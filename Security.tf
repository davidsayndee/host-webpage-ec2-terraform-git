resource "aws_security_group" "my_instance_SG" {
  name_prefix = "dele-"

  tags = {
    Name = "my-security-group"
  }
}

# Allow incoming http (port 80) traffic
resource "aws_security_group_rule" "http_inbound" {
  type        = "ingress"
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = aws_security_group.my_instance_SG.id
}

# Allow incoming ssh (port 22) traffic
resource "aws_security_group_rule" "ssh_inbound" {
  type        = "ingress"
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = aws_security_group.my_instance_SG.id
}

# Allow incoming http (port 80) traffic
resource "aws_security_group_rule" "for_downloads" {
  type        = "egress"
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = aws_security_group.my_instance_SG.id
}