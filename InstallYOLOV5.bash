#!/bin/bash
set -e
git clone https://github.com/ultralytics/yolov5.git
cd volov5
pip3 install -r requirements.txt --break-system-packages