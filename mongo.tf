resource "vault_mount" "mongo" {
  path = "mongo"
  type = "kv"
}

variable "mongo_user" {
  type      = string
  sensitive = true
}

variable "mongo_pass" {
  type      = string
  sensitive = true
}

resource "vault_kv_secret" "mongo_main" {
  path = "${vault_mount.mongo.path}/main"
  data_json = jsonencode(
    {
      MONGO_USER = var.mongo_user
      MONGO_PASS = var.mongo_pass
      MONGO_URL  = "mongodb://${var.mongo_user}:${var.mongo_pass}@${var.machine_ip}:27017"
    }
  )
}