# output "public_ip" {
#   value = aws_instance.ec2_instance.public_ip
#   description = "The public IP address of the web server"
# }

output "clb_dns_name" {  
    value       = aws_elb.ec2_example.dns_name 
    description = "The domain name of the load balancer"
}
