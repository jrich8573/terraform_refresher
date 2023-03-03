provider "aws" {
    region = "us-east-1"
}


# AWS limites the number of VPCs to 5 per account
resource "aws_vpc" "spline_vpc" {
    cidr_block = "10.192.8.0/23"
}


resource "aws_vpc" "spline_vpc2" {
    cidr_block = "192.168.0.0/24"
}
# bring the new VPC under terraform's control, run
# terraform import aws_vpc.spline_vpc2 vpc-03db7c242cd8c8929
# This assumes you have setup the second vpc within the console