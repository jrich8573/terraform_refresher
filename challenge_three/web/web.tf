
resource "aws_instance" "web" {
    ami = "ami-00eeedc4036573771"
    instance_type = "t2.micro"
    security_groups = [module.sg.sg_name]
    user_data = file("./server-script.sh")
    tags = {
        Name = "Web Server"
    }
}



# working with resources and attributes within modules
# and are made available within the module. You can pass the output of 
# one module to another

module "eip" {
    source = "../eip"
    instance_id = aws_instance.web.id
}

module "sg" {
    source = "../sg"
}

output "pub_ip" {
    value = module.eip.PublicIP
}