resource "aws_s3_bucket" "task-1-bucket-rsschool" {
  bucket        = "task-1-bucket-rsschool"
  force_destroy = "true"
}

resource "aws_s3_bucket_ownership_controls" "task-1-bucket-rsschool" {
  bucket = aws_s3_bucket.task-1-bucket-rsschool.id

  rule {
    object_ownership = "ObjectWriter"
  }
}

resource "aws_s3_bucket_acl" "task-1-bucket-rsschool" {
  depends_on = [aws_s3_bucket_ownership_controls.task-1-bucket-rsschool]
  bucket     = aws_s3_bucket.task-1-bucket-rsschool.id
  acl        = "private"
}

resource "aws_s3_bucket_versioning" "task-1-bucket-rsschool" {
  bucket = aws_s3_bucket.task-1-bucket-rsschool.id

  versioning_configuration {
    status = "Enabled"
  }
}
