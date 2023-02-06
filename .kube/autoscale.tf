resource "aws_launch_configuration" "worker_nodes_launch_config" {
  # ... configuration for launch configuration ...
}

resource "aws_autoscaling_group" "worker_nodes" {
  desired_capacity = 2
  max_size         = 5
  min_size         = 1

  launch_configuration = aws_launch_configuration.worker_nodes_launch_config.name

  # ... other configuration for the auto-scaling group ...
}
