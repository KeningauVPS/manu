#!/usr/bash
# Created by Kang wahid
if [[ -e /etc/debian_version ]]; then
	OS=debian
	RCLOCAL='/etc/rc.local'
elif [[ -e /etc/centos-release || -e /etc/redhat-release ]]; then
	OS=centos
	RCLOCAL='/etc/rc.d/rc.local'
	chmod +x /etc/rc.d/rc.local
else
	echo "Sepertinya Anda tidak menjalankan installer ini pada sistem Debian, Ubuntu atau CentOS"
	exit
fi
color1='\e[031;1m'
color2='\e[34;1m'
color3='\e[0m'
echo "--------------- Selamat Datang Di Vps Anda Boss ---------------"
echo ""
cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
tram=$( free -m | awk 'NR==2 {print $2}' )
swap=$( free -m | awk 'NR==4 {print $2}' )
up=$(uptime|awk '{ $1=$2=$(NF-6)=$(NF-5)=$(NF-4)=$(NF-3)=$(NF-2)=$(NF-1)=$NF=""; print }')

echo -e "\e[032;1mCPU model:\e[0m $cname"
echo -e "\e[032;1mNumber of cores:\e[0m $cores"
echo -e "\e[032;1mCPU frequency:\e[0m $freq MHz"
echo -e "\e[032;1mTotal amount of ram:\e[0m $tram MB"
echo -e "\e[032;1mTotal amount of swap:\e[0m $swap MB"
echo -e "\e[032;1mSystem uptime:\e[0m $up"
echo -e "Seputar SSH & OpenVPN"
echo -e "\033[38;5;214m(1)Create Account User""\e[38;5;198m          (21)Check User Banned \e[0m"
echo -e "\033[38;5;214m(2)Generate Account SSH/Vpn""\e[38;5;198m     (22)Create Acc PPTP VPN \e[0m"
echo -e "\033[38;5;214m(3)Trial ID""\e[38;5;198m                     (23)Delete Acc PPTP VPN \e[0m"
echo -e "\033[38;5;214m(4)Topup User Account""\e[38;5;198m           (24)Check Acc Detail PPTP VPN\e[0m"  
echo -e "\033[38;5;214m(5)Change Password User""\e[38;5;198m         (25)Check login PPTP VPN\e[0m" 
echo -e "\033[38;5;214m(6)Ban User""\e[38;5;198m                     (26)Check User PPTP VPN\e[0m"
echo -e "\033[38;5;214m(7)Unbanned User"\e[38;5;198m                 (27)Speedtest Server\e[0m" 
echo -e "\033[38;5;214m(8)Lock User Account""\e[38;5;198m            (28)Benchmark Server\e[0m" 
echo -e "\033[38;5;214m(9)Unlock User Accountr""\e[38;5;198m         (29)RAM Server \e[0m"  
echo -e "\033[38;5;214m(10)Delete User Account""\e[38;5;198m         (30)Restart OpenSSH\e[0m"
echo -e "\033[38;5;214m(11)Check User Detail""\e[38;5;198m           (31)Restart Dropbear\e[0m"
echo -e "\033[38;5;214m(12)Check User IDr""\e[38;5;198m              (32)Restart OpenVPN\e[0m"
echo -e "\033[38;5;214m(13)Cek Login Dropbear""\e[38;5;198m          (33)Restart PPTP\e[0m"
echo -e "\033[38;5;214m(14)Check User Login VPS""\e[38;5;198m        (34)Restart Webmin\e[0m"
echo -e "\033[38;5;214m(15)Kill Multi Login""\e[38;5;198m            (35)Restart Squid Proxyr\e[0m"
echo -e "\033[38;5;214m(16)Check User Account""\e[38;5;198m          (36)Restart Edit Port Server\e[0m"
echo -e "\033[38;5;214m(17)Check User Expired""\e[38;5;198m          (37)Restart Set Auto Reboot\e[0m"
echo -e "\033[38;5;214m(18)Delete User Expired""\e[38;5;198m         (38)Reboot Server\e[0m"
echo -e "\033[38;5;214m(19)Lock user expired""\e[38;5;198m           (39)Change Password Server\e[0m" 
echo -e "\033[38;5;214m(20)Check User Kicked""\e[38;5;198m           (40)Lihat Info Script\e[0m"          
echo -e"\e[38;5;198m                                                 (41)Update Now\e[0m" 
echo -e "                                     \e[40;38;5;196mAutoscript By\e[30;48;5;19m OrangKuatSabahanTerkini\e[0m"
echo -e "                                        Telegram: \e[4m@OrangKuatSabahanTerkini \e[24mNormal"
read -p "Tulis Pilihan Anda (angka): " x
if test $x -eq 1; then
user-add
elif test $x -eq 2; then
user-generate
elif test $x -eq 3; then
trial
elif test $x -eq 4; then
user-aktif
elif test $x -eq 5; then
user-password
elif test $x -eq 6; then
read -p "Isikan Jumlah Maximal Login (1-2): " MULTILOGIN
user-ban $MULTILOGIN
elif test $x -eq 7; then
user-unban
elif test $x -eq 8; then
user-lock
elif test $x -eq 9; then
user-unlock
elif test $x -eq 10; then
user-delete
elif test $x -eq 11; then
user-detail
elif test $x -eq 12; then
user-list
elif test $x -eq 13; then
user-login
elif test $x -eq 14; then
user-log
elif test $x -eq 15; then
read -p "Isikan Jumlah Maximal Login (1-2): " MULTILOGIN
user-limit $MULTILOGIN
elif test $x -eq 16; then
infouser
elif test $x -eq 17; then
expireduser
elif test $x -eq 18; then
user-delete-expired
elif test $x -eq 19; then
clear
echo "Script ini berjalan secara otomatis setiap jam 12 malam"
echo "Anda tidak perlu menjalankannya secara manual"
echo "Jika anda tetap ingin menjalankan script ini, ketik user-expire"
elif test $x -eq 20; then
log-limit
elif test $x -eq 21; then
log-ban
elif test $x -eq 22; then
user-add-pptp
elif test $x -eq 23; then
user-delete-pptp
elif test $x -eq 24; then
user-detail-pptp
elif test $x -eq 25; then
user-login-pptp
elif test $x -eq 26; then
alluser-pptp
elif test $x -eq 27; then
speedtest --share
elif test $x -eq 28; then
bench-network
elif test $x -eq 29; then
ram
elif test $x -eq 30; then
	if [[ "$OS" = 'debian' ]]; then 
		service ssh restart 
	else 
		service sshd restart 
	fi
elif test $x -eq 31; then
service dropbear restart
elif test $x -eq 32; then
service openvpn restart
elif test $x -eq 33; then
	if [[ "$OS" = 'debian' ]]; then 
		service pptpd restart 
	else 
		service pptpd restart 
	fi
elif test $x -eq 34; then
service webmin restart
elif test $x -eq 35; then
	if [[ "$OS" = 'debian' ]]; then 
		service squid3 restart 
	else 
		service squid restart 
	fi
elif test $x -eq 36; then
edit-port
elif test $x -eq 37; then
auto-reboot
elif test $x -eq 38; then
reboot
elif test $x -eq 39; then
passwd
elif test $x -eq 40; then
log-install
elif test $x -eq 41; then
wget
else
echo "Pilihan Tidak Terdapat Di Menu."
exit
fi
