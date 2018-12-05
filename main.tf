provider "google" {  
}

# vm1.tf

variable "node_count" {
  default = "3"
 }

resource "google_compute_disk" "test-node-1-index-disk-" {
    count   = "${var.node_count}"
    name    = "testpd-node-1-index-disk-${count.index}-data"
    type    = "n1-standard-1"
    zone    = "us-central1-a"
    size    = "5"
    project      = "sharp-quest-216218"
}
resource "google_compute_instance" "test-node-" {
    count = "${var.node_count}"
    name = "testpd-node-${count.index}"
    machine_type = "n1-standard-1"
    zone = "us-central1-a"
    project      = "sharp-quest-216218"

}
  boot_disk {
    initialize_params {
      image = "debian-9-stretch-v20181113"
    }
  }

  // Local SSD disk
  scratch_disk {
  }


    network_interface {
      network = "default"
      access_config {
        // Ephemeral IP
      }

    }
