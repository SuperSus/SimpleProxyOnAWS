FROM alpine:3.18

ENV TERRAFORM_VERSION=1.4.6

RUN apk add --update curl unzip bash python3 py3-pip make && \
    curl -LO https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/bin

# install AWS CLI
RUN pip3 install --upgrade pip && \
    pip3 install awscli

WORKDIR /app

# Copy your terraform files and Makefile
COPY . .

CMD ["/bin/bash"]