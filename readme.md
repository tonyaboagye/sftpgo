sftpgo installation on a Debian vm hosted in gcp 
NOTE ssh into Debian vm and run the below commands one after the other


1. Download and trust the repo’s GPG key
curl -sS https://ftp.osuosl.org/pub/sftpgo/apt/gpg.key | sudo gpg --dearmor -o /usr/share/keyrings/sftpgo-archive-keyring.gpg


2. Detect your OS version (Debian codename)
CODENAME=$(lsb_release -c -s)


3. Add the SFTPGo repository
echo "deb [signed-by=/usr/share/keyrings/sftpgo-archive-keyring.gpg] https://ftp.osuosl.org/pub/sftpgo/apt ${CODENAME} main" | sudo tee /etc/apt/sources.list.d/sftpgo.list


4. Refresh package list
sudo apt update


5. Install SFTPGo
sudo apt install sftpgo