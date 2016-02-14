#!/bin/bash
git clone https://github.com/joshglendenning/pac.git ~/.pac
sudo ln -s ~/.pac/bin/pac /usr/local/bin/pac
read -p "Use yaourt (y/n)?" -n 1 choice; echo
case "$choice" in 
    y|Y ) 
        echo "BUILD_NOCONFIRM=1\nEDITFILES=0" > ~/.yaourtrc
        sudo pac update
        sudo pac install yaourt
        ;;
    n|N ) 
        ;;
    * ) echo "invalid";;
esac
echo "Done!"
