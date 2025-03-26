{ pkgs ? import ./nixpkgs.nix }:

  let tools = with pkgs; [
    terraform
    qemu
    talosctl
    kubectl
  ];

  in pkgs.mkShell {
    packages = tools;
    inputsFrom = with pkgs; tools;

    shellHook = ''
    '';
  }
