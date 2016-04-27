#
# Chef Server
#
module "chef-server" {
  source = "github.com/mengesb/tf_chef_server"
  aws_access_key = "${var.aws_access_key}"
  aws_flavor = "${var.cs_flavor}"
  aws_key_name = "${var.aws_key_name}"
  aws_private_key_file = "${var.aws_private_key_file}"
  aws_region = "${var.aws_region}"
  aws_secret_key = "${var.aws_secret_key}"
  aws_subnet_id = "${var.aws_subnet_id}"
  aws_vpc_id = "${var.aws_vpc_id}"
  ami_os = "${var.ami_os}"
  allowed_cidrs = "${var.allowed_cidrs}"
  client_version = "${var.client_version}"
  domain = "${var.domain}"
  hostname = "${var.cs_hostname}"
  log_to_file = "${var.log_to_file}"
  org_short = "${var.cs_orgs}"
  org_long = "${var.cs_orgl}"
  root_delete_termination = "${var.root_delete_termination}"
  server_count = 1
  ssl_cert = "${var.ssl_cert}"
  ssl_key  = "${var.ssl_key}"
  tag_description = "${var.tag_description}"
  username = "${var.cs_userna}"
  user_email = "${var.cs_userem}"
  user_firstname = "${var.cs_userfn}"
  user_lastname = "${var.cs_userln}"
}
resource "aws_route53_record" "chef-server-public" {
  zone_id = "${var.r53_extid}"
  name    = "${module.chef-server.fqdn}"
  type    = "A"
  ttl     = "${var.r53_ttl}"
  records = ["${module.chef-server.public_ip}"]
}
resource "aws_route53_record" "chef-server-private" {
  zone_id = "${var.r53_intid}"
  name    = "${module.chef-server.fqdn}"
  type    = "A"
  ttl     = "${var.r53_ttl}"
  records = ["${module.chef-server.private_ip}"]
}
#
# Chef Analytics
#
module "analytics-server" {
  source = "github.com/mengesb/tf_chef_analytics"
  aws_access_key = "${var.aws_access_key}"
  aws_flavor = "${var.as_flavor}"
  aws_key_name = "${var.aws_key_name}"
  aws_private_key_file = "${var.aws_private_key_file}"
  aws_region = "${var.aws_region}"
  aws_secret_key = "${var.aws_secret_key}"
  aws_subnet_id = "${var.aws_subnet_id}"
  aws_vpc_id = "${var.aws_vpc_id}"
  allowed_cidrs = "${var.allowed_cidrs}"
  chef_fqdn = "${aws_route53_record.chef-server-public.name}"
  chef_ip = "${module.chef-server.private_ip}"
  chef_org = "${module.chef-server.organization}"
  chef_org_validator = "${module.chef-server.organization_validator}"
  chef_sg = "${module.chef-server.security_group_id}"
  client_version = "${var.client_version}"
  domain = "${var.domain}"
  hostname = "${var.as_hostname}"
  knife_rb = "${module.chef-server.knife_rb}"
  log_to_file = "${var.log_to_file}"
  root_delete_termination = "${var.root_delete_termination}"
  server_count = 1
  ssl_cert = "${var.ssl_cert}"
  ssl_key  = "${var.ssl_key}"
  tag_description = "${var.tag_description}"
  wait_on = "${aws_route53_record.chef-server-public.name} at ${aws_route53_record.chef-server-public.0.records}"
}
resource "aws_route53_record" "analytics-server-public" {
  zone_id = "${var.r53_extid}"
  name    = "${module.analytics-server.fqdn}"
  type    = "A"
  ttl     = "${var.r53_ttl}"
  records = ["${module.analytics-server.public_ip}"]
}
resource "aws_route53_record" "analytics-server-private" {
  zone_id = "${var.r53_intid}"
  name    = "${module.analytics-server.fqdn}"
  type    = "A"
  ttl     = "${var.r53_ttl}"
  records = ["${module.analytics-server.private_ip}"]
}
#
# Chef Compliance
#
module "compliance-server" {
  source = "github.com/mengesb/tf_chef_compliance"
  aws_access_key = "${var.aws_access_key}"
  aws_flavor = "${var.cmp_flavor}"
  aws_key_name = "${var.aws_key_name}"
  aws_private_key_file = "${var.aws_private_key_file}"
  aws_region = "${var.aws_region}"
  aws_secret_key = "${var.aws_secret_key}"
  aws_subnet_id = "${var.aws_subnet_id}"
  aws_vpc_id = "${var.aws_vpc_id}"
  accept_license = "${var.cmp_license}"
  allowed_cidrs = "${var.allowed_cidrs}"
  chef_fqdn = "${aws_route53_record.chef-server-public.name}"
  chef_org = "${module.chef-server.organization}"
  chef_org_validator = "${module.chef-server.organization_validator}"
  client_version = "${var.client_version}"
  domain = "${var.domain}"
  hostname = "${var.cmp_hostname}"
  knife_rb = "${module.chef-server.knife_rb}"
  log_to_file = "${var.log_to_file}"
  root_delete_termination = "${var.root_delete_termination}"
  server_count = 1
  ssl_cert = "${var.ssl_cert}"
  ssl_key  = "${var.ssl_key}"
  tag_description = "${var.tag_description}"
  wait_on = "${aws_route53_record.analytics-server-public.name} at ${aws_route53_record.analytics-server-public.0.records}"
}
resource "aws_route53_record" "compliance-server-public" {
  zone_id = "${var.r53_extid}"
  name    = "${module.compliance-server.fqdn}"
  type    = "A"
  ttl     = "${var.r53_ttl}"
  records = ["${module.compliance-server.public_ip}"]
}
resource "aws_route53_record" "compliance-server-private" {
  zone_id = "${var.r53_intid}"
  name    = "${module.compliance-server.fqdn}"
  type    = "A"
  ttl     = "${var.r53_ttl}"
  records = ["${module.compliance-server.private_ip}"]
}
#
# GHE server
#
module "ghe-server" {
  source = "github.com/mengesb/tf_ghe_server"
  aws_access_key = "${var.aws_access_key}"
  aws_flavor = "${var.cs_flavor}"
  aws_key_name = "${var.aws_key_name}"
  aws_private_key_file = "${var.aws_private_key_file}"
  aws_region = "${var.aws_region}"
  aws_secret_key = "${var.aws_secret_key}"
  aws_subnet_id = "${var.aws_subnet_id}"
  aws_vpc_id = "${var.aws_vpc_id}"
  allowed_cidrs = "${var.allowed_cidrs}"
  allowed_commit_cidrs = "${var.allowed_cidrs}"
  chef_fqdn = "${aws_route53_record.chef-server-public.name}"
  chef_org = "${module.chef-server.organization}"
  chef_org_validator = "${module.chef-server.organization_validator}"
  client_version = "${var.client_version}"
  domain = "${var.domain}"
  hostname = "${var.ghe_hostname}"
  knife_rb = "${module.chef-server.knife_rb}"
  log_to_file = "${var.log_to_file}"
  ghe_license = "${var.ghe_license}"
  ghe_settings = "${var.ghe_settings}"
  root_delete_termination = "${var.root_delete_termination}"
  server_count = 1
  tag_description = "${var.tag_description}"
  wait_on = "${aws_route53_record.analytics-server-public.name} at ${aws_route53_record.analytics-server-public.0.records}"
}
resource "aws_route53_record" "ghe-server-public" {
  zone_id = "${var.r53_extid}"
  name    = "${module.ghe-server.fqdn}"
  type    = "A"
  ttl     = "${var.r53_ttl}"
  records = ["${module.ghe-server.public_ip}"]
}
resource "aws_route53_record" "ghe-server-private" {
  zone_id = "${var.r53_intid}"
  name    = "${module.ghe-server.fqdn}"
  type    = "A"
  ttl     = "${var.r53_ttl}"
  records = ["${module.ghe-server.private_ip}"]
}
#
# Chef Supermarket
#
module "supermarket-server" {
  source = "github.com/mengesb/tf_chef_supermarket"
  aws_access_key = "${var.aws_access_key}"
  aws_flavor = "${var.ss_flavor}"
  aws_key_name = "${var.aws_key_name}"
  aws_private_key_file = "${var.aws_private_key_file}"
  aws_region = "${var.aws_region}"
  aws_secret_key = "${var.aws_secret_key}"
  aws_subnet_id = "${var.aws_subnet_id}"
  aws_vpc_id = "${var.aws_vpc_id}"
  allowed_cidrs = "${var.allowed_cidrs}"
  chef_fqdn = "${aws_route53_record.chef-server-public.name}"
  chef_org = "${module.chef-server.organization}"
  chef_org_validator = "${module.chef-server.organization_validator}"
  client_version = "${var.client_version}"
  domain = "${var.domain}"
  hostname = "${var.ss_hostname}"
  knife_rb = "${module.chef-server.knife_rb}"
  log_to_file = "${var.log_to_file}"
  root_delete_termination = "${var.root_delete_termination}"
  server_count = 1
  ssl_cert = "${var.ssl_cert}"
  ssl_key  = "${var.ssl_key}"
  tag_description = "${var.tag_description}"
  wait_on = "${aws_route53_record.analytics-server-public.name} at ${aws_route53_record.analytics-server-public.0.records}"
}
resource "aws_route53_record" "supermarket-server-public" {
  zone_id = "${var.r53_extid}"
  name    = "${module.supermarket-server.fqdn}"
  type    = "A"
  ttl     = "${var.r53_ttl}"
  records = ["${module.supermarket-server.public_ip}"]
}
resource "aws_route53_record" "supermarket-server-private" {
  zone_id = "${var.r53_intid}"
  name    = "${module.supermarket-server.fqdn}"
  type    = "A"
  ttl     = "${var.r53_ttl}"
  records = ["${module.supermarket-server.private_ip}"]
}
#
# Chef Delivery
#
module "delivery-server" {
  source = "github.com/mengesb/tf_chef_delivery"
  aws_access_key = "${var.aws_access_key}"
  aws_flavor = "${var.ds_flavor}"
  aws_key_name = "${var.aws_key_name}"
  aws_private_key_file = "${var.aws_private_key_file}"
  aws_region = "${var.aws_region}"
  aws_secret_key = "${var.aws_secret_key}"
  aws_subnet_id = "${var.aws_subnet_id}"
  aws_vpc_id = "${var.aws_vpc_id}"
  allowed_cidrs = "${var.allowed_cidrs}"
  chef_fqdn = "${aws_route53_record.chef-server-public.name}"
  chef_org = "${module.chef-server.organization}"
  chef_org_validator = "${module.chef-server.organization_validator}"
  client_version = "${var.client_version}"
  delivery_license = "${var.ds_license}"
  domain = "${var.domain}"
  ent = "${var.ds_enterprise}"
  hostname = "${var.ds_hostname}"
  knife_rb = "${module.chef-server.knife_rb}"
  log_to_file = "${var.log_to_file}"
  root_delete_termination = "${var.root_delete_termination}"
  secret_key_file = "${module.chef-server.secret_file}"
  server_count = 1
  ssl_cert = "${var.ssl_cert}"
  ssl_key  = "${var.ssl_key}"
  tag_description = "${var.tag_description}"
  wait_on = "${aws_route53_record.analytics-server-public.name} at ${aws_route53_record.analytics-server-public.0.records}"
}
resource "aws_route53_record" "delivery-server-public" {
  zone_id = "${var.r53_extid}"
  name    = "${module.delivery-server.fqdn}"
  type    = "A"
  ttl     = "${var.r53_ttl}"
  records = ["${module.delivery-server.public_ip}"]
}
resource "aws_route53_record" "delivery-server-private" {
  zone_id = "${var.r53_intid}"
  name    = "${module.delivery-server.fqdn}"
  type    = "A"
  ttl     = "${var.r53_ttl}"
  records = ["${module.delivery-server.private_ip}"]
}
#
# Chef Delivery Builds
#
module "delivery-build-server" {
  source = "github.com/mengesb/tf_chef_delivery_build"
  aws_access_key = "${var.aws_access_key}"
  aws_flavor = "${var.dbs_flavor}"
  aws_key_name = "${var.aws_key_name}"
  aws_private_key_file = "${var.aws_private_key_file}"
  aws_region = "${var.aws_region}"
  aws_secret_key = "${var.aws_secret_key}"
  aws_subnet_id = "${var.aws_subnet_id}"
  aws_vpc_id = "${var.aws_vpc_id}"
  allowed_cidrs = "${var.allowed_cidrs}"
  basename = "${var.dbs_basename}"
  chef_fqdn = "${aws_route53_record.chef-server-public.name}"
  chef_org = "${module.chef-server.organization}"
  chef_org_validator = "${module.chef-server.organization_validator}"
  client_version = "${var.client_version}"
  delivery_sg = "${module.delivery-server.security_group_id}"
  domain = "${var.domain}"
  knife_rb = "${module.chef-server.knife_rb}"
  log_to_file = "${var.log_to_file}"
  root_delete_termination = "${var.root_delete_termination}"
  secret_key_file = "${module.chef-server.secret_file}"
  server_count = "${var.dbs_count}"
  tag_description = "${var.tag_description}"
  wait_on = "${aws_route53_record.delivery-server-public.name} at ${aws_route53_record.delivery-server-public.0.records}"
}
# Public Route53 DNS record
resource "aws_route53_record" "delivery-build" {
  count   = "${var.dbs_count}"
  zone_id = "${var.r53_extid}"
  name    = "${element(split(",", module.delivery-build-server.fqdns), count.index)}"
  type    = "A"
  ttl     = "${var.r53_ttl}"
  records = ["${element(split(",", module.delivery-build-server.public_ips), count.index)}"]
}
# Private Route53 DNS record
resource "aws_route53_record" "delivery-build-private" {
  count   = "${var.dbs_count}"
  zone_id = "${var.r53_intid}"
  name    = "${element(split(",", module.delivery-build-server.fqdns), count.index)}"
  type    = "A"
  ttl     = "${var.r53_ttl}"
  records = ["${element(split(",", module.delivery-build-server.private_ips), count.index)}"]
}

