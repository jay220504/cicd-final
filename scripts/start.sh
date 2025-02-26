#!/bin/bash
cd /home/ec2-user/app
nohup node server.js > server.log 2>&1 &
