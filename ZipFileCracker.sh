#!/bin/bash

# Function to install Python 3 and required packages
install_python3_and_dependencies() {
    echo "Updating system packages..."
    apt update && apt upgrade -y

    echo "Installing Python 3..."
    pkg install python3 -y

    echo "Installing pip for Python 3..."
    apt install python3-pip -y

    echo "Installing required Python dependencies..."
    python3 -m pip install pyzipper
}

# Check if Python 3 is installed
if ! command -v python3 &> /dev/null; then
    echo "Python 3 is not installed. Installing..."
    install_python3_and_dependencies
fi

# Check if pyzipper is installed
python3 -c "import pyzipper" 2>/dev/null
if [ $? -ne 0 ]; then
    echo "pyzipper is not installed. Installing..."
    python3 -m pip install pyzipper
fi

# Navigate to the directory of the script
cd "$(dirname "$0")"

# Run main.py or Zipfile cracker python3 code
python3 main.py
