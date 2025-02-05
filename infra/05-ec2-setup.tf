resource "null_resource" "this" {
  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = "ec2-user"
      host        = aws_instance.this.public_ip
      private_key = file("./keys/id_rsa")
    }
    inline = [
      "sudo yum -y update",
      "sudo yum -y install docker git make",
      "sudo systemctl start docker",
      "sudo usermod -aG docker $(whoami)",
      "sudo curl -L \"https://github.com/docker/compose/releases/download/v2.27.0/docker-compose-$(uname -s)-$(uname -m)\" -o /usr/local/bin/docker-compose",
      "sudo chmod +x /usr/local/bin/docker-compose",
      "sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose",
      "cd ~",
      "sudo git clone ${var.repository_uri}",
      "cd ${var.repository_dir}",
      "sudo ${local.ec2.up_command}",
    ]
  }
}