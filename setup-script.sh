#!/bin/sh

# set vars
read -p "Enter the path to the Vault license: " LICENSE_PATH

for ((i=1; i<=3; i++)); do

# create the 3 HCL files
cat <<EOF > vault-$i.hcl
storage "consul" {
    address = "http://127.0.0.4:8500"
    path    = "vault/"
    scheme  = "http"
}

listener "tcp" {
    address     = "127.0.0.${i}:8200"
    tls_disable = 1
    telemetry {
        unauthenticated_metrics_access = true
    }
}

ui = true
cluster_addr = "http://127.0.0.${i}:8201"
api_addr = "http://127.0.0.${i}:8200"
disable_mlock = true
license_path = "${LICENSE_PATH}"
EOF

# end HCL file creation loop
done

