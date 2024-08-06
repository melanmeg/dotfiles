#!/bin/bash

# terraform
alias tf='terraform'
alias tfi='terraform init'
alias tfs='terraform show .terraform/state.tfstate'
alias tfl='terraform state list -state=.terraform/state.tfstate'
alias tfp='terraform plan -state=.terraform/state.tfstate'
alias tfa='terraform apply --auto-approve -state=.terraform/state.tfstate'
alias tfd='terraform destroy --auto-approve -state=.terraform/state.tfstate'
alias tfr='terraform refresh -state=.terraform/state.tfstate'
