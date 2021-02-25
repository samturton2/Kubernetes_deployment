# Using Terraform to Deploy Kubernetes Cluster
![](img/k8.jpg)

- In this course we will be using **kops** and **Terraform** to deploy a **K8 cluster** of an **Nginx** Web Server.
- Kubectl will help us communicate with and control our kubernetes cluster.

![](img/Whatisthecourseabout.png)

## Terraform starter

- The `terraform.code.tf` file was created to specify the creation of a simple ec2 instance in our AWS specified region, and outputs the private ip of the created EC2 instance into a text file.
- a `terraform.tfvars` file was created and ignored from git which heald the following
```tfvars
AWS_ACCESS_KEY= "<your aws access key"
AWS_SECRET_KEY= "<your aws secret key"
```

## Kops
- To create the kubernetes cluster, we first need to create an S3 bucket to store the kubernetes congiguration in.
- We next need to purchase a domain name, (I chose a free one from https://my.freenom.com/) namely samdevopsinuse.ml.
- This needs to be created as a publically hosted zone in AWS Route53. The custom name servers shown in aws need to be entered into the domain name provider aswell.
![](img/route53.png)
