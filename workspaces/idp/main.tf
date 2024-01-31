resource "aws_iam_saml_provider" "google_workspaces" {
  name                   = "google_workspaces"
  saml_metadata_document = file("${path.module}/files/metadata.xml")
  tags                   = local.tags
}
