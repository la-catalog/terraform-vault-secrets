resource "vault_mount" "influx" {
  path = "influx"
  type = "kv"
}

resource "vault_kv_secret" "influx_main" {
  path = "${vault_mount.influx.path}/main"
  data_json = jsonencode(
    {
      INFLUX_URL = "http://${var.machine_ip}:8086"
    }
  )
}