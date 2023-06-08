## SIMPLE PROXY AWS SERVER

#### Instalation:

### USAGE
```bash
make init
make apply
make destroy
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
