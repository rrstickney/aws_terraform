resource "aws_route53_zone" "aws_icestation_is" {
  name = "aws.icestation.is"
}

resource "digitalocean_record" "aws_icestation_is" {
  for_each = toset(aws_route53_zone.aws_icestation_is.name_servers)

  domain = "icestation.is"
  type   = "NS"
  name   = "aws"
  value  = "${each.value}."
}
