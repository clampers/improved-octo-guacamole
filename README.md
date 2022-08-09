# Standard Site Template

This repo contains (almost) everything a developer needs to spin up a new Heartland Dental website.

## Requirements

- [Docker](https://docs.docker.com/get-docker/) with compose
- AWS account with [the ability to create IAM user and policy](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_create-console.html#access_policies_create-json-editor)\*

---

## Initial Deployment\*

> TODO: [automate this](https://github.com/marketplace/actions/aws-cloudformation-deploy-cloudformation-stack-action-for-github-actions)

- Step 0: Replace all instances of `Hello World!` within this project with your project name.

- Step 1: Use `aws/s3-website` to deploy to Cloudformation.
  See: https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-cli-creating-stack.html

> TODO: Automate this in template

- Step 2: Create an IAM user with access to S3 deployment bucket (generated in step 1)
  Attach the following policy

```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Resource": [
                "arn:aws:s3:::<your-bucket-name>",
                "arn:aws:s3:::<your-bucket-name>/*"
            ],
            "Sid": "VisualEditor1",
            "Effect": "Allow",
            "Action": [
                "s3:*"
            ]
        },
        {
            "Sid": "VisualEditor2",
            "Effect": "Allow",
            "Action": "cloudfront:*",
            "Resource": "arn:aws:cloudfront::<your-aws-account-number>:distribution/<your-distribution-id>"
        }
    ]
}
```

- Step 3: Configure GitHub Action secrets by adding the following to `Your Repo > Settings > Secrets > Actions`:

- AWS_ACCESS_KEY_ID - What you copied in the previous step as AWS access key ID.
- AWS_SECRET_ACCESS_KEY - What you copied in the previous step as Secret access key.
- AWS_S3_BUCKET_NAME - The bucket name you set previously in your IAM Policy (ex: www.acme.com).
- AWS_CLOUDFRONT_DISTRIBUTION_ID - The Cloudfront distribution id you set previously in your IAM Policy.

> TODO: Docker Hub token + user integration

- Step 4: Double check that the repository has access to the organization level Actions token and user: `SST_DOCKER_HUB_TOKEN`, `SST_DOCKER_HUB_USERNAME`

- Step 5: done?

---

## Local Development

> Important:
>
> > If you are developing on Windows `serve.sh` needs to be changed from CRLF to LF

- `docker-compose up`
- The server will start and be available at `http://localhost:8080`
- Auto reload is not currently supported. You can edit the generated `./_site` files and manually reload to preview changes.

> TODO: get auto reload working

## Other

\*: Only necessary on initial deployment, likely already completed by our DevOps team.
