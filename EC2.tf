data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical (Ubuntu) official AMIs
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  key_name      = "webapp_deploy" # Ensure this matches an existing key pair in AWS

  user_data = <<-EOF
                #!/bin/bash
                sudo apt-get update
                sudo apt-get install -y apache2 git
                sudo systemctl start apache2
                sudo systemctl enable apache2
                git clone https://github.com/davidsayndee/host-webpage-ec2-terraform-git /tmp/host-webpage-ec2-terraform
                sudo mv /tmp/host-webpage-ec2-terraform/index.html /var/www/html/
                sudo chown www-data:www-data /var/www/html/index.html
                sudo systemctl restart apache2
                EOF
}
