# Domoticz SMA Inverter Docker

This repository contains example Docker files to run Domoticz with the SMA inverter plugin. The plugin can be found at [derenback/Domoticz-SMA-Inverter](https://github.com/derenback/Domoticz-SMA-Inverter).

## Getting Started

Follow these instructions to set up and run Domoticz with the SMA inverter plugin in a Docker container.

### Prerequisites

- Docker installed on your system. If Docker is not installed, please follow the instructions [here](https://docs.docker.com/get-docker/).

### Installation (Automatic)

1. Clone this repository:
    ```sh
    git clone https://github.com/yourusername/Domoticz-SMA-Inverter-Docker.git
    cd Domoticz-SMA-Inverter-Docker
    ```

2. Run the setup script:
    ```sh
    ./setup.sh
    ```

3. Follow the prompts to complete the installation.

### Installation (Manual)

1. Clone this repository:
    ```sh
    git clone https://github.com/yourusername/Domoticz-SMA-Inverter-Docker.git
    cd Domoticz-SMA-Inverter-Docker
    ```

2. Pull the Domoticz Docker image:
    ```sh
    sudo docker pull domoticz/domoticz
    ```

3. Build the Docker image with the SMA plugin:
    ```sh
    sudo docker build . -t domoticz-sma
    ```

4. Create the installation directory (default: `/opt/domoticz`):
    ```sh
    sudo mkdir -p /opt/domoticz
    ```

5. Copy the `docker-compose.yml` file to the installation directory:
    ```sh
    sudo cp docker-compose.yml /opt/domoticz
    ```

6. Navigate to the installation directory:
    ```sh
    cd /opt/domoticz
    ```

7. Start and stop the container to create the configuration folder:
    ```sh
    sudo docker compose up -d
    sudo docker compose down
    ```

8. Clone the SMA plugin repository into the plugin folder:
    ```sh
    cd config/plugins
    sudo git clone https://github.com/derenback/Domoticz-SMA-Inverter.git
    cd ../../
    ```

9. Start the Domoticz container:
    ```sh
    sudo docker compose up -d
    ```

10. Access Domoticz at [http://localhost:8080](http://localhost:8080).