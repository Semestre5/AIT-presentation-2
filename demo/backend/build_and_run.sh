#!/bin/bash

docker build -t backend_node .
docker run -p 3000:3000 backend_node 
