#! /bin/bash

echo ">>>> remove docker"

yum list installed | grep docker

yum remove -y docker-ce.x86_64

yum remove -y docker-ce-cli.x86_64

rm -rf /var/lib/docker
