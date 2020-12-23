# Autonomous Infrastructure As Code

## Prerequisites
Make sure you install terraform.
GCP JSON auth token file.

## Install terraform

#### First, install the HashiCorp tap, a repository of all our Homebrew packages.
```console
$ brew tap hashicorp/tap
```
#### Now, install Terraform with hashicorp/tap/terraform.
```console
$ brew install hashicorp/tap/terraform
```
NOTE: This installs a signed binary and is automatically updated with every new official release.

#### To update to the latest, run
```console
$ brew upgrade hashicorp/tap/terraform
```

## Provisioning Infrastructure

```console
cd ./environments/prod/
terraform validate
terraform fmt
terraform plan
terraform apply -auto-approve
```