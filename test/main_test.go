package main

import (
	"github.com/gruntwork-io/terratest/modules/terraform"
	"testing"
)

func TestNewZone(tester *testing.T) {
	tCases := []struct{
		name string
		want string
	}{
		{"new_zone", "[test.zone]"},
	}
	tCase := tCases[0]

	tfOptions := terraform.WithDefaultRetryableErrors(tester, &terraform.Options{
		TerraformDir: "..",
		VarFiles: []string{"examples/new_zone/terraform.tfvars"},
	})
	// Make sure to tear down infrastructure after test runs.
	// Note if the test panics this will not happen.
	defer terraform.Destroy(tester, tfOptions)

	// website::tag::2::Run "terraform init" and "terraform apply".
	// This will run `terraform init` and `terraform apply` and fail the test if there are any errors
	terraform.InitAndApply(tester, tfOptions)

	// Run `terraform output` to get the values of output variables
	got := terraform.Output(tester, tfOptions, "route53_zone_name")

	if got != tCase.want {
		tester.Errorf("got %q and want %q", got, tCase.want)
	}
}