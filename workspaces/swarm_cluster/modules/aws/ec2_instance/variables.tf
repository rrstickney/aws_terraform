variable "name" {
  type        = string
  description = "instance name"
}
variable "instance_type" {
  type        = string
  description = "ec2 instance type"
}

variable "key_name" {
  type        = string
  description = "ssh key pair"
}

variable "monitoring" {
  type        = bool
  description = "wanna monitor this instance or not?"
}

variable "vpc_security_group_ids" {
  type        = list(string)
  description = "security group ids to attach the instance"
}

variable "subnet_id" {
  type        = string
  description = "subnet ID"
}

variable "tags" {
  type        = map(string)
  description = "tags"
}

variable "volume_tags" {
  type        = map(string)
  description = "tags, but for volumes"
}
variable "ami" {
  type        = string
  description = "ami ID"
}

variable "root_block_device" {
  type        = list(any)
  description = "root ebs volume details in a list"
}

variable "ebs_block_device" {
  type        = list(any)
  description = "root ebs volume details in a list"
}
