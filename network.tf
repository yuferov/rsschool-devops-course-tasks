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

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.basename}-internet-gateway"
  }
}

resource "aws_route_table" "public_routes" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
}

resource "aws_route_table_association" "subnet_assoc" {
  #for_each = aws_subnet.networks
  for_each = {
    for subnet_name, subnet in aws_subnet.networks :
    subnet_name => subnet
    if contains(["pub-sub-1", "pub-sub-2"], subnet_name)
  }
  subnet_id      = each.value.id
  route_table_id = aws_route_table.public_routes.id
}

