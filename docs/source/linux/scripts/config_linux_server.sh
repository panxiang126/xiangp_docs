#!/bin/bash

#####################
# server name, eg: nj nb nb2 lx
# Replace as appropriate!
n=""
#####################

if [[ "xp${n}px" == "xppx" ]]; then
echo "please give the n variable the name of the server."
exit
fi


## script
mkdir -p ~/scripts
cd ~/scripts

echo $n > AccountIdentification

echo '#!/bin/bash
echo $1 | sed "s/--/+/g"| sed "s/++/+/g"| bc -l | sed "s/^\./0\./g"|sed "s/^-\./-0\./g"
' > c
chmod +x c


## bashrc
if [ ! -f ~/.bashrc_xiangpan_ini ];then cp ~/.bashrc ~/.bashrc_xiangpan_ini;fi
cp ~/.bashrc ~/.bashrc_xiangpan_`date +%Y%m%d%H%M%S`
cp ~/.bashrc_xiangpan_ini ~/.bashrc

h=`cd ~ && pwd |sed "s/\//XPSPPX/g"`
echo '
LANG=en_US.utf8
LC_ALL=en_US.utf8

PS1="['$n'_\u@\h \W]\$ "

export accouIdent=`cat ~/scripts/AccountIdentification`

#pan scripts
export PATH="XPHOMENAMEPX/scripts:$PATH"
'| sed "s/XPHOMENAMEPX/$h/g"|sed "s/XPSPPX/\//g" >> ~/.bashrc


## downDir
cd ~/scripts
mkdir -p ~/downDir_`cat ~/scripts/AccountIdentification`
echo '#!/bin/bash

cd ~/downDir_`cat ~/scripts/AccountIdentification`
myDate=`date +%Y%m%d%H%M%S` && mkdir tmp_${myDate}
mv * ./tmp_${myDate} 2>/dev/null && cd -

if [ xp"$1"px == "xp-dpx" ];then
rm ~/downDir_`cat ~/scripts/AccountIdentification`/* -rf
fi '> CN
chmod +x CN


## envDir
cd ~/scripts
echo 'asePyDir $HOME/app/miniconda3/installDir/envs/ase/bin/python
dpPyDir $HOME/app/miniconda3/installDir/envs/deepmd_cpu/bin/python
dnDir $HOME/downDir_$accouIdent

sourceFiledp_cpu $HOME/scripts/deepmd_cpu
sourceFiledp_gpu $HOME/scripts/deepmd_gpu
' > envsDir



# pyDir=`cat ~/scripts/envsDir |grep asePyDir|awk '{print $2}'` && pyDir=`eval ls $pyDir`
# dnDir=`cat ~/scripts/envsDir |grep dnDir|awk '{print $2}'`    && dnDir=`eval cd $dnDir && pwd`





