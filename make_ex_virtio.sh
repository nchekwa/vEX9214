#!/bin/bash


rootpassword=root123



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

echo "-----------------------------------------------------"
echo "Creating config drive..."
mkdir config_drive
mkdir config_drive/boot
mkdir config_drive/var
mkdir config_drive/var/db
mkdir config_drive/var/db/vmm
mkdir config_drive/var/db/vmm/etc
mkdir config_drive/var/db/vmm/yang
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
cat > config_drive/config/juniper.conf <<EOF
/* password: $rootpassword */
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
event-options {
    policy rts_peer_cp_recv_timeout_event {
        events rts_peer_cp_recv_timeout;
        within 1 {
            trigger on 1;
        }
        then {
            execute-commands {
                commands {
                    "show chassis environment";
                    "show system processes extensive";
                    "show system uptime";
                    "show chassis alarms";
                    "request chassis fpc slot 0 restart";
                }
                output-filename rts_peer_cp_recv_timeout;
                destination local;
                output-format text;
            }
        }
    }
    destinations {
        local {
            archive-sites {
                /var/log/;
            }
        }
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
