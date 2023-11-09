## ################################################################################################
## Design > Interface Maps
## Name:    Juniper_vEX9214__AOS-20x1+4x10
##          |-> Logical device:     AOS-20x1+4x10
##          |-> Device profile:     Juniper vEX9214
## ################################################################################################

locals {
  vex9214_p0g0_port_count    = apstra_logical_device.aos_20x1_4x10.panels[0].port_groups[0].port_count      // Port Group #1 = count: 10
  vex9214_p0g0_ld_port_first = 1                                                                            // First Logical Port in Panel #1 => 1

  vex9214_p1g0_port_count    = apstra_logical_device.aos_20x1_4x10.panels[1].port_groups[0].port_count      // Port Group 2 = count: 10
  vex9214_p1g0_ld_port_first = 1                                                                            // First Logical Port in Panel #2 => 1

  vex9214_p2g0_port_count    = apstra_logical_device.aos_20x1_4x10.panels[2].port_groups[0].port_count      // Port Group #3 = count: 2
  vex9214_p2g0_ld_port_first = 1                                                                            // First Logical Port in Panel #3 => 1

  vex9214_p3g0_port_count    = apstra_logical_device.aos_20x1_4x10.panels[3].port_groups[0].port_count      // Port Group #4 = count: 2
  vex9214_p3g0_ld_port_first = 1                                                                            // First Logical Port in Panel #4 => 1
}

resource "apstra_interface_map" "vex9214" {
  name              = "Juniper_vEX9214__${apstra_logical_device.aos_20x1_4x10.name}"
  logical_device_id = apstra_logical_device.aos_20x1_4x10.id
  device_profile_id = "Juniper_vEX9214"
  interfaces = flatten([
    // Panel #1
    [for i in range(local.vex9214_p0g0_port_count) :
      {
        logical_device_port     = "1/${local.vex9214_p0g0_ld_port_first + i}"           // Panel#1 [ port#1 - port#10 ]
        physical_interface_name = "ge-0/0/${i}"                                         // Phisical Device Interfaces: ge-0/0/0 - ge-0/0/9
      }
    ],
    // Panel #2
    [for i in range(local.vex9214_p1g0_port_count) :
      {
        logical_device_port     = "2/${local.vex9214_p1g0_ld_port_first + i}"           // Panel#2 [ port#1 - port#10 ]
        physical_interface_name = "ge-0/1/${i}"                                         // Phisical Device Interfaces: ge-0/1/0 - ge-0/1/9
      }
    ],
    // Panel #3
    [for i in range(local.vex9214_p2g0_port_count) :
      {
        logical_device_port     = "3/${local.vex9214_p2g0_ld_port_first + i}"           // Panel#3 [ port#1 - port#2 ]
        physical_interface_name = "xe-0/2/${i}"                                         // Phisical Device Interfaces: xe-0/2/0 - xe-0/2/1
      }
    ],
    // Panel #4
    [for i in range(local.vex9214_p3g0_port_count) :
      {
        logical_device_port     = "4/${local.vex9214_p3g0_ld_port_first + i}"           // Panel#4 [ port#1 - port#2 ]
        physical_interface_name = "xe-0/3/${ i}"                                        // Phisical Device Interfaces: xe-0/3/0 - xe-0/3/1
      }
    ],
  ])
}
