module "aws_budgets_budget" {
  source   = "./modules/aws/aws_budgets_budget"
  for_each = local.budgets

  name              = each.key
  budget_type       = each.value.budget_type
  limit_amount      = each.value.limit_amount
  limit_unit        = each.value.limit_unit
  time_period_end   = each.value.time_period_end
  time_period_start = each.value.time_period_start
  time_unit         = each.value.time_unit
  notification      = each.value.notification
}
