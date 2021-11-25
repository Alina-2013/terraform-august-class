aks_config = {
	cluster_name = "my-cluster" 
	
	adgroup_name = "DevOps"
	address_space = "10.1.0.0/16"
	resource_group_name = "aks-resource-group"
	location = "eastus"
	kubernetes_version = "1.21.1"
	orchestrator_version = "1.21.1"
	network_plugin = "azure"
	os_disk_size_gb = 50
	sku_tier = "Paid" # defaults to Free
	enable_role_based_access_control = true
	rbac_aad_managed = true
	private_cluster_enabled = false # default value
	enable_http_application_routing = true
	enable_azure_policy = true
	enable_auto_scaling = true
	agents_min_count = 1
	agents_max_count = 2
	agents_count = null # Please set `agents_count` `null` while `enable_auto_scaling` is `true` to avoid possible `agents_count` changes.
	agents_max_pods = 100
	agents_pool_name = "exnodepool"
	agents_type = "VirtualMachineScaleSets"
}

agents_availability_zones = ["1", "2"]
subnet_prefixes = ["10.1.0.0/24"]
subnet_names = ["subnet1"]
