resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
}

resource "aws_subnet" "networks" {
  for_each = var.net_conf

  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = each.value["cidr"]
  availability_zone       = each.value["az"]
  map_public_ip_on_launch = each.value["is_public"]

  tags = {
    Type = "${each.key}"
    Name = "${var.basename}-${each.key}"
  }
}
