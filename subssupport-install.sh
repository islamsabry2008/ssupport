#!/bin/sh
##setup command=wget -q "--no-check-certificate" https://github.com/popking159/ssupport/raw/main/subssupport-install.sh -O - | /bin/sh
######### Only These two lines to edit with new version ######
#version='1.7.0.26'
#description='add Indexsubtitle and Moviesubtitles providers \n add another provider for yify subtitles "Subsyts" \n more adjustment for fixed background'
##############################################################
echo ''
echo '************************************************************'
echo "**                       STARTED                          **"
echo '************************************************************'
echo "**                  Uploaded by: MNASR                    **"
echo "************************************************************"
echo "**                 SubsSupport v1.7 r26                   **"
echo "************************************************************"
echo "************************************************************"
sleep 3s

if [ -d /usr/lib/enigma2/python/Plugins/Extensions/SubsSupport ]; then
echo "> removing package please wait..."
sleep 2s 
rm -rf /usr/lib/enigma2/python/Plugins/Extensions/SubsSupport > /dev/null 2>&1
fi

status='/var/lib/opkg/status'
package='enigma2-plugin-extensions-subssupport'

if grep -q $package $status; then
opkg remove $package > /dev/null 2>&1
fi

sleep 2s

echo "downloading SubsSupport..."
wget -O  /var/volatile/tmp/SubsSupportcore.tar.gz https://github.com/popking159/ssupport/raw/main/SubsSupportcore.tar.gz
echo "Installing SubsSupport..."
tar -xzf /var/volatile/tmp/SubsSupportcore.tar.gz -C /
rm -rf /var/volatile/tmp/SubsSupportcore.tar.gz > /dev/null 2>&1
sleep 2s
if [ -d /usr/lib/enigma2/python/Plugins/SystemPlugins/NewVirtualKeyBoard ]; then
wget -O  /var/volatile/tmp/subtitles.py https://raw.githubusercontent.com/popking159/ssupport/refs/heads/main/subtitles.py
mv /var/volatile/tmp/subtitles.py /usr/lib/enigma2/python/Plugins/Extensions/SubsSupport/subtitles.py
fi
sync
echo "#########################################################"
echo "#########################################################"
echo "Installing dependency files"
opkg install python3-codecs python3-compression python3-core python3-difflib python3-json python3-requests python3-xmlrpc unrar python3-beautifulsoup4


# ============================================================================================================
sleep 2
sync
echo "==================================================================="
echo "===                          FINISHED                           ==="
echo "===                      Modded by MNASR                        ==="
echo "==================================================================="
sleep 2
echo "==================================================================="
echo "===                        Restarting                           ==="
echo "==================================================================="

killall -9 enigma2
exit 0
