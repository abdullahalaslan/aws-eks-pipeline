# build image and push to ECR
resource "aws_codebuild_project" "hello-mycodebuild" {
  name          = "hello-mycodebuild"
  description   = "Terraform Build"
  service_role  = "${aws_iam_role.tf-codebuild-role.arn}"

  artifacts {
    type = "CODEPIPELINE"
  }

  environment {
    compute_type    = "BUILD_GENERAL1_SMALL"
    image           = "${var.build_image}"
    type            = "LINUX_CONTAINER"
    privileged_mode = true

    environment_variable {
      "name"  = "REPOSITORY_NAME"
      "value" = "${var.ecr_repo_name}"
      "name"  = "REPOSITORY_URI"
      "value" = "${var.ecr_repo_uri}"
      "name"  = "EKS_CLUSTER_NAME"
      "value" = "${var.cluster_name}"
      "name"  = "EKS_KUBECTL_ROLE_ARN"
      "value" = "${var.kubectl_role}"
    }
  }

  source {
    type            = "CODEPIPELINE"
    buildspec       = "${var.build_spec}"
  }

}