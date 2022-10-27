#!/bin/bash
echo "SUI node install script by Kapuczino"
y | sudo apt install screen
y | sudo apt-get update
y | sudo apt-get install ca-certificates curl gnupg lsb-release
y | sudo mkdir -p /etc/apt/keyrings
y | curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
y | echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | y | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
y | sudo apt-get update
y | sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
y | wget https://raw.githubusercontent.com/MystenLabs/sui/main/docker/fullnode/docker-compose.yaml
y | wget https://github.com/MystenLabs/sui/raw/main/crates/sui-config/data/fullnode-template.yaml
y | wget https://github.com/MystenLabs/sui-genesis/raw/main/devnet/genesis.blob
y | docker compose up -d
echo "SUI fullnode done"