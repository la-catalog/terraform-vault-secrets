resource "vault_mount" "pypi" {
  path = "pypi"
  type = "kv"
}

variable "pypi_main_user" {
  type      = string
  sensitive = true
}

variable "pypi_main_pass" {
  type      = string
  sensitive = true
}

resource "vault_kv_secret" "pypi_main" {
  path = "${vault_mount.pypi.path}/main"
  data_json = jsonencode(
    {
      PYPI_USER = var.pypi_main_user
      PYPI_PASS = var.pypi_main_pass
      PYPI_URL  = "http://${var.pypi_main_user}:${var.pypi_main_pass}@${var.machine_ip}:8080"
    }
  )
}