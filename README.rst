slideshow/README
==================================================

This is a slideshow for a RPI.

Some of the install was taken from ChatGPT.
https://chatgpt.com/share/67e4314b-a1cc-8001-82fd-08ca85bf6a90





Setup
--------------------------------------------------

- flash the SD card with ubuntu

- login and change the password.

- checkout the git repo to "slideshow".

::

   git clone ..../slideshow.git slideshow
   cd slideshow
   source setup.env

   make _apt-get-install

   make _npm-init
