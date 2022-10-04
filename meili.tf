variable "meili_key" {
  type      = string
  sensitive = true
}

resource "vault_kv_secret" "meili" {
  path = "${vault_mount.url.path}/meili"
  data_json = jsonencode(
    {
      MEILI_URL = "http://${var.machine_ip}:7700"
      MEILI_KEY = var.meili_key
    }
  )
}