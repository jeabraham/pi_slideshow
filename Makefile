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

_npm-init:
	npm init -y
	npm install express

#####

_test_getSlides:
	curl "http://localhost:3000/getSlides"

_logs:
	sudo journalctl -u slideshow.service

#####

_user_install:
#
	install -m 555 ./system/xinitrc ~/.xinitrc
#
	mkdir -p ~/.config/autostart
	install -m 555 ./system/slideshow.desktop ~/.config/autostart

_systemd_install:
	sudo install -m 444 system/slideshow.service /etc/systemd/system/
#
	sudo systemctl daemon-reload
	sudo systemctl enable slideshow.service
	sudo systemctl start slideshow.service
#
	sudo systemctl status slideshow.service

_systemd_restart:
	sudo systemctl restart slideshow
	sleep 3
	sudo systemctl status  slideshow

#####

# https://askubuntu.com/questions/1501903/x11-session-fails-to-start-on-arm64-ubuntu-23-10-on-raspberry-pi-5
#
./system/gldriver-test_0.15_all.deb:
	curl \
	  --output "${@}" \
	"https://archive.raspberrypi.org/debian/pool/main/g/gldriver-test/gldriver-test_0.15_all.deb"

