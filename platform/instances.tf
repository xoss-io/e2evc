
resource "aws_instance" "ec2" {
  count         = length(local.vms)
  ami           = data.aws_ami.ami_win_srv2k19.id
  instance_type = local.vms[count.index].size
  user_data     = data.template_file.userdata[count.index].rendered
  key_name      = "e2evc"

  vpc_security_group_ids = [aws_security_group.ingress_rdp.id,aws_security_group.ingress_winrm.id, aws_security_group.egress_any.id, aws_security_group.ingress_internal.id, aws_security_group.ingress_rdp.id]
  tags = {
    function = local.vms[count.index].function
    Name     = local.vms[count.index].hostname
  }

  provisioner "file" {
    content     = data.template_file.dsc_configuration[count.index].rendered
    destination = "C:/Windows/Temp/dsc.ps1"


    connection {
     host =  self.public_dns
      type     = "winrm"
      user     = local.administrative_user_to_create
      password = random_password.ec2_installer.result
      timeout = "5m"
    }
  }

   provisioner "remote-exec" {

    connection {
      host =  self.public_dns
      type     = "winrm"
      user     = local.administrative_user_to_create
      password = random_password.ec2_installer.result
      timeout = "10m"
    }
     inline = [ "powershell.exe -ExecutionPolicy Bypass -File C:/Windows/Temp/dsc.ps1"  ]

  }
}