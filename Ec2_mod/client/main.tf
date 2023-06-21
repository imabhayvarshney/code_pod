module vm{
  source = "../ec2_module"

  ami_ssm_parameter = var.ami_ssm_parameter
  disable_api_termination = var.disable_api_termination
  ebs_block_device = var.ebs_block_device
  ebs_optimized = var.ebs_optimized
  iam_instance_profile = var.iam_instance_profile
  instance_initiated_shutdown_behavior = var.instance_initiated_shutdown_behavior
  instance_type = var.instance_type
  metadata_options = var.metadata_options
  root_block_device = var.root_block_device
  tags = var.tags
  user_data = var.user_data
  vpc_security_group_ids = var.vpc_security_group_ids
  

}