#!/bin/bash

#----- Disable_Laptop_Keyboard v2.0
#----- www.github.com/nlkguy/bash-scripts

#----- Utility to disable misbehaving laptop keyboard
#----- Adding options to disable temporarily or permanently
#----- Adding a Cow Assistant to walk you through

#-----------------------------------------------------------

#Functions

cowASK(){

read -p "Do you need a COW to assist you ? (y/n) : " -n 1 -r
echo

if [[ ! $REPLY =~ ^[Yy]$ ]]
then

fi

}

cowASK
