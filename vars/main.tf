provider "aws" {
  region = "us-east-2"
}

variable "num_of_servers" {
   type = number
}
resource "aws_instance" "ec2" {
    ami = "ami-00eeedc4036573771"
    instance_type = "t2.micro"
    count = var.num_of_servers # will create 3 instancs of an ec2 instance
}
