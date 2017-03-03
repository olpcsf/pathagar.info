---
layout: default
title: Pathagar on Raspberry Pi
---
## Raspberry Pi as a Content Server

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
run `raspi-config` and then upgrade the `OS`.  Details of raspi-config
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
    
### Pathagar Specific Instructions

See ~/olpcSF/Pathagar/Aaron/history.txt

#### Bring in Pathagar and its Dependencies

The following is described in the [RachelSetup directory
hierarchy](https://github.com/alexKleider/olpcSF/tree/master/RachelSetup);
the essentials .
Specifically, the update.sh and create_server.sh scripts should have
been already sourced.  

It is suggested to use the user pi home directory to serve as a home
for Pathagar.  If you are logged in as user pi::

    cd
    git clone https://github/pathagarbooks/pathagar.git
    cd pathagar
    sudo apt-get instal python-virtualenv
    virtualenv -p python2.7 penv
    source penv/bin/activate  # 'deactivate' when done.
    pip install -r requirements.pip
    cd <directory/where/this/README/is/found>
    cp local_settings.py ~/pathagar/

The __last two commands__ serve to customize settings and serve to
accomplish what would otherwise have to be done by the following:<br>
IF you've done the above, NO NEED TO DO THE FOLLOWING:<br>
Edit the settings.py file and preface the static directory
with '/library':<br>
STATIC_URL = '/library/static/'<br>
and add two lines:<br>
FORCE_SCRIPT_NAME = '/library'<br>
LOGIN_REDIRECT_URL = FORCE_SCRIPT_NAME<br>

#### Apache Web Server

Since we wish to serve pathagar along with other content, an
appropriate apache2 conf file is provided.

    cd <directory/where/this/README/is/found>
    sudo cp pathagar.conf4pi /etc/apache2/sites-available/pathagar.conf
    sudo a2ensite pathagar.conf
    sudo service apache2 reload
    python manage.py syncdb
    python manage.py runserver 0.0.0.0:8000
    # Teminate server with CTL-C

#  Notes to myself:

A paragraph<sup>[1](#myfootnote1)</sup> that has a foot note.

Other stuff goes here.

### Footnotes 

<a name="myfootnote1">1</a>:  Some explanation of the paragraph above.


