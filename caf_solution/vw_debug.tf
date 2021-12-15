resource "null_resource" "debug" {
  triggers = {
    always_run = "${timestamp()}"
  }
  provisioner "local-exec" {
  command = "echo $VARIABLE1 >> debuglz.json; echo $VARIABLE2 >> debuglz.json; echo $VARIABLE3 >> debuglz.json; cat debuglz.json"
    environment = {
      VARIABLE1 = jsonencode(data.terraform_remote_state.remote)
      VARIABLE2 = jsonencode(var.image_definitions)
      VARIABLE3 = jsonencode(local.remote)
    } 
  }
}