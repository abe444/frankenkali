#!/bin/bash

echo "Updating system..."
sudo apt update && sudo apt upgrade -y

echo "Installing common dependencies..."
sudo apt install -y git curl build-essential python3 python3-pip

echo "Installing Nmap..."
sudo apt install -y nmap

echo "Installing Gobuster..."
sudo apt install -y gobuster

echo "Installing OWASP ZAP..."
sudo snap install owasp-zap --classic

echo "Installing Nikto..."
sudo apt install -y nikto

echo "Installing Metasploit Framework..."
curl https://raw.githubusercontent.com/rapid7/metasploit-framework/master/msfupdate | sudo bash

echo "Installing SQLMap..."
sudo apt install -y sqlmap

echo "Installing John the Ripper..."
sudo apt install -y john

echo "Installing Hydra..."
sudo apt install -y hydra

echo "Installing Burp Suite..."
sudo snap install burpsuite --classic

echo "Installing Netcat..."
sudo apt install -y netcat-traditional

echo "Installing Wireshark..."
sudo apt install -y wireshark

echo "Installing Aircrack-ng..."
sudo apt install -y aircrack-ng

echo "Installing CrackMapExec..."
sudo apt install -y crackmapexec

echo "Installing Impacket..."
sudo apt install -y python3-impacket

echo "Installing Enum4linux..."
sudo apt install -y enum4linux

echo "Installing ExifTool..."
sudo apt install -y exiftool

echo "Installing FFUF..."
go install github.com/ffuf/ffuf/v2@latest
export PATH=$PATH:/root/go/bin

echo "Downloading SecLists..."
sudo git clone https://github.com/danielmiessler/SecLists.git /opt/SecLists

echo "Installing Dirb..."
sudo apt install -y dirb

echo "Installing Binwalk..."
sudo apt install -y binwalk

echo "Installing GDB..."
sudo apt install -y gdb

echo "Installing Radare2..."
sudo apt install -y radare2

echo "Installing Searchsploit..."
sudo apt install -y exploitdb

echo "Cleaning up..."
sudo apt autoremove -y
sudo apt clean

echo "Setting up security-focused Firefox config (Arkenfox)..."
sudo apt install -y firefox

# Create two Firefox profiles: 'default' and 'ARKENFOX'
echo "Creating Firefox profiles..."
firefox -CreateProfile "default-release"
firefox -CreateProfile "ARKENFOX"

# Get the path to the ARKENFOX profile
ARKENFOX_PROFILE=$(find ~/.mozilla/firefox -maxdepth 1 -name "*.ARKENFOX" | head -n 1)

# Clone the Arkenfox repository for the ARKENFOX profile
echo "Cloning Arkenfox repository..."
git clone https://github.com/arkenfox/user.js.git /tmp/arkenfox-userjs

# Copy the Arkenfox user.js file into the ARKENFOX profile directory
if [ -n "$ARKENFOX_PROFILE" ]; then
    echo "Copying user.js to the ARKENFOX profile..."
    cp /tmp/arkenfox-userjs/user.js "$ARKENFOX_PROFILE"
else
    echo "ARKENFOX profile not found!"
fi

# Post-install message
echo "Arkenfox user.js applied to the ARKENFOX profile. You can switch between profiles in Firefox."

# Frankenkali setup complete
echo "Frankenkali setup complete. Your Ubuntu machine is now ready for l33t heking!"
