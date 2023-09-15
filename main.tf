terraform {
  required_providers {
    fly = {
      source  = "fly-apps/fly"
      version = "0.0.23"
    }
  }
}

provider "fly" {
  fly_api_token = var.fly_api_token
}

resource "fly_app" "MajesticSoulPhotography" {
  name = "majestic-soul-photography"
  org  = "personal" # must use slug name here
}

resource "fly_ip" "tracer-bullet-ip-v4" {
  app        = fly_app.MajesticSoulPhotography.name
  type       = "v4"
  depends_on = [fly_app.MajesticSoulPhotography]
}
resource "fly_ip" "tracer-bullet-ip-v6" {
  app        = fly_app.MajesticSoulPhotography.name
  type       = "v6"
  depends_on = [fly_app.MajesticSoulPhotography]

}
resource "fly_machine" "MajesticSoulPhotography-Machine" {
  for_each = toset(["ewr", "lax"])
  app      = fly_app.MajesticSoulPhotography.name
  region   = "mia"
  name     = "fly-machine-MajesticSoulPhotography"
  image    = "kknixon/majesticsoul:latest"
  services = [
    {
      ports = [
        {
          port     = 443
          handlers = ["tls", "http"]
        },
        {
          port     = 80
          handlers = ["http"]
        }
      ]
      "protocol" : "tcp",
      "internal_port" : 8080
    },
  ]
  cpus       = 1
  memorymb   = 1024
  depends_on = [fly_app.MajesticSoulPhotography]
}