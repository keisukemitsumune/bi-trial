resource "aws_key_pair" "this" {
  key_name   = "${local.general.service_name}-aws_key_pair"
  public_key = file("./keys/id_rsa.pub")
}

resource "aws_instance" "this" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = aws_subnet.public1.id
  vpc_security_group_ids = [
    aws_security_group.ec2.id,
  ]
  iam_instance_profile        = aws_iam_instance_profile.this.name
  associate_public_ip_address = true
  key_name                    = aws_key_pair.this.id
  root_block_device {
    volume_size = 10
    volume_type = "gp2"
  }
}

resource "aws_iam_instance_profile" "this" {
  name = aws_iam_role.this.name
  role = aws_iam_role.this.name
}