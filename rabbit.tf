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

resource "vault_kv_secret" "rabbit_main" {
  path = "${vault_mount.rabbit.path}/main"
  data_json = jsonencode(
    {
      RABBIT_USER = var.rabbit_user
      RABBIT_PASS = var.rabbit_pass
      RABBIT_URL  = "amqp://${var.rabbit_user}:${var.rabbit_pass}@${var.machine_ip}:5672"
    }
  )
}