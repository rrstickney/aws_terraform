variable "key_name" {
  description = "keypair_name"
  type        = string
}
variable "public_key" {
  description = "public key"
  type        = string
}
variable "tags" {
  description = "tags"
  type        = map(string)
}
