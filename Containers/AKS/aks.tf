# Publicly available module
# https://registry.terraform.io/modules/Azure/aks/azurerm/latest

module "aks" {
	version = "4.8.0"
	source = "Azure/aks/azurerm"
	resource_group_name = var.aks_config["resource_group_name"]
	kubernetes_version = var.aks_config["kubernetes_version"]
	orchestrator_version = var.aks_config["orchestrator_version"]
	prefix = var.aks_config["cluster_name"]
	network_plugin = var.aks_config["network_plugin"]
	vnet_subnet_id = module.network.vnet_subnets[0]
	os_disk_size_gb = var.aks_config["os_disk_size_gb"]
	sku_tier = var.aks_config["sku_tier"]
	enable_role_based_access_control = var.aks_config["enable_role_based_access_control"]
	rbac_aad_admin_group_object_ids = [azuread_group.example.id]
	rbac_aad_managed = var.aks_config["rbac_aad_managed"]
	private_cluster_enabled = var.aks_config["private_cluster_enabled"] # default value
	enable_http_application_routing = var.aks_config["enable_http_application_routing"]
	enable_azure_policy = var.aks_config["enable_azure_policy"]
	enable_auto_scaling = var.aks_config["enable_auto_scaling"]
	agents_min_count = var.aks_config["agents_min_count"]
	agents_max_count = var.aks_config["agents_max_count"]
	agents_count = null # Please set `agents_count` `null` while `enable_auto_scaling` is `true` to avoid possible `agents_count` changes.
	agents_max_pods = var.aks_config["agents_max_pods"]
	agents_pool_name = var.aks_config["agents_pool_name"]
	agents_availability_zones = var.agents_availability_zones
	agents_type = var.aks_config["agents_type"]
	agents_labels = {
		"nodepool" : "defaultnodepool"
	}
	agents_tags = {
		"Agent" : "defaultnodepoolagent"
	}
	network_policy = "azure"
	net_profile_dns_service_ip = "10.0.0.10"
	net_profile_docker_bridge_cidr = "170.10.0.1/16"
	net_profile_service_cidr = "10.0.0.0/16"
	depends_on = [module.network]
}
