provider "aws" {
    region = "us-east-2"
}



resource "aws_db_instance" "myRDS" {
    db_name = "myDB" # name (from the videos) has been depricated
    identifier = "my-first-rds"
    instance_class = "db.t2.micro"
    engine = "mariadb"
    engine_version = "10.2.21"
    username = "bob"
    password = "needToChage"
    port = 3306
    allocated_storage = 20
    skip_final_snapshot = true 
}