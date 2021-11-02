resource "aws_iam_group" "developers_august" {
  name = "developers_august"
}

resource "aws_iam_group" "developers" {
  name = each.key
  for_each = toset([
    "sales",
    "marketing",
    "billing",
  ])
}
