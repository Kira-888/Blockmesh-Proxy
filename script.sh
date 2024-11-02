#!/bin/bash


generate_uuid() {
    uuidgen
}


read -p "Enter the device name: " device_name


read -p "Enter the IP address for the node: " ip_address
if [[ -z "$ip_address" ]]; then
    echo "IP address cannot be empty."
    exit 1
fi

read -p "Enter the port for the node: " port
if [[ -z "$port" ]]; then
    echo "Port cannot be empty."
    exit 1
fi

read -p "Enter the username for the node: " username
if [[ -z "$username" ]]; then
    echo "Username cannot be empty."
    exit 1
fi

read -p "Enter the password for the node: " password
if [[ -z "$password" ]]; then
    echo "Password cannot be empty."
    exit 1
fi

read -p "Enter the email for login: " email
if [[ -z "$email" ]]; then
    echo "Email cannot be empty."
    exit 1
fi

read -p "Enter the login password: " login_password
if [[ -z "$login_password" ]]; then
    echo "Login password cannot be empty."
    exit 1
fi


mac_address="02:42:ac:$(printf '%02x' $((RANDOM%256))):$(printf '%02x' $((RANDOM%256))):$(printf '%02x' $((RANDOM%256)))"


fake_product_uuid_file="$device_name.txt"
if [ ! -f "$fake_product_uuid_file" ]; then
    generated_uuid=$(generate_uuid)
    echo "$generated_uuid" > "$fake_product_uuid_file"
fi


proxychains_conf="$device_name.conf"
cat <<EOF > "$proxychains_conf"
strict_chain
proxy_dns
tcp_read_time_out 15000
tcp_connect_time_out 8000

[ProxyList]
http $ip_address $port $username $password
EOF

# Verify the generated proxychains.conf
echo "Generated proxychains.conf:"
cat "$proxychains_conf"

# Running blockmesh-cli with proxychains
echo "Starting blockmesh-cli for $device_name with MAC: $mac_address"
proxychains4 -f "$proxychains_conf" ./blockmesh-cli login --email "$email" --password "$login_password"
