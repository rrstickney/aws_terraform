locals {
  budgets = {
    broke_ass_budgeting_actual = {
      budget_type       = "COST"
      limit_amount      = 30
      limit_unit        = "USD"
      time_period_end   = "2025-01-01_00:00"
      time_period_start = "2024-03-01_00:00"
      time_unit         = "MONTHLY"
      notification = [
        {
          comparison_operator        = "GREATER_THAN"
          threshold                  = 75
          threshold_type             = "PERCENTAGE"
          notification_type          = "ACTUAL"
          subscriber_email_addresses = ["budget_warnings@icestation.is"]
        },
        {
          comparison_operator        = "GREATER_THAN"
          threshold                  = 90
          threshold_type             = "PERCENTAGE"
          notification_type          = "ACTUAL"
          subscriber_email_addresses = ["budget_critical@icestation.is"]
        }
      ]
    }
    broke_ass_budgeting_forecasted = {
      budget_type       = "COST"
      limit_amount      = 100
      limit_unit        = "USD"
      time_period_end   = "2025-01-01_00:00"
      time_period_start = "2024-03-01_00:00"
      time_unit         = "MONTHLY"
      notification = [
        {
          comparison_operator        = "GREATER_THAN"
          threshold                  = 50
          threshold_type             = "PERCENTAGE"
          notification_type          = "FORECASTED"
          subscriber_email_addresses = ["budget_warnings@icestation.is"]
        },
        {
          comparison_operator        = "GREATER_THAN"
          threshold                  = 75
          threshold_type             = "PERCENTAGE"
          notification_type          = "FORECASTED"
          subscriber_email_addresses = ["budget_critical@icestation.is"]
        }
      ]
    }
  }
}
