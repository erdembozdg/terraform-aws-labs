#!/bin/bash -xe

# source /etc/environment

BUCKET="terraform-intro-state"
AWS_REGION="us-west-2"
SERVICE_NAME="bozdag/s3/terraform.tfstate"

BUCKET=${BUCKET:-$(bucket)}
AWS_REGION=${AWS_REGION:-$(aws_region)}
SERVICE_NAME=${SERVICE_NAME:-$(service_name)} 

aws s3api create-bucket --bucket "${BUCKET}" --region "${AWS_REGION}" --create-bucket-configuration LocationConstraint="${AWS_REGION}"


# cat > terraform.tfvars << EOL
# s3_tfstate = {
#     bucket = "${BUCKET}"
# }
# EOL

# terraform init 
# -reconfigure \
#     -backend-config="bucket='${BUCKET}'" \
#     -backend-config="key='${SERVICE_NAME}'"

# terraform import module.backend.aws_s3_bucket.tfstate_bucket "${BUCKET}"