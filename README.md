# tf_chef_stack
Terraform plans for deploying a full Chef stack.

## Usage

Unless listed here, each sub-directory should contain a `README.md` describing that provider's usage

### AWS Plan Usage

This is a gathering of various individually developed module Terraform plans by [Brian Menges](https://github.com/mengesb).

The following Terraform modules deploy their respective software title, referred to collectively as "the stack"

* Chef Server 12.x    - [tf_chef_server](https://github.com/mengesb/tf_chef_server)
* Chef Analytics      - [tf_chef_analytics](https://github.com/mengesb/tf_chef_analytics)
* Chef Compliance     - [tf_chef_compliance](https://github.com/mengesb/tf_chef_compliance)
* Chef Supermarket    - [tf_chef_supermarket](https://github.com/mengesb/tf_chef_supermarket)
* Chef Delivery       - [tf_chef_delivery](https://github.com/mengesb/tf_chef_delivery)
* Chef Delivery Build - [tf_chef_delivery_build](https://github.com/mengesb/tf_chef_delivery_build)
* GitHub Enterprise   - [tf_ghe_server](https://github.com/mengesb/tf_ghe_server)

Since this is a full stack plan, please note that configurables reside in the children repositories. Provided in [aws](aws) is an [example terraform.tfvars](aws/terraform.tfvars.example)
giving you the minimum amount of configuration required. There are of course other overrides that are available on a per-module basis; please consider making your own plan or using the
specific module to your more specific needs.

To use this plan
1. `cp terraform.tfvars.example terraform.tfvars`
2. Modify it as you see fit with your preferred editor
3. `terraform get` to download required sub-modules
4. `terraform plan` to see what it will build
5. `terraform apply` to initiate the plan
6. `terraform output` to see the stack output

## Plan Requirements

Unless listed here, each sub-directory should contain a `README.md` describing that provider's requirements.

### AWS Plan Requirements

This plan requires the following:

* AWS account (this wil incur charges!)
* AWS VPC pre-created
* AWS Subnet pre-created
* SSL certifiate (wildcard)
* AWS Route53 (preferred method of DNS)

Plan runtime is approximately 1 hour

## Contributing

Contributions are welcome. Currently the only "plan" developed is for AWS with a pre-defined set of conditions. Should other AWS or other provider plans be developed, they will undoubtedly be in different directories. Please fork, commit, PR and show the plan in action. Subsequent `README.md` files *SHOULD* be present in sub-directories. Please understand that this is a work in progress and is subject to rapid change.

## Contributors

* [Brian Menges](https://github.com/mengesb)

## License

This is licensed undert [the Apache 2.0 license](https://www.apache.org/licenses/LICENSE-2.0).

