#!/bin/bash
set -e
sudo systemctl enable vncserver-x11-serviced
sudo systemctl start vncserver-x11-serviced
Xvfb :0 -screen 0 1920x1080x24 &
export DISPLAY=:0
sudo systemctl status vncserver-x11-serviced
echo "VNC running on primary interface:"
sudo ifconfig