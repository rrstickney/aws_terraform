variable "name" {
  description = "security group name"
  type        = string
}
variable "description" {
  description = "security group description"
  type        = string
}

variable "vpc_id" {
  description = "vpc_id"
  type        = string
}
variable "ingress" {
  description = "ingress rules"
  type        = list(map(any))
}
variable "egress" {
  description = "egress rules"
  type        = list(map(any))
}

variable "tags" {
  description = "tags"
  type        = map(string)
}
