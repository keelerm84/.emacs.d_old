.emacs.d Configuration
======================

This repo provides all of my emacs customizations, allowing for quick setup on new machines.  A big thanks to magnars, from whom I stole most of this. ;)  Watch his excellent videos at [Emacs Rocks](http://emacsrocks.com).

## Setup

To grab all the dependencies, either:

    git clone git://github.com/keelerm84/.emacs.d.git
    cd .emacs.d
    git submodule init
    git submodule update --recursive

CEDET 1.1 needs downloaded and built:

    Download and extract cedet 1.1 to .emacs.d/site-lisp/cedet-1.1
    cd .emacs.d/site-lisp/cedet-1.1
    make clean
    make

SLIME
There is currently a problem with slime when connecting to a browser.  It will occassionally hang due to some conflict.  Until this is resolved, you need to edit slime-fancy.el and remove the reference to auto-doc.

