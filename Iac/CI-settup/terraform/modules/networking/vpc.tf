resource "aws_vpc" "rodney-real-Hashi-vpc"{
    cidr_block = var.rodney_vpc.cidr_block
    enable_dns_support = var.rodney_vpc.enable_dns_support
    enable_dns_hostnames = var.rodney_vpc.enable_dns_hostnames
    instance_tenancy = var.rodney_vpc.instance_tenancy

    tags={
        Name = "${var.rodney_vpc.Name}"
        owner = "${var.rodney_vpc.Owner}"
        resource_location_tag = "ghana1"
        expiration_date = "17-12-23"
    }
}
