# outputs file

output "idp_provider_arn" {
  value = aws_iam_saml_provider.saml2_vpn.arn
}
