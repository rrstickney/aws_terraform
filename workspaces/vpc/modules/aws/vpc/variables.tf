
variable "vpc_name" {
  description = "VPC Name"
  type        = string
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
}

variable "vpc_azs" {
  description = "Availability zones for VPC"
  type        = list(string)
}

variable "vpc_private_subnets" {
  description = "Private subnets for VPC"
  type        = list(string)
}

variable "vpc_private_subnet_tags" {
  description = "tags for private subnets"
  type        = map(string)
}

variable "vpc_public_subnets" {
  description = "Public subnets for VPC"
  type        = list(string)
}

variable "vpc_public_subnet_tags" {
  description = "tags for public subnets"
  type        = map(string)
}

variable "vpc_enable_nat_gateway" {
  description = "Enable NAT gateway for VPC"
  type        = bool
  default     = true
}

variable "vpc_single_nat_gateway" {
  description = "one nat gateway instead of one per AZ"
  type        = bool
  default     = true
}

variable "tags" {
  description = "tags"
  type        = map(any)
}

