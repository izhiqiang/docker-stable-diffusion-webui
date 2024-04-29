#!/bin/bash

version="1.9.2"

# 登录仓库
docker login -u $DOCKER_USER -p $DOCKER_PWD

# 构建仓库
docker build --build-arg="SD_VERSION=$version" -t zhiqiangwang/stable-diffusion-webui:$version  .

# 发布仓库
echo "Release Docker Version: " $version
docker push zhiqiangwang/stable-diffusion-webui:$version

echo "Release Docker Version latest"
# docker pull 
docker tag zhiqiangwang/stable-diffusion-webui:$version zhiqiangwang/stable-diffusion-webui:latest
docker push zhiqiangwang/stable-diffusion-webui:latest