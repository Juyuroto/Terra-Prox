variable "pm_api_token_secret" {
  type      = string
  sensitive = true
}

variable "pm_api_url" {
  type        = string
  description = "URL de l'API Proxmox"
}

variable "pm_api_token_id" {
  type        = string
  description = "ID du token API (utilisateur@realm!nom)"
}

variable "vm_name" { 
  type = string 
}

variable "target_node" { 
  type = string
  default = "pve4" 
}

variable "template_name" { 
  type = string
  default = "Ubuntu26.04-Template" 
}

variable "storage" { 
  type = string
  default = "VM-Storage" 
}

variable "memory" { 
  type = number
  default = 2048 
}

variable "cores" { 
  type = number
  default = 2 
}

variable "disk_size" { 
  type = string
  default = "20G" 
}

variable "ip" { 
  type = string 
}

variable "gateway" { 
  type = string
  default = "192.168.20.1" 
}

variable "ci_user" { 
  type = string
  default = "alain" 
}