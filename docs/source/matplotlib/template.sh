#!/bin/bash

# python
pyDir=`cat ~/scripts/envsDir |grep asePyDir|awk '{print $2}'` && pyDir=`eval ls $pyDir`

# download directory
dnDir=`cat ~/scripts/envsDir |grep dnDir|awk '{print $2}'`    && dnDir=`eval cd $dnDir && pwd`

# save name
n=`pwd|xargs basename` && exName=ex_`pwd|sed "s/$n//g"|xargs basename`_${n}

# data pre-processing

cat > runplot.py <<\EOF


# data pre-processing


# matplot setting



EOF

$pyDir runplot.py
rm runplot.py

mv ${exName}*$dnDir

