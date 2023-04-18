provider "aws" {
  region = var.region
  profile = "training"
}

module "ecr" {
  source = "terraform-aws-modules/ecr/aws"

  repository_name = "hyland-poc-ecr"
  # repository_type = "public"


  repository_read_write_access_arns = ["arn:aws:iam::196029031078:user/guilherme.tavares"]
  repository_lifecycle_policy = jsonencode({
    rules = [
      {
        rulePriority = 1,
        description  = "Keep last 5 images",
        selection = {
          tagStatus     = "tagged",
          tagPrefixList = ["v"],
          countType     = "imageCountMoreThan",
          countNumber   = 5
        },
        action = {
          type = "expire"
        }
      }
    ]
  })

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}