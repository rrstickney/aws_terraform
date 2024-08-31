#create teh IDP provider for auth
resource "aws_iam_saml_provider" "saml2_vpn" {
  name                   = "saml2_vpn"
  saml_metadata_document = file("${path.module}/files/metadata.xml")
  tags                   = local.tags
}

