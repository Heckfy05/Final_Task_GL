provider "google" {
  #version = "2.23.0"
  credentials = file("providers.json")
  project     = var.project
  region      = var.region
  zone        = var.zone
}
# Creating firevall
resource "google_compute_firewall" "firewall" {
  name    = "sshhttps"
  network = "default"
  allow {
    protocol = "tcp"
    ports    = ["22", "80", "443"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["k8s"]
}

# Creating Instance
resource "google_compute_instance" "K8S" {
  name         = "k8swp"
  machine_type = "custom-4-8192" #custom-VCPUS-MEM_IN_MB like custom-6-20480 for 6 vCPU and 20GB of RAM.
  tags         = ["k8s"]

  boot_disk {
    initialize_params {
      image = var.image
      size  = 35
    }
  }
  network_interface {
    network = "default"
    access_config {}
  }
  metadata = {
    ssh-keys = "${var.gcp_ssh_user}:${file(var.publickeypath)}"
  }
}
# Creating managed SQL DB
resource "google_sql_database_instance" "instance" {
name = "my-database-instance"
database_version = "MYSQL_8_0"
settings {
tier = "db-f1-micro"
}
}
resource "google_sql_database" "database" {
name = var.database
instance = "${google_sql_database_instance.instance.name}"
charset = "utf8"
collation = "utf8_general_ci"
}
resource "google_sql_user" "users" {
name = var.db_user
instance = "${google_sql_database_instance.instance.name}"
host = "%"
password = var.db_user_pass
}