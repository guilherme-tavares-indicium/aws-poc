# main.tf
module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  # Required Inputs
  bucket = var.bucket_name

  # Optional Inputs
  acl = "private"
  versioning = {
    enabled = false
  }
  force_destroy = true
  tags = {
    Name = "hyland_demo"
  }
}
