#!/bin/bash

echo " ____________________________________"
echo "/ Do you want to disable your laptop \\"
echo "\ keyboard ??                        /"
echo " ------------------------------------"
echo "        \  ^__^"
echo "         \ (oo)\_______"
echo "           (__)\       )\/\\"
echo "               ||--WWW |"
echo "               ||     ||"


#txt=$(xinput | grep "AT Translated Set 2 keyboard")
#txt_trim=$(echo $txt | sed -e 's/^[[:space:]]*//')
#ID=${txt_trim:34:2}
#echo "ID of the internal keyboard is ${txt_trim:34:2}"
echo "do you want to disable it (y or n) : " && read confirmation
yes="y"
no="n"
if [ $confirmation == $yes ]; then
	xinput disable AT Translated Set 2 keyboard
	echo " _________________________________________"
	echo "/ notice any diffrence ? your keyboard is \\"
	echo "\ disabled, mine toooo, have a nice day   /"
	echo " -----------------------------------------"
	echo "        \  ^__^"
	echo "         \ (oo)\_______"
	echo "           (__)\       )\/\\"
	echo "               ||----- |"
	echo "               ||     ||"
else 
	exit 1
fi
