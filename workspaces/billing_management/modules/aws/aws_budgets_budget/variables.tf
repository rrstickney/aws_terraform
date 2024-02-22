variable "name" {
  type        = string
  description = "budget name"
}

variable "budget_type" {
  type        = string
  description = "budget type"
}

variable "limit_amount" {
  type        = number
  description = "amount limit"
}

variable "limit_unit" {
  type        = string
  description = "limit unit"
  default     = "USD"
}

variable "time_period_end" {
  type        = string
  description = "YYYY-MM-DD_HH:MM"
}

variable "time_period_start" {
  type        = string
  description = "YYYY-MM-DD_HH:MM"
}

variable "time_unit" {
  type        = string
  description = "MONTHLY, QUATERLY, ANNUALLY, DAILY"
}

variable "notification" {
  description = "budget notification configs"
  type = list(object({
    comparison_operator        = string
    threshold                  = number
    threshold_type             = string
    notification_type          = string
    subscriber_email_addresses = list(string)
  }))
}
