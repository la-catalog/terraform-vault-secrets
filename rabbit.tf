resource "vault_mount" "rabbit" {
  path = "rabbit"
  type = "kv"
}

variable "rabbit_user" {
  type      = string
  sensitive = true
}

variable "rabbit_pass" {
  type      = string
  sensitive = true
}

resource "vault_kv_secret" "rabbit" {
  path = "${vault_mount.rabbit.path}/default"
  data_json = jsonencode(
    {
      RABBIT_URL = "amqp://${var.rabbit_user}:${var.rabbit_pass}@${var.machine_ip}:5672"
    }
  )
}