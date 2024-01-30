
variable "rodney_aws_provider_region" {
  type = string
  default = "us-east-2"
}


variable "rodney_one_resource"{
   type = bool
}



variable "rodney_vpc"{
    type = object({
        cidr_block = string 
        enable_dns_support = string
        enable_dns_hostnames = string
        instance_tenancy = string
        Name = string
        Owner = string
    })

    default = {
        cidr_block = "10.0.0.0/16"
        enable_dns_support = "true"
        enable_dns_hostnames = "true"
        instance_tenancy = "default"
        Name = "rodney-real-Hashi-dev-vpc"
        Owner = "rodney-real-Hashi-dev-vpc"
    }
}




variable "rod_aws_subnets"{
    type = list(object({
                cidr_block = string
                availability_zone = string
                Name = string
                Owner = string
            })
    )

    default = [
        {
            cidr_block ="10.0.0.0/28",
            availability_zone = "us-east-2a"
            Name = "rodney-real-Hashi-dev-subnet-1"
            Owner = "rodney-real-Hashi-dev-subnet-1"
        },
        {
            cidr_block ="10.0.0.16/28"
            availability_zone = "us-east-2b"
            Name = "rodney-real-Hashi-dev-subnet-2"
            Owner = "rodney-real-Hashi-dev-subnet-2"
        }
    ]

}




variable "rod_aws_instances"{
    type = list(object({
            ami  = string
            instance_type = string
            availability_zone = string
            Name = string
            owner = string
            resource_location_tag = string
            expiration_date = string
        })
    )

    default = [
      {
          ami    = "ami-0283a57753b18025b"
          instance_type = "t2.medium"
          availability_zone = "us-east-2"
          Name = "rodney-real-hashi-dev-instance-1"
          owner = "rodney-real-hashi-dev-instance-1"
          resource_location_tag = "ghana1"
          expiration_date = "17-12-23"
      },
      {
          ami    = "ami-0283a57753b18025b"
          availability_zone = "us-east-2"
          instance_type = "t2.medium"
          Name = "rodney-real-hashi-dev-instance-2"
          owner = "rodney-real-hashi-dev-instance-2"
          resource_location_tag = "ghana1"
          expiration_date = "17-12-23"
      }
    ]
}


variable "r_security_group_details"{

  type = object(
            {
              name = string
            }
          )
   default = {
      name = "rodney-real-Hashi-dev-security-group"
   }       
   
}


variable "r_target_group_details"{

  type = object(
            {
              name = string
              port = number
              protocol = string
            }
          )
   default = {
      name = "rodney-real-Hash-targ-dev-group"
      port = 80
      protocol = "HTTP"
   }       
   
}

variable "r_load_balancer_details"{

  type = object(
            {
              name = string
            
            }
          )
   default = {
      name = "rodney-real-Hashi-aws-dev-lb"
      
   }       
   
}

variable "r_internt_gateway_details" {
  type = object(
            {
              name = string
            
            }
          )
   default = {
      name = "rodney-internet-dev-gateway"
      
   } 
  
}


