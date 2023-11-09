terraform {
    required_providers {
    apstra = {
        source = "Juniper/apstra"
    }
    }
}

# Apstra credentials can be supplied through environment variables:
#export APSTRA_USER=<username>
#export APSTRA_PASS=<password>
# Alternatively, credentials can be embedded in the URL using HTTP basic authentication format

provider "apstra" {
  url                       = "https://admin:admin@10.10.2.253" # required
  tls_validation_disabled   = true                         # optional
  blueprint_mutex_enabled   = false                        # optional
  api_timeout               = 60                           # optional; 0 == infinite
  experimental              = true
}

