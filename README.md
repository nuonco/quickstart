# Nuon Quickstart

## What's in this Repo

This repo will introduce you to the basic concepts and tools you'll need to deploy apps with Nuon. It contains:

- [./nuon](./nuon): Terraform for deploying an example app using the Nuon platform.
- [./example](./example): Source code for the components of the example app.
- [./install-roles](./install-roles): The IAM roles you need to provision new installs.
- [./scripts](./scripts): Utility scripts.

## Getting Started

To get started using Nuon, you'll need to sign up for an account, and install our CLI.

1. Sing up using our [Dashboard](https://app.nuon.co/sign-in).
1. A data plane with your management server and build runner will be provisioned with ~ 10 minutes.
1. Connect your Github account.
1. Fork and clone this repo.
1. Run `./scripts/install-cli.sh` to install our CLI.
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

An install is a sandbox, with an instance of your app running in it. A sandbox defines the environment your app runs in. Currently, we have a pre-built sandbox that provides a VPC, an EKS cluster, and a Route53 zone. You don't need to own the AWS account you want to install to. Nuon just needs an IAM role with the requisite permissions to create a sandbox. You'll then be able to deploy your app to that sandbox, and will have a running install.

To enable you to provide the best possible experience for your customers, we offer 2 ways to set up that IAM role.

### Terraform

If you have admin access to the AWS account, there's a Terraform project in [./install-roles/terraform](./install-roles/terraform) you can use.

1. Authenticate with whatever AWS account you want to create the install in.
1. Navigate to [./install-roles/terraform](./install-roles/terraform).
1. Run `terraform init`, `terraform plan`, and `terraform apply`, just as you would for any other Terraform project.

### Cloudformation Quick-Create

If you do not have admin access to the AWS account, you can share a [Cloudformation Quick-Create](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/cfn-console-create-stacks-quick-create-links.html) link with someone who does.

[Click here](https://us-west-2.console.aws.amazon.com/cloudformation/home#/stacks/quickcreate?templateUrl=https://nuon-sandbox-boostrap-poc.s3.us-west-2.amazonaws.com/index.yaml&stackName=install-roles) to see an example of how this works. The Cloudformation template used for this can be found in [./install-roles/cloudformation-quickcreate](./install-roles/cloudformation-quickcreate), which you can use to set up your own Quick-Create URL.

### Provision the Sandbox

Once the IAM role has been created, you can use it to provision a sandbox.

1. Navigate to [./nuon](./nuon).
1. Uncomment the `nuon_install` resource in `./nuon/installs.tf`, and paste the IAM role's ARN there.
1. Run `terraform init`, `terraform plan`, and `terraform apply`, just as you would for any other Terraform project.
1. It will take 15-20 minutes to fully provision the sandbox.

For this quickstart, you can create as many installs as you'd like. Having more than one will give you a fuller picture of what Nuon does.

## Building and Releasing

Once you've created an app and at least one install, you can use the CLI to build and release that app's components. For each component:

1. Run `nuon builds create -c={component_id}` to create a new build and get it's ID.
1. Run `nuon releases create -c {component_id} -b {build_id}` to create a new release from your build. This will deploy to all of your installs, 10 at a time.

## Next Steps

Once you've completed this quickstart, you should be ready to start deploying your own apps with Nuon. For more information, check out our [documentation](https://docs.nuon.co/).
