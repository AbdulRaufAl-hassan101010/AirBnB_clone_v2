#!/usr/bin/env bash

# Install Nginx if not already installed
if [ ! -x "$(command -v nginx)" ]; then
    apt-get update
    apt-get -y install nginx
fi

# Create directories if they don't exist
mkdir -p /data/web_static/releases/test/
mkdir -p /data/web_static/shared/
echo "Hello World!" > /data/web_static/releases/test/index.html

# Create symbolic link
ln -sf /data/web_static/releases/test/ /data/web_static/current

# Give ownership of the /data/ folder to the ubuntu user and group
chown -R ubuntu:ubuntu /data/

# Update Nginx configuration
sed -i '/^\tserver_name _;/a \\n\tlocation /hbnb_static/ {\n\t\talias /data/web_static/current/;\n\t}\n' /etc/nginx/sites-available/default

# Restart Nginx
service nginx restart

exit 0
