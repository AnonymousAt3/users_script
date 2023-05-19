#!/bin/bash




if [[ $EUID -ne 0 ]]; then

   echo "This script must be run as root."

   exit 1

fi





read -p "Enter the username for the new GUI user: " username

read -sp "Enter the password for the new GUI user: " password

echo





adduser --disabled-password --gecos "" $username





echo "$username:$password" | chpasswd





usermod -aG sudo $username





mkdir -p /etc/lightdm/lightdm.conf.d

echo -e "[SeatDefaults]\nautologin-user=$username\nautologin-user-timeout=0" > /etc/lightdm/lightdm.conf.d/50-autologin.conf



echo "Root GUI user creation and setup complete."


