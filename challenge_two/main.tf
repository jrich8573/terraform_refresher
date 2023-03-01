provider "aws"{
    region = "us-east-2"
}

variable "ingressrules" {
    type = list(number)
    default = [80, 443]
  
}

variable "egressrules" {
    type = list(number)
    default = [80, 443]
  
}
resource "aws_instance" "db" {
    ami = "ami-00eeedc4036573771"
    instance_type = "t2.micro"
    security_groups = [aws_security_group.webtraffic.name]
    tags = {
        name = "DB Server"
    }
}

resource "aws_instance" "web" {
    ami = "ami-00eeedc4036573771"
    instance_type = "t2.micro"
    security_groups = [aws_security_group.webtraffic.name]
    user_data = file("server-script.sh")
    tags = {
        name = "Web Server"
    }
}


resource "aws_eip" "web_ip" {
  instance = aws_instance.web.id
}


resource "aws_security_group" "webtraffic"{
    name = "allow HTTPS"

    dynamic "ingress" {
        iterator = port
        for_each = var.ingressrules
        content {
            from_port = port.value
            to_port = port.value
            protocol = "TCP"
            cidr_blocks = ["0.0.0.0/0"]
        }
    }

     dynamic "egress" {
        iterator = port
        for_each = var.egressrules
        content {
            from_port = port.value
            to_port = port.value
            protocol = "TCP"
            cidr_blocks = ["0.0.0.0/0"]
        }
    }
}


output "PrivateIP" {
    value = aws_instance.db.private_ip
}

output "PublicIP" {
    value = aws_eip.web_ip.public_ip
}