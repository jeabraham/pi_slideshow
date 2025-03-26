slideshow/README
==================================================

This is a slideshow for a RPI.

Some of the install was taken from ChatGPT.
https://chatgpt.com/share/67e4314b-a1cc-8001-82fd-08ca85bf6a90

Usage:
--------------------------------------------------

- Copy your files to "slideshow/images".

- login at the console with ``ubuntu / hbapasswd ``.
  
- The show should start

If the show does not start:

- open your web browser to ``http://localhost:3000``

- disable screen saver:

::

   cd slideshow
   source ./setup.env
   make _user_screen_saver_disable
  
If you need to restart the server: ``make _server_restart``.


Setup:
--------------------------------------------------

- flash the SD card with ubuntu

- login and change the password. ``ubuntu / ubuntu``
  (Change the password to the usual.)

- checkout the git repo to ``slideshow``.

::

   git clone 10.11.1.121:/zfs/repos/slideshow.git slideshow
   cd slideshow
   source setup.env

   make _apt-get-install

   make _npm-init

   make _server_install

- manually make a startup item.

  - name: slidehow
  - command: firefox --kiosk http://localhost:3000/
  - when: on login
