#!/bin/sh

# Load Api-Key and Secret
source .env

if [ "$#" != 1 ]; then
    echo "Getty Images Connect API v3.0"
    echo "Usage: $0 [ImageID]"
    echo
    echo "ex: $0 83454811"
    exit 1
fi

IMAGE_ID=$1

curl -s -H "Api-Key:${API_KEY}" \
    "https://connect.gettyimages.com/v3/images/${IMAGE_ID}" | jq '.'
