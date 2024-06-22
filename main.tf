/*terraform {
  cloud {
    organization = "my_lab_hien"

    workspaces {
      name = "remote-bakend"
    }
  }
}*/

provider "aws" {
  region = var.region
}

/*data "aws_ami" "ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ami-04c913012f8977029"]
  }

  owners = ["099720109477"]
}*/

resource "aws_instance" "server" {
  ami           = "ami-08a0d1e16fc3f61ea"
  instance_type = "t2.micro"

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "Server"
  }
}

output "public_ip" {
  value = aws_instance.server.public_ip
}


