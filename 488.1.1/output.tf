output "ec2-ip" {
  value = aws_instance.sec488-instance.public_ip
}