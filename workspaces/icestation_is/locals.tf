locals {
  digitalocean_record = {
    "ns1" = {
      name  = "@"
      type  = "NS"
      value = "ns1.digitalocean.com."
      ttl   = 86400
    }
    "ns2" = {
      name  = "@"
      type  = "NS"
      value = "ns2.digitalocean.com."
      ttl   = 86400
    }
    "ns3" = {
      name  = "@"
      type  = "NS"
      value = "ns3.digitalocean.com."
      ttl   = 86400
    }
    "ha" = {
      type  = "A"
      value = "192.168.7.5"
    }
    "@" = {
      type     = "MX"
      value    = "smtp.google.com."
      priority = "1"
    }
    "spf_records" = {
      name  = "@"
      type  = "TXT"
      value = "v=spf1 include:_spf.google.com ~all"
      ttl   = 3600
    }
  }
}
