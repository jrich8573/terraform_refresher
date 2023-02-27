provider "aws" {
    region = "us-east-1"
}

# String variables
variable "vpcname" {
    type = string
    default = "spline_vpc"
}

# numbers variable (int type)
variable "sshport" {
    type = number
    default = 22
}

#boolean variable
variable "enabled" {
     default = true
}

# list variables
variable "mylist" {
    type = list(string)
    default = ["value1","value2"] # can be use for things such as firewall rules. Indexed value 0 
}

# map variable
variable "mymap" {
    type = map
    default = {
        key1 = "value1"
        key2 = "value"
    }
}

variable "inputname"{
    type = string
    description = "set the name of the vpc"
}

# AWS limites the number of VPCs to 5 per account
resource "aws_vpc" "spline_vpc" {
    cidr_block = "10.192.8.0/23"


    tags = {
        Name = var.inputname
    }
}

output "myoutput" {
    value = aws_vpc.spline_vpc.id # will only show after terraform apply, because it is a computed value
}

variable "my_tuple" {
    type = tuple([string, number, string])
    default = ["cat", 1, "dog"] # like a list, but supports multiple data types
}

variable "myobject" {
    type = object({name = string, port = list(number)})
    default = {
      name = "Jason"
      port =  [22,25, 80]
    }
}
