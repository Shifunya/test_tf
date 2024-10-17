data "aws_secretsmanager_secret" "secrets" {
  name = "rds_1"
}

data "aws_secretsmanager_secret_version" "current"{
  secret_id = data.aws_secretsmanager_secret.secrets.id
}

locals {
  rds_user = jsondecode(
    data.aws_secretsmanager_secret_version.current.secret_string)["db_user"]
  rds_pass = jsondecode(
    data.aws_secretsmanager_secret_version.current.secret_string)["db_pass"]
}