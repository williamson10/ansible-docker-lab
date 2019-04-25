data "docker_registry_image" "code-server-jekyll" {
  name = "williamson10/code-server-jekyll"
}

resource "docker_image" "code-server-jekyll" {
  name          = "${data.docker_registry_image.code-server-jekyll.name}"
  pull_triggers = ["${data.docker_registry_image.code-server-jekyll.sha256_digest}"]
}

resource "docker_container" "code-server-jekyll" {
  name = "code-server-jekyll"
  image = "${docker_image.code-server-jekyll.name}"
  ports {
    internal = 8443
    external = 8443
  }

  ports {
    internal = 4000
    external = 4000
  }

  volumes {
    volume_name = "code-server_data"
    container_path = "/home/coder/project"
  }

  env = ["PASSWORD=letmein"] # TODO: Look into vault
 
}