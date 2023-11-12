#!/bin/bash
# Check if the script is running in Bash
if [ -z "$BASH_VERSION" ]; then
    echo "This script requires Bash to run. Please run it using 'bash $0'."
    exit 1
fi

# *************************************************************************************************
# *** Variables ***********************************************************************************
# *************************************************************************************************
apstra_ip=localhost
apstra_username="admin"
apstra_password="admin"
action="create"

# *************************************************************************************************
# *** Functions ***********************************************************************************
# *************************************************************************************************

# ************************************************************************
# Function > show_usage
#
#    Function to display script usage
# ************************************************************************
show_usage() {
    echo "Usage: $0 [options] <apstra_ip>"
    echo "Options:"
    echo "  -a, --action <action>      Specify the action (create|delete). Default: create."
    echo "  -u, --user <username>      Specify the username. Default: admin."
    echo "  -p, --password <password>  Specify the password. Default: admin."
    echo "  -h, --help                 Display this help message."
    echo "Example:"
    echo "  $0 -a delete -u myuser -p mypassword 10.10.10.10"
}

# *************************************************************************************************
# *** Parse command-line options  *****************************************************************
# *************************************************************************************************
while [[ $# -gt 0 ]]; do
    case "$1" in
        -a|--action)
            action="$2"
            shift 2
            ;;
        -u|--user)
            apstra_username="$2"
            shift 2
            ;;
        -p|--password)
            apstra_password="$2"
            shift 2
            ;;
        -h|--help)
            show_usage
            exit 0
            ;;
        *)
            apstra_ip="$1"
            shift
            ;;
    esac
done


# *************************************************************************************************
# *** MAIN ****************************************************************************************
# *************************************************************************************************
echo "apstra_ip:   $apstra_ip"
echo "user:        $apstra_username"
echo "action:      $action"
echo ""

token=`curl --silent \
  -k -X POST "https://$apstra_ip/api/user/login" \
  -H  "accept: application/json" \
  -H  "content-type: application/json, Cache-Control:no-cache" \
  -d "{ \"username\":\"$apstra_username\", \"password\":\"$apstra_password\" }" | jq --raw-output '.token'`
echo "Token: $token"
echo ""

# Conditional logic based on the value of the action variable
if [ "$action" = "create" ]; then
    echo "CREATE - Device Profile..."
    curl -H "AuthToken: $token" \
    -k -X POST "https://$apstra_ip/api/device-profiles" \
    -H  "accept: application/json" \
    -H  "content-type: application/json" \
    -d @./device-profiles-Juniper_vEX9214.json
    echo ""

    echo "CREATE - Logical Device..."
    curl -H "AuthToken: $token" \
    -k -X POST "https://$apstra_ip/api/design/logical-devices" \
    -H  "accept: application/json" \
    -H  "content-type: application/json" \
    -d @./logical-device-aos_20x1_4x10_vEX9214.json
    echo ""

    echo "CREATE - Interface Map..."
    curl -H "AuthToken: $token" \
    -k -X POST "https://$apstra_ip/api/design/interface-maps" \
    -H  "accept: application/json" \
    -H  "content-type: application/json" \
    -d @./interface-map-Juniper_vEX9214__AOS-20x1+4x10.json
    echo ""

elif [ "$action" = "delete" ]; then
    echo "DELETE - Interface Map..."
    curl -H "AuthToken: $token" \
    -k -X DELETE "https://$apstra_ip/api/design/interface-maps/Juniper_vEX9214__AOS-20x1_4x10" \
    -H  "accept: application/json" \
    -H  "content-type: application/json"
    echo ""


    echo "DELETE - Logical Device..."
    curl -H "AuthToken: $token" \
    -k -X DELETE "https://$apstra_ip/api/design/logical-devices/aos_20x1_4x10_vEX9214" \
    -H  "accept: application/json" \
    -H  "content-type: application/json" 
    echo ""

    echo "DELETE - Device Profile..."
    curl -H "AuthToken: $token" \
    -k -X DELETE "https://$apstra_ip/api/device-profiles/Juniper_vEX9214" \
    -H  "accept: application/json" \
    -H  "content-type: application/json" 
    echo ""
else
    echo "ERROR: Unknown action: $action"
    exit 1
fi



