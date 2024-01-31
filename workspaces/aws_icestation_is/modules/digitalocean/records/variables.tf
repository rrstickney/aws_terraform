variable "domain" {
  type        = string
  description = "domain name"
  default     = null
}

variable "type" {
  type        = string
  description = "record type"
  default     = null
}

variable "name" {
  type        = string
  description = "hostnames"
  default     = null
}

variable "priority" {
  type        = number
  description = "Priority for MX records"
  default     = null
}

variable "value" {
  type        = string
  description = "Record data"
}

variable "ttl" {
  type        = number
  description = "Time to live for records"
  default     = null
}

variable "do_token" {}
