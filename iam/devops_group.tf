resource "aws_iam_group" "devops_group" {
    name = "devops-gp"

}

resource "aws_iam_group_membership" "devops" {
    name = aws_iam_group.devops_group.name

    users = [
        aws_iam_user.daegwan_ops.name
    ]
    group = aws_iam_group.devops_group.name
}