# Using Terraform to Deploy Kubernetes Cluster
![](img/k8.jpg)

- In this course we will be using **kops** and **Terraform** to deploy a **K8 cluster** of an **Nginx** Web Server.
- Kubectl will help us communicate with and control our kubernetes cluster.

![](img/Whatisthecourseabout.png)

## Terraform starter

- The `terraform.code.tf` file was created to specify the creation of a simple ec2 instance in our AWS specified region, and outputs the private ip of the created EC2 instance into a text file.
- a `terraform.tfvars` file was created and ignored from git which heald the following
```tfvars
AWS_ACCESS_KEY= "<your aws access key>"
AWS_SECRET_KEY= "<your aws secret key>"
```

## Kops
- To create the kubernetes cluster, we first need to create an S3 bucket to store the kubernetes congiguration in.
- We next need to purchase a domain name, (previously was using samdevopsinuse.ml) (update: kops.sh file now using bhouk.com domain)
- This needs to be created as a publically hosted zone in AWS Route53. The custom name servers shown in aws need to be entered into the domain name provider aswell.
![](img/route53.png)
- `kops.sh` file was created to create the cluster.
```bash
export AWS_ACCESS_KEY_ID=$(aws configure get aws_access_key_id)
export AWS_SECRET_ACCESS_KEY=$(aws configure get aws_secret_access_key)

kops create cluster \
# The name of our cluster
--name=kops.samdevopsinuse.ml \
# name of the s3 bucket made in AWS (kops storage)
--state=s3://kops.samdevopsinuse.ml \
# Role based authorisation
--authorization RBAC \
# Define data centre
--zones=eu-west-1b \
# Define number of nodes we will want
--node-count=2 \
# How mant Master nodes for this k8 cluster
--master-count=1 \
# ec2 instances power
--node-size=t2.micro \
--master-size=t2.micro \
# Hosted zone set up with Freenom
# Purchased sam.devopsinuse.ml for free
--dns-zone=kops.samdevopsinuse.ml \
# Make name of output folder where
# kops will generate terraform code
--out=samdevopsinuse_terraform \
# Target is "terraform" code
--target=terraform \
# Need to create ssh keypair for k8 clusters
--ssh-public-key=~/.ssh/samdevopsinuse.pub
```
- This can be ran in the terminal after `aws configure` is ran, with `bash kops.sh`

- This will take a second to run, but will produce a folder in your directory.
![](img/kops_folder.png)
- The Kubernetes.tf file is made by kops, which declares a large network of aws services needed
    - subnets
    - roles
    - policies
    - ec2 instances
    - security groups
    - autoscaling groups

--- ( note: in my case i had to manually input the aws key variables into the kubernetes.tf file, as it wasnt done automatically with kops.sh)

- cd into the folder created, `terraform init` and then `terraform apply` which should create both your master and child nodes in aws.

![](img/master_child_nodes.png)

- Wait for the api route53 resources are loaded 
    - can run `kubectl api-resources` to list them if needs

- You can run the following to list the instances in the k8 cluster
```bash
kubectl get nodes
```

- We can now deploy nginx on our kubernetes infrastructure. This can be done easily by launching a nginx docker container
- (I've tested this in the udemy node, provisioning user_date in the terraform file)

```bash
# How to proceed deployment on k8s
kubectl \
        create deployment my-nginx-deployment \
        --image=nginx
 
# How to expose deployment via service
kubectl \
        expose deployment my-nginx-deployment \
        --port=80 \
        --type=NodePort \
        --name=my-nginx-service
```
- `kubectl get pods` will show you the running docker containers in your kubernetes cluster
- `kubectl get pods,svc` will also show your services and the ports that are open