

resource "aws_instance" "rodney-real-hashi-instances" {

  count = var.rodney_one_resource ? "1" : "${length(var.rod_aws_instances)}"

  ami           = "${var.rod_aws_instances[count.index].ami}"
  instance_type = "${var.rod_aws_instances[count.index].instance_type}"
  associate_public_ip_address = true

  subnet_id =  "${element(var.rodney_aws_subnets.*.id, count.index)}"
  vpc_security_group_ids = [var.rodney_security_group.id]

  key_name = "jed_awintech_keypair"

  tags = {
    Name = "${var.rod_aws_instances[count.index].Name}"
    owner = "${var.rod_aws_instances[count.index].owner}"
    resource_location_tag = "${var.rod_aws_instances[count.index].resource_location_tag}"
    expiration_date = "${var.rod_aws_instances[count.index].expiration_date}"
  }
}

#
## Create an EBS volume
#resource "aws_ebs_volume" "example_volume" {
##  availability_zone = aws_instance.example_instance.availability_zone
#  availability_zone = "us-east-2a"
#  size              = 50  # Size of the volume in gigabytes
#  type              = "gp2"  # Volume type (e.g., gp2, io1)
#
#}
#
## Attach the EBS volume to the EC2 instance
#resource "aws_volume_attachment" "example_attachment" {
#  device_name          = "/dev/sdf"  # Device name on the EC2 instance
##  instance_id          = aws_instance.example_instance.id
#  instance_id          = "${aws_instance.rodney-real-hashi-instances[0].id}"
#  volume_id            = aws_ebs_volume.example_volume.id
#
#}




# resource "aws_instance" "rodney-real-hashi-instance-2" {
#   ami           = var.rodney_aws_instance.ami
#   instance_type = var.rodney_aws_instance.instance_type
#   associate_public_ip_address = true
#   subnet_id = aws_subnet.rodney-real-Hashi-subnet-2.id
#   vpc_security_group_ids = [aws_security_group.rodney-real-Hashi-security-group.id]

#   tags = {
#     Name = "rodney-real-hashi-instance-2"
#     owner = "rodney-real-hashi-instance-2"
#     resource_location_tag = "ghana1"
#     expiration_date = "17-12-23"
# }
# }

