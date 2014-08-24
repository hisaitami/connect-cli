#!/bin/sh

# Load Api-Key and Secret
source .env

if [ "$#" != 1 ]; then
    echo "Getty Images Connect API v3.0"
    echo "Usage: $0 [Search phrase]"
    echo
    echo "ex: $0 cat"
    exit 1
fi

COMMAND="php -r 'echo urlencode(\"${1}\");'"
PHRASE=`eval $COMMAND`

curl -s \
    -H "Accept-Language:ja" \
    -H "Api-Key:${API_KEY}" \
    "https://connect.gettyimages.com/v3/search/images?phrase=${PHRASE}" | jq -r '.'
