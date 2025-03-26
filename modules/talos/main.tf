resource "proxmox_virtual_environment_vm" "vm" {
  name = "k8s-1"
  node_name = "wintermute"
  tags = ["terraform"]
  
  #agent {
  #  enabled = true
  #}

  cpu {
    cores = var.vm_cores
  }

  memory {
    dedicated = var.vm_memory
  }

  disk {
    datastore_id = "local-zfs"
    file_id = "local:iso/talos_nocloud_v1.9.5.img"
    interface = "virtio0"
    size = var.vm_disk
  }

  initialization {
    datastore_id = "local-zfs"
    ip_config {
      ipv4 {
        address = "dhcp"
      }
    }

    #user_account {
    #  keys = [trimspace(tls_private_key.vm_key.public_key_openssh)]
    #  password = random_password.vm_password.result
    #  username = "herder"
    #}

  }

  #startup {
  #  order = "3"
  #  up_delay = "60"
  #  down_delay = "60"
  #}

  network_device {
    bridge = "vmbr0"
  }
}
