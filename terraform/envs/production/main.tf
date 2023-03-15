/**
 * Copyright 2020 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

module "env" {
  source = "../../modules/env_baseline"

  env              = "production"
  environment_code = "p"

  parent_id                  = var.parent_folder != "" ? "folders/${var.parent_folder}" : "organizations/${var.org_id}"
  org_id                     = var.org_id
  billing_account            = var.billing_account
  terraform_service_account  = var.terraform_service_account
  monitoring_workspace_users = var.monitoring_workspace_users

  base_network_project_budget_amount       = var.base_network_project_budget_amount
  restricted_network_project_budget_amount = var.restricted_network_project_budget_amount
  monitoring_project_budget_amount         = var.monitoring_project_budget_amount
  secret_project_budget_amount             = var.secret_project_budget_amount
}

module "services" {
  source = "../../modules/monitoring_services"

  monitoring_project_id = module.env.monitoring_project_id
  services              = var.monitoring_services
}