#!/bin/bash

#----- Disable_Laptop_Keyboard v2.0
#----- www.github.com/nlkguy/bash-scripts

#----- Utility to disable misbehaving laptop keyboard
#----- Adding options to disable temporarily or permanently
#----- Adding a Cow Assistant to walk you through

#-----------------------------------------------------------

# Functions

cowask(){
while true; do
    read -p "Do you need a COW to assist you ? (y/n) : " yn
    case $yn in
        [Yy]* ) dpkg --status cowsay | grep -q not-installed
				if [ $? -eq 0 ]; then
    				apt-get install cowsay
					$cowhelp = 1
					cowsay hey, im here 
				fi
				break;;
        [Nn]* ) $cowhelp = 0 ;exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
}

cow(){
say1=$1
say2=$2
cowsay $say1 $say2
}

justecho(){
print1=$1
print2=$2
echo $print1 $print2
}

diskey_help(){		# Help Menu Function

cat << _EOF_

DisKey v2.0 - Disable/Enable Laptop Keyboard

DisKey automates the process of disabling laptop keyboard either temporarily or permanently

Press "q" to exit this help page

COMMANDS :
			diskey       = disable temporarily
			
			diskey --e   = enable back

			diskey --p   = disable permanently

			diskey --h   = launch this help page


OPTIONS  :
			--t : disable keyboard temporarily

			--e : enable keyboard back

			--p : disable keyboard Permanently
			
			--h : Launch Help Menu
_EOF_
}

disable_temp(){


echo "Disabling your Laptop Keyboard Termorarily........"
echo "The Keyboard will be back in action after a reboot"
read -p "Connect an External Keyboard and Press Enter to continue? " -n 1 -r
if [[ ! $REPLY =~ ^[]$ ]]
then
    exit 1
fi
xinput disable "AT Translated Set 2 keyboard"

echo "Type \"diskey --e\" to enable it back"
}

disable_perm(){

sudo su
echo "This will Disable your Laptop Keyboard Permanently........"
echo 
echo 
sed -i -e 's/GRUB_CMDLINE_LINUX_DEFAULT=\"quiet splash\"/GRUB_CMDLINE_LINUX_DEFAULT=\"quiet splash i8042.nokbd\"/' \/etc\/default\/grub
sudo update-grub
read -p "Are you ready to Reboot now ? (y/n) : " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    sudo reboot
fi
if [[ ! $REPLY =~ ^[Nn]$ ]]
then
    exit 1
 fi

}

enable_temp(){

echo "Enabling Laptop Keyboard"
xinput disable "AT Translated Set 2 keyboard"

}

#-----------------------------------------------------------
# Main Program
# Execution Starts here

if [ "$1" == "--t" ];then
	disable_temp
	exit 1	
fi

if [ "$1" == "--e" ]; then
	enable_temp
	exit 1
fi

if [ "$1" == "--p" ]; then
	disable_perm
	exit 1
fi

if [ "$1" == "--help" ]; then
	diskey_help
	exit 1
fi

if [ "$1" == "--h" ]; then
	diskey_help
	exit 1
fi

if [ -n "$1"  ]; then
  echo "DisKey Error: Invalid argument. Try 'diskey --help' for more info." >&2
  exit 1
fi

disable_temp
exit 1
