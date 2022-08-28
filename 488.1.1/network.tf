resource "aws_vpc" "default-vpc" {

  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "default-subnet" {

  vpc_id     = aws_vpc.default-vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "SUBNET-A"
  }
}

resource "aws_security_group" "sec488-sg" {

  name   = "security_group"
  vpc_id = aws_vpc.default-vpc.id
}

resource "aws_security_group_rule" "allow-ssh" {

  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  type              = "ingress"
  security_group_id = aws_security_group.sec488-sg.id
}

resource "aws_security_group_rule" "allow-http" {

  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  type              = "ingress"
  security_group_id = aws_security_group.sec488-sg.id
}

resource "aws_security_group_rule" "allow-icmp" {

  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 8
  to_port           = 0
  protocol          = "icmp"
  type              = "ingress"
  security_group_id = aws_security_group.sec488-sg.id
}

/*
  ingress = [{
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    },

    {
      cidr_blocks = ["0.0.0.0/0"]
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
    },

    {
      cidr_blocks = ["0.0.0.0/0"]
      from_port   = 8
      to_port     = 0
      protocol    = "icmp"
    },
  ]
  */