resource "aws_iam_role" "ec2_role" {
  name = "my-ec2-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_instance_profile" "ec2_instance_profile" {
  name = "my-ec2-instance-profile"

  roles = [aws_iam_role.ec2_role.name]
}
