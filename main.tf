provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "test_server" {
  ami           = "ami-053b12d3152c0cc71"  # Ubuntu 22.04 AMI
  instance_type = "t2.micro"

  tags = {
    Name = "Test-Server"
  }

  provisioner "local-exec" {
    command = "echo ${aws_instance.test_server.public_ip} > test_server_ip.txt"
  }
}
