#!/bin/bash

#Variables globales
wordlists=/usr/share/worlists
bin=/usr/local/bin
go=~/go/bin
recon=/opt/recon
exploting=/opt/exploting
chromium=/etc/chromium.d

#Funciones
kali-large(){
    sudo apt-get install kali-linux-large -y
}

update(){
    sudo apt-get update && apt-get upgrade -y
    sudo apt-get full-upgrade -y
    sudo apt-get dist-upgrade -y
    sudo apt autoremove -y
}

install-tools(){
    sudo apt-get install -y gnome-terminal
    sudo apt-get install -y terminator
    sudo apt-get install -y golang
    sudo apt-get install -y htop
    sudo apt-get install -y neofetch
    sudo apt-get install -y ranger
    sudo apt-get install -y exiftool
    sudo apt-get install -y steghide
    sudo apt-get install -y proxychains
    sudo apt-get install -y tor
    sudo apt-get install -y leafpad
}

fastTCPScan(){
    mkdir ~/Desktop/fastTCPScan
    git clone -4 -v https://github.com/cyb3r3xpl0it/fastTCPScan.git ~/Desktop/fastTCPScan
    go build -ldflags "-s -w" ~/Desktop/fastTCPScan/fastTCPScan.go
    upx brute ~/Desktop/fastTCPScan/fastTCPScan
    chmod +x ~/Desktop/fastTCPScan/fastTCPScan
    mv ~/Desktop/fastTCPScan/fastTCPScan $bin
}

go_tools() { 
    go install -v github.com/tomnomnom/unfurl@latest
    mv $go/unfurl $bin
    go install -v github.com/tomnomnom/assetfinder@latest
    mv $go/assetfinder $bin
    go install -v github.com/tomnomnom/httprobe@latest
    mv $go/httprobe $bin
    go install -v github.com/tomnomnom/waybackurls@latest
    mv $go/waybackurls $bin
    go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
    mv $go/subfinder $bin
    go install -v github.com/lukasikic/subzy@latest
    mv $go/subzy $bin
    wget https://github.com/michenriksen/aquatone/releases/download/v1.7.0/aquatone_linux_amd64_1.7.0.zip -O aquatone.zip
    unzip aquatone.zip
    chmod +x aquatone
    mv aquatone $bin
}

whichos(){
    mkdir ~/Desktop/whichos
    git clone -4 -v https://github.com/cyb3r3xpl0it/whichos.git ~/Desktop/whichos
    chmod +x ~/Desktop/whichos/whichos.py
    mv ~/Desktop/whichos/whichos.py $bin
}

docker(){
    printf '%s\n' "deb https://download.docker.com/linux/debian bullseye stable" | sudo tee /etc/apt/sources.list.d/docker-ce.list
    curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/docker-ce-archive-keyring.gpg
    sudo apt-get update 
    sudo apt-get install docker-ce docker-ce-cli containerd.io -y
    sudo systemctl start docker
    docker pull opensecurity/mobile-security-framework-mobsf
}

wordlists(){
    mkdir -v $wordlists/seclists
    mkdir -v $wordlists/fuzzdb
    mkdir -v $wordlists/PayloadsAllTheThings
    mkdir -v $wordlists/fuzz
    mkdir -v $wordlists/bruteforce-database
    mkdir -v $wordlists/Probable-Wordlists
    git clone -4 -v https://github.com/danielmiessler/SecLists.git $wordlists/seclists
    git clone -4 -v https://github.com/fuzzdb-project/fuzzdb.git $wordlists/fuzzdb
    git clone -4 -v https://github.com/swisskyrepo/PayloadsAllTheThings.git $wordlists/PayloadsAllTheThings
    git clone -4 -v https://github.com/Bo0oM/fuzz.txt.git $wordlists/fuzz
    git clone -4 -v https://github.com/duyet/bruteforce-database.git $wordlists/bruteforce-database 
    git clone -4 -v https://github.com/berzerk0/Probable-Wordlists.git $wordlists/Probable-Wordlists
    wget https://gist.githubusercontent.com/jhaddix/86a06c5dc309d08580a018c66354a056/raw/96f4e51d96b2203f19f6381c8c545b278eaa0837/all.txt -O $wordlists/all.txt
    #wget -r --no-parent -R "index.html*" https://wordlists-cdn.assetnote.io/data/ -nH
}

recon(){
    mkdir -v $recon
    mkdir -v $recon/JSParser
    mkdir -v $recon/dirsearch
    mkdir -v $recon/lazys3
    mkdir -v $recon/teh_s3_bucketeers
    mkdir -v $recon/virtual-host-discovery
    mkdir -v $recon/lazyrecon
    mkdir -v $recon/massdns
    mkdir -v $recon/asnlookup
    mkdir -v $recon/crtndstry
    mkdir -v $recon/bbht
    mkdir -v $recon/knock-dns
    mkdir -v $recon/legion
    mkdir -v $recon/webhackshl
    mkdir -v $recon/Subist3r
    mkdir -v $recon/subdomain-takeover
    git clone -v -4 https://github.com/nahamsec/JSParser.git $recon/JSParser
    git clone -v -4 https://github.com/maurosoria/dirsearch.git $recon/dirsearch
    git clone -v -4 https://github.com/nahamsec/lazys3.git $recon/lazys3
    git clone -v -4 https://github.com/tomdev/teh_s3_bucketeers.git $recon/teh_s3_bucketeers
    git clone -v -4 https://github.com/jobertabma/virtual-host-discovery.git $recon/virtual-host-discovery
    git clone -v -4 https://github.com/nahamsec/lazyrecon.git $recon/lazyrecon
    git clone -v -4 https://github.com/blechschmidt/massdns.git $recon/massdns
    git clone -v -4 https://github.com/yassineaboukir/asnlookup.git $recon/asnlookup
    git clone -v -4 https://github.com/nahamsec/crtndstry.git $recon/crtndstry
    git clone -v -4 https://github.com/nahamsec/bbht.git $recon/bbht
    git clone -v -4 https://github.com/guelfoweb/knock.git $recon/knock-dns
    git clone -v -4 https://github.com/carlospolop/legion.git $recon/legion
    git clone -v -4 https://github.com/SecHackLabs/webhackshl.git $recon/webhackshl
    git clone -v -4 https://github.com/aboul3la/Sublist3r.git $recon/Subist3r
    git clone -v -4 https://github.com/antichown/subdomain-takeover.git $recon/subdomain-takeover
}

exploting(){
    mkdir -v $exploting
    mkdir -v $exploting/NoSQLMap
    mkdir -v $exploting/Cracking-Pack-Toolkit
    mkdir -v $exploting/dnstwist
    mkdir -v $exploting/Evil-Droid
    mkdir -v $exploting/Hash-Buster
    mkdir -v $exploting/Hashcat-Utils
    mkdir -v $exploting/JohnTheRipper
    mkdir -v $exploting/laZagne
    mkdir -v $exploting/laZagneForensic
    mkdir -v $exploting/PasteZort
    mkdir -v $exploting/PEASS-ng
    mkdir -v $exploting/TheFatRat
    mkdir -v $exploting/WaterDoS
    mkdir -v $exploting/wwwolf-php-webshell
    mkdir -v $exploting/pentmenu
    git clone -v -4 https://github.com/codingo/NoSQLMap.git $exploting/NoSQLMap
    git clone -v -4 https://github.com/iphelix/pack.git $exploting/Cracking-Pack-Toolkit
    git clone -v -4 https://github.com/elceef/dnstwist.git $exploting/dnstwist
    git clone -v -4 https://github.com/M4sc3r4n0/Evil-Droid.git $exploting/Evil-Droid
    git clone -v -4 https://github.com/s0md3v/Hash-Buster.git $exploting/Hash-Buster
    git clone -v -4 https://github.com/hashcat/hashcat-utils.git $exploting/Hashcat-Utils
    git clone -v -4 https://github.com/magnumripper/JohnTheRipper.git $exploting/JohnTheRipper
    git clone -v -4 https://github.com/AlessandroZ/LaZagne.git $exploting/laZagne
    git clone -v -4 https://github.com/AlessandroZ/LaZagneForensic.git $exploting/laZagneForensic
    git clone -v -4 https://github.com/ZettaHack/PasteZort.git $exploting/PasteZort
    git clone -v -4 https://github.com/carlospolop/PEASS-ng.git $exploting/PEASS-ng
    git clone -v -4 https://github.com/Screetsec/TheFatRat.git $exploting/TheFatRat
    git clone -v -4 https://github.com/HackingEnVivo/WaterDoS.git $exploting/WaterDoS
    git clone -v -4 https://github.com/WhiteWinterWolf/wwwolf-php-webshell.git $exploting/wwwolf-php-webshell
    git clone -v -4 https://github.com/GinjaChris/pentmenu.git $exploting/pentmenu
    wget https://github.com/carlospolop/PEASS-ng/releases/latest/download/linpeas.sh -O $exploting/PEASS-ng/linpeas.sh
}

chromium(){
    echo"# Don't use the GPU blacklist (bug #802933)\n" >> $chromium/default-flags
    echo'export CHROMIUM_FLAGS="$CHROMIUM_FLAGS --ignore-gpu-blacklist"' >> $chromium/default-flags
    echo "# Run as root Kali" >> $chromium/default-flags
    echo 'export CHROMIUM_FLAGS="$CHROMIUM_FLAGS --password-store=detect --no-sandbox --user-data-dir"' >> $chromium/default-flags
    echo "# Disable Chromium security features for web app testing" >> $chromium/default-flags
    echo 'export CHROMIUM_FLAGS="$CHROMIUM_FLAGS --disable-web-security"' >> $chromium/default-flags
}

PS3='Please enter your choice: '
options=("Install All" "Install Kali Large and Update system" "Install Tools" "Install fastTCPScan" "Install go tools" "Install whichos" "Install docker and mobsf" "Clone wordlists" "Clone recon" "Clone exploting" "Notes" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Install All")
            kali-large
            echo "\e[0;32Kali Linux Large Instalado\e[0m"
            sleep 1
            update
            echo "\e[0;32Sistema Actualizado\e[0m"
            sleep 1
            install-tools
            echo "\e[0;32Herramientas Instaladas\e[0m"
            sleep 1
            fastTCPScan
            echo "\e[0;32FastTCPScan Instalado\e[0m"
            sleep 1
            go_tools
            echo "\e[0;32Go Tools Instaladasv\e[0m"
            sleep1
            whichos
            echo "\e[0;32Whichos Instalada\e[0m"
            sleep 1
            docker
            echo "\e[0;32Docker y Mobsf instalada\e[0m"
            sleep 1
            wordlists            
            recon
            exploting
            echo "\e[0;32RepoS Clonados\e[0m"
            sleep 1
            chromium
            echo "\e[0;32Chromium configurado\e[0m"
            ;;
        "Install Kali Large and Update system")
            kali-large
            echo "\e[0;32Kali Linux Large Instalado\e[0m"
            sleep 1
            update
            echo "\e[0;32Sistema Actualizado\e[0m"
            sleep 1
            ;;
        "Install Tools")
            install-tools
            echo "\e[0;32Herramientas Instaladas\e[0m"
            sleep 1
            ;;
        "Install fastTCPScan")
            fastTCPScan
            echo "\e[0;32FastTCPScan Instalado\e[0m"
            sleep 1
            ;;
        "Install go tools")
            go_tools
            echo "\e[0;32Go Tools Instaladasv\e[0m"
            sleep1
            ;;
        "Install whichos")
            whichos
            echo "\e[0;32Whichos Instalada\e[0m"
            sleep 1
            ;;
        "Install docker and mobsf")
            docker
            echo "\e[0;32Docker y Mobsf instalada\e[0m"
            sleep 1
            ;;
        "Clone wordlists")
            wordlists
            echo "\e[0;32RepoS Clonados\e[0m"
            sleep 1
            ;;
        "Clone recon")            
            recon
            echo "\e[0;32RepoS Clonados\e[0m"
            sleep 1
            ;;
        "Clone exploting")
            exploting
            echo "\e[0;32RepoS Clonados\e[0m"
            sleep 1
            ;;
        "Notes")
            echo "Install apktool"
            echo "Install ngrok"
            echo "link simbolico sobre repos ln -s /opt/git/repo /usr/local/bin"
            echo "install bookmarks"
            echo "remove and install burpsuite pro"
            echo "install jython and jruby"
            echo "install cobalt strike"
            echo "install angry ip"
            echo "install firefox and chromium extensions"
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done