#!/bin/bash
#set -e
clear
tput sgr0
tput setaf 1
echo ''
echo '                          :                      :M'
echo '                         XMX                   .HMM>'
echo '                         MMMM.                dMMMM>'
echo '                        .MMMMMX     .....   dMMMMMMX'
echo '                        XMMMMMMMnMMMMMMMMMMMMMMMMMMM'
echo '                       :MMMMMMMMMMMMMMMMMMMMMMMMMMMM>'
echo '                       XMMMMM!"    "MMMMMM"`  `"MMMMM'
echo '                       MMMM#         4MMf        `MMMX'
echo '                      XMMM            MX          .MMM:'
echo '                     .MMM~            .>            MMM'
echo '                     MMMf       .     .>            `MMX'
echo '                    MMMM>     :MMM    .>   :MMM      MMMX'
echo '                   XMMMM      MMMM>   .>   XMMMX     MMMMk'
echo '                  MMMMMM>     MMMM~   .k   MMMMX     MMMMMh'
echo '                 MMMMMMMX     XMMM    XX   ?MMM     XMMMMMMM'
echo '                 MMMMMMMMk     ^`    X .h    `     :MM##MMM~'
echo '                  ?MM>  ^?M.       .!    %.      .HM"   MM'
echo '                 .?M      ."%+++!".nMMMMn "%++!*" %.. .M..'
echo '                  `?M>+%L         <MMMMMMMM>       :   XM"'
echo '                    .X   %        XMMMMMMMM>      X   .f'
echo '                      X   `M.      ?MMMMMM~    .HM   :`'
echo '                       %.  `MMMx.          .xHMMM   X'
echo '                  ..    `X  `MMMMMMMMMMMMMMMMMMM  :f'
echo '                :MMMMMMMh:.M. 4MM     "     MM" xMMMMMMMMMMh.'
echo '              :MMMMMMMMMMMMMMM: `%x.......x"`.HMMMMMMMMMMMMMM'
echo '            .MMMMMMMMMMMMMMMMMMMMhx.......xHMMMMMMMMMMMMMMMMM'
echo '    .nHMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM`MMMMMMMMMMMMMMMMX'
echo '  :MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMdMMMMMMMMMMMMMMMMMMMM'
echo ' MMMMMMMMMMMMMMMMMMMM"``""MMMMMMMMMMMM!MMMMMMMMMMMMMMMMMMMM~'
echo 'MMMMMMMMMMMMMMMMMMM!     XMMMMMMMMMMMf:HMMMMMMMMMMMMMMMMM!'
echo 'M?MMMMMMMMMMMMMMMM`    :MMMMMMMMMMMM!MMMMMMMMMMMMMMMMMMM~'
echo ':MMMMMMMMMMMMMMMMX     MMMMMMMMMMMMXXMMMMMMMMMMMMMMMMM`'
echo 'MMMMMMMMMMMMMMMMMX    .MMMMMMMMMMMMM!MMMMMMMMMMMMMMMMX'
echo 'MMMMMMMMMMMMMMMMM~    .MMMMMMMMMMMMMM?MMMMMMMMMMMMMMM~'
echo ' #M)MMMMMMMM!MMM       MMMMMMMMMMMMMMMM/MMMMMMMMMMMM~'
echo '   ?MMMMMM"-"2MMMMMx   XMMMMMMMMMMMMMMMMX?**!:MMM"`'
echo '     ^""    XMMMMMMMM  .MMMMMMMMMMM"`MMMMMMMMMMM>'
echo '           XMMMMMMMMML  MMMMMMMMMX .MMMMMMMMMMMf'
echo '           XMMMMMMMMMML 4MMMMMMMMMXMMMMMMMMMMM~'
echo '          XMMMMMMMMMMMMXMMMMMMMMMMXMMMMMMMMMx.'
echo '            MMMMMMMMMMMMM!MMMMMMMMMMLMMMMMMMMMMMMx'
echo '             #MMMMMMMMMMMMMMMMMMMMMMM!MMMMMMMMMMMMM'
echo '              `MMMMMMMMMMMLMMMMMMMMMMM/MMMMMMMMMMMM>'
echo '                 `*MMMMM!nMMMMMHh(?*MMM?MMMMMMMMMMM>'
echo '                       XMMMMMMMMMMMMMMMX4MMMMMMMMMM'
echo '                      XM#     `*MMMMMMMMXMMMMMMMM"'
echo '                     .M          `MMMMMMMX^"*""'
echo '                     Xf            !?MMMMMM'
echo '                     .X             X ?MMMMM'
echo '                      !             `> `MMMMX'
echo '                       #:     4     X>  .MMMM>'
echo '                        `L     "x.xM~    `MMMX'
echo '                          %.    f         MMMX'
echo '                           `#M``         :MMM~'
echo '                              `Mx.      dMMM~'
echo '                                 ``"**MM*"'
echo ''
tput sgr0

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Function ( PAUSE )
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function pause() {
 read -s -n 1 -p "Press any key to continue . . ."
 echo ""
}
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Function ( Firmware Update )
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
func_firmware_update () {
    sudo rpi-update
}
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Function ( upgrade )
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
func_update () {
    sudo apt update
    sudo apt -y upgrade
    sudo apt-get dist-upgrade
    sudo apt-get autoclean
    sudo apt-get autoremove
    sudo apt-file update
}
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Function ( pihole upgrade )
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
func_pihole_update () {
    sudo pihole -up
    sudo pihole -g
}
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Function ( install or not )
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
func_install_or_not() {
 if apt list $1 &> /dev/null; then
     tput sgr0
     tput setaf 1
     echo "--------------------------------------------------------------"
     tput setaf 2
     echo " The package "$1" is already installed"
   # tput sgr0
 else
     tput sgr0
     tput setaf 1
     echo "--------------------------------------------------------------"
     tput setaf 3
     echo " Installing "$2" package "$1
    tput sgr0
     $2 $1
 fi
}
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Function ( install mit apt )
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
func_install_apt() {
tput sgr0
echo "*******************************************************************"
echo "Install mit apt "${1}
echo "*******************************************************************"
   sudo apt -y install $1
}
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Function ( install mit wget )
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
func_install_wget() {
tput sgr0
echo "*******************************************************************"
echo "Install mit wget "${1}
echo "*******************************************************************"
   cd /tmp
   rm -rf "${1}"
   # Скачивание исходников.
   wget http://www.deb-multimedia.org/pool/non-free/w/w64codecs/"${1}".deb
   # Переход в "${1}".
   cd "${1}"
   dpkg -i ./*.deb*
   cd ..
}
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Liste of apt software
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
tput sgr0
echo "*******************************************************************"
echo " Liste of apt software "
echo "*******************************************************************"
list_apt=(
wget
git
pv
ufw
mc
p7zip-full
rpi-update
apt-file
progress
)

count=0

for name in "${list_apt[@]}" ; do
	count=$[count+1]
	func_install_or_not $name func_install_apt
done
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
tput sgr0



# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Liste of wget software
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
tput sgr0
echo "*******************************************************************"
echo " Liste of wget software "
echo "*******************************************************************"

list_wget=(
)

count=0

for name in "${list_apk[@]}" ; do
    count=$[count+1]
    func_install_or_not $name func_install_wget
done
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
tput sgr0


func_update
func_pihole_update
# func_firmware_update

tput sgr0
tput setaf 1
echo "*******************************************************************"
tput sgr0
tput setaf 8
echo " All packages installed"

tput setaf 11
echo " Reboot your system with ENTER"
tput sgr0
tput setaf 1
echo "*******************************************************************"
tput sgr0

# pause

sudo reboot
