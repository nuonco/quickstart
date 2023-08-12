# Nuon Quickstart

## What's in this Repo

This repo will introduce you to the basic concepts and tools you'll need to deploy apps with Nuon. It contains a simple example app, and will walk you through the process of building and deploying it to multiple installs.

## Getting Started

First, create a fork of this repo. If you have a Github org with other apps you'd like to deploy with Nuon, you should create the fork in that org.

Then, sign up for an account, create a Nuon org, and connect to your Github through our [Dashboard](https://app.nuon.co/sign-in). That will provide you with an auth token and org ID. Set those as env vars for the TF provider and the CLI:

1. `export NUON_AUTH_TOKEN={{ your_auth_token }}`
1. `export NUON_ORG_ID={{ your_org_id }}`

## Creating an App

The Terraform config for creating the example app is in the `/nuon` directory. If you take a look, you'll see the app, some components, and some basic configuration to wire everything up. To create this app in your Nuon org, follow these steps:

1. Run `./scripts/install-tf-provider.sh`, to download and install the Terraform provider.
1. Remove the `.example` from  `/nuon/terraform.tfvars.example`, and update the repo name to match your fork.
1. In the `/nuon` directory, run `terraform init`.
1. Run `terraform plan` to verify it's ready to go.
1. Run `terraform apply` to create the app.

## Creating an Install

An install is a sandbox, with an instance of your app running in it. A sandbox defines the environment your app runs in. Currently, we have a pre-built sandbox that provides a VPC, an EKS cluster, and a Route53 zone.

You don't need to own the AWS account you want to install to. Nuon just needs an IAM role with the requisite permissions to create a sandbox. You'll then be able to deploy your app to that sandbox, and will have a running install.

For the purposes of this quickstart, let's create an install in an AWS account that you own:

1. Sign into whatever AWS account you want to create the install in.
1. Go to the Dashboard, and click on the "Create Install IAM Role". This will take you to an AWS Cloudformation flow to create the IAM role Nuon will need.
1. Once the role is created, copy it's ARN.
1. Uncomment the `nuon_install` resource in `./nuon/installs.tf`, and paste the ARN there.
1. Run `terraform plan` to verify it's ready to go.
1. Run `terraform apply` to create the install. It will take 15-20 minutes to fully provision the sandbox.

For this quickstart, you can create as many installs as you'd like. Having more than one will give you a fuller picture of what Nuon does. To create an install in someone else's account, give them the "Create Install IAM Role" link from the Dashboard.

## Deploying to an Install

Once you've created an app and at least one install, you can build and deploy that app's components. For each component:

1. Run `./scripts/install-cli.sh`, to download and install our CLI.
1. Run `nuon build --component_id={{your_component_id}}`. This will create a build and return it's ID.
1. Run `nuon deploy --build_id={{your_build_id}} --install_id={{your_install_id}}`. If you have multiple installs and want to deploy to all of them, replace `--install-id` with `--all`.

## Next Steps

Once you've completed this quickstart, you should be ready to start deploying your own apps with Nuon. For more information, check out our [documentation](https://docs.nuon.co/).
