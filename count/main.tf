provider "aws" {
  region = "us-east-2"
}


module "db" {
    source = "./db"
    server_names = ["mariadb", "postgres","mysql"]
    
}

resource "aws_instance" "ec2" {
    ami = "ami-00eeedc4036573771"
    instance_type = "t2.micro"
    count = 3 # will create 3 instancs of an ec2 instance
}



output "private_ips" {
    value = module.db.PrivateIP
}