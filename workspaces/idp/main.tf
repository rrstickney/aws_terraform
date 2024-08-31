resource "aws_iam_saml_provider" "google_workspaces" {
  name                   = "google_workspaces"
  saml_metadata_document = file("${path.module}/files/metadata.xml")
  tags                   = local.tags
}

module "openid_connect" {
  source   = "./modules/aws/openid_connect"
  for_each = local.openid_connect

  url             = each.value.url
  client_id_list  = each.value.client_id_list
  thumbprint_list = each.value.thumbprint_list
  tags            = merge(local.tags, { "Name" = each.key })
}
