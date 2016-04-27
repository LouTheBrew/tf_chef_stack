# tf_chef_stack
Terraform plans for deploying a full Chef stack.

## Usage

This repo is a gathering of various providers in sub-directories consuming the individually developed module Terraform plans by [Brian Menges](https://github.com/mengesb).

The following Terraform modules deploy their respective software title, referred to collectively as "the stack"

* Chef Server 12.x    - [tf_chef_server](https://github.com/mengesb/tf_chef_server)
* Chef Analytics      - [tf_chef_analytics](https://github.com/mengesb/tf_chef_analytics)
* Chef Compliance     - [tf_chef_compliance](https://github.com/mengesb/tf_chef_compliance)
* Chef Supermarket    - [tf_chef_supermarket](https://github.com/mengesb/tf_chef_supermarket)
* Chef Delivery       - [tf_chef_delivery](https://github.com/mengesb/tf_chef_delivery)
* Chef Delivery Build - [tf_chef_delivery_build](https://github.com/mengesb/tf_chef_delivery_build)
* GitHub Enterprise   - [tf_ghe_server](https://github.com/mengesb/tf_ghe_server)

## Plan Requirements

Below in each sub-directory you'll find the plan requirements.

### AWS Provider

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

