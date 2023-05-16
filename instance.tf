resource "aws_instance" "public" {
  ami                         = "ami-08333bccc35d71140"
  associate_public_ip_address = true
  instance_type               = "t3.micro"
<<<<<<< HEAD
  key_name                    = "Terraform"
=======
  key_name                    = "Terraform_demo"
>>>>>>> bd0b6a15ad3614a9463a54811d573a95d6e01236
  vpc_security_group_ids      = [aws_security_group.public.id]
  subnet_id                   = aws_subnet.public[0].id

  tags = {
    Name = "${var.env_code}-public"
  }
}

resource "aws_security_group" "public" {
  name        = "${var.env_code}-public"
  description = "Allow inbound traffic"
  vpc_id        = aws_vpc.main.id

  ingress {
    description = "SSH from public"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["142.188.74.67/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.env_code}-public"

  }
}
<<<<<<< HEAD

resource "aws_instance" "private" {
  ami                         = "ami-08333bccc35d71140"
  instance_type               = "t3.micro"
  key_name                    = "Terraform"
  vpc_security_group_ids      = [aws_security_group.private.id]
  subnet_id                   = aws_subnet.private[0].id

  tags = {
    Name = "${var.env_code}-private"
  }
}

resource "aws_security_group" "private" {
  name        = "${var.env_code}-private"
  description = "Allow VPC traffic"
  vpc_id        = aws_vpc.main.id

  ingress {
    description = "SSH from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.env_code}-private"

  }
}
=======
>>>>>>> bd0b6a15ad3614a9463a54811d573a95d6e01236
