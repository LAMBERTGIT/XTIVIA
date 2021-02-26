The codes in this directory were used for the project.

After writing this code, I pushed it to my github account.

the xtivia-stack.yaml file was used to create the cloudformation stack. It would create 3 ec2 instance,2 security groups, and one ECR.

In the AWS management console, under cloudformation, I uploaded this template and stack was created.

I did some manual adjustments to the stack such as creating the EC2 instance role so that the jenkins server could push to ECR, while the controlplane was also able to pull the docker image from ECR.

I then attached this role the jenkins server and master node.

I forgot to add ansible as part of the userdata on jenkins, so I installed it manually for deploying the code to kubernetes.

When the stack was created, I "ssh-ed" into the jenkins server and configured 2 jobs to package and deploy the code. Webhooks were configured so that in case a push was made , a new job would be created.

I also "ssh-ed" into my master node to initialize the cluster with kubeadm.

I had difficulties joining the worker node to the master node, primarily because of the AMI I was using. As I result, I had to untaint the master node to make it schedulable.

I configured the jenkins package job to build the docker image and push it to ECR, then a deploy job which would run an ansible playbook to deploy this code to the kubernetes cluster.



