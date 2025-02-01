# Running YOLOV5 nano on a Raspberry Pi 4 B
## Preface 
This is a pretty straightforward process, clone Ultralytic's YOLOV5 model from their [repo](https://github.com/ultralytics/yolov5), install the requirements, and run the model. However since Raspberry Pi's are extremely minimalistic in terms of hardware, in order to achieve relatively decent performance there are a few extera steps that need to be taken to complete a setup. In this repository I provided multiple bash scripts that automate this setup and a [Jupyter notebook that goes through the process command by command](https://github.com/Alt900/RP4B-YOLOV5) for those that might want to deviate or improve upon my process.

## Requirements
- Micro SD card with a 64 bit lite or full Raspbian OS
- Raspberry Pi 4 B
- USB 2.0 or 3.0 camera

## Setting up
All you need to do is clone this repo with `git clone https://github.com/Alt900/RP4B-YOLOV5` and run the scripts with `sudo bash ./Filename.bash` and let the scripts do their thing. What except does is pretty self explanatory through their filenames:
- `InstallOpencv1.bash` is the first installer script for opencv
- `InstallOpencv2.bash` is the second installer script for opencv
- `InstallVNC_XVFB.bash` installs a VNC server and the XVFB frame buffer
- `InstallYOLOV5.bash` clones the YOLOV5 model and downloads it's Python library requirements.
- `StartXVFB_VNC.bash` starts the XVFB frame buffer and attaches the display output to a VNC server 
- `AP.bash` Spawns a wireless access point using NetworkManager's `nmcli` tool