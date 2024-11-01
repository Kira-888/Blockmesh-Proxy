#!/bin/bash


read -p "Enter the desired name for the Docker image: " image_name


docker build -t "$image_name" .


read -p "Enter the desired name for the Docker container: " container_name
container_name_lower=$(echo "$container_name" | tr '[:upper:]' '[:lower:]')


docker run -it --rm --name "blockmesh-node-$container_name_lower" "$image_name"

