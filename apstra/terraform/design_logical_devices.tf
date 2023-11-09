## ################################################################################################
## Design > Logical Devices
## Name:    AOS-20x1+4x10
## ################################################################################################

resource "apstra_logical_device" "aos_20x1_4x10" {
  name = "AOS-20x1+4x10"
  panels = [
    {
      rows    = 1
      columns = 10
      port_groups = [
        {
          port_count = 10
          port_speed = "1G"
          port_roles = ["superspine", "spine", "leaf", "peer", "access", "generic", "unused"]
        }
      ]
    },
    {
      rows    = 1
      columns = 10
      port_groups = [
        {
          port_count = 10
          port_speed = "1G"
          port_roles = ["superspine", "spine", "leaf", "peer", "access", "generic", "unused"]
        }
      ]
    },
    {
      rows    = 1
      columns = 2
      port_groups = [
        {
          port_count = 2
          port_speed = "10G"
          port_roles = ["superspine", "spine", "leaf", "peer", "access", "generic", "unused"]
        }
      ]
    },
    {
      rows    = 1
      columns = 2
      port_groups = [
        {
          port_count = 2
          port_speed = "10G"
          port_roles = ["superspine", "spine", "leaf", "peer", "access", "generic", "unused"]
        }
      ]
    }
  ]
}
