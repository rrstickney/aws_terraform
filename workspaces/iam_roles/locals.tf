locals {
  roles = {
    "icestation_admin" = {
      name = "icestation_admin"
      managed_policy_arns = [
        "arn:aws:iam::aws:policy/AdministratorAccess"
      ]
    }
  }
}
