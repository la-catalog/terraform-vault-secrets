variable "mongo_user" {
  type      = string
  sensitive = true
}

variable "mongo_pass" {
  type      = string
  sensitive = true
}

resource "vault_kv_secret" "mongo" {
  path = "${vault_mount.url.path}/mongo"
  data_json = jsonencode(
    {
      MONGO_URL = "mongodb://${var.mongo_user}:${var.mongo_pass}@${var.machine_ip}:27017"
    }
  )
}