module "iam_role" {
  source   = "./modules/aws/iam"
  for_each = local.roles

  role_name            = each.value.name
  max_session_duration = each.value.max_session_duration
  assume_role_policy   = each.value.assume_role_policy
  managed_policy_arns  = each.value.managed_policy_arns
}
