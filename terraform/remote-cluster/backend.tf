terraform {
  cloud {
    organization = "NATS-Julien-Yann-AlexisB"

    workspaces {
      name = "votingapp"
    }
  }
}
