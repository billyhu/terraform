# Configure the Alicloud Provider
provider "alicloud" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}

# Create a web server
resource "alicloud_instance" "web" {
  # cn-beijing
  provider          = "alicloud"
  availability_zone = "cn-beijing-b"
  image_id          = "ubuntu_140405_32_40G_cloudinit_20161115.vhd"

  #  instance_network_type = "Classic"
  internet_charge_type  = "PayByBandwidth"

  instance_type        = "ecs.n1.medium"
  io_optimized         = "optimized"
  system_disk_category = "cloud_efficiency"
  security_groups      = ["${alicloud_security_group.default.id}"]
  instance_name        = "web"
}

# Create security group
resource "alicloud_security_group" "default" {
  name        = "default"
  provider    = "alicloud"
  description = "default"
}
