#!/bin/sh

python3 -m venv venv

source venv/bin/activate

pip install -U setuptools pip wheel
pip install cython numpy



