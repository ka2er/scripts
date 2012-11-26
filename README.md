Personnal Scripts
=================

backup-and-rotate-photos.sh
---------------------------

Do 7 weeks backup using hard-link and minimizing hard disk space

set-keyboard-layout*
--------------------

Keyboard change layout to us when plugged (for my USB happy hacking and not the main laptop one)

- Add rules into /etc/udev/rules.d
- Edit files to match your home
- call sequence is :
99-happy-hacking.rules => set-keyboard-layout-udev.sh => set-keyboard-layout.sh
