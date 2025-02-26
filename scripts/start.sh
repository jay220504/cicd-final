
#!/bin/bash

# Ensure correct PATH for PM2
export PATH=$HOME/.npm-global/bin:$PATH

cd /home/ec2-user/app

# Ensure permissions
sudo chown -R ec2-user:ec2-user /home/ec2-user/app
sudo chmod -R 755 /home/ec2-user/app

# Install dependencies
npm install --omit=dev

# Stop existing PM2 process (if any)
pm2 delete my-app || true

# Start application with PM2
pm2 start server.js --name my-app

# Save PM2 process list to restart after reboot
pm2 save
pm2 startup systemd
