provider "aws" {
    region = "us-east-1"
}


# AWS limites the number of VPCs to 5 per account
resource "aws_vpc" "spline_vpc" {
    cidr_block = "10.192.8.0/23"
}
