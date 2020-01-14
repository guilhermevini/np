resource "aws_security_group" "balance" {
  name        = "sg_balance"
  description = "security group for web app"
  vpc_id      = "${aws_vpc.main.id}"

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "sg_balance"
  }
}

resource "aws_security_group" "web_app" {
  name        = "sg_web_app"
  description = "security group for web app"
  vpc_id      = "${aws_vpc.main.id}"

  egress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "sg_web_app"
  }
}


resource "aws_security_group_rule" "inbound_web" {
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  source_security_group_id = "${aws_security_group.balance.id}"
  security_group_id        = "${aws_security_group.web_app.id}"
}


resource "aws_security_group_rule" "outbound_balance" {
  type                     = "egress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  source_security_group_id = "${aws_security_group.web_app.id}"
  security_group_id        = "${aws_security_group.balance.id}"
}