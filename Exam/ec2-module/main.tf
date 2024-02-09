provider "aws" {
  region = "us-east-1"  
}

variable "vpc_id" {
  description = "ID of the VPC"
}

resource "aws_instance" "my_instance" {
  ami           = "ami-0c55b159cbfafe1f0"  # Change to your desired AMI
  instance_type = "t2.micro"

  vpc_security_group_ids = [aws_security_group.my_sg.id]
  subnet_id              = aws_subnet.subnet_a.id  # Use the subnet ID from vpc-module

  tags = {
    Name = "MyEC2Instance"
  }
}

resource "aws_security_group" "my_sg" {
  vpc_id = var.vpc_id  # Use the VPC ID from vpc-module

}
