
resource "aws_subnet" "public_a" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "${lookup(var.subnet_public, "2a")}"
  availability_zone = "${lookup(var.zonas, "2a")}"

  tags {
    Name = "neon-public-a"
  }

}

resource "aws_subnet" "public_b" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "${lookup(var.subnet_public, "2b")}"
  availability_zone = "${lookup(var.zonas, "2b")}"

  tags {
    Name = "neon-public-b"
  }
}

resource "aws_subnet" "private_a" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "${lookup(var.subnet_private, "2a")}"
  availability_zone = "${lookup(var.zonas, "2a")}"

  tags {
    Name = "neon-private-a"
  }

}

resource "aws_subnet" "private_b" {
  vpc_id     = "${aws_vpc.main.id}"

  cidr_block = "${lookup(var.subnet_private, "2b")}"
  availability_zone = "${lookup(var.zonas, "2b")}"

  tags {
    Name = "neon-private-b"
  }

}