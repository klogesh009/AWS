# [3.0.3] (07-09-2021)

### Features

* Update to use GP3 volumes as default
* Allow custom IOPS and throughput for gp3 volumes

# [3.0.2] (02-09-2021)

### Features

* Allow the option to change the default security group name
* Allow the option to change the default ec2 profile name
* Allow the option to change the default ec2 role name

# [3.0.1] (25-08-2021)

### Features

* Only create SubProduct volume tag where it has a value
* N.B. hack to fix situation where tf13 and AWS Provider 3 always reports drift when "" is passed for tag_subproduct

# [3.0.0] (17-08-2021)

### Features

* Made Terraform13 compatable

# [2.3.3] (14-05-2021)

### Features

* Added the ability to add custom cpm backup tag to root volume

# [2.3.2] (01-03-2021)

### Features

* Added the ability to provide custom tags

# [2.3.1] (04-02-2021)

### Features

* Added the ability to change the health check target on the route53 record

# [2.3.0] (01-02-2021)

### Features

* Increase the maximum number of additional volumes that can be attached to 6, including cpm backup tags for each

# [2.2.0] (22-01-2021)

### Features

* Add locals to add functionality to attach EC2 instances to load balancers

# [2.1.0]

### Bug Fixes

* Use tag_role in naming

# [2.0.0] (17-11-2020)

### Features

* TIOOAF-278 | Add in functionality to turn off making default security groups

# [1.1.0]

### Bug Fixes

* Fix issue where adding default security groups to VPC would fail

# [1.0.0]

* Initial tag for new module
