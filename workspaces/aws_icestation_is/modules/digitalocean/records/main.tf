resource "digitalocean_record" "this" {
  domain   = var.domain
  type     = var.type
  name     = var.name
  priority = var.priority
  value    = var.value
  ttl      = var.ttl
}
