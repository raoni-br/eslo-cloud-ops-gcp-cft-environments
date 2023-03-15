variable "monitoring_project_id" {
  description = "GCP Project Id of monitoring project"
  type        = string
}

variable "services" {
  description = "A object containing the service name as key and the description as value"
  type        = map(string)
}
