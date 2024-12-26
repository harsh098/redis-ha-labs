data "aws_availability_zones" "available" {}

data "aws_caller_identity" "current" {}

data "aws_iam_policy" "ebs_csi_policy" {
  arn = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
}