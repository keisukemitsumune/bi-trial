data "aws_iam_policy_document" "assume_policy" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["datasync.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "policy" {
  statement {
    effect = "Allow"
    actions = [
      "s3:*",
      "cloudwatch:*",
      "logs:*"
    ]
    resources = ["*"]
  }
}

resource "aws_iam_role" "this" {
  name               = "${local.general.service_name}-role"
  assume_role_policy = data.aws_iam_policy_document.assume_policy.json
}

resource "aws_iam_role_policy" "this" {
  name   = "${local.general.service_name}-role_policy"
  role   = aws_iam_role.this.id
  policy = data.aws_iam_policy_document.policy.json
}