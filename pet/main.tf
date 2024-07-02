# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.3.2"
    }
  }
}

variable "prefix" {
  type = string
}

resource "random_pet" "this" {
  prefix = var.prefix
  length = 3
}

resource "random_pet" "always_new" {
  keepers = {
    uuid = uuid() # Force a new name each time
  }
  length = var.animal_count
}

resource "random_pet" "tg" {
  count = 25

  separator = "-"
  length    = 2

  keepers = {
    count = count.index
  }
}
output "name" {
  value = random_pet.this.id
}
