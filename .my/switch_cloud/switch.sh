#!/bin/bash

SCRIPT_DIR=$1

if [ "$MY_SET_CLOUD_BENDER" == "gcp" ]; then
    echo "This is a GCP environment."
    "./$SCRIPT_DIR/gcp.sh"
elif [ "$MY_SET_CLOUD_BENDER" == "aws" ]; then
    echo "This is an AWS environment."
elif [ "$MY_SET_CLOUD_BENDER" == "azure" ]; then
    echo "This is an Azure environment."
else
    echo "Unknown environment."
fi
