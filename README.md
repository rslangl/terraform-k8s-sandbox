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
```

## References

* [Talos on Proxmox](https://www.talos.dev/v1.9/talos-guides/install/virtualized-platforms/proxmox/)
* [Talos Linux Image Factory](https://factory.talos.dev)
