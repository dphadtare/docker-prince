variable "TAG" {
  default = "14.3"
}

target "prince" {
  tags = ["docker.io/dphadatare/prince:${TAG}"]
  platforms = [
    "linux/amd64",
    "linux/arm64",
  ]
}

group "default" {
  targets = ["prince"]
}

