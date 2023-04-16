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
  token = "dop_v1_374525b4a9d76f80725ecb08358a65f0d0ceb01a47fc4f5778f19e1f7cbd4f55"
}