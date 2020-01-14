resource "aws_autoscaling_attachment" "asg_attachment" {
  alb_target_group_arn   = "${var.alb_tg_arn}"
  autoscaling_group_name = "${aws_autoscaling_group.autoscaling.id}"
}

resource "aws_autoscaling_group" "autoscaling" {
  vpc_zone_identifier       = ["${var.subnets}"]
  launch_configuration      = "${var.config}"
  min_size                  = 1
  max_size                  = 2
  health_check_grace_period = 0
  health_check_type         = "EC2"
  force_delete              = true
  default_cooldown          = 360
  
  name_prefix = "asg-neon"

  tag {
    key                 = "Name"
    value               = "asg-neon"
    propagate_at_launch = true
  }

}
