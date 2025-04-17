resource "aws_s3_bucket" "my-frontend-react-bucket" {
  bucket = "miu-workshop-3-frontend-react-bucket"
  force_destroy = true
  tags = {
    Name = "MIUWorkshop3FrontendBucket"
  }
}

resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket = aws_s3_bucket.my-frontend-react-bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
resource "aws_s3_bucket_website_configuration" "miu_cicd_tutorial" {
  bucket = aws_s3_bucket.my-frontend-react-bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}