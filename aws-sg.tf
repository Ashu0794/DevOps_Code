resource "aws_security_group" "Inbound_Rule" {
  name        = "Inbound Rule"
  description = "This is inbound rule for AWS Instance"
  
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  dynamic "ingress" {
    for_each = var.ports
    iterator = port
    content {
      description = "This is inbound rule for AWS Instance"
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

  }
}

