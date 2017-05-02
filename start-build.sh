#!/bin/bash
cd api
./api/start-build.sh
cd ../orders
./orders/start-build.sh
cd ../users
./users/start-build.sh
cd ../webserver
./webserver/start-build.sh
cd ..