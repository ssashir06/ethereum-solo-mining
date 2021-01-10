#!/bin/sh

echo "Testing host'$NODE_URL':"
while curl $NODE_URL; [ $? -ne 0 ]; do
    echo "Waiting for '$NODE_URL' ..."
    sleep 5
done
echo "Ok to connect to '$NODE_URL'."

exec "$@"