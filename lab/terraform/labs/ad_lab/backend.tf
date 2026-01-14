terraform {
  backend "local" {
    path = "state/ad_lab.tfstate"
  }
}