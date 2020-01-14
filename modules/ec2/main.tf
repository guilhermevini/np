module "balance" {
  source = "../balance"

  sg      = ["${var.balance_sg}"]
  subnets = ["${var.sub_pub}"]
  vpc     = "${var.vpc}"
}

module "scaling" {
  source = "../scaling"

  config     = "${aws_launch_configuration.launchconfig.name}"
  subnets    = ["${var.sub_priv}"]
  alb_tg_arn = "${module.balance.tg_arn}"
}

resource "aws_launch_configuration" "launchconfig" {
  name          = "web_config"
  image_id      = "${var.image_id}"
  instance_type = "t2.micro"
  key_name      = "${var.key}"
  security_groups = ["${var.web_sg}"]
  lifecycle {
    create_before_destroy = true
  }
}

