resource "aws_subnet" "rodney-real-Hashi-subnets"{

    count = var.rodney_one_resource ? "1" : "${length(var.rod_aws_subnets)}"


    vpc_id = aws_vpc.rodney-real-Hashi-vpc.id

    cidr_block = "${var.rod_aws_subnets[count.index].cidr_block}"
    availability_zone = "${var.rod_aws_subnets[count.index].availability_zone}"

    tags = {
        Name = "${var.rod_aws_subnets[count.index].Name}"
        owner = "${var.rod_aws_subnets[count.index].Owner}"
        resource_location_tag = "ghana1"
        expiration_date = "17-12-23"
    }
}

