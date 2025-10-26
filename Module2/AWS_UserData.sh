#!/bin/bash
set -e

# Update package manager
apt-get update -y

# Install Nginx
apt-get install -y nginx

# Get hostname and IP
HOSTNAME=$(hostname)
LOCAL_IP=$(hostname -I | awk '{print $1}')
INSTANCE_ID=$(ec2-metadata --instance-id 2>/dev/null | cut -d " " -f 2 || echo "N/A")

# Create custom index page
cat > /var/www/html/index.html <<EOF
<!DOCTYPE html>
<html>
<head>
    <title>Server Info</title>
    <style>
        body { font-family: Arial; margin: 50px; background: #f0f0f0; }
        .info { background: white; padding: 30px; border-radius: 10px; box-shadow: 0 2px 5px rgba(0,0,0,0.1); }
        h1 { color: #333; }
        p { font-size: 18px; line-height: 1.6; }
        .label { font-weight: bold; color: #0066cc; }
    </style>
</head>
<body>
    <div class="info">
        <h1>Server Information</h1>
        <p><span class="label">Hostname:</span> $HOSTNAME</p>
        <p><span class="label">Local IP:</span> $LOCAL_IP</p>
        <p><span class="label">Instance ID:</span> $INSTANCE_ID</p>
    </div>
</body>
</html>
EOF

# Start and enable Nginx
systemctl start nginx
systemctl enable nginx

# Set permissions
chmod 644 /var/www/html/index.html