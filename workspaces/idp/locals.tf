locals {
  tags = {
    service = "auth"
  }
  openid_connect = {
    "terraform_cloud" = {
      url                = "app.terraform.io"
      client_id_list     = [aws.workload.identity]
      thumbprint_id_list = [data.tls_certificate.tfc_certificate.certificates[0].sha1_fingerprint]
    }
  }
}
