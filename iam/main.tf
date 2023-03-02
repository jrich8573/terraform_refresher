# using AWS console to create the json below, we can use terraform to create the policy and user for our account with
# the need of writing the custom json from scratch. 


provider "aws" {
  region = "us-east-2"
}

resource "aws_iam_user" "users" {
    name = "jrich"
}

resource "aws_iam_policy" "customPolicy" {
    name = "GlacierPolicy"

    policy = <<EOF
{
        "Version": "2012-10-17",
        "Statement": [
            {
                "Sid": "VisualEditor0",
                "Effect": "Allow",
                "Action": [
                    "glacier:InitiateJob",
                    "glacier:AbortMultipartUpload",
                    "glacier:CreateVault",
                    "glacier:ListTagsForVault",
                    "glacier:DeleteVault",
                    "glacier:DeleteArchive",
                    "glacier:ListParts",
                    "glacier:DeleteVaultNotifications",
                    "glacier:ListJobs",
                    "glacier:ListMultipartUploads",
                    "glacier:SetVaultNotifications",
                    "glacier:CompleteMultipartUpload",
                    "glacier:InitiateMultipartUpload",
                    "glacier:UploadMultipartPart",
                    "glacier:PurchaseProvisionedCapacity",
                    "glacier:UploadArchive",
                    "glacier:ListVaults",
                    "glacier:ListProvisionedCapacity"
                ],
                "Resource": "*"
            }
        ]
    }
    EOF
}


resource "aws_iam_policy_attachment" "polciyBind" {
    name = "attachment"
    users = [aws_iam_user.users.name]
    policy_arn = aws_iam_policy.customPolicy.arn
}