
//OUTPUTS
output "app_server_arn" {
  value = aws_instance.web_sev.arn
}

output "app_server_publicdns" {
    value = aws_instance.web_sev.public_dns
}

output "app_server_publicip" {
    value = aws_instance.web_sev.public_ip
}