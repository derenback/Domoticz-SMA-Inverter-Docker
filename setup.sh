#!/bin/bash

# This script will install Domoticz and the SMA plugin in a Docker container

# Check if Docker is installed
if ! command -v docker &> /dev/null
then
    echo "Docker is not installed. Please install Docker before running this script."
    exit
fi

# Check if Docker is installed
if ! command -v git &> /dev/null
then
    echo "Git is not installed. Do you want to install Git? (y/N)"
    read -n 1 install_git
    if [ "$install_git" == "y" ]
    then
        echo "Installing Git..."
        sudo apt update
        sudo apt install git
        git --version
    else
        echo "Git is required to install the SMA plugin. Please install Git before running this script."
        exit
    fi
fi

# Store current directory
current_dir=$(pwd)

# Prompt for the installation path with a default value
read -p "Enter the path to install files (default: /opt/domoticz): " install_path
install_path=${install_path:-/opt/domoticz}
sudo docker pull domoticz/domoticz
sudo docker build . -t domoticz-sma

# Use the user-provided or default path
sudo mkdir -p "$install_path"
sudo cp docker-compose.yml "$install_path"
cd "$install_path"
# Start and stop the container to create the configuration folder
sudo docker compose up -d
sudo docker compose down

# create the plugin folder
cd "$install_path"/config/plugins
sudo git clone https://github.com/derenback/Domoticz-SMA-Inverter.git
cd "$install_path"

# Start the container
sudo docker compose up -d

# Return to the original directory
cd "$current_dir"

echo "Domoticz and the SMA plugin have been installed in a Docker container."
echo "You can access Domoticz at http://localhost:8080."