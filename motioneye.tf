data "docker_registry_image" "motioneye" {
  name = "ccrisan/motioneye:master-amd64"
}

resource "docker_image" "motioneye" {
  name          = "${data.docker_registry_image.motioneye.name}"
  pull_triggers = ["${data.docker_registry_image.motioneye.sha256_digest}"]
}

resource "docker_container" "motioneye" {
  name = "motioneye"
  image = "${docker_image.motioneye.name}"
  ports {
    internal = 8765
    external = 8765
  }

  volumes {
    volume_name = "motioneye_data"
    container_path = "/etc/motioneye"
  }
  
}