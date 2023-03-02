
resource "aws_instance" "db" {
    ami = "ami-00eeedc4036573771"
    instance_type = "t2.micro"
    tags = {
        Name = "DB Server"
    }
}

# working with resources and attributes within modules
# and are made available within the module. You can pass the output of 
# one module to another

output "PrivateIP" {
    value = aws_instance.db.private_ip
}