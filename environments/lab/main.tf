module "vpc" {
  source = "../../modules/vpc"
}

module "ec2" {
  source = "../../modules/ec2"
  web_sg = "${module.vpc.sg_web_id}"
  balance_sg = "${module.vpc.sg_balance_id}"
  vpc = "${module.vpc.vpc_id}"
  sub_pub = ["${module.vpc.sub_pub}"]
  sub_priv = ["${module.vpc.sub_priv}"]
}
