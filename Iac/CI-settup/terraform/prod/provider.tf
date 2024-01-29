# terraform {
#   required_providers {
#     aws = {
#       source = "hashicorp/aws"
#     }
#   }
  
# }

# terraform {
#   backend "s3"{
#     bucket = "rod-hashi-real-2nd-tested-bucket"
#     key = "terraform.tfstate"
#     region = "us-east-2"
#     dynamodb_table = "rod-hashi-real-2nd-dynamodb"
#   }
# }


provider "aws" {
    region     = var.rodney_aws_provider_region
    shared_credentials_files = ["~/.aws/credentials"]
    profile                  = "default"
}