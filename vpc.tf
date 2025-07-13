module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "5.8.1"
  
  name   = "${local.name}-vpc"
  cidr = local.vpc_cidr
  azs = local.azs
  public_subnets = local.public_subnets
  private_subnets = local.private_subnets
  intra_subnets = local.intra_subnets

  enable_nat_gateway = true
  enable_vpn_gateway = true


  tags = {
    Name = "${local.name}-vpc"
    Environment = local.env
  }

  public_subnet_tags = {
    Name = "${local.name}-public-subnet"
    Environment = local.env
  }

  private_subnet_tags = {
    Name = "${local.name}-private-subnet"
    Environment = local.env
  }

}