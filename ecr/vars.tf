variable "region" {
  description = "The AWS region to use"
  type        = string
  default     = "us-east-1"
}

variable "name" {
  description = "The name of the ECR repository"
  type        = string
  default     = "my-repo"
}

variable "environment" {
  description = "The environment for the ECR repository"
  type        = string
  default     = "dev"
}

variable "owner" {
  description = "The owner of the ECR repository"
  type        = string
  default     = "me"
}
