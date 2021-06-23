locals {
  cluster_name                 = "kops.samdevopsinuse.ml"
  master_autoscaling_group_ids = [aws_autoscaling_group.master-eu-west-1a-masters-kops-samdevopsinuse-ml.id]
  master_security_group_ids    = [aws_security_group.masters-kops-samdevopsinuse-ml.id]
  masters_role_arn             = aws_iam_role.masters-kops-samdevopsinuse-ml.arn
  masters_role_name            = aws_iam_role.masters-kops-samdevopsinuse-ml.name
  node_autoscaling_group_ids   = [aws_autoscaling_group.nodes-eu-west-1a-kops-samdevopsinuse-ml.id]
  node_security_group_ids      = [aws_security_group.nodes-kops-samdevopsinuse-ml.id]
  node_subnet_ids              = [aws_subnet.eu-west-1a-kops-samdevopsinuse-ml.id]
  nodes_role_arn               = aws_iam_role.nodes-kops-samdevopsinuse-ml.arn
  nodes_role_name              = aws_iam_role.nodes-kops-samdevopsinuse-ml.name
  region                       = "eu-west-1"
  route_table_public_id        = aws_route_table.kops-samdevopsinuse-ml.id
  subnet_eu-west-1a_id         = aws_subnet.eu-west-1a-kops-samdevopsinuse-ml.id
  vpc_cidr_block               = aws_vpc.kops-samdevopsinuse-ml.cidr_block
  vpc_id                       = aws_vpc.kops-samdevopsinuse-ml.id
}

output "cluster_name" {
  value = "kops.samdevopsinuse.ml"
}

output "master_autoscaling_group_ids" {
  value = [aws_autoscaling_group.master-eu-west-1a-masters-kops-samdevopsinuse-ml.id]
}

output "master_security_group_ids" {
  value = [aws_security_group.masters-kops-samdevopsinuse-ml.id]
}

output "masters_role_arn" {
  value = aws_iam_role.masters-kops-samdevopsinuse-ml.arn
}

output "masters_role_name" {
  value = aws_iam_role.masters-kops-samdevopsinuse-ml.name
}

output "node_autoscaling_group_ids" {
  value = [aws_autoscaling_group.nodes-eu-west-1a-kops-samdevopsinuse-ml.id]
}

output "node_security_group_ids" {
  value = [aws_security_group.nodes-kops-samdevopsinuse-ml.id]
}

output "node_subnet_ids" {
  value = [aws_subnet.eu-west-1a-kops-samdevopsinuse-ml.id]
}

output "nodes_role_arn" {
  value = aws_iam_role.nodes-kops-samdevopsinuse-ml.arn
}

output "nodes_role_name" {
  value = aws_iam_role.nodes-kops-samdevopsinuse-ml.name
}

output "region" {
  value = "eu-west-1"
}

output "route_table_public_id" {
  value = aws_route_table.kops-samdevopsinuse-ml.id
}

output "subnet_eu-west-1a_id" {
  value = aws_subnet.eu-west-1a-kops-samdevopsinuse-ml.id
}

output "vpc_cidr_block" {
  value = aws_vpc.kops-samdevopsinuse-ml.cidr_block
}

output "vpc_id" {
  value = aws_vpc.kops-samdevopsinuse-ml.id
}

variable "AWS_SECRET_KEY" {}
variable "AWS_ACCESS_KEY" {}

provider "aws" {
  access_key = var.AWS_ACCESS_KEY
  secret_key = var.AWS_SECRET_KEY
  region = "eu-west-1"
}

resource "aws_autoscaling_group" "master-eu-west-1a-masters-kops-samdevopsinuse-ml" {
  enabled_metrics = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
  launch_template {
    id      = aws_launch_template.master-eu-west-1a-masters-kops-samdevopsinuse-ml.id
    version = aws_launch_template.master-eu-west-1a-masters-kops-samdevopsinuse-ml.latest_version
  }
  max_size            = 1
  metrics_granularity = "1Minute"
  min_size            = 1
  name                = "master-eu-west-1a.masters.kops.samdevopsinuse.ml"
  tag {
    key                 = "KubernetesCluster"
    propagate_at_launch = true
    value               = "kops.samdevopsinuse.ml"
  }
  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "master-eu-west-1a.masters.kops.samdevopsinuse.ml"
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"
    propagate_at_launch = true
    value               = "master-eu-west-1a"
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"
    propagate_at_launch = true
    value               = "master"
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/master"
    propagate_at_launch = true
    value               = ""
  }
  tag {
    key                 = "k8s.io/role/master"
    propagate_at_launch = true
    value               = "1"
  }
  tag {
    key                 = "kops.k8s.io/instancegroup"
    propagate_at_launch = true
    value               = "master-eu-west-1a"
  }
  tag {
    key                 = "kubernetes.io/cluster/kops.samdevopsinuse.ml"
    propagate_at_launch = true
    value               = "owned"
  }
  vpc_zone_identifier = [aws_subnet.eu-west-1a-kops-samdevopsinuse-ml.id]
}

resource "aws_autoscaling_group" "nodes-eu-west-1a-kops-samdevopsinuse-ml" {
  enabled_metrics = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
  launch_template {
    id      = aws_launch_template.nodes-eu-west-1a-kops-samdevopsinuse-ml.id
    version = aws_launch_template.nodes-eu-west-1a-kops-samdevopsinuse-ml.latest_version
  }
  max_size            = 2
  metrics_granularity = "1Minute"
  min_size            = 2
  name                = "nodes-eu-west-1a.kops.samdevopsinuse.ml"
  tag {
    key                 = "KubernetesCluster"
    propagate_at_launch = true
    value               = "kops.samdevopsinuse.ml"
  }
  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "nodes-eu-west-1a.kops.samdevopsinuse.ml"
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"
    propagate_at_launch = true
    value               = "nodes-eu-west-1a"
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"
    propagate_at_launch = true
    value               = "node"
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node"
    propagate_at_launch = true
    value               = ""
  }
  tag {
    key                 = "k8s.io/role/node"
    propagate_at_launch = true
    value               = "1"
  }
  tag {
    key                 = "kops.k8s.io/instancegroup"
    propagate_at_launch = true
    value               = "nodes-eu-west-1a"
  }
  tag {
    key                 = "kubernetes.io/cluster/kops.samdevopsinuse.ml"
    propagate_at_launch = true
    value               = "owned"
  }
  vpc_zone_identifier = [aws_subnet.eu-west-1a-kops-samdevopsinuse-ml.id]
}

resource "aws_ebs_volume" "a-etcd-events-kops-samdevopsinuse-ml" {
  availability_zone = "eu-west-1a"
  encrypted         = false
  size              = 20
  tags = {
    "KubernetesCluster"                            = "kops.samdevopsinuse.ml"
    "Name"                                         = "a.etcd-events.kops.samdevopsinuse.ml"
    "k8s.io/etcd/events"                           = "a/a"
    "k8s.io/role/master"                           = "1"
    "kubernetes.io/cluster/kops.samdevopsinuse.ml" = "owned"
  }
  type = "gp2"
}

resource "aws_ebs_volume" "a-etcd-main-kops-samdevopsinuse-ml" {
  availability_zone = "eu-west-1a"
  encrypted         = false
  size              = 20
  tags = {
    "KubernetesCluster"                            = "kops.samdevopsinuse.ml"
    "Name"                                         = "a.etcd-main.kops.samdevopsinuse.ml"
    "k8s.io/etcd/main"                             = "a/a"
    "k8s.io/role/master"                           = "1"
    "kubernetes.io/cluster/kops.samdevopsinuse.ml" = "owned"
  }
  type = "gp2"
}

resource "aws_iam_instance_profile" "masters-kops-samdevopsinuse-ml" {
  name = "masters.kops.samdevopsinuse.ml"
  role = aws_iam_role.masters-kops-samdevopsinuse-ml.name
}

resource "aws_iam_instance_profile" "nodes-kops-samdevopsinuse-ml" {
  name = "nodes.kops.samdevopsinuse.ml"
  role = aws_iam_role.nodes-kops-samdevopsinuse-ml.name
}

resource "aws_iam_role_policy" "masters-kops-samdevopsinuse-ml" {
  name   = "masters.kops.samdevopsinuse.ml"
  policy = file("${path.module}/data/aws_iam_role_policy_masters.kops.samdevopsinuse.ml_policy")
  role   = aws_iam_role.masters-kops-samdevopsinuse-ml.name
}

resource "aws_iam_role_policy" "nodes-kops-samdevopsinuse-ml" {
  name   = "nodes.kops.samdevopsinuse.ml"
  policy = file("${path.module}/data/aws_iam_role_policy_nodes.kops.samdevopsinuse.ml_policy")
  role   = aws_iam_role.nodes-kops-samdevopsinuse-ml.name
}

resource "aws_iam_role" "masters-kops-samdevopsinuse-ml" {
  assume_role_policy = file("${path.module}/data/aws_iam_role_masters.kops.samdevopsinuse.ml_policy")
  name               = "masters.kops.samdevopsinuse.ml"
}

resource "aws_iam_role" "nodes-kops-samdevopsinuse-ml" {
  assume_role_policy = file("${path.module}/data/aws_iam_role_nodes.kops.samdevopsinuse.ml_policy")
  name               = "nodes.kops.samdevopsinuse.ml"
}

resource "aws_internet_gateway" "kops-samdevopsinuse-ml" {
  tags = {
    "KubernetesCluster"                            = "kops.samdevopsinuse.ml"
    "Name"                                         = "kops.samdevopsinuse.ml"
    "kubernetes.io/cluster/kops.samdevopsinuse.ml" = "owned"
  }
  vpc_id = aws_vpc.kops-samdevopsinuse-ml.id
}

resource "aws_key_pair" "kubernetes-kops-samdevopsinuse-ml-65f70f6051f5091cb36db4e039fbee0b" {
  key_name   = "kubernetes.kops.samdevopsinuse.ml-65:f7:0f:60:51:f5:09:1c:b3:6d:b4:e0:39:fb:ee:0b"
  public_key = file("${path.module}/data/aws_key_pair_kubernetes.kops.samdevopsinuse.ml-65f70f6051f5091cb36db4e039fbee0b_public_key")
  tags = {
    "KubernetesCluster"                            = "kops.samdevopsinuse.ml"
    "Name"                                         = "kops.samdevopsinuse.ml"
    "kubernetes.io/cluster/kops.samdevopsinuse.ml" = "owned"
  }
}

resource "aws_launch_template" "master-eu-west-1a-masters-kops-samdevopsinuse-ml" {
  block_device_mappings {
    device_name = "/dev/sda1"
    ebs {
      delete_on_termination = true
      encrypted             = false
      volume_size           = 64
      volume_type           = "gp2"
    }
  }
  iam_instance_profile {
    name = aws_iam_instance_profile.masters-kops-samdevopsinuse-ml.id
  }
  image_id      = "ami-09c60c18b634a5e00"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.kubernetes-kops-samdevopsinuse-ml-65f70f6051f5091cb36db4e039fbee0b.id
  lifecycle {
    create_before_destroy = true
  }
  metadata_options {
    http_endpoint               = "enabled"
    http_put_response_hop_limit = 1
    http_tokens                 = "optional"
  }
  name = "master-eu-west-1a.masters.kops.samdevopsinuse.ml"
  network_interfaces {
    associate_public_ip_address = true
    delete_on_termination       = true
    security_groups             = [aws_security_group.masters-kops-samdevopsinuse-ml.id]
  }
  tag_specifications {
    resource_type = "instance"
    tags = {
      "KubernetesCluster"                                                            = "kops.samdevopsinuse.ml"
      "Name"                                                                         = "master-eu-west-1a.masters.kops.samdevopsinuse.ml"
      "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"      = "master-eu-west-1a"
      "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"             = "master"
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/master" = ""
      "k8s.io/role/master"                                                           = "1"
      "kops.k8s.io/instancegroup"                                                    = "master-eu-west-1a"
      "kubernetes.io/cluster/kops.samdevopsinuse.ml"                                 = "owned"
    }
  }
  tag_specifications {
    resource_type = "volume"
    tags = {
      "KubernetesCluster"                                                            = "kops.samdevopsinuse.ml"
      "Name"                                                                         = "master-eu-west-1a.masters.kops.samdevopsinuse.ml"
      "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"      = "master-eu-west-1a"
      "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"             = "master"
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/master" = ""
      "k8s.io/role/master"                                                           = "1"
      "kops.k8s.io/instancegroup"                                                    = "master-eu-west-1a"
      "kubernetes.io/cluster/kops.samdevopsinuse.ml"                                 = "owned"
    }
  }
  tags = {
    "KubernetesCluster"                                                            = "kops.samdevopsinuse.ml"
    "Name"                                                                         = "master-eu-west-1a.masters.kops.samdevopsinuse.ml"
    "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"      = "master-eu-west-1a"
    "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"             = "master"
    "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/master" = ""
    "k8s.io/role/master"                                                           = "1"
    "kops.k8s.io/instancegroup"                                                    = "master-eu-west-1a"
    "kubernetes.io/cluster/kops.samdevopsinuse.ml"                                 = "owned"
  }
  user_data = filebase64("${path.module}/data/aws_launch_template_master-eu-west-1a.masters.kops.samdevopsinuse.ml_user_data")
}

resource "aws_launch_template" "nodes-eu-west-1a-kops-samdevopsinuse-ml" {
  block_device_mappings {
    device_name = "/dev/sda1"
    ebs {
      delete_on_termination = true
      encrypted             = false
      volume_size           = 128
      volume_type           = "gp2"
    }
  }
  iam_instance_profile {
    name = aws_iam_instance_profile.nodes-kops-samdevopsinuse-ml.id
  }
  image_id      = "ami-09c60c18b634a5e00"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.kubernetes-kops-samdevopsinuse-ml-65f70f6051f5091cb36db4e039fbee0b.id
  lifecycle {
    create_before_destroy = true
  }
  metadata_options {
    http_endpoint               = "enabled"
    http_put_response_hop_limit = 1
    http_tokens                 = "optional"
  }
  name = "nodes-eu-west-1a.kops.samdevopsinuse.ml"
  network_interfaces {
    associate_public_ip_address = true
    delete_on_termination       = true
    security_groups             = [aws_security_group.nodes-kops-samdevopsinuse-ml.id]
  }
  tag_specifications {
    resource_type = "instance"
    tags = {
      "KubernetesCluster"                                                          = "kops.samdevopsinuse.ml"
      "Name"                                                                       = "nodes-eu-west-1a.kops.samdevopsinuse.ml"
      "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"    = "nodes-eu-west-1a"
      "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"           = "node"
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node" = ""
      "k8s.io/role/node"                                                           = "1"
      "kops.k8s.io/instancegroup"                                                  = "nodes-eu-west-1a"
      "kubernetes.io/cluster/kops.samdevopsinuse.ml"                               = "owned"
    }
  }
  tag_specifications {
    resource_type = "volume"
    tags = {
      "KubernetesCluster"                                                          = "kops.samdevopsinuse.ml"
      "Name"                                                                       = "nodes-eu-west-1a.kops.samdevopsinuse.ml"
      "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"    = "nodes-eu-west-1a"
      "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"           = "node"
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node" = ""
      "k8s.io/role/node"                                                           = "1"
      "kops.k8s.io/instancegroup"                                                  = "nodes-eu-west-1a"
      "kubernetes.io/cluster/kops.samdevopsinuse.ml"                               = "owned"
    }
  }
  tags = {
    "KubernetesCluster"                                                          = "kops.samdevopsinuse.ml"
    "Name"                                                                       = "nodes-eu-west-1a.kops.samdevopsinuse.ml"
    "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"    = "nodes-eu-west-1a"
    "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"           = "node"
    "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node" = ""
    "k8s.io/role/node"                                                           = "1"
    "kops.k8s.io/instancegroup"                                                  = "nodes-eu-west-1a"
    "kubernetes.io/cluster/kops.samdevopsinuse.ml"                               = "owned"
  }
  user_data = filebase64("${path.module}/data/aws_launch_template_nodes-eu-west-1a.kops.samdevopsinuse.ml_user_data")
}

resource "aws_route_table_association" "eu-west-1a-kops-samdevopsinuse-ml" {
  route_table_id = aws_route_table.kops-samdevopsinuse-ml.id
  subnet_id      = aws_subnet.eu-west-1a-kops-samdevopsinuse-ml.id
}

resource "aws_route_table" "kops-samdevopsinuse-ml" {
  tags = {
    "KubernetesCluster"                            = "kops.samdevopsinuse.ml"
    "Name"                                         = "kops.samdevopsinuse.ml"
    "kubernetes.io/cluster/kops.samdevopsinuse.ml" = "owned"
    "kubernetes.io/kops/role"                      = "public"
  }
  vpc_id = aws_vpc.kops-samdevopsinuse-ml.id
}

resource "aws_route" "route-0-0-0-0--0" {
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.kops-samdevopsinuse-ml.id
  route_table_id         = aws_route_table.kops-samdevopsinuse-ml.id
}

resource "aws_security_group_rule" "all-master-to-master" {
  from_port                = 0
  protocol                 = "-1"
  security_group_id        = aws_security_group.masters-kops-samdevopsinuse-ml.id
  source_security_group_id = aws_security_group.masters-kops-samdevopsinuse-ml.id
  to_port                  = 0
  type                     = "ingress"
}

resource "aws_security_group_rule" "all-master-to-node" {
  from_port                = 0
  protocol                 = "-1"
  security_group_id        = aws_security_group.nodes-kops-samdevopsinuse-ml.id
  source_security_group_id = aws_security_group.masters-kops-samdevopsinuse-ml.id
  to_port                  = 0
  type                     = "ingress"
}

resource "aws_security_group_rule" "all-node-to-node" {
  from_port                = 0
  protocol                 = "-1"
  security_group_id        = aws_security_group.nodes-kops-samdevopsinuse-ml.id
  source_security_group_id = aws_security_group.nodes-kops-samdevopsinuse-ml.id
  to_port                  = 0
  type                     = "ingress"
}

resource "aws_security_group_rule" "https-external-to-master-0-0-0-0--0" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 443
  protocol          = "tcp"
  security_group_id = aws_security_group.masters-kops-samdevopsinuse-ml.id
  to_port           = 443
  type              = "ingress"
}

resource "aws_security_group_rule" "master-egress" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 0
  protocol          = "-1"
  security_group_id = aws_security_group.masters-kops-samdevopsinuse-ml.id
  to_port           = 0
  type              = "egress"
}

resource "aws_security_group_rule" "node-egress" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 0
  protocol          = "-1"
  security_group_id = aws_security_group.nodes-kops-samdevopsinuse-ml.id
  to_port           = 0
  type              = "egress"
}

resource "aws_security_group_rule" "node-to-master-tcp-1-2379" {
  from_port                = 1
  protocol                 = "tcp"
  security_group_id        = aws_security_group.masters-kops-samdevopsinuse-ml.id
  source_security_group_id = aws_security_group.nodes-kops-samdevopsinuse-ml.id
  to_port                  = 2379
  type                     = "ingress"
}

resource "aws_security_group_rule" "node-to-master-tcp-2382-4000" {
  from_port                = 2382
  protocol                 = "tcp"
  security_group_id        = aws_security_group.masters-kops-samdevopsinuse-ml.id
  source_security_group_id = aws_security_group.nodes-kops-samdevopsinuse-ml.id
  to_port                  = 4000
  type                     = "ingress"
}

resource "aws_security_group_rule" "node-to-master-tcp-4003-65535" {
  from_port                = 4003
  protocol                 = "tcp"
  security_group_id        = aws_security_group.masters-kops-samdevopsinuse-ml.id
  source_security_group_id = aws_security_group.nodes-kops-samdevopsinuse-ml.id
  to_port                  = 65535
  type                     = "ingress"
}

resource "aws_security_group_rule" "node-to-master-udp-1-65535" {
  from_port                = 1
  protocol                 = "udp"
  security_group_id        = aws_security_group.masters-kops-samdevopsinuse-ml.id
  source_security_group_id = aws_security_group.nodes-kops-samdevopsinuse-ml.id
  to_port                  = 65535
  type                     = "ingress"
}

resource "aws_security_group_rule" "ssh-external-to-master-0-0-0-0--0" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 22
  protocol          = "tcp"
  security_group_id = aws_security_group.masters-kops-samdevopsinuse-ml.id
  to_port           = 22
  type              = "ingress"
}

resource "aws_security_group_rule" "ssh-external-to-node-0-0-0-0--0" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 22
  protocol          = "tcp"
  security_group_id = aws_security_group.nodes-kops-samdevopsinuse-ml.id
  to_port           = 22
  type              = "ingress"
}

resource "aws_security_group" "masters-kops-samdevopsinuse-ml" {
  description = "Security group for masters"
  name        = "masters.kops.samdevopsinuse.ml"
  tags = {
    "KubernetesCluster"                            = "kops.samdevopsinuse.ml"
    "Name"                                         = "masters.kops.samdevopsinuse.ml"
    "kubernetes.io/cluster/kops.samdevopsinuse.ml" = "owned"
  }
  vpc_id = aws_vpc.kops-samdevopsinuse-ml.id
}

resource "aws_security_group" "nodes-kops-samdevopsinuse-ml" {
  description = "Security group for nodes"
  name        = "nodes.kops.samdevopsinuse.ml"
  tags = {
    "KubernetesCluster"                            = "kops.samdevopsinuse.ml"
    "Name"                                         = "nodes.kops.samdevopsinuse.ml"
    "kubernetes.io/cluster/kops.samdevopsinuse.ml" = "owned"
  }
  vpc_id = aws_vpc.kops-samdevopsinuse-ml.id
}

resource "aws_subnet" "eu-west-1a-kops-samdevopsinuse-ml" {
  availability_zone = "eu-west-1a"
  cidr_block        = "172.20.32.0/19"
  tags = {
    "KubernetesCluster"                            = "kops.samdevopsinuse.ml"
    "Name"                                         = "eu-west-1a.kops.samdevopsinuse.ml"
    "SubnetType"                                   = "Public"
    "kubernetes.io/cluster/kops.samdevopsinuse.ml" = "owned"
    "kubernetes.io/role/elb"                       = "1"
  }
  vpc_id = aws_vpc.kops-samdevopsinuse-ml.id
}

resource "aws_vpc_dhcp_options_association" "kops-samdevopsinuse-ml" {
  dhcp_options_id = aws_vpc_dhcp_options.kops-samdevopsinuse-ml.id
  vpc_id          = aws_vpc.kops-samdevopsinuse-ml.id
}

resource "aws_vpc_dhcp_options" "kops-samdevopsinuse-ml" {
  domain_name         = "eu-west-1.compute.internal"
  domain_name_servers = ["AmazonProvidedDNS"]
  tags = {
    "KubernetesCluster"                            = "kops.samdevopsinuse.ml"
    "Name"                                         = "kops.samdevopsinuse.ml"
    "kubernetes.io/cluster/kops.samdevopsinuse.ml" = "owned"
  }
}

resource "aws_vpc" "kops-samdevopsinuse-ml" {
  cidr_block           = "172.20.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    "KubernetesCluster"                            = "kops.samdevopsinuse.ml"
    "Name"                                         = "kops.samdevopsinuse.ml"
    "kubernetes.io/cluster/kops.samdevopsinuse.ml" = "owned"
  }
}

terraform {
  required_version = ">= 0.12.0"
}
