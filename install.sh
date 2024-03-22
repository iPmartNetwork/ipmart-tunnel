#!/bin/bash

# Check if running as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit
fi

# Install required packages
echo "Installing required packages..."
apt update
apt install -y iptables iptables-persistent

# Create symbolic link for iptables-dds script
# به داخل پوشه مخزن می‌رویم
mkdir /root/ipmart-tunnel
cd /root/ipmart-tunnel

# ساخت لینک نمادین با نام ipmart-tunnel که به tunnel.sh اشاره دارد
ln -s "$(pwd)/tunnel.sh" /usr/local/bin/ipmart-tunnel
echo "Installation completed. You can now use 'ipmart-tunnel' command."
# تغییر مجوزهای اجرایی اسکریپت
chmod +x tunnel.sh
sudo bash tunnel.sh

