provider "aws" {
  region = var.region
}

data "aws_availability_zones" "available" {}

resource "aws_dynamodb_table" "terraform_locks" {
  name         = "cahanovich"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}

data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-ebs"]
  }
}
resource "aws_instance" "ec2_instance" {
    ami                          = data.aws_ami.amazon_linux_2.id
    subnet_id                    = "${element(module.vpc.public_subnets, 0)}"
    vpc_security_group_ids       = [aws_security_group.sg.id]
    instance_type                = var.instance_type
    ebs_optimized                = true
    #key_name = aws_key_pair.cahanovich-key
    associate_public_ip_address  = true
    
    user_data                    = file("linux.sh")

    tags                         = var.tags

    iam_instance_profile         = aws_iam_instance_profile.ec2_instance_profile.name
}