provider "local" {
  # Configuration options
}

provider "aws" {
  region = var.region
}

variable "region" {
  type        = string
  description = "AWS Region for S3 bucket"
}
