#!/bin/bash

# Function to prompt for user input
prompt_user() {
    read -p "$1 [$2]: " input
    echo "${input:-$2}"
}

# Function to install a tool
install_tool() {
    tool_name=$1
    install_command=$2

    echo "Installing $tool_name..."
    eval "$install_command"
    if [ $? -eq 0 ]; then
        echo "$tool_name has been successfully installed."
    else
        echo "Error: Failed to install $tool_name."
    fi
}

# Install Go 1.18
echo "Installing Go 1.18..."
wget https://golang.org/dl/go1.18.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.18.linux-amd64.tar.gz
export PATH="/usr/local/go/bin:$PATH"
echo 'export PATH="/usr/local/go/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
rm go1.18.linux-amd64.tar.gz

# Install Python
sudo apt-get update
sudo apt-get install -y python3

# Set up environment variables for Go
echo 'export GOPATH=$HOME/go' >> ~/.bashrc
echo 'export PATH=$PATH:$GOPATH/bin' >> ~/.bashrc
source ~/.bashrc

# Install tools
install_tool "waybackurls" "go install github.com/tomnomnom/waybackurls@latest"
install_tool "gau" "go install github.com/lc/gau/v2/cmd/gau@latest"
install_tool "httpx" "go install github.com/projectdiscovery/httpx/cmd/httpx@latest"
install_tool "assetfinder" "go install github.com/tomnomnom/assetfinder@latest"
install_tool "subfinder" "go install github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest"
install_tool "amass" "go install github.com/owasp-amass/amass/v4/..."
install_tool "kxss" "go install github.com/tomnomnom/hacks/kxss@latest"
install_tool "dalfox" "go install github.com/hahwul/dalfox/v2@latest"
install_tool "ffuf" "go install github.com/ffuf/ffuf/v2@latest"
install_tool "dirsearch" "pip3 install dirsearch"

# Display completion message
echo "Go 1.17 and selected tools have been installed successfully."
