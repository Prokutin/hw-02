###vm_web vars

variable "vm_web_image_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "Семейство образа ОС для ВМ"
}

variable "vm_web_platform_id" {
  type        = string
  default     = "standard-v3"
  description = "Платформа ВМ"
}

# variable "vm_web_cores" {
#   type        = number
#   default     = 2
#   description = "Количество ядер ВМ"
# }
#
# variable "vm_web_memory" {
#   type        = number
#   default     = 1
#   description = "Объём RAM ВМ, ГБ"
# }
#
# variable "vm_web_core_fraction" {
#   type        = number
#   default     = 20
#   description = "Гарантированная доля vCPU, %"
# }

variable "vm_web_preemptible" {
  type        = bool
  default     = true
  description = "Прерываемая ВМ"
}

variable "vm_web_nat" {
  type        = bool
  default     = true
  description = "Публичный IP-адрес у ВМ"
}

# variable "vm_web_serial_port_enable" {
#   type        = number
#   default     = 1
#   description = "Включить доступ к последовательному порту (1/0)"
# }

###vm_db vars

variable "vm_db_zone" {
  type        = string
  default     = "ru-central1-d"
  description = "Зона доступности ВМ"
}

variable "vm_db_subnet_cidr" {
  type        = list(string)
  default     = ["10.0.2.0/24"]
  description = "CIDR подсети в зоне ВМ БД"
}

variable "vm_db_platform_id" {
  type        = string
  default     = "standard-v2"
  description = "Платформа ВМ"
}

# variable "vm_db_cores" {
#   type        = number
#   default     = 2
#   description = "Количество ядер ВМ"
# }
#
# variable "vm_db_memory" {
#   type        = number
#   default     = 2
#   description = "Объём RAM ВМ, ГБ"
# }
#
# variable "vm_db_core_fraction" {
#   type        = number
#   default     = 20
#   description = "Гарантированная доля vCPU, %"
# }

variable "vm_db_preemptible" {
  type        = bool
  default     = true
  description = "Прерываемая ВМ"
}

variable "vm_db_nat" {
  type        = bool
  default     = true
  description = "Публичный IP-адрес у ВМ"
}

# variable "vm_db_serial_port_enable" {
#   type        = number
#   default     = 1
#   description = "Включить доступ к последовательному порту (1/0)"
# }

###vms resources and shared metadata

variable "vms_resources" {
  type = map(object({
    cores         = number
    memory        = number
    core_fraction = number
  }))
  default = {
    web = {
      cores         = 2
      memory        = 1
      core_fraction = 20
    }
    db = {
      cores         = 2
      memory        = 2
      core_fraction = 20
    }
  }
  description = "Ресурсы ВМ: ядра, RAM (ГБ), доля vCPU (%)"
}

variable "metadata" {
  type        = map(string)
  default     = {
    serial-port-enable = "1"
    ssh-keys           = "ubuntu:<your_ssh_ed25519_key>"
  }
  description = "Метаданные, общие для всех ВМ"
}
