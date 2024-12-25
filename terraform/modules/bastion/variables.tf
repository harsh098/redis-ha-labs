variable "region" {
  description = "AWS region to deploy our resources"
  type        = string
  default     = "us-west-2"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string

}

variable "vpc_id" {
  description = "vpc id for the bastion"
  type        = string
}

variable "vpc_name" {
  description = "name of the vpc"
  type        = string
  default     = "default-vpc"
}

variable "public_subnet_ids" {
  description = "public subnet where the bastion host will get provisioned"
  type        = list(string)
  default     = []
}

variable "security_group_id" {
  type        = string
  default     = ""
}

variable "iam_role_name" {
  type        = string
  default     = ""
}

variable "bastion_name" {
  type = string
}

variable "cluster_name" {
  type = string
  description = "EKS Cluster to pull Kubeconfig for."
}

variable "environment" {
  type = string

  validation {
    condition     = contains(["dev", "qa", "stage", "production"], var.environment)
    error_message = "Environment must be one of: dev, qa, stage, production"
  }
}