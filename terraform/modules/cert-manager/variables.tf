variable "environment" {
  type        = string
  description = "The environment impacted"

  validation {
    condition     = contains(["production", "local"], var.environment)
    error_message = "The environment must be either 'production' or 'local'"
  }
}

variable "dns_email" {
  type        = string
  description = "The email address to use for Let's Encrypt certificates"
}
