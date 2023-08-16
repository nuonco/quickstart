# Nuon Quickstart

## What's in this Repo

This repo will introduce you to the basic concepts and tools you'll need to deploy apps with Nuon. It contains:

- [./nuon](./nuon): Terraform for deploying an example app using the Nuon platform.
- [./example](./example): Source code for the components of the example app.
- [./install-roles](./install-roles): The IAM roles you need to provision new installs.
- [./scripts](./scripts): Scripts for installing our CLI and Terraform provider.

## Getting Started

To get started using Nuon, you'll need to sign up for an account, and install our CLI and TF provider.

1. Sing up using our [Dashboard](https://app.nuon.co/sign-in).
1. A build server and runner will be provisioned for you automatically.
1. Connect your Github account.
1. Fork and clone this repo.
1. Run the install scripts in [./scripts](./scripts).
1. Open a terminal, and copy your auth token and org ID from the Dashboard:
    1. `export NUON_API_TOKEN={{ your_auth_token }}`
    1. `export NUON_ORG_ID={{ your_org_id }}`

You are now ready to create apps and installs using Nuon. From here on out, everything will happen in the terminal session you set the env vars in.

## Creating an App

To create the example app in your Nuon org:

1. Navigate to [/nuon](./nuon).
1. Remove the `.example` from  `/nuon/terraform.tfvars.example`, and update the repo name to match your fork.
1. Run `terraform init`, `terraform plan`, and `terraform apply`, just as you would for any other Terraform project.

## Creating an Install

An install is a sandbox, with an instance of your app running in it. A sandbox defines the environment your app runs in. Currently, we have a pre-built sandbox that provides a VPC, an EKS cluster, and a Route53 zone.

You don't need to own the AWS account you want to install to. Nuon just needs an IAM role with the requisite permissions to create a sandbox. You'll then be able to deploy your app to that sandbox, and will have a running install.

For the purposes of this quickstart, let's create the IAM role in an AWS account that you own:

1. Authenticate with whatever AWS account you want to create the install in.
1. Navigate to [./install-roles](./install-roles).
1. Run `terraform init`, `terraform plan`, and `terraform apply`, just as you would for any other Terraform project.

Use the ARN of that IAM role to provision the sandbox.

1. Navigate to [./nuon](./nuon).
1. Uncomment the `nuon_install` resource in `./nuon/installs.tf`, and paste the IAM role's ARN there.
1. Run `terraform init`, `terraform plan`, and `terraform apply`, just as you would for any other Terraform project.
1. It will take 15-20 minutes to fully provision the sandbox.

For this quickstart, you can create as many installs as you'd like. Having more than one will give you a fuller picture of what Nuon does.

## Deploying to an Install

Once you've created an app and at least one install, you can use the CLI to build and deploy that app's components. For each component:

1. Run `nuon build --component_id={{your_component_id}}`. This will create a build and return it's ID.
1. Run `nuon deploy --build_id={{your_build_id}} --install_id={{your_install_id}}`. If you have multiple installs and want to deploy to all of them, replace `--install-id` with `--all`.

## Next Steps

Once you've completed this quickstart, you should be ready to start deploying your own apps with Nuon. For more information, check out our [documentation](https://docs.nuon.co/).
