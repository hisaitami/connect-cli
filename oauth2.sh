#!/bin/sh

# Load Api-Key and Secret
source .env

curl -s -d "grant_type=client_credentials&client_id=${API_KEY}&client_secret=${SECRET}" "https://connect.gettyimages.com/oauth2/token" | jq -r '.access_token'
