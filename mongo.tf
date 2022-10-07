resource "vault_mount" "mongo" {
  path = "mongo"
  type = "kv"
}

variable "mongo_main_user" {
  type      = string
  sensitive = true
}

variable "mongo_main_pass" {
  type      = string
  sensitive = true
}

resource "vault_kv_secret" "mongo_main" {
  path = "${vault_mount.mongo.path}/main"
  data_json = jsonencode(
    {
      MONGO_USER = var.mongo_main_user
      MONGO_PASS = var.mongo_main_pass
      MONGO_URL  = "mongodb://${var.mongo_main_user}:${var.mongo_main_pass}@${var.machine_ip}:27017"
    }
  )
}