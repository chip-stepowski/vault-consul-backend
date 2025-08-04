storage "consul" {
    address = "127.0.0.1:8500"
    path    = "vault/"
    scheme  = "http"
}

listener "tcp" {
    address     = "127.0.0.1:8200"
    tls_disable = 1
    telemetry {
        unauthenticated_metrics_access = true
    }
}

seal "awskms" {
    region = "us-east-1"
    kms_key_id = ""
}
