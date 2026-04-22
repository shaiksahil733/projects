output "main" {
  value       = aws_vpc.main.id
  description = "need vpc od for display"

}
output "web-url" {
  value = format("http://%s", aws_instance.public.public_ip)
}

output "ssh_command" {
  value = format(
    "ssh -i %s %s@%s",
    var.key_pair.private_key_path,
    var.web_image.username,
  aws_instance.public.public_ip)
}