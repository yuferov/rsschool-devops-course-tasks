terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.99.1"
    }
  }
  backend "s3" {
    bucket         = "rsschool-s3-tfstate"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    use_lockfile   = "true"
    encrypt        = "true"
    dynamodb_table = "rsschool_tf_lockid"
  }
}

provider "aws" {
  region                   = "us-east-1"
}
