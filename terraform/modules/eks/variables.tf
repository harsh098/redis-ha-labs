variable "vpc_id" {
  type = string
}

variable "vpc_name" {
  type    = string
  default = "default-vpc"
}

variable "private_subnet_ids" {
  type = list(string)
}

variable "environment" {
  type = string

  validation {
    condition     = contains(["dev", "qa", "stage", "production"], var.environment)
    error_message = "Environment must be one of: dev, qa, stage, production"
  }
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string

}

variable "region" {
  description = "AWS region to deploy our resources"
  type        = string
  default     = "us-west-2"
}

variable "bastion_complete_public_ip" {
  description = "Public ip of the bastion host"
  type        = string
}

variable "security_group_id" {
  description = "security group id for inbound/outbound traffic"
  type        = string 
}

variable "iam_role_arn" {
  type    = string
  default = ""
}

variable "iam_role_additional_policies" {
  type = map(string)
  default = {}
}

variable "eks_cluster_name" {
  type = string
  default = "default_eks_cluster"
}

variable "node_groups" {
  type = map(object({
    min_size      = number
    max_size      = number
    desired_size  = number
    capacity_type = string
  }))
  default = {
    node_wg_1 = {
      min_size      = 1
      max_size      = 3
      desired_size  = 2
      capacity_type = "ON_DEMAND"
    }
  }
}

variable "cluster_addons" {
  type = map(any)
  default = {}
}