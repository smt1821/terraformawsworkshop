# Instructions: Dynamically create an AWS CodeCommit Repo below

# Create aws_codecommit_repository resource
resource "aws_codecommit_repository" "codecommit_repo" {
  for_each        = var.codecommit_repos == null ? {} : var.codecommit_repos
  repository_name = each.value.repo_name
  description     = each.value.description
  default_branch  = each.value.default_branch
  tags            = each.value.tags
}