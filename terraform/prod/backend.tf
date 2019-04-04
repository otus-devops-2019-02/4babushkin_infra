terraform {
  backend "gcs" {
    bucket = "terraform2-prod"
    prefix = "terraform/state-prod"
  }
}
