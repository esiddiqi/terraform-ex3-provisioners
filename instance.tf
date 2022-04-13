resource "aws_key_pair" "ec2-terrademo-key" {

 key_name   = "terra-ec2-key"
 public_key = file("ec2-terra-ssh-key-demo.pub")

}

resource "aws_instance" "terra-instance" {

 ami = var.AMIS[var.REGION]
 instance_type = "t2.micro"
 availability_zone = var.ZONE1
 key_name = aws_key_pair.ec2-terrademo-key.key_name
 vpc_security_group_ids = ["sg-05ed6f021b22c2359"]
 tags = {
   Name = "terra-instance"
 }

 provisioner "file" {
   source = "web.sh"
   destination = "/tmp/web.sh"

 }

 provisioner remote-exec{
   inline = [
       "chmod u+x /tmp/tmp.sh",
       "sudo /tmp/tmp.sh"

   ]
 }
 connection {
   user = "ec2-user"
   private_key = file("ec2-terra-ssh-key-demo")
   host = self.public_ip

 }

}