#!/bin/bash

echo -e "\n=========="
echo "Loading images. Please wait."
echo -e "\n=========="

docker load < alex.tar

docker load < alexdb.tar

docker load < alexgui.tar

docker load < alex_python.tar

echo -e "\n=========="
echo "Images loaded."  
echo -e "\n=========="
