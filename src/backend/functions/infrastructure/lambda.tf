resource "aws_iam_role" "lambda_execution_role" {
  name = "lambda_execution_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
        Effect = "Allow"
      },
    ]
  })
}

resource "aws_lambda_function" "task_function" {
  function_name = "TaskFunction"

  # Assumes you have a ZIP file for your Lambda function code
  s3_bucket = "my_lambda_functions"
  s3_key    = "task_function.zip"

  handler = "task_handler.handler"
  runtime = "nodejs12.x"

  role = aws_iam_role.lambda_execution_role.arn
}
