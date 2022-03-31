terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
  }
}
provider "aws" {
  region     = "ap-southeast-2"
  profile = "default"
}

resource "aws_vpc" "first-vpc" {
  cidr_block       = "10.0.0.0/16"
  tags = {
    Name = "production"
  }
}

resource "aws_subnet" "subnet-1" {
  vpc_id     = aws_vpc.first-vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "prod-subnet"
  }
}

# resource "<provider>_<resource_type>" "name" { config option ... key = "value" key2 = "another value"}
# resource "aws_instance" "my-first-server" {
#   ami           = "ami-0b7dcd6e6fd797935"
#   instance_type = "t2.micro"

#   tags = {
#     Name = "ubuntu"
#   }
# }