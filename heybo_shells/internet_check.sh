#!/bin/bash

FORMAT="ctrl_interface=DIR=/var/run/wpa_supplicant\nGROUP=netdev\nupdate_config=1\ncountry=GB\n\nnetwork={\nssid=%s\npsk=%s\nkey_mgmt=%s\n}\n"

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
cd /etc/wpa_supplicant/ && printf $FORMAT "$SSID" "$PSK" "$TYPEB"  

echo "Checking wifi configuration"
sleep 5
