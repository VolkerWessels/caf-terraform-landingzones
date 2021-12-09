resource "null_resource" "debug" {
  triggers = {
    always_run = "${timestamp()}"
  }
  provisioner "local-exec" {
  command = "echo $VARIABLE1 >> debug_lz.json; echo $VARIABLE2 >> debug_lz.json; echo $VARIABLE3 >> debug_lz.json; cat debug_lz.json"
    environment = {
      VARIABLE1 = jsonencode(data.terraform_remote_state.remote)
      VARIABLE2 = jsonencode(var.image_definitions)
      VARIABLE3 = jsonencode(local.remote)
    } 
  }
}
