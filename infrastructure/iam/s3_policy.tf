resource "aws_iam_policy" "s3_bucket_policy" {
  name        = "my-s3-bucket-policy"
  description = "Custom policy for an S3 bucket"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:ListBucket"
        ],
        Effect   = "Allow",
        Resource = [
          "arn:aws:s3:::my-bucket",
          "arn:aws:s3:::my-bucket/*"
        ]
      }
    ]
  })
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-bucket"

  # Attach the bucket policy to the S3 bucket
  policy = aws_iam_policy.s3_bucket_policy.json
}
