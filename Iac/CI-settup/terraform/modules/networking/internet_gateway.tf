# Create Internet Gateway and Attach it to VPC
# terraform aws create internet gateway
resource "aws_internet_gateway" "rodney-internet-gateway" {
vpc_id    = aws_vpc.rodney-real-Hashi-vpc.id
    tags={
            Name = var.r_internt_gateway_details.name
            owner = var.r_internt_gateway_details.name
            resource_location_tag = "ghana1"
            expiration_date = "17-12-23"
        }
}


# Create Route Table and Add Public Route
# terraform aws create route table
resource "aws_route_table" "rod-public-route-table" {
vpc_id       = aws_vpc.rodney-real-Hashi-vpc.id
route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.rodney-internet-gateway.id 
    }

}



# Associate Public All Subnets to "Public Route Table"
# terraform aws associate subnet with route table

resource "aws_route_table_association" "rod-public-route-table-association" {

count = var.rodney_one_resource ? "1" : "${length(var.rod_aws_subnets)}"

subnet_id           = "${element(aws_subnet.rodney-real-Hashi-subnets.*.id, count.index)}"
route_table_id      = aws_route_table.rod-public-route-table.id
}






# Associate Public Subnet 1 to "Public Route Table"
# terraform aws associate subnet with route table


# resource "aws_route_table_association" "rod-public-route-table-association-1" {
# subnet_id           = aws_subnet.rodney-real-Hashi-subnet-1.id
# route_table_id      = aws_route_table.rod-public-route-table.id
# }



# Associate Public Subnet 2 to "Public Route Table"
# terraform aws associate subnet with route table


# resource "aws_route_table_association" "rod-public-route-table-association-2" {
# subnet_id           = aws_subnet.rodney-real-Hashi-subnet-2.id
# route_table_id      = aws_route_table.rod-public-route-table.id
# }




