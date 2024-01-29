
output "rodney_vpc_id"{
    value = aws_vpc.rodney-real-Hashi-vpc.id
}

output "rodney_vpc_arn"{
    value = aws_vpc.rodney-real-Hashi-vpc.arn
}


output "rodney_vpc"{
    value = aws_vpc.rodney-real-Hashi-vpc
}


output "rodney_aws_subnets"{
    value = aws_subnet.rodney-real-Hashi-subnets
}

output "rodney-real-Hashi-security-group"{
    value = aws_security_group.rodney-real-Hashi-security-group
}




# output "rodney_vpc_subnets_1"{
#     value = aws_subnet.rodney-real-Hashi-subnet-1
# }

# output "rodney_vpc_subnets_2"{
#     value = aws_subnet.rodney-real-Hashi-subnet-2
# }