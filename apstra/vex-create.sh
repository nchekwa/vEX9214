export apstra_ip=localhost
export apstra_username="admin"
export apstra_password="admin"

export token=`curl --silent \
  -k -X POST "https://$apstra_ip/api/user/login" \
  -H  "accept: application/json" \
  -H  "content-type: application/json, Cache-Control:no-cache" \
  -d "{ \"username\":\"$apstra_username\", \"password\":\"$apstra_password\" }" | jq --raw-output '.token'`


echo $token




cat <<EOF > /tmp/vex.json
{
  "label": "Juniper vEX9214",
  "id": "Juniper_vEX9214",
  "predefined": false,
  "dual_routing_engine": false,
  "physical_device": false,
  "slot_count": 0,
  "ports": [
    {
      "port_id": 1,
      "display_id": 0,
      "row_id": 1,
      "column_id": 1,
      "panel_id": 1,
      "slot_id": 0,
      "failure_domain_id": 1,
      "connector_type": "SFP",
      "transformations": [
        {
          "transformation_id": 1,
          "is_default": true,
          "interfaces": [
            {
              "name": "ge-0/0/0",
              "interface_id": 1,
              "speed": {
                "value": 1,
                "unit": "G"
              },
              "state": "active",
              "setting": "{\n  \"interface\": {\n    \"speed\": \"\"\n  },\n  \"global\": {\n    \"speed\": \"\"\n  }\n}"
            }
          ]
        },
        {
          "transformation_id": 2,
          "is_default": false,
          "interfaces": [
            {
              "name": "ge-0/0/0",
              "interface_id": 1,
              "speed": {
                "value": 10,
                "unit": "G"
              },
              "state": "active",
              "setting": "{\n  \"interface\": {\n    \"speed\": \"10g\"\n  },\n  \"global\": {\n    \"speed\": \"\"\n  }\n}"
            }
          ]
        }
      ]
    },
    {
      "port_id": 2,
      "display_id": 1,
      "row_id": 1,
      "column_id": 2,
      "panel_id": 1,
      "slot_id": 0,
      "failure_domain_id": 1,
      "connector_type": "SFP",
      "transformations": [
        {
          "transformation_id": 1,
          "is_default": true,
          "interfaces": [
            {
              "name": "ge-0/0/0",
              "interface_id": 1,
              "speed": {
                "value": 1,
                "unit": "G"
              },
              "state": "active",
              "setting": "{\n  \"interface\": {\n    \"speed\": \"\"\n  },\n  \"global\": {\n    \"speed\": \"\"\n  }\n}"
            }
          ]
        },
        {
          "transformation_id": 2,
          "is_default": false,
          "interfaces": [
            {
              "name": "ge-0/0/0",
              "interface_id": 1,
              "speed": {
                "value": 10,
                "unit": "G"
              },
              "state": "active",
              "setting": "{\n  \"interface\": {\n    \"speed\": \"10g\"\n  },\n  \"global\": {\n    \"speed\": \"\"\n  }\n}"
            }
          ]
        }
      ]
    },
    {
      "port_id": 3,
      "display_id": 2,
      "row_id": 1,
      "column_id": 3,
      "panel_id": 1,
      "slot_id": 0,
      "failure_domain_id": 1,
      "connector_type": "SFP",
      "transformations": [
        {
          "transformation_id": 1,
          "is_default": true,
          "interfaces": [
            {
              "name": "ge-0/0/0",
              "interface_id": 1,
              "speed": {
                "value": 1,
                "unit": "G"
              },
              "state": "active",
              "setting": "{\n  \"interface\": {\n    \"speed\": \"\"\n  },\n  \"global\": {\n    \"speed\": \"\"\n  }\n}"
            }
          ]
        },
        {
          "transformation_id": 2,
          "is_default": false,
          "interfaces": [
            {
              "name": "ge-0/0/0",
              "interface_id": 1,
              "speed": {
                "value": 10,
                "unit": "G"
              },
              "state": "active",
              "setting": "{\n  \"interface\": {\n    \"speed\": \"10g\"\n  },\n  \"global\": {\n    \"speed\": \"\"\n  }\n}"
            }
          ]
        }
      ]
    },
    {
      "port_id": 4,
      "display_id": 3,
      "row_id": 1,
      "column_id": 4,
      "panel_id": 1,
      "slot_id": 0,
      "failure_domain_id": 1,
      "connector_type": "SFP",
      "transformations": [
        {
          "transformation_id": 1,
          "is_default": true,
          "interfaces": [
            {
              "name": "ge-0/0/0",
              "interface_id": 1,
              "speed": {
                "value": 1,
                "unit": "G"
              },
              "state": "active",
              "setting": "{\n  \"interface\": {\n    \"speed\": \"\"\n  },\n  \"global\": {\n    \"speed\": \"\"\n  }\n}"
            }
          ]
        },
        {
          "transformation_id": 2,
          "is_default": false,
          "interfaces": [
            {
              "name": "ge-0/0/0",
              "interface_id": 1,
              "speed": {
                "value": 10,
                "unit": "G"
              },
              "state": "active",
              "setting": "{\n  \"interface\": {\n    \"speed\": \"10g\"\n  },\n  \"global\": {\n    \"speed\": \"\"\n  }\n}"
            }
          ]
        }
      ]
    },
    {
      "port_id": 5,
      "display_id": 4,
      "row_id": 1,
      "column_id": 5,
      "panel_id": 1,
      "slot_id": 0,
      "failure_domain_id": 1,
      "connector_type": "SFP",
      "transformations": [
        {
          "transformation_id": 1,
          "is_default": true,
          "interfaces": [
            {
              "name": "ge-0/0/0",
              "interface_id": 1,
              "speed": {
                "value": 1,
                "unit": "G"
              },
              "state": "active",
              "setting": "{\n  \"interface\": {\n    \"speed\": \"\"\n  },\n  \"global\": {\n    \"speed\": \"\"\n  }\n}"
            }
          ]
        },
        {
          "transformation_id": 2,
          "is_default": false,
          "interfaces": [
            {
              "name": "ge-0/0/0",
              "interface_id": 1,
              "speed": {
                "value": 10,
                "unit": "G"
              },
              "state": "active",
              "setting": "{\n  \"interface\": {\n    \"speed\": \"10g\"\n  },\n  \"global\": {\n    \"speed\": \"\"\n  }\n}"
            }
          ]
        }
      ]
    },
    {
      "port_id": 6,
      "display_id": 5,
      "row_id": 1,
      "column_id": 6,
      "panel_id": 1,
      "slot_id": 0,
      "failure_domain_id": 1,
      "connector_type": "SFP",
      "transformations": [
        {
          "transformation_id": 1,
          "is_default": true,
          "interfaces": [
            {
              "name": "ge-0/0/0",
              "interface_id": 1,
              "speed": {
                "value": 1,
                "unit": "G"
              },
              "state": "active",
              "setting": "{\n  \"interface\": {\n    \"speed\": \"\"\n  },\n  \"global\": {\n    \"speed\": \"\"\n  }\n}"
            }
          ]
        },
        {
          "transformation_id": 2,
          "is_default": false,
          "interfaces": [
            {
              "name": "ge-0/0/0",
              "interface_id": 1,
              "speed": {
                "value": 10,
                "unit": "G"
              },
              "state": "active",
              "setting": "{\n  \"interface\": {\n    \"speed\": \"10g\"\n  },\n  \"global\": {\n    \"speed\": \"\"\n  }\n}"
            }
          ]
        }
      ]
    },
    {
      "port_id": 7,
      "display_id": 6,
      "row_id": 1,
      "column_id": 7,
      "panel_id": 1,
      "slot_id": 0,
      "failure_domain_id": 1,
      "connector_type": "SFP",
      "transformations": [
        {
          "transformation_id": 1,
          "is_default": true,
          "interfaces": [
            {
              "name": "ge-0/0/0",
              "interface_id": 1,
              "speed": {
                "value": 1,
                "unit": "G"
              },
              "state": "active",
              "setting": "{\n  \"interface\": {\n    \"speed\": \"\"\n  },\n  \"global\": {\n    \"speed\": \"\"\n  }\n}"
            }
          ]
        },
        {
          "transformation_id": 2,
          "is_default": false,
          "interfaces": [
            {
              "name": "ge-0/0/0",
              "interface_id": 1,
              "speed": {
                "value": 10,
                "unit": "G"
              },
              "state": "active",
              "setting": "{\n  \"interface\": {\n    \"speed\": \"10g\"\n  },\n  \"global\": {\n    \"speed\": \"\"\n  }\n}"
            }
          ]
        }
      ]
    },
    {
      "port_id": 8,
      "display_id": 7,
      "row_id": 1,
      "column_id": 8,
      "panel_id": 1,
      "slot_id": 0,
      "failure_domain_id": 1,
      "connector_type": "SFP",
      "transformations": [
        {
          "transformation_id": 1,
          "is_default": true,
          "interfaces": [
            {
              "name": "ge-0/0/0",
              "interface_id": 1,
              "speed": {
                "value": 1,
                "unit": "G"
              },
              "state": "active",
              "setting": "{\n  \"interface\": {\n    \"speed\": \"\"\n  },\n  \"global\": {\n    \"speed\": \"\"\n  }\n}"
            }
          ]
        },
        {
          "transformation_id": 2,
          "is_default": false,
          "interfaces": [
            {
              "name": "ge-0/0/0",
              "interface_id": 1,
              "speed": {
                "value": 10,
                "unit": "G"
              },
              "state": "active",
              "setting": "{\n  \"interface\": {\n    \"speed\": \"10g\"\n  },\n  \"global\": {\n    \"speed\": \"\"\n  }\n}"
            }
          ]
        }
      ]
    },
    {
      "port_id": 9,
      "display_id": 8,
      "row_id": 1,
      "column_id": 9,
      "panel_id": 1,
      "slot_id": 0,
      "failure_domain_id": 1,
      "connector_type": "SFP",
      "transformations": [
        {
          "transformation_id": 1,
          "is_default": true,
          "interfaces": [
            {
              "name": "ge-0/0/0",
              "interface_id": 1,
              "speed": {
                "value": 1,
                "unit": "G"
              },
              "state": "active",
              "setting": "{\n  \"interface\": {\n    \"speed\": \"\"\n  },\n  \"global\": {\n    \"speed\": \"\"\n  }\n}"
            }
          ]
        },
        {
          "transformation_id": 2,
          "is_default": false,
          "interfaces": [
            {
              "name": "ge-0/0/0",
              "interface_id": 1,
              "speed": {
                "value": 10,
                "unit": "G"
              },
              "state": "active",
              "setting": "{\n  \"interface\": {\n    \"speed\": \"10g\"\n  },\n  \"global\": {\n    \"speed\": \"\"\n  }\n}"
            }
          ]
        }
      ]
    },
    {
      "port_id": 10,
      "display_id": 9,
      "row_id": 1,
      "column_id": 10,
      "panel_id": 1,
      "slot_id": 0,
      "failure_domain_id": 1,
      "connector_type": "SFP",
      "transformations": [
        {
          "transformation_id": 1,
          "is_default": true,
          "interfaces": [
            {
              "name": "ge-0/0/0",
              "interface_id": 1,
              "speed": {
                "value": 1,
                "unit": "G"
              },
              "state": "active",
              "setting": "{\n  \"interface\": {\n    \"speed\": \"\"\n  },\n  \"global\": {\n    \"speed\": \"\"\n  }\n}"
            }
          ]
        },
        {
          "transformation_id": 2,
          "is_default": false,
          "interfaces": [
            {
              "name": "ge-0/0/0",
              "interface_id": 1,
              "speed": {
                "value": 10,
                "unit": "G"
              },
              "state": "active",
              "setting": "{\n  \"interface\": {\n    \"speed\": \"10g\"\n  },\n  \"global\": {\n    \"speed\": \"\"\n  }\n}"
            }
          ]
        }
      ]
    },
    {
      "port_id": 11,
      "display_id": 0,
      "row_id": 1,
      "column_id": 1,
      "panel_id": 2,
      "slot_id": 0,
      "failure_domain_id": 1,
      "connector_type": "SFP",
      "transformations": [
        {
          "transformation_id": 1,
          "is_default": true,
          "interfaces": [
            {
              "name": "ge-0/1/0",
              "interface_id": 1,
              "speed": {
                "value": 1,
                "unit": "G"
              },
              "state": "active",
              "setting": "{\n  \"interface\": {\n    \"speed\": \"\"\n  },\n  \"global\": {\n    \"speed\": \"\"\n  }\n}"
            }
          ]
        },
        {
          "transformation_id": 2,
          "is_default": false,
          "interfaces": [
            {
              "name": "ge-0/1/0",
              "interface_id": 1,
              "speed": {
                "value": 10,
                "unit": "G"
              },
              "state": "active",
              "setting": "{\n  \"interface\": {\n    \"speed\": \"10g\"\n  },\n  \"global\": {\n    \"speed\": \"\"\n  }\n}"
            }
          ]
        }
      ]
    },
    {
      "port_id": 12,
      "display_id": 1,
      "row_id": 1,
      "column_id": 2,
      "panel_id": 2,
      "slot_id": 0,
      "failure_domain_id": 1,
      "connector_type": "SFP",
      "transformations": [
        {
          "transformation_id": 1,
          "is_default": true,
          "interfaces": [
            {
              "name": "ge-0/1/1",
              "interface_id": 1,
              "speed": {
                "value": 1,
                "unit": "G"
              },
              "state": "active",
              "setting": "{\n  \"interface\": {\n    \"speed\": \"\"\n  },\n  \"global\": {\n    \"speed\": \"\"\n  }\n}"
            }
          ]
        },
        {
          "transformation_id": 2,
          "is_default": false,
          "interfaces": [
            {
              "name": "ge-0/1/1",
              "interface_id": 1,
              "speed": {
                "value": 10,
                "unit": "G"
              },
              "state": "active",
              "setting": "{\n  \"interface\": {\n    \"speed\": \"10g\"\n  },\n  \"global\": {\n    \"speed\": \"\"\n  }\n}"
            }
          ]
        }
      ]
    },
    {
      "port_id": 13,
      "display_id": 2,
      "row_id": 1,
      "column_id": 3,
      "panel_id": 2,
      "slot_id": 0,
      "failure_domain_id": 1,
      "connector_type": "SFP",
      "transformations": [
        {
          "transformation_id": 1,
          "is_default": true,
          "interfaces": [
            {
              "name": "ge-0/1/2",
              "interface_id": 1,
              "speed": {
                "value": 1,
                "unit": "G"
              },
              "state": "active",
              "setting": "{\n  \"interface\": {\n    \"speed\": \"\"\n  },\n  \"global\": {\n    \"speed\": \"\"\n  }\n}"
            }
          ]
        },
        {
          "transformation_id": 2,
          "is_default": false,
          "interfaces": [
            {
              "name": "ge-0/1/2",
              "interface_id": 1,
              "speed": {
                "value": 10,
                "unit": "G"
              },
              "state": "active",
              "setting": "{\n  \"interface\": {\n    \"speed\": \"10g\"\n  },\n  \"global\": {\n    \"speed\": \"\"\n  }\n}"
            }
          ]
        }
      ]
    },
    {
      "port_id": 14,
      "display_id": 3,
      "row_id": 1,
      "column_id": 4,
      "panel_id": 2,
      "slot_id": 0,
      "failure_domain_id": 1,
      "connector_type": "SFP",
      "transformations": [
        {
          "transformation_id": 1,
          "is_default": true,
          "interfaces": [
            {
              "name": "ge-0/1/3",
              "interface_id": 1,
              "speed": {
                "value": 1,
                "unit": "G"
              },
              "state": "active",
              "setting": "{\n  \"interface\": {\n    \"speed\": \"\"\n  },\n  \"global\": {\n    \"speed\": \"\"\n  }\n}"
            }
          ]
        },
        {
          "transformation_id": 2,
          "is_default": false,
          "interfaces": [
            {
              "name": "ge-0/1/3",
              "interface_id": 1,
              "speed": {
                "value": 10,
                "unit": "G"
              },
              "state": "active",
              "setting": "{\n  \"interface\": {\n    \"speed\": \"10g\"\n  },\n  \"global\": {\n    \"speed\": \"\"\n  }\n}"
            }
          ]
        }
      ]
    },
    {
      "port_id": 15,
      "display_id": 4,
      "row_id": 1,
      "column_id": 5,
      "panel_id": 2,
      "slot_id": 0,
      "failure_domain_id": 1,
      "connector_type": "SFP",
      "transformations": [
        {
          "transformation_id": 1,
          "is_default": true,
          "interfaces": [
            {
              "name": "ge-0/1/4",
              "interface_id": 1,
              "speed": {
                "value": 1,
                "unit": "G"
              },
              "state": "active",
              "setting": "{\n  \"interface\": {\n    \"speed\": \"\"\n  },\n  \"global\": {\n    \"speed\": \"\"\n  }\n}"
            }
          ]
        },
        {
          "transformation_id": 2,
          "is_default": false,
          "interfaces": [
            {
              "name": "ge-0/1/4",
              "interface_id": 1,
              "speed": {
                "value": 10,
                "unit": "G"
              },
              "state": "active",
              "setting": "{\n  \"interface\": {\n    \"speed\": \"10g\"\n  },\n  \"global\": {\n    \"speed\": \"\"\n  }\n}"
            }
          ]
        }
      ]
    },
    {
      "port_id": 16,
      "display_id": 5,
      "row_id": 1,
      "column_id": 6,
      "panel_id": 2,
      "slot_id": 0,
      "failure_domain_id": 1,
      "connector_type": "SFP",
      "transformations": [
        {
          "transformation_id": 1,
          "is_default": true,
          "interfaces": [
            {
              "name": "ge-0/1/5",
              "interface_id": 1,
              "speed": {
                "value": 1,
                "unit": "G"
              },
              "state": "active",
              "setting": "{\n  \"interface\": {\n    \"speed\": \"\"\n  },\n  \"global\": {\n    \"speed\": \"\"\n  }\n}"
            }
          ]
        },
        {
          "transformation_id": 2,
          "is_default": false,
          "interfaces": [
            {
              "name": "ge-0/1/5",
              "interface_id": 1,
              "speed": {
                "value": 10,
                "unit": "G"
              },
              "state": "active",
              "setting": "{\n  \"interface\": {\n    \"speed\": \"10g\"\n  },\n  \"global\": {\n    \"speed\": \"\"\n  }\n}"
            }
          ]
        }
      ]
    },
    {
      "port_id": 17,
      "display_id": 6,
      "row_id": 1,
      "column_id": 7,
      "panel_id": 2,
      "slot_id": 0,
      "failure_domain_id": 1,
      "connector_type": "SFP",
      "transformations": [
        {
          "transformation_id": 1,
          "is_default": true,
          "interfaces": [
            {
              "name": "ge-0/1/6",
              "interface_id": 1,
              "speed": {
                "value": 1,
                "unit": "G"
              },
              "state": "active",
              "setting": "{\n  \"interface\": {\n    \"speed\": \"\"\n  },\n  \"global\": {\n    \"speed\": \"\"\n  }\n}"
            }
          ]
        },
        {
          "transformation_id": 2,
          "is_default": false,
          "interfaces": [
            {
              "name": "ge-0/1/6",
              "interface_id": 1,
              "speed": {
                "value": 10,
                "unit": "G"
              },
              "state": "active",
              "setting": "{\n  \"interface\": {\n    \"speed\": \"10g\"\n  },\n  \"global\": {\n    \"speed\": \"\"\n  }\n}"
            }
          ]
        }
      ]
    },
    {
      "port_id": 18,
      "display_id": 7,
      "row_id": 1,
      "column_id": 8,
      "panel_id": 2,
      "slot_id": 0,
      "failure_domain_id": 1,
      "connector_type": "SFP",
      "transformations": [
        {
          "transformation_id": 1,
          "is_default": true,
          "interfaces": [
            {
              "name": "ge-0/1/7",
              "interface_id": 1,
              "speed": {
                "value": 1,
                "unit": "G"
              },
              "state": "active",
              "setting": "{\n  \"interface\": {\n    \"speed\": \"\"\n  },\n  \"global\": {\n    \"speed\": \"\"\n  }\n}"
            }
          ]
        },
        {
          "transformation_id": 2,
          "is_default": false,
          "interfaces": [
            {
              "name": "ge-0/1/7",
              "interface_id": 1,
              "speed": {
                "value": 10,
                "unit": "G"
              },
              "state": "active",
              "setting": "{\n  \"interface\": {\n    \"speed\": \"10g\"\n  },\n  \"global\": {\n    \"speed\": \"\"\n  }\n}"
            }
          ]
        }
      ]
    },
    {
      "port_id": 19,
      "display_id": 8,
      "row_id": 1,
      "column_id": 9,
      "panel_id": 2,
      "slot_id": 0,
      "failure_domain_id": 1,
      "connector_type": "SFP",
      "transformations": [
        {
          "transformation_id": 1,
          "is_default": true,
          "interfaces": [
            {
              "name": "ge-0/1/8",
              "interface_id": 1,
              "speed": {
                "value": 1,
                "unit": "G"
              },
              "state": "active",
              "setting": "{\n  \"interface\": {\n    \"speed\": \"\"\n  },\n  \"global\": {\n    \"speed\": \"\"\n  }\n}"
            }
          ]
        },
        {
          "transformation_id": 2,
          "is_default": false,
          "interfaces": [
            {
              "name": "ge-0/1/8",
              "interface_id": 1,
              "speed": {
                "value": 10,
                "unit": "G"
              },
              "state": "active",
              "setting": "{\n  \"interface\": {\n    \"speed\": \"10g\"\n  },\n  \"global\": {\n    \"speed\": \"\"\n  }\n}"
            }
          ]
        }
      ]
    },
    {
      "port_id": 20,
      "display_id": 9,
      "row_id": 1,
      "column_id": 10,
      "panel_id": 2,
      "slot_id": 0,
      "failure_domain_id": 1,
      "connector_type": "SFP",
      "transformations": [
        {
          "transformation_id": 1,
          "is_default": true,
          "interfaces": [
            {
              "name": "ge-0/1/9",
              "interface_id": 1,
              "speed": {
                "value": 1,
                "unit": "G"
              },
              "state": "active",
              "setting": "{\n  \"interface\": {\n    \"speed\": \"\"\n  },\n  \"global\": {\n    \"speed\": \"\"\n  }\n}"
            }
          ]
        },
        {
          "transformation_id": 2,
          "is_default": false,
          "interfaces": [
            {
              "name": "ge-0/1/9",
              "interface_id": 1,
              "speed": {
                "value": 10,
                "unit": "G"
              },
              "state": "active",
              "setting": "{\n  \"interface\": {\n    \"speed\": \"10g\"\n  },\n  \"global\": {\n    \"speed\": \"\"\n  }\n}"
            }
          ]
        }
      ]
    },
    {
      "port_id": 21,
      "display_id": 0,
      "row_id": 1,
      "column_id": 1,
      "panel_id": 3,
      "slot_id": 0,
      "failure_domain_id": 1,
      "connector_type": "QSFP28",
      "transformations": [
        {
          "transformation_id": 1,
          "is_default": true,
          "interfaces": [
            {
              "name": "xe-0/2/0",
              "interface_id": 1,
              "speed": {
                "value": 10,
                "unit": "G"
              },
              "state": "active",
              "setting": "{\n  \"interface\": {\n    \"speed\": \"\"\n  },\n  \"global\": {\n    \"speed\": \"\"\n  }\n}"
            }
          ]
        },
        {
          "transformation_id": 2,
          "is_default": false,
          "interfaces": [
            {
              "name": "xe-0/2/0",
              "interface_id": 1,
              "speed": {
                "value": 1,
                "unit": "G"
              },
              "state": "active",
              "setting": "{\n  \"interface\": {\n    \"speed\": \"1g\"\n  },\n  \"global\": {\n    \"speed\": \"\"\n  }\n}"
            }
          ]
        }
      ]
    },
    {
      "port_id": 22,
      "display_id": 1,
      "row_id": 1,
      "column_id": 2,
      "panel_id": 3,
      "slot_id": 0,
      "failure_domain_id": 1,
      "connector_type": "QSFP28",
      "transformations": [
        {
          "transformation_id": 1,
          "is_default": true,
          "interfaces": [
            {
              "name": "xe-0/2/1",
              "interface_id": 1,
              "speed": {
                "value": 10,
                "unit": "G"
              },
              "state": "active",
              "setting": "{\n  \"interface\": {\n    \"speed\": \"\"\n  },\n  \"global\": {\n    \"speed\": \"\"\n  }\n}"
            }
          ]
        },
        {
          "transformation_id": 2,
          "is_default": false,
          "interfaces": [
            {
              "name": "xe-0/2/1",
              "interface_id": 1,
              "speed": {
                "value": 1,
                "unit": "G"
              },
              "state": "active",
              "setting": "{\n  \"interface\": {\n    \"speed\": \"1g\"\n  },\n  \"global\": {\n    \"speed\": \"\"\n  }\n}"
            }
          ]
        }
      ]
    },
    {
      "port_id": 23,
      "display_id": 0,
      "row_id": 1,
      "column_id": 1,
      "panel_id": 4,
      "slot_id": 0,
      "failure_domain_id": 1,
      "connector_type": "QSFP28",
      "transformations": [
        {
          "transformation_id": 1,
          "is_default": true,
          "interfaces": [
            {
              "name": "xe-0/3/0",
              "interface_id": 1,
              "speed": {
                "value": 10,
                "unit": "G"
              },
              "state": "active",
              "setting": "{\n  \"interface\": {\n    \"speed\": \"\"\n  },\n  \"global\": {\n    \"speed\": \"\"\n  }\n}"
            }
          ]
        },
        {
          "transformation_id": 2,
          "is_default": false,
          "interfaces": [
            {
              "name": "xe-0/3/0",
              "interface_id": 1,
              "speed": {
                "value": 1,
                "unit": "G"
              },
              "state": "active",
              "setting": "{\n  \"interface\": {\n    \"speed\": \"1g\"\n  },\n  \"global\": {\n    \"speed\": \"\"\n  }\n}"
            }
          ]
        }
      ]
    },
    {
      "port_id": 24,
      "display_id": 1,
      "row_id": 1,
      "column_id": 2,
      "panel_id": 4,
      "slot_id": 0,
      "failure_domain_id": 1,
      "connector_type": "QSFP28",
      "transformations": [
        {
          "transformation_id": 1,
          "is_default": true,
          "interfaces": [
            {
              "name": "xe-0/3/1",
              "interface_id": 1,
              "speed": {
                "value": 10,
                "unit": "G"
              },
              "state": "active",
              "setting": "{\n  \"interface\": {\n    \"speed\": \"\"\n  },\n  \"global\": {\n    \"speed\": \"\"\n  }\n}"
            }
          ]
        },
        {
          "transformation_id": 2,
          "is_default": false,
          "interfaces": [
            {
              "name": "xe-0/3/1",
              "interface_id": 1,
              "speed": {
                "value": 1,
                "unit": "G"
              },
              "state": "active",
              "setting": "{\n  \"interface\": {\n    \"speed\": \"1g\"\n  },\n  \"global\": {\n    \"speed\": \"\"\n  }\n}"
            }
          ]
        }
      ]
    }
  ],
  "hardware_capabilities": {
    "asic": "Trio",
    "ecmp_limit": 32,
    "ram": 32,
    "routing_instance_supported": [
      {
        "version": ".*",
        "value": true
      }
    ],
    "cpu": "x86",
    "form_factor": "1RU",
    "userland": 32
  },
  "software_capabilities": {
    "onie": false,
    "lxc_support": false,
    "config_apply_support": "complete_only"
  },
  "selector": {
    "os": "Junos",
    "os_version": ".*",
    "manufacturer": "Juniper",
    "model": "VIRTUAL-EX9214"
  },
  "device_profile_type": "monolithic"
}
EOF



curl -H "AuthToken: $token" \
  -k -X POST "https://$apstra_ip/api/device-profiles" \
  -H  "accept: application/json" \
  -H  "content-type: application/json" \
  -d @/tmp/vex.json

