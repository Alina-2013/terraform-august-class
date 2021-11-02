resource "aws_s3_bucket" "b" {
  bucket_prefix = "my-tf-test-bucket"
  acl    = "private"
}