storage "consul" {
    address = "127.0.0.4:8500"
    path    = "vault/"
    scheme  = "http"
}

listener "tcp" {
    address     = "127.0.0.2:8200"
    tls_disable = 1
    telemetry {
        unauthenticated_metrics_access = true
    }
}

ui = true
cluster_addr = "http://127.0.0.2:8201"
api_addr = "http://127.0.0.2:8200"
disable_mlock = true
license_path = "/path/to/vault/license"
