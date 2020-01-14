resource "aws_vpc" "main" {
  cidr_block = "${var.range}"
  enable_dns_hostnames = true

  tags = {
    Name = "neon-lab"
  }
}

resource "aws_internet_gateway" "ig" {
    vpc_id = "${aws_vpc.main.id}"
}
