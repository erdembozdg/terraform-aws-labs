
# module "default-vpc" {
#     source = ""
#     key_name = aws_key_pair.mykey.key_name
#     key_path = var.PATH_PRIVATE_KEY
#     region = var.AWS_REGION
#     vpc_id = aws_default_vpc.default.id
#     subnets = {
#         "0" = aws_default_subnet.default_az1.id
#         "1" = aws_default_subnet.default_az2.id
#         "2" = aws_default_subnet.default_az3.id
#     }
# }

# output "default-vpc-output" {
#   value = module.default-vpc.server_address
# }
