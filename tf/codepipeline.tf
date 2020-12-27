resource "aws_codepipeline" "hello-mypipeline" {
  name     = "hello-mypipeline"
  role_arn = "${aws_iam_role.tf-codepipeline-role.arn}"

  artifact_store = {
    location = "codepipeline-eu-central-1-657326117404"
    type     = "S3"
  }

  stage {
    name = "Source"

    action {
      name             = "Source"
      category         = "Source"
      owner            = "AWS"
      provider         = "GitHub"
      version          = "2"
      output_artifacts = ["source"]

      configuration {
        RepositoryName = "${var.github_repo_name}"
        BranchName     = "${var.default_branch}"
      }
    }
  }

  stage {
    name = "Build"

    action {
      name             = "Build"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      input_artifacts  = ["source"]
      version          = "1"

      configuration {
        ProjectName = "${aws_codebuild_project.hello-mycodebuild.name}"
      }
    }
  }

}
