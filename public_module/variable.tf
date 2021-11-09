variable "region" {
  type        = string
  default     = "us-east-2"
  description = "Region to be used"
}
variable "vpc_name" {
  type        = string
  default     = "dev"
  description = "VPC Name to be used"
}
variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = "VPC cidr to be used"
}
variable "private_subnet1" {
  type        = string
  default     = "10.0.1.0/24"
  description = "Subnet cidr to be used"
}
variable "private_subnet2" {
  type        = string
  default     = "10.0.2.0/24"
  description = "Subnet cidr to be used"
}
variable "private_subnet3" {
  type        = string
  default     = "10.0.3.0/24"
  description = "Subnet cidr to be used"
}
variable "public_subnet1" {
  type        = string
  default     = "10.0.101.0/24"
  description = "Subnet cidr to be used"
}
variable "public_subnet2" {
  type        = string
  default     = "10.0.102.0/24"
  description = "Subnet cidr to be used"
}
variable "public_subnet3" {
  type        = string
  default     = "10.0.103.0/24"
  description = "Subnet cidr to be used"
}

variable "tags" {
  description = "Tags to be used"
  type        = map(any)
  default = {
    Terraform   = "true"
    Environment = "dev"
  }
}


data "aws_availability_zones" "available" {
  state = "available"
}


