<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.36.0 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ec2_keys"></a> [ec2\_keys](#module\_ec2\_keys) | ./modules/aws/ec2_keys | n/a |
| <a name="module_ec2_security_group"></a> [ec2\_security\_group](#module\_ec2\_security\_group) | ./modules/aws/ec2_security_group | n/a |
| <a name="module_swarm_manager"></a> [swarm\_manager](#module\_swarm\_manager) | ./modules/aws/ec2_instance | n/a |
| <a name="module_swarm_worker"></a> [swarm\_worker](#module\_swarm\_worker) | ./modules/aws/ec2_instance | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_ami.ubuntu_22_arm64](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |
| [aws_subnet.public_subnet_2a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet) | data source |
| [aws_subnet.public_subnet_2b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet) | data source |
| [aws_subnet.public_subnet_2c](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet) | data source |
| [terraform_remote_state.vpc](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_key_pair_output"></a> [key\_pair\_output](#output\_key\_pair\_output) | n/a |
| <a name="output_security_group_output"></a> [security\_group\_output](#output\_security\_group\_output) | n/a |
<!-- END_TF_DOCS -->