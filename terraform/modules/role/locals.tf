locals {
  name                       = "bastion"
  role_name                  = format("bastion-eks-access-%s", var.environment)
}
