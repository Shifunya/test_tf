#################################################################################################
# ECR Repositories and Policies for 3 Services
#################################################################################################

# ECR Repository for Service 1
resource "aws_ecr_repository" "webapp_ecr" {
    name = "app1-repo"
}

# # ECR Lifecycle Policy for Service 1
# resource "aws_ecr_lifecycle_policy" "webapp_ecr_policy" {
#     repository = aws_ecr_repository.webapp_ecr.name
#     policy     = local.webapp_ecr_policy
# }

# ECR Repository for Service 2
resource "aws_ecr_repository" "adminapi_ecr" {
    name = "app2-repo"
}

# # ECR Lifecycle Policy for Service 2
# resource "aws_ecr_lifecycle_policy" "adminapi_ecr_policy" {
#     repository = aws_ecr_repository.adminapi_ecr.name
#     policy     = local.adminapi_ecr_policy# }