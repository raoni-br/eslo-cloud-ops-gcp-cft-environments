
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

/******************************************
  Project for Environment Secrets
*****************************************/

module "env_secrets" {
  source                      = "terraform-google-modules/project-factory/google"
  version                     = "~> 8.0"
  random_project_id           = "true"
  impersonate_service_account = var.terraform_service_account
  default_service_account     = "deprivilege"
  name                        = "prj-${var.environment_code}-secrets"
  org_id                      = var.org_id
  billing_account             = var.billing_account
  folder_id                   = google_folder.env.id
  disable_services_on_destroy = false
  activate_apis               = ["logging.googleapis.com", "secretmanager.googleapis.com"]
  skip_gcloud_download        = var.skip_gcloud_download

  labels = {
    environment       = var.env
    application_name  = "env-secrets"
    business_code     = "sre"
    env_code          = var.environment_code
  }
  budget_alert_pubsub_topic   = var.secret_project_alert_pubsub_topic
  budget_alert_spent_percents = var.secret_project_alert_spent_percents
  budget_amount               = var.secret_project_budget_amount
}
