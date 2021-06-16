export AWS_ACCESS_KEY_ID=$(aws configure get aws_access_key_id)
export AWS_SECRET_ACCESS_KEY=$(aws configure get aws_secret_access_key)

kops create cluster \
--name kops.samdevopsinuse.ml \
--zones eu-west-1a \
--state s3://kops.samdevopsinuse.ml \
--authorization RBAC \
--node-count=2 \
--master-count=1 \
--node-size=t2.micro \
--master-size=t2.micro \
--dns-zone=kops.bhouk.com \
--out=samdevopsinuse_terraform \
--target=terraform \
--ssh-public-key=~/.ssh/samdevopsinuse.pub \
--yes
