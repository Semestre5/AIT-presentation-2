#!/bin/bash

# update the default.vcl in your container
docker cp default.vcl my-varnish:/etc/varnish/default.vcl
# run varnishreload
winpty docker exec my-varnish varnishreload