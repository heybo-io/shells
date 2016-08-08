#Written vertically to make it easier to edit. Refactor once fully tested.


sudo apt-get --assume-yes update &&
sudo apt-get --assume-yes upgrade &&

sudo apt-get --assume-yes install git &&

git clone https://www.github.com/heybo-io/heybo.git /home/pi/heybo &&


#sudo apt-get --assume-yes  install &&
sudo apt-get --assume-yes  install libasound-dev &&
sudo apt-get --assume-yes  install python3-pip &&

#Installs PyAudio
sudo apt-get --assume-yes  install portaudio19-dev python-all-dev python3-all-dev && sudo pip3 install pyaudio &&
sudo yes | pip3   install requests &&

#FLAC

sudo apt-get --assume-yes  install flac &&


#Install Google Text to Speech
sudo yes | pip3   install gtts &&


#vlc

sudo apt-get install vlc &&
sudo yes | pip3 install python-vlc &&



#sudo apt-get --assume-yes  install multimedia-jack &&


sudo yes | pip3 install SpeechRecognition &&



#Build Directory Bullshit

#git clone https://www.github.com/oaubert/python-vlc.git /home/pi/kobo_stable/python-vlc

#cd /home/pi/kobo_stable/python-vlc/ && sudo python3 setup.py install

cd /etc/ && sudo echo "sh /home/pi/heybo/load_program.sh" >> /etc/rc.local


echo "Everything Installed!  Rebooting in 5 seconds"
sudo reboot 4

echo "Error with set up.  Exiting."
exit 0
