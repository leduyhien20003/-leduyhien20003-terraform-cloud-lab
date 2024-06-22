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
  ami           = "ami-0eaf7c3456e7b5b68"
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


