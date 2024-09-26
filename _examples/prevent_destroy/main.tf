terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.6.3"
    }
  }
}

resource "random_password" "password" {
  lifecycle {
    prevent_destroy = true
  }

  length  = 4
  special = false
}

output "password" {
  value = nonsensitive(random_password.password.result)
}
