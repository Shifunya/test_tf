#################################################################################################
# Here described used providers
#################################################################################################

provider "aws" {
  region                      = var.region
  # shared_config_files       = [var.shared_config_files]
  # shared_credentials_files  = [var.shared_credentials_files]
  # profile                   = var.credential_profile
  default_tags {
    tags = var.default_tags
  }
}

terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.0"
    }
  }
}

