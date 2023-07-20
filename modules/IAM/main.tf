resource "aws_iam_policy" "policy" {
  name        = var.policy_name
  description = "My test policy for EC2 Instance"

  policy = var.iam_policy

}

resource "aws_iam_role" "my_role" {
  name = var.role_name

  assume_role_policy = var.role_policy
}

resource "aws_iam_policy_attachment" "iam_policy_attach" {
  name = "Iam role policy attachment"
  roles = [aws_iam_role.my_role.name]
  policy_arn = aws_iam_policy.policy.arn
}

resource "aws_iam_instance_profile" "test-profile" {
  name = "test_profile"
  role = aws_iam_role.my_role.name
}