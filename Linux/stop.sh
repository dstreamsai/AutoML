#!/bin/bash

echo -e "\n=========="
echo "Stoping containers. Please wait."
echo -e "\n=========="

ComposeBin=$(which docker-compose)
$ComposeBin stop

echo -e "\n=========="
echo "Cluster is stopped."



