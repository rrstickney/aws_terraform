variable "role_name" {
  type = string
}

variable "assume_role_policy" {
  type = string
}

variable "managed_policy_arns" {
  type = set(string)
}
