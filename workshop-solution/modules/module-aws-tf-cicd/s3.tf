# CodePipeline

resource "random_uuid" "codepipeline_artifacts_s3_uuid" {
}

resource "random_string" "codepipeline_artifacts_s3" {
  count   = var.create_codepipeline_resources ? 1 : 0
  length  = 8
  special = false
}


resource "aws_s3_bucket" "codepipeline_artifacts_bucket" {
  count  = var.create_codepipeline_resources ? 1 : 0
  bucket = "codepipeline-artifacts-${random_string.codepipeline_artifacts_s3[0].result}"
}

resource "aws_s3_bucket_public_access_block" "codepipeline_bucket_pab" {
  bucket = aws_s3_bucket.codepipeline_artifacts_bucket[0].id

  block_public_acls       = var.s3_public_access_block
  block_public_policy     = var.s3_public_access_block
  ignore_public_acls      = var.s3_public_access_block
  restrict_public_buckets = var.s3_public_access_block
}