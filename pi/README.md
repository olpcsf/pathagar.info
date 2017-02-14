##Raspberry Pi as a Content Server

### Overview

The content of this directory (`pi`) is an attempt to document
steps taken to turn a `Raspberry Pi` into a content server running a
static content site as well as a Pathagar book server.

### What's Needed

1. A Raspberry Pi B

    The [Vilros basic starter kit](https://www.amazon.com/Vilros-Raspberry-Basic-Starter-Kit/dp/B01D92SSX6/ref=sr_1_4?s=pc&ie=UTF8&qid=1478455788&sr=1-4&keywords=raspberry+pi)
    is recommended since it includes the required power cord, and a
    protective case. WiFi is built in to this newer (v3) model. The
    older (v2) model will work but a separate [USB WiFi
    dongle](https://www.amazon.com/CanaKit-Raspberry-Wireless-Adapter-Dongle/dp/B00GFAN498/ref=sr_1_1?s=pc&ie=UTF8&qid=1486968857&sr=1-1&keywords=CanaKit+WIFI) will be needed.

2. A micro SD Card- 64 Gig recommended

### Preparing an Image

The latest `Raspbian` image can be found
[here](https://downloads.raspberrypi.org/raspbian_lite_latest).
Notice use of the `lite` version which is devoid of Xwindows (the
graphical user interface) which is not needed for a server.

### Updating the Image

With the `Pi` connected (via an ethernet cable) to the internet,
run `raspi-config' and then upgrade the `OS`.  Details of raspi-config
can be found in `server-setup/raspi-config`.  Once this is done, use
`rsync` to copy the `server-setup` directory structure from this
repostitory to `/home/pi/`.  Then, as user `pi`::

    cd /home/pi/server-setup
    sudo su
    mv /etc/sudoers.d/010_pi-nopasswd /etc/sudoers.d/010_pi-nopasswd.original
    source update.sh

The last command does a reset so you'll have to log back onto the Pi.

### Install Server and other Dependencies

Following the reboot, log back on (as `pi`) and run the following
commands::

    cd /home/pi/server-setup
    sudo su
    source create_server.sh
    



Can simulate FOOT NOTES as follows:
    <a name="myfootnote1">1</a>: Footnote content goes here
    Then reference it at some other place in the document like this
    <sup>[1](#myfootnote1)</sup>
