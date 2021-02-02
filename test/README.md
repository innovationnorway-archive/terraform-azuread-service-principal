# Test Configuration

This directory contains a Terraform configuration that tests the module in the root directory using [the `testing` provider](https://registry.terraform.io/providers/apparentlymart/testing).

You can use this configuration as normal to run the test:

* `terraform init` to install the required dependencies
* `terraform apply` to create the test objects and run the test assertions
* `terraform destroy` when you're done, to clean up the test objects

The successful completion of `terraform apply` indicates that the tests are all passing.
