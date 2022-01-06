resource "aws_instance" "app_server" {
  ami           = data.aws_ami.latest_amazon_linux_ami.id
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}