#!/bin/bash

# Removes old builds
make clean

# The following line needs access to the internet
# Downloads latest drivers from Github repository
git pull 

# Builds and installs updated Wi-Fi drivers (note: will reboot system)
make
sudo make install

# Prints CLI option to reboot now

answered=false

while [ "$answered" == false ]
do
    echo "Would you like to restart now (Y/n): "
    read input
    if [ "$input" == "Y" ] || [ "$input" == "y" ]
    then
        answered=true
        systemctl reboot
    elif [ "$input" == N ] || [ "$input" == n  ]
    then
        answered=true
        echo "Restart soon for driver update to come into effect."
    else
        echo "Invalid input."
    fi
done
