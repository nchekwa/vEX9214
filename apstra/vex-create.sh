{
  "predefined": false,
  "hardware_capabilities": {
    "userland": 32,
    "routing_instance_supported": [
      {
        "version": ".*",
        "value": true
      }
    ],
    "ram": 32,
    "asic": "Trio",
    "form_factor": "1RU",
    "ecmp_limit": 32,
    "cpu": "x86"
  },
  "selector": {
    "os_version": "(1[89]|2[0-2])\\..*",
    "model": "VIRTUAL-EX9214",
    "os": "Junos",
    "manufacturer": "Juniper"
  },
  "created_at": "1970-01-01T00:00:00.000000Z",
  "last_modified_at": "2022-09-30T22:34:03.727109Z",
  "device_profile_type": "monolithic",
  "software_capabilities": {
    "onie": false,
    "config_apply_support": "complete_only",
    "lxc_support": false
  },
  "slot_count": 0,
  "label": "Juniper vEX Full",
  "ports": [
    {
      "display_id": 1,
      "panel_id": 1,
      "slot_id": 0,
      "connector_type": "SFP",
      "row_id": 1,
      "transformations": [
        {
          "is_default": true,
          "interfaces": [
            {
              "state": "active",
              "setting": "{\n  \"interface\": {\n    \"speed\": \"1g\"\n  },\n  \"global\": {\n    \"speed\": \"\"\n  }\n}",
              "speed": {
                "unit": "G",
                "value": 1
              },
              "name": "ge-0/0/0",
              "interface_id": 1
            }
          ],
          "transformation_id": 1
        }
      ],
      "port_id": 1,
      "failure_domain_id": 1,
      "column_id": 1
    },
    {
      "display_id": 2,
      "panel_id": 1,
      "slot_id": 0,
      "connector_type": "SFP",
      "row_id": 1,
      "transformations": [
        {
          "is_default": true,
          "interfaces": [
            {
              "state": "active",
              "setting": "{\n  \"interface\": {\n    \"speed\": \"1g\"\n  },\n  \"global\": {\n    \"speed\": \"\"\n  }\n}",
              "speed": {
                "unit": "G",
                "value": 1
              },
              "name": "ge-0/0/1",
              "interface_id": 1
            }
          ],
          "transformation_id": 1
        }
      ],
      "port_id": 2,
      "failure_domain_id": 1,
      "column_id": 2
    },
    {
      "display_id": 3,
      "panel_id": 1,
      "slot_id": 0,
      "connector_type": "SFP",
      "row_id": 1,
      "transformations": [
        {
          "is_default": true,
          "interfaces": [
            {
              "state": "active",
              "setting": "{\n  \"interface\": {\n    \"speed\": \"1g\"\n  },\n  \"global\": {\n    \"speed\": \"\"\n  }\n}",
              "speed": {
                "unit": "G",
                "value": 1
              },
              "name": "ge-0/0/2",
              "interface_id": 1
            }
          ],
          "transformation_id": 1
        }
      ],
      "port_id": 3,
      "failure_domain_id": 1,
      "column_id": 3
    },
    {
      "display_id": 4,
      "panel_id": 1,
      "slot_id": 0,
      "connector_type": "SFP",
      "row_id": 1,
      "transformations": [
        {
          "is_default": true,
          "interfaces": [
            {
              "state": "active",
              "setting": "{\n  \"interface\": {\n    \"speed\": \"1g\"\n  },\n  \"global\": {\n    \"speed\": \"\"\n  }\n}",
              "speed": {
                "unit": "G",
                "value": 1
              },
              "name": "ge-0/0/3",
              "interface_id": 1
            }
          ],
          "transformation_id": 1
        }
      ],
      "port_id": 4,
      "failure_domain_id": 1,
      "column_id": 4
    },
    {
      "display_id": 5,
      "panel_id": 1,
      "slot_id": 0,
      "connector_type": "SFP",
      "row_id": 1,
      "transformations": [
        {
          "is_default": true,
          "interfaces": [
            {
              "state": "active",
              "setting": "{\n  \"interface\": {\n    \"speed\": \"1g\"\n  },\n  \"global\": {\n    \"speed\": \"\"\n  }\n}",
              "speed": {
                "unit": "G",
                "value": 1
              },
              "name": "ge-0/0/4",
              "interface_id": 1
            }
          ],
          "transformation_id": 1
        }
      ],
      "port_id": 5,
      "failure_domain_id": 1,
      "column_id": 5
    },
    {
      "display_id": 6,
      "panel_id": 1,
      "slot_id": 0,
      "connector_type": "SFP",
      "row_id": 1,
      "transformations": [
        {
          "is_default": true,
          "interfaces": [
            {
              "state": "active",
              "setting": "{\n  \"interface\": {\n    \"speed\": \"1g\"\n  },\n  \"global\": {\n    \"speed\": \"\"\n  }\n}",
              "speed": {
                "unit": "G",
                "value": 1
              },
              "name": "ge-0/0/5",
              "interface_id": 1
            }
          ],
          "transformation_id": 1
        }
      ],
      "port_id": 6,
      "failure_domain_id": 1,
      "column_id": 6
    },
    {
      "display_id": 7,
      "panel_id": 1,
      "slot_id": 0,
      "connector_type": "SFP",
      "row_id": 1,
      "transformations": [
        {
          "is_default": true,
          "interfaces": [
            {
              "state": "active",
              "setting": "{\n  \"interface\": {\n    \"speed\": \"1g\"\n  },\n  \"global\": {\n    \"speed\": \"\"\n  }\n}",
              "speed": {
                "unit": "G",
                "value": 1
              },
              "name": "ge-0/0/6",
              "interface_id": 1
            }
          ],
          "transformation_id": 1
        }
      ],
      "port_id": 7,
      "failure_domain_id": 1,
      "column_id": 7
    },
    {
      "display_id": 8,
      "panel_id": 1,
      "slot_id": 0,
      "connector_type": "SFP",
      "row_id": 1,
      "transformations": [
        {
          "is_default": true,
          "interfaces": [
            {
              "state": "active",
              "setting": "{\n  \"interface\": {\n    \"speed\": \"1g\"\n  },\n  \"global\": {\n    \"speed\": \"\"\n  }\n}",
              "speed": {
                "unit": "G",
                "value": 1
              },
              "name": "ge-0/0/7",
              "interface_id": 1
            }
          ],
          "transformation_id": 1
        }
      ],
      "port_id": 8,
      "failure_domain_id": 1,
      "column_id": 8
    },
    {
      "display_id": 9,
      "panel_id": 1,
      "slot_id": 0,
      "connector_type": "SFP",
      "row_id": 1,
      "transformations": [
        {
          "is_default": true,
          "interfaces": [
            {
              "state": "active",
              "setting": "{\n  \"interface\": {\n    \"speed\": \"1g\"\n  },\n  \"global\": {\n    \"speed\": \"\"\n  }\n}",
              "speed": {
                "unit": "G",
                "value": 1
              },
              "name": "ge-0/0/8",
              "interface_id": 1
            }
          ],
          "transformation_id": 1
        }
      ],
      "port_id": 9,
      "failure_domain_id": 1,
      "column_id": 9
    },
    {
      "display_id": 10,
      "panel_id": 1,
      "slot_id": 0,
      "connector_type": "SFP",
      "row_id": 1,
      "transformations": [
        {
          "is_default": true,
          "interfaces": [
            {
              "state": "active",
              "setting": "{\n  \"interface\": {\n    \"speed\": \"1g\"\n  },\n  \"global\": {\n    \"speed\": \"\"\n  }\n}",
              "speed": {
                "unit": "G",
                "value": 1
              },
              "name": "ge-0/0/9",
              "interface_id": 1
            }
          ],
          "transformation_id": 1
        }
      ],
      "port_id": 10,
      "failure_domain_id": 1,
      "column_id": 10
    },
    {
      "display_id": 11,
      "panel_id": 2,
      "slot_id": 0,
      "connector_type": "SFP",
      "row_id": 1,
      "transformations": [
        {
          "is_default": true,
          "interfaces": [
            {
              "state": "active",
              "setting": "{\n  \"interface\": {\n    \"speed\": \"1g\"\n  },\n  \"global\": {\n    \"speed\": \"\"\n  }\n}",
              "speed": {
                "unit": "G",
                "value": 1
              },
              "name": "ge-0/1/0",
              "interface_id": 1
            }
          ],
          "transformation_id": 1
        }
      ],
      "port_id": 11,
      "failure_domain_id": 1,
      "column_id": 1
    },
    {
      "display_id": 12,
      "panel_id": 2,
      "slot_id": 0,
      "connector_type": "SFP",
      "row_id": 1,
      "transformations": [
        {
          "is_default": true,
          "interfaces": [
            {
              "state": "active",
              "setting": "{\n  \"interface\": {\n    \"speed\": \"1g\"\n  },\n  \"global\": {\n    \"speed\": \"\"\n  }\n}",
              "speed": {
                "unit": "G",
                "value": 1
              },
              "name": "ge-0/1/1",
              "interface_id": 1
            }
          ],
          "transformation_id": 1
        }
      ],
      "port_id": 12,
      "failure_domain_id": 1,
      "column_id": 2
    },
    {
      "display_id": 13,
      "panel_id": 2,
      "slot_id": 0,
      "connector_type": "SFP",
      "row_id": 1,
      "transformations": [
        {
          "is_default": true,
          "interfaces": [
            {
              "state": "active",
              "setting": "{\n  \"interface\": {\n    \"speed\": \"1g\"\n  },\n  \"global\": {\n    \"speed\": \"\"\n  }\n}",
              "speed": {
                "unit": "G",
                "value": 1
              },
              "name": "ge-0/1/2",
              "interface_id": 1
            }
          ],
          "transformation_id": 1
        }
      ],
      "port_id": 13,
      "failure_domain_id": 1,
      "column_id": 3
    },
    {
      "display_id": 14,
      "panel_id": 2,
      "slot_id": 0,
      "connector_type": "SFP",
      "row_id": 1,
      "transformations": [
        {
          "is_default": true,
          "interfaces": [
            {
              "state": "active",
              "setting": "{\n  \"interface\": {\n    \"speed\": \"1g\"\n  },\n  \"global\": {\n    \"speed\": \"\"\n  }\n}",
              "speed": {
                "unit": "G",
                "value": 1
              },
              "name": "ge-0/1/3",
              "interface_id": 1
            }
          ],
          "transformation_id": 1
        }
      ],
      "port_id": 14,
      "failure_domain_id": 1,
      "column_id": 4
    },
    {
      "display_id": 15,
      "panel_id": 2,
      "slot_id": 0,
      "connector_type": "SFP",
      "row_id": 1,
      "transformations": [
        {
          "is_default": true,
          "interfaces": [
            {
              "state": "active",
              "setting": "{\n  \"interface\": {\n    \"speed\": \"1g\"\n  },\n  \"global\": {\n    \"speed\": \"\"\n  }\n}",
              "speed": {
                "unit": "G",
                "value": 1
              },
              "name": "ge-0/1/4",
              "interface_id": 1
            }
          ],
          "transformation_id": 1
        }
      ],
      "port_id": 15,
      "failure_domain_id": 1,
      "column_id": 5
    },
    {
      "display_id": 16,
      "panel_id": 2,
      "slot_id": 0,
      "connector_type": "SFP",
      "row_id": 1,
      "transformations": [
        {
          "is_default": true,
          "interfaces": [
            {
              "state": "active",
              "setting": "{\n  \"interface\": {\n    \"speed\": \"1g\"\n  },\n  \"global\": {\n    \"speed\": \"\"\n  }\n}",
              "speed": {
                "unit": "G",
                "value": 1
              },
              "name": "ge-0/1/5",
              "interface_id": 1
            }
          ],
          "transformation_id": 1
        }
      ],
      "port_id": 16,
      "failure_domain_id": 1,
      "column_id": 6
    },
    {
      "display_id": 17,
      "panel_id": 2,
      "slot_id": 0,
      "connector_type": "SFP",
      "row_id": 1,
      "transformations": [
        {
          "is_default": true,
          "interfaces": [
            {
              "state": "active",
              "setting": "{\n  \"interface\": {\n    \"speed\": \"1g\"\n  },\n  \"global\": {\n    \"speed\": \"\"\n  }\n}",
              "speed": {
                "unit": "G",
                "value": 1
              },
              "name": "ge-0/1/6",
              "interface_id": 1
            }
          ],
          "transformation_id": 1
        }
      ],
      "port_id": 17,
      "failure_domain_id": 1,
      "column_id": 7
    },
    {
      "display_id": 18,
      "panel_id": 2,
      "slot_id": 0,
      "connector_type": "SFP",
      "row_id": 1,
      "transformations": [
        {
          "is_default": true,
          "interfaces": [
            {
              "state": "active",
              "setting": "{\n  \"interface\": {\n    \"speed\": \"1g\"\n  },\n  \"global\": {\n    \"speed\": \"\"\n  }\n}",
              "speed": {
                "unit": "G",
                "value": 1
              },
              "name": "ge-0/1/7",
              "interface_id": 1
            }
          ],
          "transformation_id": 1
        }
      ],
      "port_id": 18,
      "failure_domain_id": 1,
      "column_id": 8
    },
    {
      "display_id": 19,
      "panel_id": 2,
      "slot_id": 0,
      "connector_type": "SFP",
      "row_id": 1,
      "transformations": [
        {
          "is_default": true,
          "interfaces": [
            {
              "state": "active",
              "setting": "{\n  \"interface\": {\n    \"speed\": \"1g\"\n  },\n  \"global\": {\n    \"speed\": \"\"\n  }\n}",
              "speed": {
                "unit": "G",
                "value": 1
              },
              "name": "ge-0/1/8",
              "interface_id": 1
            }
          ],
          "transformation_id": 1
        }
      ],
      "port_id": 19,
      "failure_domain_id": 1,
      "column_id": 9
    },
    {
      "display_id": 20,
      "panel_id": 2,
      "slot_id": 0,
      "connector_type": "SFP",
      "row_id": 1,
      "transformations": [
        {
          "is_default": true,
          "interfaces": [
            {
              "state": "active",
              "setting": "{\n  \"interface\": {\n    \"speed\": \"1g\"\n  },\n  \"global\": {\n    \"speed\": \"\"\n  }\n}",
              "speed": {
                "unit": "G",
                "value": 1
              },
              "name": "ge-0/1/9",
              "interface_id": 1
            }
          ],
          "transformation_id": 1
        }
      ],
      "port_id": 20,
      "failure_domain_id": 1,
      "column_id": 10
    },
    {
      "display_id": 21,
      "panel_id": 3,
      "slot_id": 0,
      "connector_type": "SFP",
      "row_id": 1,
      "transformations": [
        {
          "is_default": true,
          "interfaces": [
            {
              "state": "active",
              "setting": "{\n  \"interface\": {\n    \"speed\": \"10g\"\n  },\n  \"global\": {\n    \"speed\": \"\"\n  }\n}",
              "speed": {
                "unit": "G",
                "value": 10
              },
              "name": "xe-0/2/0",
              "interface_id": 1
            }
          ],
          "transformation_id": 1
        }
      ],
      "port_id": 21,
      "failure_domain_id": 1,
      "column_id": 1
    },
    {
      "display_id": 22,
      "panel_id": 3,
      "slot_id": 0,
      "connector_type": "SFP",
      "row_id": 1,
      "transformations": [
        {
          "is_default": true,
          "interfaces": [
            {
              "state": "active",
              "setting": "{\n  \"interface\": {\n    \"speed\": \"10g\"\n  },\n  \"global\": {\n    \"speed\": \"\"\n  }\n}",
              "speed": {
                "unit": "G",
                "value": 10
              },
              "name": "xe-0/2/1",
              "interface_id": 1
            }
          ],
          "transformation_id": 1
        }
      ],
      "port_id": 22,
      "failure_domain_id": 1,
      "column_id": 2
    },
    {
      "display_id": 23,
      "panel_id": 4,
      "slot_id": 0,
      "connector_type": "SFP",
      "row_id": 1,
      "transformations": [
        {
          "is_default": true,
          "interfaces": [
            {
              "state": "active",
              "setting": "{\n  \"interface\": {\n    \"speed\": \"10g\"\n  },\n  \"global\": {\n    \"speed\": \"\"\n  }\n}",
              "speed": {
                "unit": "G",
                "value": 10
              },
              "name": "xe-0/3/0",
              "interface_id": 1
            }
          ],
          "transformation_id": 1
        }
      ],
      "port_id": 23,
      "failure_domain_id": 1,
      "column_id": 1
    },
    {
      "display_id": 24,
      "panel_id": 4,
      "slot_id": 0,
      "connector_type": "SFP",
      "row_id": 1,
      "transformations": [
        {
          "is_default": true,
          "interfaces": [
            {
              "state": "active",
              "setting": "{\n  \"interface\": {\n    \"speed\": \"10g\"\n  },\n  \"global\": {\n    \"speed\": \"\"\n  }\n}",
              "speed": {
                "unit": "G",
                "value": 10
              },
              "name": "xe-0/3/1",
              "interface_id": 1
            }
          ],
          "transformation_id": 1
        }
      ],
      "port_id": 24,
      "failure_domain_id": 1,
      "column_id": 2
    }
  ]
}
