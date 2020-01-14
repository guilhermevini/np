output "tg_arn" {
  value = "${aws_alb_target_group.web.arn}"
}

output "tg_name" {
  value = "${aws_alb_target_group.web.name}"
}
