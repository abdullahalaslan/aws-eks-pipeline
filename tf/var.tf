# define aws region
variable "region" {
  default = "eu-central-1"
}

# CodeCommit and ECR repo name, also as artifact bucket prefix
variable "github_repo_name" {
  default = "aws-eks-pipeline"
}

variable "ecr_repo_name" {
  default = "hello-ecrrepository"
}

variable "ecr_repo_uri" {
  default = "574868243623.dkr.ecr.eu-central-1.amazonaws.com/hello-ecrrepository"
}

variable "cluster_name" {
  default = "hello-mycluster"
}

variable "kubectl_role" {
  default = "arn:aws:iam::574868243623:role/kubectl-eks-role"
}

# define default git branch
variable "default_branch" {
  default = "main"
}

# define docker image for build stage
variable "build_image" {
  default = "aws/codebuild/amazonlinux2-x86_64-standard:3.0"
}

# define build spec for build stage
variable "build_spec" {
  default = "buildspec.yml"
}
