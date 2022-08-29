resource "aws_instance" "sec488-instance" {

  ami           = var.ami
  instance_type = "t2.micro"

  tags = {
    Name  = "SEC488-MGMT"
    Class = "SEC488"
  }

  subnet_id              = aws_subnet.default-subnet.id
  vpc_security_group_ids = [aws_security_group.sec488-sg.id]

  associate_public_ip_address = true
  key_name                    = aws_key_pair.ec2-access.key_name

  iam_instance_profile = aws_iam_instance_profile.ec2-instance-profile.id
}