terraform {
  backend "gcs" {
    bucket = "terraform2-stage"
    prefix = "terraform/state-stage"
  }
}
