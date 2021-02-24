kops create cluster \
	# The name of our cluster
	--name=kops.samdevopsinuse.com \
	# name of the s3 bucket made in AWS (kops storage)
	--state=s3://kops.samdevopsinuse.com \
	# Role based authorisation
	--authorization RBAC \
	# Define data centre
	--zones=eu-west-1a \
	# Define number of nodes we will want
	--node-count=2 \
	# How mant Master nodes for this k8 cluster
	--master-count=1 \
	# ec2 instances power
	--node-size=t2.micro \
	--master-size=t2.micro \
	# Hosted zone set up with Freenom
	# Purchased sam.devopsinuse.ml for free
	--dns-zone=kops.sam.devopsinuse.ml \
	# Make name of output folder where
	# kops will generate terraform code
	--out=samdevopsinuse_terraform \
	# Target is "terraform" code
	--target=terraform
	# Need to create ssh keypair for k8 clusters
	--ssh-public-key=~/.ssh/samdevopsinuse.pub
