# rsschool-devops-course-tasks
Repo with code related to rs_school devops tasks.
The code sets up s3 backend and dynamodb lock for terraform and creates s3 bucket.
Follow the instructions below to set up and execute the code.

*Task_1
**Prerequisites**

Complete steps 1-3, defined in the original task README file

Set up environment variables (fill in blank ones):
```
export AWS_SECRET_ACCESS_KEY=""
export AWS_ACCESS_KEY_ID=""
export AWS_REGION="us-east-1"
```
Create s3 bucket for .tfstate file using AWS CLI:
```
aws --no-cli-pager s3api create-bucket --acl private --bucket rsschool-s3-tfstate
```
Create dynamodb table for terraform lock:
```
aws --no-cli-pager dynamodb create-table --attribute-definitions AttributeName=LockID,AttributeType=S --key-schema AttributeName=LockID,KeyType=HASH --billing-mode PAY_PER_REQUEST --table-name rsschool_tf_lockid
```
Pull the repo using git and go to repo dir:
```
git pull git@github.com:yuferov/rsschool-devops-course-tasks.git
cd rsschool-devops-course-tasks
```

Run terraform commands:
```
terraform init
terraform plan
terraform apply -auto-approve
```
