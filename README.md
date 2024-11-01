# Blockmesh-Proxy

This is docker based installation with proxies:

# Discalimer:

this is only for educational purpose.
Use of proxies for farming are unethical
use at your own risk

# Clone the Blockmesh-Proxy directory

```console
cd $HOME

https://github.com/Kira-888/Blockmesh-Proxy.git

cd Blockmesh-Proxy
```


# download the bianry files:

```console
wget https://github.com/block-mesh/block-mesh-monorepo/releases/download/v0.0.321/blockmesh-cli-x86_64-unknown-linux-gnu.tar.gz

tar -xvzf blockmesh-cli-x86_64-unknown-linux-gnu.tar.gz

cd target/release/

echo 'export PATH="$PATH:~/target/release"' >> ~/.bashrc
source ~/.bashrc

cd /root/Blockmesh-Proxy
```

# 
```console
screen -S node1
[change the number if you want multiple nodes]

chmod +x run_blockmesh.sh

chmod +x script.sh

./run_blockmesh.sh
```

* give the image name to build

> eg node1

* give docker container name

> node1

* give device name
  
> node1

# give the proxy details:

> put the ip address of proxy server

> put the port of proxy server

> put the username of proxy server

> put the password of proxy server

# give blockmesh details

> put the login main of blockmesh node

> put the login password of blockmesh node
