resource "aws_vpc" "myvpc"{
  
  module "my_vpc" { 
    source = "terraform-aws-modules/vpc/aws" 
    version = "3.0.0" 
    
   
    vpc_name = "my-vpc" 
    vpc_cidr_block = "10.0.0.0/16" 
    vpc_availability_zones = ["us-east-1a", "us-east-1b"] 
    vpc_public_subnets = ["10.0.1.0/24", "10.0.2.0/24"] 
    vpc_private_subnets = ["10.0.3.0/24", "10.0.4.0/24"] 
    vpc_database_subnets = ["10.0.5.0/24", "10.0.6.0/24"] 
    vpc_create_database_subnet_group = true 
    vpc_create_database_subnet_route_table = true 
    vpc_enable_nat_gateway = true vpc_single_nat_gateway = true 
  } 
  
  output "vpc_id" { 
    value = module.my_vpc.vpc_id
  }
}
