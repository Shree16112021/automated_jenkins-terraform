resource "aws_instance" "main-instance" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = aws_subnet.public-subnet.id
  tags = {
    Name = "main-instance"
  }
}