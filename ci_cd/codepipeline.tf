resource "aws_codepipeline" "my_codepipeline" {
  name = "my-cms-pipeline"

  role_arn = aws_iam_role.codepipeline_role.arn

  artifact_store {
    location = aws_s3_bucket.artifact_bucket.bucket
    type     = "S3"
  }

  stage {
    name = "Source"

    action {
      name            = "SourceAction"
      category        = "Source"
      owner           = "AWS"
      provider        = "CodeCommit"
      version         = "1"
      configuration = {
        RepositoryName = "my-cms-repo"
        BranchName     = "main"
      }
      output_artifacts = ["source_output"]
      run_order       = 1
    }
  }

  stage {
    name = "Build"

    action {
      name            = "BuildAction"
      category        = "Build"
      owner           = "AWS"
      provider        = "CodeBuild"
      version         = "1"
      configuration = {
        ProjectName = aws_codebuild_project.my_codebuild.name
      }
      input_artifacts = ["source_output"]
      output_artifacts = ["build_output"]
      run_order       = 1
    }
  }

  stage {
    name = "Deploy"

    action {
      name            = "DeployAction"
      category        = "Deploy"
      owner           = "AWS"
      provider        = "ECS"
      version         = "1"
      configuration = {
        ClusterName        = aws_ecs_cluster.my_cluster.name
        ServiceName        = aws_ecs_service.my_service.name
        FileName           = "imagedefinitions.json"
      }
      input_artifacts = ["build_output"]
      run_order       = 1
    }
  }
}

resource "aws_iam_role" "codepipeline_role" {
  name = "codepipeline-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Effect = "Allow",
      Principal = {
        Service = "codepipeline.amazonaws.com"
      }
    }]
  })
}

resource "aws_s3_bucket" "artifact_bucket" {
  bucket = "my-cms-artifacts"
  acl    = "private"
}
