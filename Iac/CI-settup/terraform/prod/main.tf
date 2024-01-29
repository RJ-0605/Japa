
locals {
    env = "prod"
    one_resource = false
}

module "networking"{
    source = "../modules/networking"

    rodney_aws_instances = module.compute.rodney_aws_instances

    rodney_env = "${local.env}"

    rodney_one_resource = "${var.rodney_one_resource}"

    rodney_vpc = var.rodney_vpc

    rod_aws_subnets = var.rod_aws_subnets

    r_security_group_details = var.r_security_group_details

    r_target_group_details = var.r_target_group_details
}


module "compute"{
    source = "../modules/compute"

    rod_aws_instances = var.rod_aws_instances

    rodney_aws_subnets = module.networking.rodney_aws_subnets

    rodney_security_group = module.networking.rodney-real-Hashi-security-group

    rodney_env = "${local.env}"

    rodney_one_resource = "${local.one_resource}"
}




