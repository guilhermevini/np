/*------------------- [ PUBLIC ] ---------------------*/

resource "aws_route_table" "public" {
    vpc_id = "${aws_vpc.main.id}"

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.ig.id}"
    }

    tags {
        Name = "rt-public"
    }
}

resource "aws_route_table_association" "public_a" {
    subnet_id = "${aws_subnet.public_a.id}"
    route_table_id = "${aws_route_table.public.id}"
}

resource "aws_route_table_association" "public_b" {
    subnet_id = "${aws_subnet.public_b.id}"
    route_table_id = "${aws_route_table.public.id}"
}

/*------------------- [ PRIVATE ] ---------------------*/

resource "aws_route_table" "private_a" {
    vpc_id = "${aws_vpc.main.id}"

    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = "${aws_nat_gateway.nat_a.id}"
    }

    tags {
        Name = "rt-private-a"
    }
}

resource "aws_route_table" "private_b" {
    vpc_id = "${aws_vpc.main.id}"

    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = "${aws_nat_gateway.nat_b.id}"
    }

    tags {
        Name = "rt-private-b"
    }
}

resource "aws_route_table_association" "private_a" {
    subnet_id = "${aws_subnet.private_a.id}"
    route_table_id = "${aws_route_table.private_a.id}"
}

resource "aws_route_table_association" "private_b" {
    subnet_id = "${aws_subnet.private_b.id}"
    route_table_id = "${aws_route_table.private_b.id}"
}
