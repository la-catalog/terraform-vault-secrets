resource "vault_kv_secret" "redis" {
  path = "${vault_mount.url.path}/redis"
  data_json = jsonencode(
    {
      REDIS_URL = "redis://${var.machine_ip}:6379"
    }
  )
}