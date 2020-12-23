terraform {
  backend "gcs" {
    bucket = "web-v2-tfstate"
    prefix = "env/prod"
  }
}