# Contributing Guide

There's not much to it. Just make use of these recommendations to ensure your
PR gets accepted fast.

* Make test using the [Module Testing Experiment]
* Adhere to the [Standard Module Structure]
* For making complex output, use [Command: console] to ensure you get what you
  expect.
* Please update the README using terraform-docs CLI, just run `terraform-docs .`
  in the root of the project. A Terraform Docs configuration file is provided
  to facilitate running the command in an automated fashion.
* Should you have questions, if there is an existing issue or discussion ask 
  there. Or open an issue/discussion to ask. Paste a link to any code you may 
  have.
* Only make a PR when you're ready to merge.
* We do not share out the secrets, so you'll have to add them to your own 
  forks environment and run in your own Org.

[Standard Module Structure]: https://developer.hashicorp.com/terraform/language/modules/develop/structure
[Module Testing Experiment]: https://developer.hashicorp.com/terraform/language/modules/testing-experiment
[Command: console]: https://developer.hashicorp.com/terraform/cli/commands/console
[Terraform Docs Introduction]: https://terraform-docs.io/user-guide/introduction/
