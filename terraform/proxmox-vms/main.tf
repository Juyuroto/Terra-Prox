resource "proxmox_vm_qemu" "debian" {
  name        = "debian"
  target_node = "pve"
  clone       = "Template-debian"
  full_clone  = true
  boot        = "order=scsi0"
  memory      = 2048

  cpu {
    cores   = 2
    sockets = 1
  }

  disks {
    scsi {
      scsi0 {
        disk {
          size    = "15G"
          storage = "local-lvm"
          discard = true
        }
      }
    }
  }

  network {
    id       = 0
    model    = "virtio"
    bridge   = "vmbr0"
    firewall = false
  }
}