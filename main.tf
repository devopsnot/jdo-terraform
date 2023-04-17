terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

# Configure the DigitalOcean Provider
provider "digitalocean" {
  token = "dop_v1_d10c07580ae0a41f4ec003e375e2a0bb6ecd32bafa329dee091c5f87e3a3e0da"
}

# MAQUINA VIRTUAL CREATE
# Create a new Web Droplet in the nyc2 region
resource "digitalocean_droplet" "jenkins" {
  image  = "ubuntu-22-04-x64"
  name   = "jenkins-vm"
  region = "nyc1"
  size   = "s-2vcpu-2gb"
  ssh_keys = [data.digitalocean_ssh_key.example.id]
}

# CONECTION SSH
data "digitalocean_ssh_key" "example" {
  name = "srv-ubuntu-vm"
}



# CONEXAO KUBERNETS
resource "digitalocean_kubernetes_cluster" "k8s" {
  name   = "k8s"
  region = "nyc1"
  # Grab the latest version slug from `doctl kubernetes options versions`
  version = "1.24.4-do.0"

  node_pool {
    name       = "default"
    size       = "s-2vcpu-2gb"
    node_count = 2

  }
}