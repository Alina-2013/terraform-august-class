variable "region" {
  type        = string
  description = "Please provide a region for instances"
  default     = "us-east-1"
}
variable "key_name" {
  type        = string
  description = "Please provide a key pair name for instances"
  default     = "class2-key"
}
variable "sec_group_name" {
  type        = string
  description = "Please provide a sec group name for instances"
  default     = "allow_tls"
}
variable "instance_type" {
    type        = string
    description = "Please provide an instance type"
   default = "t3.micro" 
}