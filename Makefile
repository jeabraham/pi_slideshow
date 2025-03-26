#
# slideshow/Makefile
#

_default:

#####

_apt-get-install:
	sudo apt-get install \
	  build-essential \
	  chromium-browser \
	  emacs-nox \
	  nodejs \
	  npm \
	  raspi-config \
	  x11-xserver-utils \
	  xubuntu-desktop

#_systemctl:
#	sudo systemctl disable apparmor
#	sudo systemctl mask
#	sudo systemctl disable cups
#	sudo systemctl mask cups

#####

# https://askubuntu.com/questions/1501903/x11-session-fails-to-start-on-arm64-ubuntu-23-10-on-raspberry-pi-5
./system/gldriver-test_0.15_all.deb:
	curl \
	  --output "${@}" \
	"https://archive.raspberrypi.org/debian/pool/main/g/gldriver-test/gldriver-test_0.15_all.deb"

_install_gldriver: | ./system/gldriver-test_0.15_all.deb
	sudo dpkg -i ./system/gldriver-test_0.15_all.deb

#####

_npm-init:
	npm init -y
	npm install express

#####

URL:=http://localhost:${SLIDESHOW_PORT}

_test_index_1:
	curl "${URL}/"
_test_index_2:
	curl "${URL}/index.html"

_test_getImageList:
	curl "${URL}/getImageList"

#_test_favicon:
#	curl -i "${URL}/favicon.ico"

_test_getImage_1:
	curl "${URL}/images/DJI_20240916160122_0680_D.JPG" \
	  --output /dev/null

_test+=_test_index_1
_test+=_test_index_2
_test+=_test_getImageList
_test+=_test_getImage_1

_test: ${_test}

#####

# This does not work.
# you will need to open the web browser and open "http://localhost:3000"

_user_install:
#
	install -m 555 ./system/xinitrc ~/.xinitrc
#
	mkdir -p ~/.config/autostart
	install -m 555 ./system/slideshow.desktop ~/.config/autostart

#####

_server_install:
	sudo install -m 444 system/slideshow.service /etc/systemd/system/
#
	sudo systemctl daemon-reload
	sudo systemctl enable slideshow.service
	sudo systemctl start slideshow.service
#
	sudo systemctl status slideshow.service

_server_restart:
	sudo systemctl restart slideshow
	sleep 3
	sudo systemctl status  slideshow

_server_status:
	sudo systemctl status  slideshow

_server_logs:
	sudo journalctl -u slideshow.service

# For debugging...
_server_run_cli:
	sudo systemctl stop slideshow
	./server/slideshow-server
