# How to Disable Laptop Built-In Keyboard in Linux

Often times laptop keyboards fails to register keypresses when they get old , or the behave weird and make random keystrokes while youre working in an important document.You can disable the built in keyboard in laptops and use an external keyboard temporarily or permenantly. in my case , when the humidity rises my VAIO-dhikans Keyboard will go crazy and i disabled it. i tried to clean it , blowed air at it but nothing stopped it from staying crazy.So i went in search for "How to to disable laptop keyboard" 

###  Using Xinput
``xinput`` is a utility to configure input devices in Linux machines  
<img src="https://github.com/nlkguy/bash-scripts/blob/main/disable_laptop_keyboard/xinput.png" alt="Xinput" width="60%" height="60%">

1. type `xinput` into a terminal  

2. find the ID or name of the keyboard. In most of the Debian Linux machines the name for laptop keyboard is  
`"AT Translated Set 2 keyboard"` and there is a corresponding ID number. 

3. type `xinput disable <id>` or `xinput disable <"name">`  
this will be reverted after reboot 

### Execute on System Startup
#### Rc.local method


> Example :   
> ```nlk@vaio-dhikan:~$ xinput disable 16```   
> ```nlk@vaio-dhikan:~$ xinput disable "AT Translated Set 2 keyboard"```




## References

>[AskUbuntu.com : Thread on How to disable laptop keyboard](https://askubuntu.com/questions/160945/is-there-a-way-to-disable-a-laptops-internal-keyboard)  
>[LinuxHint.com : How to Run Linux Commands and Scripts Automatically on a System Reboot](https://linuxhint.com/run_linux_command_script_sys_reboot/)
