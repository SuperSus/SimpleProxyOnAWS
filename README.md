## SIMPLE PROXY AWS SERVER

#### Instalation:
- init terraform
```bash
terraform init
```

fill in terraform.tfvars with real data
```bash
cp terraform.tfvars.example terraform.tfvars
```

### CONFIGURE EC2
```bash
sudo su
amazon-linux-extras install docker -y
service docker start
usermod -a -G docker ec2-user
chkconfig docker on

yum install git -y

git clone https://github.com/SuperSus/SimpleProxyOnAWS.git

cd SimpleProxyOnAWS
cp terraform.tfvars.example terraform.tfvars
```

### USAGE
```bash
cd SimpleProxyOnAWS

make init
make apply
make destroy
```
