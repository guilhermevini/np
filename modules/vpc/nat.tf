resource "aws_eip" "nat_ip_a" {
  vpc   = true
}

resource "aws_eip" "nat_ip_b" {
  vpc   = true
}

resource "aws_nat_gateway" "nat_a" {
  allocation_id = "${aws_eip.nat_ip_a.id}"
  subnet_id     = "${aws_subnet.public_a.id}"

  tags = {
    Name = "nat-pub-a"
  }
}

resource "aws_nat_gateway" "nat_b" {
  allocation_id = "${aws_eip.nat_ip_b.id}"
  subnet_id     = "${aws_subnet.public_b.id}"

  tags = {
    Name = "nat-pub-b"
  }
}
