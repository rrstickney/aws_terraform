module "digitalocean_record" {
  source   = "./modules/digitalocean/records"
  do_token = var.do_token
  for_each = local.digitalocean_record

  name     = each.key
  type     = each.value["type"]
  ttl      = lookup(each.value, "ttl", null)
  priority = lookup(each.value, "priority", null)
  value    = lookup(each.value, "value", null)
  domain   = "icestation.is"

}
