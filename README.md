# rsschool-devops-course-tasks
Repo with code related to rs_school devops tasks.
The code sets up s3 backend and dynamodb lock for terraform and creates s3 bucket.
Follow the instructions below to set up and execute the code.

# Task_1
## Prerequisites

1. Complete steps 1-3 from the original task [README file](https://github.com/rolling-scopes-school/tasks/blob/master/devops/modules/1_basic-configuration/task_1.md#steps).
**Hint**: you also need to add an [AmazonDynamoDBFullAccess_v2](https://204567761946-nbl34tov.us-east-1.console.aws.amazon.com/iam/home?region=us-east-1#/policies/details/arn%3Aaws%3Aiam%3A%3Aaws%3Apolicy%2FAmazonDynamoDBFullAccess_v2?section=permissions) policy to your AWS user to use this codebase.

2. Set up environment variables (fill in blank ones):
```
export AWS_SECRET_ACCESS_KEY=""
export AWS_ACCESS_KEY_ID=""
export AWS_REGION="us-east-1"
```
3. Create a s3 bucket for .tfstate file using AWS CLI:
```
aws --no-cli-pager s3api create-bucket --acl private --bucket rsschool-s3-tfstate
```
4. Create a dynamodb table for terraform lock:
```
aws --no-cli-pager dynamodb create-table --attribute-definitions AttributeName=LockID,AttributeType=S --key-schema AttributeName=LockID,KeyType=HASH --billing-mode PAY_PER_REQUEST --table-name rsschool_tf_lockid
```
5. Pull the repo using git and go to repo dir:
```
git pull git@github.com:yuferov/rsschool-devops-course-tasks.git
cd rsschool-devops-course-tasks
```

6. Run the following terraform commands to initialize s3 backend and deploy a s3 bucket:
```
terraform init
terraform plan
terraform apply -auto-approve
```
