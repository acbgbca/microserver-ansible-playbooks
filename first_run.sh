#!/bin/bash

set -e

# Make sure we are in the same directory as the script
cd $(dirname "$0")

# Setup virtual environment
if [ ! -d "./ansible-venv" ]; then
    echo "Setting up virtual environment"
    python3 -m venv ./ansible-venv
fi

# Source virtual environment
if [ "$VIRTUAL_ENV" != "$(pwd)/ansible-venv" ]; then
    echo "Sourcing virtual environment"
    source ./ansible-venv/bin/activate
fi

# Setup pip
if ! command -v pip3 >/dev/null 2>&1; then
    echo "Installing pip3"
    pip3 install --upgrade pip
fi

# Install ansible
if ! command -v ansible >/dev/null 2>&1; then
    echo "Installing ansible"
    pip3 install --upgrade ansible
fi

ansible-galaxy install -r requirements.yml
