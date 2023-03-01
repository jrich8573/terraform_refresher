variable "ec2name" {
    type = string
}

resource "aws_instance" "ec2" {
    ami = "ami-00eeedc4036573771"
    instance_type = "t2.micro"
    tags = {
        Name = var.ec2name
    }
}

# working with resources and attributes within modules
# and are made available within the module. You can pass the output of 
# one module to another

output "instance_id" {
    value = aws_instance.ec2.id
}