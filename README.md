# Nuon Quickstart

## What's in this Repo

This repo will introduce you to the basic concepts and tools you'll need to deploy apps with Nuon. It contains a simple example app, and will walk you through the process of building and deploying it to multiple installs.

## Getting Started

First, create a fork of this repo. If you have a Github org with other apps you'd like to deploy with Nuon, you should create the fork in that org.

Then, sign up for an account, create a Nuon org, and connect to your Github through our [Dashboard](https://app.nuon.co/sign-in). That will provide you with an auth token and org ID, which you'll need for both the CLI tool and the Terraform provider.

## Creating an App

The Terraform config for creating the example app is in the `/nuon` directory. If you take a look, you'll see the app, some components, and some basic configuration to wire everything up. To create this app in your Nuon org, follow these steps:

1. Run `./scripts/install-tf-provider.sh`, to download and install the Terraform provider.
1. Paste the auth token and org ID into `/nuon/terraform.tfvars.example` and remove the `.example`.
1. Update `/nuon/repos.tf` to use your fork of this repo.
1. In the `/nuon` directory, run `terraform init`.
1. If that succeeds, then you should be able run `terraform plan` and `terraform apply`.

You should now see the app and it's components in the Dashboard.

## Creating an Install

An install is a sandbox, with an instance of your app running in it. A sandbox defines the environment your app runs in. Currently, we have a pre-built sandbox that provides a VPC, an EKS cluster, and a Route53 zone.

You don't need to own the AWS account you want to install to. Nuon just needs an IAM role with the requisite permissions to create a sandbox. You'll then be able to deploy your app to that sandbox, and will have a running install.

For purposes of this quickstart, let's create an install in an AWS account that you own:

1. Sign into whatever AWS account you want to create the install in.
1. Go to the Dashboard, and click on the "Create Install IAM Role". This will take you to an AWS Cloudformation flow to create the IAM role Nuon will need.
1. Once the role is created, copy it's ARN.
1. Uncomment the `nuon_install` resource in `./nuon/installs.tf`, and paste the ARN there.
1. Run `terraform plan` to verify it's ready to go.
1. Run `terraform apply` to create the install. It will take 15-20 minutes to fully provision the sandbox.

For this quickstart, you can create as many installs as you'd like. We recommend at least 2, so you can get a full picture of how Nuon actually works.

## Deploying to an Install

Once you've created an app and at least one install, you can build and deploy that app's components. For each component:

1. Run `./scripts/install-cli.sh`, to download and install our CLI.
1. Set the auth token and the org ID as the `NUON_AUTH_TOKEN` and `NUON_ORG_ID` env vars, respectively.
1. Run `nuon build --component_id={{your_component_id}}`. This will create a build and return it's ID.
1. You should see the build under the component in the Dashboard.
1. Run `nuon deploy --build_id={{your_build_id}} --install_id={{your_install_id}}`. If you have multiple installs and want to deploy to all of them, replace `--install-id` with `--all`.
1. You should see a deploy under each install in the Dashboard.

## Next Steps

Once you've completed this quickstart, you should be ready to start deploying your own apps with Nuon. For more information, check out our [documentation](https://docs.nuon.co/).
