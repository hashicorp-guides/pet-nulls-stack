# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

terraform {
  required_providers {
    null = {
      source  = "hashicorp/null"
      version = "3.1.1"
    }
  }
}

variable "pet" {
  type = string
}

variable "instances" {
  type = number
}

variable "username" {
  type = string
}

resource "null_resource" "this" {
  count = var.instances

  triggers = {
    pet = var.pet
  }
}

resource "null_resource" "random" {
  triggers = {
    username = var.username
  }
}

output "ids" {
  value = [for n in null_resource.this : n.id]
}

output "username" {
  value = var.username
}

output "random" {
  value = "Changed to ${null_resource.random.id}"
}
