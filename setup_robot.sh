#!/bin/bash

PYTHON_VERSION=3.10.4

curl -LO https://bootstrap.pypa.io/get-pip.py
curl -LO https://www.python.org/ftp/python/${PYTHON_VERSION}/python-${PYTHON_VERSION}-embed-amd64.zip && \
unzip python-${PYTHON_VERSION}-embed-amd64.zip -d ./python3

export PATH=$(pwd)/python3/:$PATH

which python && \
python.exe get-pip.py && \
sed -i 's/#import/import/g' python3/python310._pth

export PATH=$(pwd)/python3/Scripts/:$PATH

which pip && \
pip install robotframework \
robotframework-seleniumlibrary \
robotframework-csvlibrary \
robotframework-requests \
RESTinstance

rm ./get-pip.py
rm ./python-${PYTHON_VERSION}-embed-amd64.zip