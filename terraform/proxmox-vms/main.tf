resource "proxmox_vm_qemu" "vm" {
  name = var.vm_name
  vmid = var.vmid
  target_node = var.target_node
  clone = var.template_name
  full_clone = true
  agent = 1
  os_type = "cloud-init"
  scsihw = "virtio-scsi-single"
  boot = "order=scsi0"
  memory = var.memory

  cpu {
    cores = var.cores
    sockets = 1
    type = "x86-64-v2-AES"
  }

  serial {
    id = 0
    type = "socket"
  }

  vga {
    type = "serial0"
  }

  disks {
    scsi {
      scsi0 {
        disk {
          size = var.disk_size
          storage = var.storage
          discard = true
        }
      }
    }
    ide {
      ide2 {
        cloudinit {
          storage = var.storage
        }
      }
    }
  }

  network {
    id = 0
    model = "virtio"
    bridge = "vmbr0"
  }

  ipconfig0 = "ip=${var.ip}/24,gw=${var.gateway}"
  nameserver = var.gateway
  ciuser = var.ci_user
  sshkeys = file(pathexpand("~/.ssh/id_ed25519.pub"))
}