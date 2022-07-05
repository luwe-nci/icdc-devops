# create s3 policy document
data "aws_iam_policy_document" "s3_policy" {
  count = var.create_alb_s3_bucket ? 1 : 0
  statement {
    sid    = "allowalbaccount"
    effect = "Allow"
    principals {
      identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"]
      type        = "AWS"
    }
    actions   = ["s3:PutObject"]
    resources = ["arn:aws:s3:::${var.alb_s3_bucket_name}/*"]
  }
  statement {
    sid    = "allowalblogdelivery"
    effect = "Allow"
    principals {
      identifiers = ["delivery.logs.amazonaws.com"]
      type        = "Service"
    }
    actions   = ["s3:PutObject"]
    resources = ["arn:aws:s3:::${var.alb_s3_bucket_name}/*"]
    condition {
      test     = "StringEquals"
      values   = ["bucket-owner-full-control"]
      variable = "s3:x-amz-acl"
    }
  }
  statement {
    sid       = "awslogdeliveryacl"
    effect    = "Allow"
    actions   = ["s3:GetBucketAcl"]
    resources = ["arn:aws:s3:::${var.alb_s3_bucket_name}"]
    principals {
      identifiers = ["delivery.logs.amazonaws.com"]
      type        = "Service"
    }
  }
}