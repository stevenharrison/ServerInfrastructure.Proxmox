resource "proxmox_virtual_environment_vm" "test_vm" {
  name      = "${var.lab_name}-test-01"
  node_name = "proxmox" # <-- your Proxmox node name (e.g. pve, pve1, proxmox)

  pool_id = "lab"

  # Clone from an existing Proxmox VM template
  clone {
    vm_id = 9001 # <-- CHANGE to your template VMID
    full = true
    # You can also set "full" = true/false depending on your preference/version.
  }

  cpu {
    cores = 1
    type  = "host"
  }

  memory {
    dedicated = 1024
  }

  # Primary disk
  disk {
    interface    = "scsi0"
    datastore_id = "local-lvm"  # <-- CHANGE if your storage differs
    size         = 40           # GiB
  }

  network_device {
    bridge = "vmbr1"
    model  = "virtio"
  }

  agent {
    enabled = true
  }
}