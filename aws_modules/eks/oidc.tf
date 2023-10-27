data "tls_certificate" "tls_certificate" {
  url = aws_eks_cluster.eks_cluster.identity.0.oidc.0.issuer
}

resource "aws_iam_openid_connect_provider" "oidc_provider" {
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = [data.tls_certificate.tls_certificate.certificates[0].sha1_fingerprint]
  url             = data.tls_certificate.tls_certificate.url
  depends_on      = [data.tls_certificate.tls_certificate]
}

data "aws_iam_policy_document" "oidc_assume_role_policy" {
  depends_on = [aws_iam_openid_connect_provider.oidc_provider]
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]
    effect  = "Allow"

    condition {
      test     = "StringEquals"
      variable = "${replace(aws_iam_openid_connect_provider.oidc_provider.url, "https://", "")}:sub"
      values   = ["system:serviceaccount:kube-system:aws-node"]
    }

    principals {
      identifiers = [aws_iam_openid_connect_provider.oidc_provider.arn]
      type        = "Federated"
    }
  }
}

resource "aws_iam_role" "oidc_iam_role" {
  assume_role_policy = data.aws_iam_policy_document.oidc_assume_role_policy.json
  name               = var.oidc_iam_role_name
  depends_on         = [data.aws_iam_policy_document.oidc_assume_role_policy]
}

resource "aws_iam_policy" "oidc_policy" {
  name        = var.oidc_policy_name
  description = "Policy for OIDC role of EKS cluster"
  depends_on  = [aws_iam_role.oidc_iam_role]

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "*"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "oidc-policy-attach" {
  depends_on = [aws_iam_policy.oidc_policy, aws_iam_role.oidc_iam_role]
  role       = aws_iam_role.oidc_iam_role.name
  policy_arn = aws_iam_policy.oidc_policy.arn
}
