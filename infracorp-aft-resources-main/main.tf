# main.tf

variable "log_archive_account_id" {
  type        = string
  default     = "965146699708"
  description = "🤖 AWS Log Archive Account Id"
}

variable "audit_account_id" {
  type        = string
  default     = "160794370438"
  description = "🤖 AWS Audit Account Id"
}

variable "aft_management_account_id" {
  type        = string
  default     = "390403868225"
  description = "🐙 AWS AFT Management Account Id"
}

variable "ct_management_account_id" {
  type        = string
  default     = "774432765225"
  description = "💰 AWS Management Account Id"
}

variable "terraform_token" {
  type = string
  default = "" #Set on Terraform Cloud
  description = "Terraform Cloud Team Token for AFT."
}

module "aft" {
  source = "github.com/aws-ia/terraform-aws-control_tower_account_factory"

  # Required Variables
  log_archive_account_id                            = var.log_archive_account_id
  audit_account_id                                  = var.audit_account_id
  aft_management_account_id                         = var.aft_management_account_id
  ct_management_account_id                          = var.ct_management_account_id
  ct_home_region                                    = "sa-east-1"
  tf_backend_secondary_region                       = "us-east-1"

  # VCS Variables
  vcs_provider                                      = "github"
  account_request_repo_name                         = "NucleaSA/infracorp-aft-account-request"
  global_customizations_repo_name                   = "NucleaSA/infracorp-aft-global-customizations"
  account_customizations_repo_name                  = "NucleaSA/infracorp-aft-account-customizations"
  account_provisioning_customizations_repo_name     = "NucleaSA/infracorp-aft-account-provisioning-customizations"

  # Terraform Variables
  terraform_distribution                            = "tfc"
  terraform_org_name                                =  "Nuclea"
  terraform_token                                   = var.terraform_token

  # Optional setup
  aft_enable_vpc                                    = false
  #backup_recovery_point_retention                   = 1
  #cloudwatch_log_group_retention                    = 1
  #aft_metrics_reporting                             = false
  #log_archive_bucket_object_expiration_days         = 1

}


 
