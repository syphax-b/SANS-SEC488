resource "aws_iam_instance_profile" "ec2-instance-profile" {

  name = "ec2-profile"
  role = aws_iam_role.ec2-remote-access-role.name
}

resource "aws_iam_role" "ec2-remote-access-role" {

  name = "ec2_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "ec2-remote-access-role-policy" {

  role       = aws_iam_role.ec2-remote-access-role.name
  policy_arn = data.aws_iam_policy.adminaccess.arn
}