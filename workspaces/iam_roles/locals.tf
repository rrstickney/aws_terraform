locals {
  roles = {
    "icestation_admin" = {
      name               = "icestation_admin"
      assume_role_policy = file("${path.module}/files/assume_role_google_workspaces.json")
      managed_policy_arns = [
        "arn:aws:iam::aws:policy/AdministratorAccess"
      ]
      max_session_duration = "28800"
    }
    "terraform_cloud_admin" = {
      name               = "terraform_cloud_admin"
      assume_role_policy = file("${path.module}/files/assume_role_terraform_cloud.json")
      managed_policy_arns = [
        "arn:aws:iam::aws:policy/AdministratorAccess"
      ]
      max_session_duration = "3600"
    }
  }
}
