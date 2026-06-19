resource "aws_instance" "web_server" {
  ami                    = "ami-0011550b539717e2a" 
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  key_name               = "Shree"

  tags = {
    Name = "Web-Server"
  }
}