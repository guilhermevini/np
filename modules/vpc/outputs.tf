output "sg_web_id" {
  value = "${aws_security_group.web_app.id}"
}

output "sg_balance_id" {
  value = "${aws_security_group.balance.id}"
}

output "vpc_id" {
  value = "${aws_vpc.main.id}"
}

output "sub_pub" {
  value = ["${aws_subnet.public_a.id}", "${aws_subnet.public_b.id}"]
}

output "sub_priv" {
  value = ["${aws_subnet.private_a.id}", "${aws_subnet.private_b.id}"]
}