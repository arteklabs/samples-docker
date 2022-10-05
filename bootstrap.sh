#!/bin/bash
yes | sudo apt install docker-compose

# task runner
python3 -m venv .env
source .env/bin/activate
pip install -r requirements.txt
