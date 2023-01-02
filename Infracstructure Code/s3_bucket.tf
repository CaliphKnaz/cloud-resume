resource "aws_s3_bucket" "resume-bucket" {
  bucket = var.bucket-name


  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_policy" "allow_global_access" {
  bucket = aws_s3_bucket.resume-bucket.id
  policy = file("public-bucket.json")

}

output "bucket-name" {
  value = aws_s3_bucket.resume-bucket.bucket
} 

resource "aws_s3_bucket_website_configuration" "resume-website" {
  bucket = aws_s3_bucket.resume-bucket.bucket

  index_document {
    suffix = "index.html"
  }
}

resource "aws_s3_bucket_acl" "resume-assets-acl" {
  bucket = aws_s3_bucket.resume-bucket.id
  acl    = "public-read"
}

resource "aws_s3_object" "resume-assets" {
  bucket = aws_s3_bucket.resume-bucket.bucket
  for_each = fileset("C:/Users/Txter/OneDrive/Documents/Coding/The_Cloud_Resume_Challenge_Guidebook_-_Multicloud_bundle/Code/Development/", "*")
  key = each.value

  source = "C:/Users/Txter/OneDrive/Documents/Coding/The_Cloud_Resume_Challenge_Guidebook_-_Multicloud_bundle/Code/Development/${each.value}"
}

