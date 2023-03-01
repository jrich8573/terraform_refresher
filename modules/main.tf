provider "aws" {
    region = "us-east-2"
}

module "ec2module" {
    source = "./ec2"
    ec2name = "Name from Module"
}