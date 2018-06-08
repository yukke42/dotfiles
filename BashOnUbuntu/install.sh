#!/bin/bash

sudo apt update && sudo apt install -y\
  ssh\
  build-essential\
  vim\
  locate\
  trash-cli\
  python3-pip

pip install pipenv
