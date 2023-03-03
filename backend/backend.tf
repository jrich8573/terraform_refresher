# by calling terraform, we are changing how terraform manages state files. By passing 
# backend, we are telling terraform wher to store the state file. 

terraform {
    backend "s3" {
        key = "terraform/tfstate.tfstate" # you don't have to include terraform in the path. 
        bucket = "<bucket_name>"
        region = "us-east-2"
        access_key = "" # if left blank, they will popup like input variables
        secret_key = ""
        # you can also use cat ~/.aws/credentials if configured using the AWS CLI
    }
}