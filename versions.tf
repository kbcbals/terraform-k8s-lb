
terraform {
  required_providers {
    hcloud = {
      source = "hetznercloud/hcloud"
      version = "1.40.0"
    }
  }
  required_version = ">= 0.13"
}