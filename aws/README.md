https://cloud-images.ubuntu.com/locator/ec2/

terraform force-unlock e88ce3b1-99a7-efdf-cc05-764819c80c7c

terraform plan -lock=false
terraform plan -out file ; terraform apply file ; rm file