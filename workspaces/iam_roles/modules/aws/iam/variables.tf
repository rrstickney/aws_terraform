variable "role_name" {
  type = string
}

variable "max_session_duration" {
  type    = string
  default = 3600
}

variable "assume_role_policy" {
  type = string
}

variable "managed_policy_arns" {
  type = set(string)
}
