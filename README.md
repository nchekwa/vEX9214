# vEX9214
create metadata USB for vEX<br>
default config root password: <b>root123</b><br><br>
# after 21.2
to support Apstra and evpn-vxlan<br>
you need to have in chassis parameter 'evpn-vxlan-default-switch-support'<br>
<br>
<br>
# How to use:
```bash
Usage: make_ex_virtio.sh [-synchronize] [-ztp] [-no-vxlan-default]
Options:
  -no-synchronize       Disable dual boot enable - do not add: system>commit synchronize
  -no-ztp               Disable auto upgrade - do not add: chassis>auto-image-upgrade
  -no-vxlan-default     Disable evpn-vxlan-default-switch-support - do not add chassis>evpn-vxlan-default-switch-support
```
