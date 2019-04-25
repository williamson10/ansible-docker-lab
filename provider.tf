provider "docker" {
  host = "tcp://docker:2375/"

  registry_auth {
    address = "registry.hub.docker.com"
    config_file = "config.json"
  }
}