##################################################################################
# VARIABLES
##################################################################################
#TESTING 123
#Test

variable "aws_access_key" {}
variable "aws_secret_key" {}
#variable "private_key_path" {}
variable "key_name" {
  default = "Giovanni"
}
variable "network_address" {
	default = "10.2.0.0/16"
}
variable "subnet1_address" {
	default = "10.2.0.0/24"
}
variable "subnet2_address" {
	default = "10.2.1.0/24"
}
#variable "key_name" {}

##################################################################################
# PROVIDERS
##################################################################################

provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "us-east-2"
}

#### Defining first ec2 instance and specifying the security group and vpc/subnet it should reside on:

resource "aws_instance" "nginx-gio" {
	ami           = "ami-0520e698dd500b1d1"
  	instance_type = "t2.micro"
#	subnet_id 	= "${aws_subnet.subnet1_gio.id}"
#vpc_security_group_ids	=	["${aws_security_group.SSH-HTTP.id}"]
  	key_name        = "${var.key_name}"
		

#  	connection {
#    		user        = "ec2-user"
#  		private_key = "${file(var.private_key_path)}"

#security_groups = ["${aws_security_group.SSH-HTTP.name}"]

  	tags = {
    		name = "Gio-deployed-by-terra"
  	}

#	provisioner "remote-exec" {
#	
#	inline = [
#			"sudo yum install nginx -y",
#			"sudo systemctl start nginx",
#      			"echo '<html><head><title>Blue Team Server</title></head><body style=\"background-color:#1F778D\"><p style=\"text-align: center;\"><span style=\"color:#FFFFFF;\"><span style=\"font-size:28px;\">Blue Team</span></span></p></body></html>' | sudo tee /usr/share/nginx/html/index.html"
#			]			
#
#  	connection {
#    		host	= "${aws_instance.nginx-gio.public_dns}"
#		type	= "ssh"
#		user        = "ec2-user"
#  		private_key = "${file(var.private_key_path)}"
#
#		}	
#	
#	}



}


#### Defining second ec2 instance and specifying the security group and vpc/subnet it should reside on:

#resource "aws_instance" "nginx-gio2" {
#	ami           = "ami-0520e698dd500b1d1"
#  	instance_type = "t2.micro"
#	subnet_id 	= "${aws_subnet.subnet2_gio.id}"
#	vpc_security_group_ids	=	["${aws_security_group.SSH-HTTP.id}"]
#  	key_name        = "${var.key_name}"
#		
#
##security_groups = ["${aws_security_group.SSH-HTTP.name}"]
##
##  	tags = {
##    		name = "Gio-deployed-by-terra"
##  	}
##
#	provisioner "remote-exec" {
#	
#	inline = [
#			"sudo yum install nginx -y",
#			"sudo systemctl start nginx",
#      			"echo '<html><head><title>Green Team Server</title></head><body style=\"background-color:#228B22\"><p style=\"text-align: center;\"><span style=\"color:#FFFFFF;\"><span style=\"font-size:28px;\">Green Team</span></span></p></body></html>' | sudo tee /usr/share/nginx/html/index.html"
#			]			
#
#  	connection {
#    		host	= "${aws_instance.nginx-gio2.public_dns}"
#		type	= "ssh"
#		user        = "ec2-user"
#  		private_key = "${file(var.private_key_path)}"
#
#		}	
#	
#	}
#
#}
#
###################################################################################
## OUTPUT
###################################################################################
#
##dumping the DNS name for single instances which was specified above


output "aws_instance_public_dns" {
#    value = ["${aws_instance.nginx-gio.public_dns}","${aws_instance.nginx-gio2.public_dns}"]
    value = ["${aws_instance.nginx-gio.public_dns}"]
}


#
#output "aws_elb_public_dns" {
#	value = "${aws_elb.lb_gio.dns_name}"
#}
#
#output "aws_availability_zones" {
#	value = "${data.aws_availability_zones.available.names[0]}"
#}
