#! /usr/bin/bash
#Check if we are root/sudo
if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "Not running with sudo, Im going to exit now please rerun me with sudo"
    exit
fi
zypper --non-interactive update

#mkdir foldersetup
mkidr /home/peter/repos
cd /home/peter/repos
#Start of 1password install
rpm --import https://downloads.1password.com/linux/keys/1password.asc
zypper --non-interactive ar -C https://downloads.1password.com/linux/rpm/stable/x86_64 1password
zypper --non-interactive install 1password
#End of 1password

#Start install MSVSC
rpm --import https://packages.microsoft.com/keys/microsoft.asc
zypper --non-interactive ar -C https://packages.microsoft.com/yumrepos/vscode vscode
zypper refresh
zypper --non-interactive install code
#End install MSVSC


#Start of install apps with zypper
zypper --non-interactive install git
zypper --non-interactive install discord
zypper --non-interactive install qjackctl
zypper --non-interactive install python311
zypper --non-interactive install nodejs
zypper --non-interactive install npm

#su to peter and run git.sh
/bin/su -s /bin/bash -c './git.sh' peter





