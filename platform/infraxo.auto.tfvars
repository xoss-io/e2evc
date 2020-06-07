
    # AWS
    aws_account_id = "136691220971"
    
    aws_region = "eu-central-1"
    
    aws_profile = "terraform-demolab" # aws configure --profile terraform-demolab => with access key of terraform-demolab user
    
    # Terraform labels
    
    company_fullname = "XOSS.io"
    
    app_fullname = "E2EVC demo"
    
    company_name = "xoss"
    
    app_name = "e2evc"
    
    # Network
    
    network_address = "10.100.0.0/16"
    
    subnet_count = 2
    
    public_subnet_address_pool = ["10.100.101.0/24", "10.100.102.0/24", "10.100.103.0/24", "10.100.104.0/24", "10.100.105.0/24"]
    
    private_subnet_address_pool = ["10.100.1.0/24", "10.100.2.0/24", "10.100.3.0/24", "10.100.4.0/24", "10.100.5.0/24"]
    
    # Active Directory Domain
    
    ad_domain_name = "e2evc.demo"
    
    ad_domain_controller_ip = "172.31.23.180"
    
    ad_domain_admin_username = "Administrator"
    
    ad_domain_admin_password = "*hwRngakmgahXt&-oD=wjAy9DwUY=%jU"
    
    # Domain (Route53)
    
    domain_name = "e2evc.info"
    
    # DSC
    dsc_pullserver_url = "https://config.infraxo-dev.com/api/dsc"
    
    dsc_registration_key = "3e0cbed0-0b21-4e8e-874e-7577f9cda75f"
    
    # Citrix
    
    #citrix_storefront_ami_name = "Windows_SRV2K19_Base"
    
    #citrix_storefront_instance_count = 2
    
    #citrix_storefront_instance_type = "t2.medium"
    
    #citrix_storefront_volume_size_in_gb = 30
    
    citrix_storefront_hostname = "DEMOWWW"
    
    #citrix_ddc_ami_name = "Windows_SRV2K19_Base"
    
    #citrix_ddc_instance_count = 2
    
    #citrix_ddc_instance_type = "t2.large" // Needs minimum 5gb ram => t2.medium is not enough
    
    #citrix_ddc_volume_size_in_gb = 30
    
    citrix_ddc_hostname = "DEMOWAP"
    
    #citrix_database_ami_name = "Windows_SRV2K19_Base"
    
    #citrix_database_instance_type = "t2.medium"
    
    #citrix_database_volume_size_in_gb = 30
    
    citrix_database_hostname = "DEMOWDB"
    
    citrix_storefront_ami_name = "W2K16 DC Base Role"
	citrix_storefront_instance_count = 2
	citrix_storefront_instance_type = "m4.large"
	citrix_storefront_volume_size_in_gb = 30
	citrix_ddc_ami_name = "W2K16 DC Base Role"
	citrix_ddc_instance_count = 2
	citrix_ddc_instance_type = "m4.large"
	citrix_ddc_volume_size_in_gb = 30
	citrix_database_ami_name = "W2K16 DC Base Role"
	citrix_database_instance_type = "m4.large"
	citrix_database_volume_size_in_gb = 30
	