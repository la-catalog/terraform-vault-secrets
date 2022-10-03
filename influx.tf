resource "vault_kv_secret" "influx" {
  path = "${vault_mount.url.path}/influx"
  data_json = jsonencode(
    {
      INFLUX_URL = "http://${var.machine_ip}:8086"
    }
  )
}