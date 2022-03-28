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

# resource "<provider>_<resource_type>" "name" { config option ... key = "value" key2 = "another value"}
resource "aws_instance" "my-first-server" {
  ami           = "ami-0b7dcd6e6fd797935"
  instance_type = "t2.micro"

  tags = {
    Name = "ubuntu"
  }
}