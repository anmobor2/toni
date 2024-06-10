launch_template_name_prefix     = "my-template"
launch_template_image_id        = "ami-02a6bfdcf828430eb"
launch_template_instance_type   = "t2.micro"
launch_template_user_data_file  = "user_data.sh"
launch_template_tags = {
  Name        = "project_intely-web-server"
  Terraform   = "true"
  Environment = "project_intely"
}
launch_template_volume_size     = 1