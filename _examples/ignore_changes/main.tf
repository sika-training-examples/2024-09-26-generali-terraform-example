terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.6.3"
    }
  }
}

resource "random_password" "passwords" {
  count = 4

  lifecycle {
    ignore_changes = [
      length,
    ]
  }

  length  = 6
  special = false
}

output "password" {
  value = [
    for password in random_password.passwords :
    nonsensitive(password.result)
  ]
}
