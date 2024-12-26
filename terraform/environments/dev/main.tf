module "vpc" {
  source      = "../../modules/vpc"
  vpc_name    = var.vpc_name 
  environment = var.environment
  vpc_cidr    = var.vpc_cidr
  aws_region  = var.aws_region
}

module "eks" {
  region                     = var.aws_region 
  eks_cluster_name           = var.cluster_name
  source                     = "../../modules/eks"
  environment                = var.environment
  vpc_id                     = module.vpc.vpc_id
  private_subnet_ids         = module.vpc.private_subnet_ids
  vpc_cidr                   = var.vpc_cidr
  bastion_complete_public_ip = module.bastion.bastion_complete_public_ip
  security_group_id          = module.sg.security_group_id
  iam_role_arn               = module.role.iam_role_arn
  node_groups                = {
    node_wg-1 = {
        min_size      = 1
        max_size      = 3
        desired_size  = 2
        capacity_type = "ON_DEMAND"
    }
  }
  cluster_addons = {}
}

module "bastion" {
  region            = var.aws_region
  environment       = var.environment  
  bastion_name      = "${var.environment}-bastion" 
  cluster_name      = var.cluster_name
  source            = "../../modules/bastion"
  vpc_cidr          = var.vpc_cidr
  vpc_id            = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
  security_group_id = module.sg.security_group_id
  iam_role_name     = module.role.iam_role_name
}

module "sg" {
  region  = var.aws_region
  source      = "../../modules/sg"
  vpc_cidr    = var.vpc_cidr
  vpc_id      = module.vpc.vpc_id
}

module "role" {
  region      = var.aws_region 
  source      = "../../modules/role"
  environment = var.environment
}


