terraform {
  cloud {
    organization = "nats-julien-yann-alexisb"

    workspaces {
      name = "votingapp"
    }
  }
}
