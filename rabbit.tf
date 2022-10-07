resource "vault_mount" "rabbit" {
  path = "rabbit"
  type = "kv"
}

variable "rabbit_main_user" {
  type      = string
  sensitive = true
}

variable "rabbit_main_pass" {
  type      = string
  sensitive = true
}

resource "vault_kv_secret" "rabbit_main" {
  path = "${vault_mount.rabbit.path}/main"
  data_json = jsonencode(
    {
      RABBIT_USER = var.rabbit_main_user
      RABBIT_PASS = var.rabbit_main_pass
      RABBIT_URL  = "amqp://${var.rabbit_main_user}:${var.rabbit_main_pass}@${var.machine_ip}:5672"
    }
  )
}