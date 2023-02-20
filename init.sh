#/bin/bash
# install docker
apt update
apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release -y
mkdir -p /etc/apt/keyrings
curl -fsSL https://mirrors.cloud.tencent.com/docker-ce/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
sed -i 's+download.docker.com+mirrors.cloud.tencent.com/docker-ce+' /etc/apt/sources.list.d/docker.list
apt-get update
chmod a+r /etc/apt/keyrings/docker.gpg
apt-get update
apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y

# Install common software
apt install wget curl git vim -y
apt install zsh fish -y

# localized system configuration
dpkg-reconfigure locales
dpkg-reconfigure tzdata
