#!/bin/bash
cd /home/ec2-user/app
npm install
node server.js > server.log 2>&1 &
