Script which adds Full vEX profile.<br>

On Apstra server:<be>

```bash
cd /tmp/
rm make-vEX9214.sh
rm *.json
wget -q 'https://raw.githubusercontent.com/nchekwa/vEX9214/main/apstra/make-vEX9214.sh'
wget -q 'https://raw.githubusercontent.com/nchekwa/vEX9214/main/apstra/device-profiles-Juniper_vEX9214.json'
wget -q 'https://raw.githubusercontent.com/nchekwa/vEX9214/main/apstra/interface-map-Juniper_vEX9214__AOS-20x1%2B4x10.json'
wget -q 'https://raw.githubusercontent.com/nchekwa/vEX9214/main/apstra/logical-device-AOS-20x1_4x10-vEX9214.json'
bash make-vEX9214.sh
```
<br>
<br>

```bash
Usage: make-vEX9214.sh [options] <apstra_ip>
Options:
  -a, --action <action>      Specify the action (create|delete). Default: create.
  -u, --user <username>      Specify the username. Default: admin.
  -p, --password <password>  Specify the password. Default: admin.
  -h, --help                 Display this help message.
Example:
  make-vEX9214.sh -a create -u myuser -p mypassword 10.10.10.10
```

Verify if the device profile exists in Apstra:
<img title="1" alt="Alt text" src="img/vex_1.jpg">
<img title="2" alt="Alt text" src="img/vex_2.jpg">
