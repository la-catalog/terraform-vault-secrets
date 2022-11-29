resource "vault_mount" "influx" {
  path = "influx"
  type = "kv"
}

variable "influx_main_user" {
  type      = string
  sensitive = true
}

variable "influx_main_pass" {
  type      = string
  sensitive = true
}

resource "vault_kv_secret" "influx_main" {
  path = "${vault_mount.influx.path}/main"
  data_json = jsonencode(
    {
      INFLUX_USER = var.influx_main_user
      INFLUX_PASS = var.influx_main_pass
      INFLUX_URL  = "http://${var.machine_ip}:8086"
    }
  )
}