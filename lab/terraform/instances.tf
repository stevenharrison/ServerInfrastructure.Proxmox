# resource "proxmox_vm_qemu" "test_vm" {
#   name        = "tf-test-01"
#   target_node = "pve"
#   clone       = "ubuntu-template"

#   cores  = 1
#   memory = 1024

#   network {
#     bridge = "vmbr1"
#   }
# }

resource "proxmox_vm_qemu" "test_vm" {
  name        = "tf-iso-01"
  target_node = "pve"

  # Boot/install media already uploaded to Proxmox
  iso = "local:iso/ubuntu-24.04.2-live-server-amd64.iso"

  cores  = 1
  memory = 1024

  # VM disk (pick your storage)
  scsihw = "virtio-scsi-pci"
  disk {
    slot    = "scsi0"
    type    = "scsi"
    storage = "local-lvm"
    size    = "20G"
  }

  # NIC
  network {
    bridge = "vmbr1"
    model  = "virtio"
  }

  # Boot order (syntax varies a bit by provider version)
  boot = "order=ide2;scsi0;net0"
}