variable "access_key" {
  type       = string
  sensitive  = true
  description = "AWS access key"
  default = ""
}
variable "secret_key" {
  type       = string
  sensitive  = true
  description = "AWS secreet key"
  default = ""
}
variable "key_name" {
  type        = string
  description = "Name of the key pair to use for the EC2 instance"
  default     = "terraform"
}
variable "region" {
  type        = string
  description = "AWS region"
  default     = "eu-west-2"
  
}
variable "ami_id" {
  type        = string
  description = "AMI ID for the EC2 instance"
  default     = "ami-0a6006bac3b9bb8d3"
}
variable "proxy_login" {
  type        = string
  description = "Login for the proxy"
  default     = "User"  
}
variable "proxy_password" {
  type        = string
  description = "Password for the proxy"
  default     = "StrongPassword"  
}
variable "proxies_count" {
  type = number
  description = "Number of proxies to create"
  default = 3
}
