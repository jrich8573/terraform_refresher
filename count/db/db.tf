variable "server_names" {
    type = list(string)
}

resource "aws_instance" "db" {
    ami = "ami-00eeedc4036573771"
    instance_type = "t2.micro"
    count = length(var.server_names)
    tags = {
        Name = var.server_names[count.index] # index 0
    }
}

# working with resources and attributes within modules
# and are made available within the module. You can pass the output of 
# one module to another

output "PrivateIP" {
    value = aws_instance.db.*.private_ip 
    # * is a wildcard for the name of the db
}