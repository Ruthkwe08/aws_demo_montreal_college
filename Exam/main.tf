provider "aws" {
  region = "us-east-1"  # Change to your preferred region
}

module "vpc" {
  source = "./vpc-module"
}

module "ec2" {
  source = "./ec2-module"
  vpc_id = module.vpc.vpc_id
}
