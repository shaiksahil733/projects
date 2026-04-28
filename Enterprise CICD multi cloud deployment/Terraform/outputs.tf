output "ssh_command" {
  value = format(
    "ssh -i %s %s@%s",
    var.key_pair.private_key_path,
    var.web_image.username,
  aws_instance.web_server.public_ip)
}