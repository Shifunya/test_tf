variable "identifier" {}
variable "ec2_ami" {}
variable "ec2_instance_type" {}
variable "ec2_availibility_zone" {}
variable "ec2_subnet_id" {}
variable "ec2_security_group_ids" {}
# variable "ssh1" {}
variable "ec2_key_name" {}


resource "aws_instance" "ec2" {
  ami                    = var.ec2_ami
  instance_type          = var.ec2_instance_type
  key_name               = var.ec2_key_name
  monitoring             = true
  availability_zone      = var.ec2_availibility_zone[0]
  subnet_id              = var.ec2_subnet_id
  vpc_security_group_ids = var.ec2_security_group_ids

  tags = {
    Name = var.identifier
  }
}
