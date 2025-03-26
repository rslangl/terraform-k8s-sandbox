{ pkgs ? import ./nixpkgs.nix }:

  let tools = with pkgs; [
    terraform
    qemu
    talosctl
  ];

  in pkgs.mkShell {
    packages = tools;
    inputsFrom = with pkgs; tools;

    shellHook = ''
    '';
  }
