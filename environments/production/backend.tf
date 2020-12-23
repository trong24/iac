terraform {
  backend "gcs" {
    bucket = "web-autonomous-v2-tfstate"
    prefix = "env/prod"
  }
}