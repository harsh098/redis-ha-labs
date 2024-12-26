variable "aws_region" {
  description = "AWS  region where all services will be provisioned"
  type        = string
}

variable "vpc_name" {
  description = "Name of AWS VPC"
  type        = string
  default     = "default-vpc"
}

variable "environment" {
  description = "Environment for which VPC is being created (dev, qa, staging, production)"
  type        = string

  validation {
    condition     = contains(["dev", "qa", "stage", "production"], var.environment)
    error_message = "Environment must be one of: dev, qa, stage, production"
  }
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string

}

variable "cluster_name" {
  type = string
  description = "Name of the EKS Cluster"
  default = "default-private-cluster"
}
