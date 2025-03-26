slideshow/README
==================================================

This is a slideshow for a RPI.

Some of the install was taken from ChatGPT.
https://chatgpt.com/share/67e4314b-a1cc-8001-82fd-08ca85bf6a90

Usage:
--------------------------------------------------

- Copy your files to "slideshow/images".

- open your web browser to "http://localhost:3000"

If you need to restart the server: ``make _server_restart``.


Setup
--------------------------------------------------

- flash the SD card with ubuntu

- login and change the password. (the usual)

- checkout the git repo to "slideshow".

::

   git clone ..../slideshow.git slideshow
   cd slideshow
   source setup.env

   make _apt-get-install

   make _npm-init

   make _server_install
