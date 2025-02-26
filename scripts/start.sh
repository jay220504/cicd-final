#!/bin/bash

export PATH=$HOME/.npm-global/bin:$PATH

cd /home/ec2-user/app

# Ensure correct permissions
sudo chown -R ec2-user:ec2-user /home/ec2-user/app
sudo chmod -R 755 /home/ec2-user/app

# Run npm install as ec2-user
sudo -u ec2-user npm install --omit=dev

# Start the application with PM2
pm2 start server.js --name my-app

# Save PM2 process list so it restarts after reboot
pm2 save
