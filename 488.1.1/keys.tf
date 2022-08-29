resource "aws_key_pair" "ec2-access" {

  key_name   = "ssh-key"
  public_key = file("./crypto-keys/ec2_ssh.pub")
}