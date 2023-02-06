variable "workspace_to_environment_map" {
  type = map(string)
  default = {
    qa  = "qa"
    prd = "prd"
  }
}

variable "source_instances_map" {
  description = "A map from instances to a list of instance id"
  type        = map(any)
  default = {
    qa  = [ "i-0f0ae101cf8e3202e", "i-0e2a806f55ef419d2", "i-0f31364caf36906f4", "i-0d605ef016c561e57", "i-0d14c3b9fe0ec4f54","i-046d72bb328e459b3"]
    prd = []
  }
}

variable "cron_stop" {
  description = "Cron expression to define when to trigger a stop of the DB"
  default     = "30 14 ? * MON-SAT *"
}

variable "cron_start" {
  description = "Cron expression to define when to trigger a start of the DB"
  default     = "30 03 ? * MON-SAT *"
}

variable "enable" {
  default = true
}

variable "access_key" {
  description = "value of access key"
  default     = ""
}

variable "secret_key" {
  description = "value of secret key"
  default     = ""
}

locals {
  environment      = lookup(var.workspace_to_environment_map, terraform.workspace, "qa")
  source_instances = var.source_instances_map[local.environment]
  identifier       = local.environment
}
