terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.46.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.4.3"
    }

    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0.4"
    }

    cloudinit = {
      source  = "hashicorp/cloudinit"
      version = "~> 2.2.0"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.16.1"
    }

    helm       = ">= 1.0, < 3.0"
  }

  required_version = "~> 1.3"

   backend "s3" {
    # Replace this with your bucket name!
    bucket         = "cahanovich"
    key            = "global/s3/terraform.tfstate"
    region         = "us-east-1"
    #var.region

    # Replace this with your DynamoDB table name!
    dynamodb_table = "cahanovich"
    encrypt        = true
  }
}
