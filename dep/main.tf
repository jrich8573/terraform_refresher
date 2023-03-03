provider "aws" {
    region = "us-east-2"
  
}

resource "aws_instance" "db" {
    ami = "ami-00eeedc4036573771"
    instance_type = "t2.micro"

    tags = {
      Name = "DB Server"
    }
}

resource "aws_instance" "web" {
    ami = "ami-00eeedc4036573771"
    instance_type = "t2.micro"

    tags = {
      Name  = "Web Server"
    }
    depends_on = [aws_instance.db] # when one resourse depend on another
}

data "aws_instance" "dbsearch" {
    filter {
      name = "tag:Name" # key:value looking for all tags with a specific name
      values = ["DB Server"]
    }
}

output "dbserver" {
    value = data.aws_instance.dbsearch.availability_zone
}