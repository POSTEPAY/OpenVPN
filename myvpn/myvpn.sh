#!/bin/sh
rm -rv /etc/openvpn >/dev/null 2>&1
mkdir -p /etc/openvpn
echo "downloading OpenVPN"
cd /var && cd /var/volatile && cd /var/volatile/tmp && wget -O /var/volatile/tmp/openvpn_2.4.3-r0.1_cortexa15hf-neon-vfpv4.ipk "https://github.com/davesayers2014/OpenVPN/blob/master/openvpn_2.4.3-r0.1_cortexa15hf-neon-vfpv4.ipk?raw=true" &> /dev/null 2>&1
echo "Installing OpenVPN" 
opkg --force-reinstall --force-overwrite install openvpn_2.4.3-r0.1_cortexa15hf-neon-vfpv4.ipk &> /dev/null 2>&1
cd
wget -O /etc/openvpn/mpnvpn.conf "https://mypn.co/files/linux/mpnvpn.ovpn" &> /dev/null && chmod 777 /etc/openvpn/mpnvpn.conf && /etc/openvpn/mpnvpn.conf &> /dev/null 2>&1
wget -O /etc/openvpn/user.txt "https://mypn.co/files/linux/user.txt" &> /dev/null 2>&1
echo "Configuring OpenVPN"
sed -i -e 's/USERNAME/yyyy'/g /etc/openvpn/user.txt;sed -i -e 's/PASSWORD/pppp'/g /etc/openvpn/user.txt && chmod 777 /etc/openvpn/user.txt && /etc/openvpn/user.txt &> /dev/null
sed -i -e 's/COUNTRY/country'/g /etc/openvpn/mpnvpn.conf && chmod 777 /etc/openvpn/mpnvpn.conf && /etc/openvpn/mpnvpn.conf &> /dev/null
exit 1
fi
