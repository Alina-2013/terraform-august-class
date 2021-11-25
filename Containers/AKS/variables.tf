variable "aks_config" {
	type = map(any)
}
variable "subnet_prefixes" {
	type = list(any)
}
variable "subnet_names" {
	type = list(any)
}
variable "agents_availability_zones" {
	type = list(any)
}
