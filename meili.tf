resource "vault_mount" "meili" {
  path = "meili"
  type = "kv"
}

variable "meili_main_key" {
  type      = string
  sensitive = true
}

resource "vault_kv_secret" "meili_main" {
  path = "${vault_mount.meili.path}/main"
  data_json = jsonencode(
    {
      MEILI_KEY = var.meili_main_key
      MEILI_URL = "http://${var.machine_ip}:7700"
    }
  )
}