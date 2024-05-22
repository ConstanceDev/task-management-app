
resource "aws_s3_bucket" "task_management_app_bucket" {
    bucket = "task-management-app-bucket"
    acl    = "private"
}
