# A manually created host ubuntu server

sudo apt update && sudo apt upgrade -y
sudo apt install -y \
  curl wget gnupg software-properties-common \
  git unzip python3 python3-pip python3-venv \
  sshpass

# Install Terraform
curl -fsSL https://apt.releases.hashicorp.com/gpg | \
  sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
  sudo tee /etc/apt/sources.list.d/hashicorp.list

sudo apt update
sudo apt install terraform


# Ansible
python3 -m venv ~/ansible-venv
source ~/ansible-venv/bin/activate
pip install --upgrade pip
pip install ansible


# Add this to ~/.bashrc
# source ~/ansible-venv/bin/activate


# Python wrapper for the proxmox API
pip install proxmoxer requests


ssh-keygen -t ed25519 -C "lab-automation" # /home/steve/.ssh/id_ed25519.pub

# Copy to existing VMs that are to be managed
# ssh-copy-id user@vm-ip

