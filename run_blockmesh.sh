#!/bin/bash


read -p "Do you want to install the latest version of blockmesh-cli? (y/n): " install_latest
if [[ "$install_latest" == "y" || "$install_latest" == "Y" ]]; then
    echo "Downloading the latest version of blockmesh-cli..."


    LATEST_RELEASE_URL=$(curl -s https://api.github.com/repos/block-mesh/block-mesh-monorepo/releases/latest \
    | grep "browser_download_url.*blockmesh-cli-x86_64-unknown-linux-gnu.tar.gz" \
    | cut -d '"' -f 4)


    wget $LATEST_RELEASE_URL -O blockmesh-cli-x86_64-unknown-linux-gnu.tar.gz
    tar -xvzf blockmesh-cli-x86_64-unknown-linux-gnu.tar.gz


    echo 'export PATH="$PATH:$(pwd)/target/x86_64-unknown-linux-gnu/release"' >> ~/.bashrc
    source ~/.bashrc
    echo "blockmesh-cli installed and added to PATH."
else
    echo "Skipping blockmesh-cli installation."
fi


read -p "Enter the desired name for the Docker image: " image_name


docker build -t "$image_name" .


read -p "Enter the desired name for the Docker container: " container_name
container_name_lower=$(echo "$container_name" | tr '[:upper:]' '[:lower:]')


docker run -it --rm --name "blockmesh-node-$container_name_lower" "$image_name"
