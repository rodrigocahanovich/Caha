output "region" {
  description = "AWS region"
  value       = var.region
}

output "private_subnets_cidr_blocks" {
  value = module.vpc[*].private_subnets
}

output "public_subnets_cidr_blocks" {
  value = module.vpc[*].public_subnets
}