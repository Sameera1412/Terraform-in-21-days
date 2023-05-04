resource "aws_instance" "app_server" {
  ami           = "ami-0a695f0d95cefc163"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServerInstance"
    Owner = "Sameera"
  }
}
