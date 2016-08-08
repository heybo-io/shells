#/bin/bash
# Env Set up

FT_FLAG="/home/$(whoami)/heybo_shells/FT_DO_NOT_REMOVE.log"
STATE="error";
FORMAT="ctrl_interface=DIR=/var/run/wpa_supplicant\nGROUP=netdev\nupdate_config=1\ncountry=GB\n\nnetwork={\nssid=%s\npsk=%s\nkey_mgmt=%s\n}\n"


#Internet check
#ping -c 1 www.hellokobo.com && "Network Found"
echo "Initializing Heybo Set up"

STATE=$(ping -q -w 1 -c 1 `ip r | grep default | cut -d ' ' -f 3` > /dev/null && echo ok || echo error)

if [ $STATE != "error" ]
    echo "Network found.  Continuing"

then
    continue

else 
    echo "No Network Found.  Attempting wifi set up."

fi

while [ $STATE = "error" ]; 
do
    #do a ping and check that its not a default message or change to grep for something else
    #cd /home/$(whoami)/heybo_shells && sh /home/$(whoami)/heybo_shells/internet_check.sh 
#WPA-PSK


#Acquire Information
    echo "What is your Wifi SSID?:"
    read SSID
    echo "Which kind of security? [WPA / WEP]"
    read TYPE
    echo "What is the password?"
    read PSK


#Confirm and Filter
    echo $SSID

    if [ $TYPE = "WPA" ] ||[$TYPE = "wpa"] ; then
        echo "WPA detected"
        TYPEB="WPA-PSK";

        echo $PSK;

    else 
        TYPEB=$TYPE
        echo "Unknown password type"
    fi

    #Send to WPcd /etc/wpa_supplicant/ && echo " " > wpa_supplicant.conf
    cd /etc/wpa_supplicant/ && sudo printf $FORMAT "$SSID" "$PSK" "$TYPEB" > /etc/wpa_supplicant/wpa_supplicant.conf 

    echo "Checking wifi configuration"
    sleep 5


    #sleep for 2 seconds and try again

    echo "Testing connection"
    STATE=$(ping -q -w 1 -c 1 `ip r | grep default | cut -d ' ' -f 3` > /dev/null && echo ok || echo error)
    continue 
    done

echo "Connected"
#After internet check
if [ ! -f $FT_FLAG ]; then
    echo "#########################################################################"
    echo "Welcome to first time set up.  This next part may take up to 10 minutes."
    echo "Do not disconnect your device from the internet or from its power source."
    echo "#########################################################################"
    echo "{ press ENTER to continue }"
    read

    cd /home/$(whoami)/heybo_shells/ && sudo sh /home/$(whoami)/heybo_shells/startup.sh

    touch $FT_FLAG

else
    echo "Welcome Back!"
    sleep 3

fi

