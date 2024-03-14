#!/bin/sh


rootpassword=root123
echo "-----------------------------------------------------"
# Usage function to display help
usage() {
    echo "Usage: $0 [-synchronize] [-ztp]"
    echo "Options:"
    echo "  -synchronize    Dual boot enable - add chassis auto-image-upgrade"
    echo "  -ztp            Chassis auto-image-upgrade enabled"
    exit 1
}
# Initialize variables
SYNCHRONIZE=false
ZTP=false

# Parse arguments
while [ $# -gt 0 ]; do
    case $1 in
        -synchronize)
            SYNCHRONIZE=true
            ;;
        -ztp)
            ZTP=true
            ;;
        *)
            # Unknown option
            echo "Error: Unknown option: $1"
            usage
            ;;
    esac
    shift
done


# Check if the system is running Ubuntu
if [ -f /etc/lsb-release ]; then
    . /etc/lsb-release
    if [ "$DISTRIB_ID" = "Ubuntu" ]; then
        echo "This is Ubuntu."
    else
        echo "This is not Ubuntu."
        exit 1
    fi
else
    echo "This is not Ubuntu."
    exit 1
fi

# Check if 'pwgen' is installed and install it if it's not
if ! dpkg -l | grep -q "pwgen"; then
    echo "'pwgen' is not installed. Installing..."
    sudo apt-get update -y
    sudo apt-get install -y pwgen
else
    echo "'pwgen' is already installed."
fi

# Check if 'qemu-img' is installed and install it if it's not
if ! dpkg -l | grep -q "qemu-utils"; then
    echo "'qemu-img' (qemu-utils) is not installed. Installing..."
    sudo apt-get install -y qemu-utils
else
    echo "'qemu-img' (qemu-utils) is already installed."
fi

echo "-----------------------------------------------------"
echo "Prepere..."
mkdir /mnt/virtioc
rm -f virtioc.qcow2
rm -f virtiob.qcow2
rm -Rf config_drive

echo "-----------------------------------------------------"
echo "Creating config drive..."
mkdir config_drive
mkdir config_drive/boot
mkdir config_drive/var
mkdir config_drive/var/db
mkdir config_drive/var/db/vmm
mkdir config_drive/var/db/vmm/etc
mkdir config_drive/var/db/vmm/yang
mkdir config_drive/var/db/scripts
mkdir config_drive/var/db/scripts/event
mkdir config_drive/config
mkdir config_drive/config/license
 
echo "-----------------------------------------------------"
echo "Creating loader file..."
cat > config_drive/boot/loader.conf <<EOF
boot_noveriexec=yes
hw.pci.link.0x60.irq=10
vmtype=0
vm_retype=RE-VMX
vm_i2cid=0xBAA
vm_chassis_i2cid=151
vm_instance=1
vm_is_virtual=1
kern.timecounter.invariant_tsc=1
kern.timecounter.smp_tsc=1
kern.timecounter.vm_guest_tsc=1
EOF

echo "-----------------------------------------------------"
echo "Creating additional config file..."
SALT=$(pwgen 8 1)
HASH=$(openssl passwd -1 -salt $SALT $rootpassword)
echo "Root password: $rootpassword"
cat > config_drive/config/juniper.conf <<EOF
system {
    root-authentication {
        encrypted-password "$HASH";
    }
    services {
        ssh {
            root-login allow;
            protocol-version v2;
        }
        netconf {
            ssh;
        }
    }
    arp {
        aging-timer 5;
    }
    syslog {
        file interactive-commands {
            interactive-commands any;
        }
        file messages {
            any notice;
            authorization info;
        }
    }
    processes {
        dhcp-service {
            traceoptions {
                file dhcp_logfile size 10m;
                level all;
                flag packet;
            }
        }
    }
}
chassis {
    evpn-vxlan-default-switch-support;
}
interfaces {
    fxp0 {
        unit 0 {
            family inet {
                dhcp {
                    vendor-id Juniper-ex9214-VM;
                    force-discover;
                }
            }
        }
    }
}
multi-chassis {
    mc-lag {
        consistency-check;
    }
}
protocols {
    router-advertisement {
        interface fxp0.0;
    }
    lldp {
        port-id-subtype interface-name;
        port-description-type interface-description;
        neighbour-port-info-display port-id;
        interface all;
    }
    lldp-med {
        interface all;
    }
}
EOF

if [ "$SYNCHRONIZE" = true ]; then
echo "Adding system-commit synchronize"
cat >> config_drive/config/juniper.conf <<EOF
system {
    commit synchronize;
}
EOF
fi

if [ "$ZTP" = true ]; then
echo "Adding chassis-auto-image-upgrade"
cat >> config_drive/config/juniper.conf <<EOF
chassis {
    auto-image-upgrade;
}
EOF
fi

echo "-----------------------------------------------------"
cat > config_drive/var/db/scripts/event/xdpc.sh <<EOF
#!/bin/sh
# 
# (crontab -l; echo "* * * * * /bin/sh /var/db/scripts/event/xdpc.sh >> /var/log/script.log 2>&1") | crontab -

current_datetime=\$(date '+%Y-%m-%d %H:%M:%S')
output=\$(cli -c "show chassis alarm")
echo "\$output" | grep "XDPC" > /dev/null 2>&1
if [ \$? -eq 0 ]; then
    echo "\${current_datetime} - Found XDPC. Restarting FPC slot 0..."
    cli -c "request chassis fpc slot 0 restart"
else
    lldp_count=\$(cli -c "show lldp neighbors" | tail -n +2 | wc -l | tr -d ' ')
    echo "\${current_datetime} - alarm XDPC not found / LLDP Neighbors: \${lldp_count}"
fi
EOF

echo "-----------------------------------------------------"
echo "Creating vmm-config.tgz..."
cd config_drive
tar zcf vmm-config.tgz *
rm -rf boot config var
cd ..


echo "-----------------------------------------------------"
echo "Creating virtiob (vmxhdd.img) for VCP ..."
# vmxhdd.img
# Create empty disk emulate routing-engine-hdd
qemu-img create -f qcow2 -o compat=1.1,refcount_bits=64 virtiob.qcow2 4G >/dev/null
ls -l virtiob.qcow2

echo "-----------------------------------------------------"
echo "Creating virtioc (metadata-usb-re.img)..."
# metadata-usb-re.img
# Create our own metadrive image, so we can use a junos config file
dd if=/dev/zero of=virtioc.img  bs=1M count=50 >/dev/null 2>&1
mkfs.vfat virtioc.img >/dev/null
mount -o loop virtioc.img /mnt/virtioc
cp config_drive/vmm-config.tgz /mnt/virtioc
umount /mnt/virtioc
rm -R /mnt/virtioc
qemu-img convert -O qcow2 -o compat=1.1,refcount_bits=64 virtioc.img virtioc.qcow2
ls -l virtioc.qcow2

echo "-----------------------------------------------------"
echo "Clean..."
rm virtioc.img
rm -R config_drive/
echo "DONE"
