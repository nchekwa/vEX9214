# vJunos-EX
create metadata USB for vEX<br>
default config root password: <b>root123</b><br><br>
# after 21.2
to support Apstra and evpn-vxla
```bash
wget https://raw.githubusercontent.com/nchekwa/vJunos-EX/main/make_ex_virtio.sh
sed -i 's/arp {/commit synchronize;\n    arp {/g' make_ex_virtio.sh
sed -i 's/interfaces {/chassis {\n    evpn-vxlan-default-switch-support;\n}\ninterfaces {/g' make_ex_virtio.sh
```
