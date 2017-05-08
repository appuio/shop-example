#!/bin/bash
cd api
./start-build.sh
cd ../orders
./start-build.sh
cd ../users
./start-build.sh
cd ../webserver
./webserver/start-build.sh
cd ..
