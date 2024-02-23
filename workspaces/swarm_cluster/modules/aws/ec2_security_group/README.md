<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_security_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description"></a> [description](#input\_description) | security group description | `string` | n/a | yes |
| <a name="input_egress"></a> [egress](#input\_egress) | egress rules | `list(map(any))` | n/a | yes |
| <a name="input_ingress"></a> [ingress](#input\_ingress) | ingress rules | `list(map(any))` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | security group name | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | tags | `map(string)` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | vpc\_id | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_security_group_output"></a> [security\_group\_output](#output\_security\_group\_output) | n/a |
<!-- END_TF_DOCS -->