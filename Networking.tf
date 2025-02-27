resource "aws_vpc" "Main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    name = "main_vpc"
  }
}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.Main.id
  cidr_block = "10.0.0.0/24"

  tags = {
    Name = "main._public_subnet"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.Main.id

  tags = {
    Name = "main_igw"
  }
}

resource "aws_route_table" "rtb-public" {
  vpc_id = aws_vpc.Main.id

  tags = {
    Name = "public-RT"
  }
}
resource "aws_route" "rtb-public-route" {
  route_table_id         = aws_route_table.rtb-public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.rtb-public.id
}