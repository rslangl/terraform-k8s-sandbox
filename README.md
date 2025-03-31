# Terraform K8s sandbox

Talos testbed, for based heretics.

## Requirements

```shell
# Install nix
curl -L https://nixos.org/nix/install | sh

# (Optional) Enable experimental features to search packages from CLI
nix --extra-experimental-features "nix-command flakes" search nixpkgs terraform
```

## Usage

```shell
# Launch nix-shell
nix-shell

# Deploy with terraform
terraform plan -out plan
terraform apply "plan"

# Once in a running state, get the IP from the console
export CONTROL_PLANE_IP=192.168.88.224

# Generate configs
talosctl gen config talos-proxmox-cluster https://$CONTROL_PLANE_IP:6443 --output-dir _out

# Apply configs to control plane
talosctl apply-config --insecure --nodes $CONTROL_PLANE_IP --file _out/controlplane.yaml

# Apply configs to worker
talosctl apply-config --insecure --nodes $WORKER_IP --file _out/worker.yaml 
```

## References

* [Talos on Proxmox](https://www.talos.dev/v1.9/talos-guides/install/virtualized-platforms/proxmox/)
* [Talos Linux Image Factory](https://factory.talos.dev)
