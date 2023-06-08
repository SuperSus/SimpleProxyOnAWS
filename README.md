## SIMPLE PROXY AWS SERVER

### Installation

#### Install Docker
#### Clone repo
`git clone https://github.com/SuperSus/SimpleProxyOnAWS.git`

#### Configure terraform.tfvars file
use example
`cp terraform.tfvars.example terraform.tfvars`
```.env
access_key     = "AWS_ACCESS_KEY"
secret_key     = "AWS_SECRET_KEY"
region         = "us-west-2"
ami_id         = "ami-03c7c1f17ee073747" # Note: depends on region, select AMAZONE 2 ami
proxy_login    = "USER_NAME" # socks login
proxy_password = "PASSWORD" # socks password 
proxies_count  = 1
```

#### USAGE
- `make init` - set up script
- `make apply` - create proxies or apply changes (takes several minutes)
- `make destroy` - destroy all instances (takes several minutes)

### CONFIGURE EC2 (OPTIONAL)
#### You can run script using EC2 instance
#### Create instance and execute following commands
```bash
sudo su
amazon-linux-extras install docker -y
service docker start
usermod -a -G docker ec2-user
chkconfig docker on

yum install git -y
git clone https://github.com/SuperSus/SimpleProxyOnAWS.git

cd SimpleProxyOnAWS
cp terraform.tfvars.example terraform.tfvars # copy secrets file
```

