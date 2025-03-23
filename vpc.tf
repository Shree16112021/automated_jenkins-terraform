resource "aws_vpc" "main-vpc" {
  cidr_block = var.cidr_block
  tags = {
    Name = "main-vpc"
  }
}
resource "aws_subnet" "public-subnet" {
  vpc_id     = aws_vpc.main-vpc.id
  cidr_block = var.cidr_block
  tags = {
    Name = "public-subnet"
  }
}
resource "aws_internet_gateway" "main-igw" {
  vpc_id = aws_vpc.main-vpc.id
  tags = {
    Name = "main-igw"
  }
}
resource "aws_route_table" "main-public-route-table" {
  vpc_id = aws_vpc.main-vpc.id
  route {
    cidr_block = var.public_cidr_block
    gateway_id = aws_internet_gateway.main-igw.id
    }
    tags = {
      Name = "main-public-route-table"
    }
}
resource "aws_route_table_association" "public-subnet-association" {
  subnet_id      = aws_subnet.public-subnet.id
  route_table_id = aws_route_table.main-public-route-table.id
}

