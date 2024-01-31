module "iam_role" {
  source   = "./modules/aws/iam"
  for_each = local.roles

  role_name           = each.value.name
  assume_role_policy  = file("${path.module}/files/assume_role.json")
  managed_policy_arns = each.value.managed_policy_arns
}
