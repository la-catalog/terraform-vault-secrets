resource "vault_mount" "redis" {
  path = "redis"
  type = "kv"
}

resource "vault_kv_secret" "redis" {
  path = "${vault_mount.redis.path}/default"
  data_json = jsonencode(
    {
      REDIS_URL = "redis://${var.machine_ip}:6379"
    }
  )
}