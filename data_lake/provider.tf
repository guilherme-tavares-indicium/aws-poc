# # backend
# terraform {
#   backend "s3" {
#     bucket = "your-terraform-bucket"
#     key    = "your-terraform-state-file"
#     region = "us-east-1"
#   }
# }

# provider
provider "aws" {
  region = "us-east-1"
  profile = "training"
}