#!/bin/bash

addEleNAtHere=0.0

if [ -f "./CONTCAR" ];then
mkdir conCal && cp CONTCAR ./conCal/last.vasp && if [ -f WAVECAR ];then mv WAVECAR ./conCal/;fi && cd conCal
fi

strName=`ls *.vasp *.xsd *.cif POSCAR CONTCAR 2>/dev/null |sed "s/other.xsd//g"`

cat > aseRunVasp.py << \EOF
#!/usr/bin/env python
import os
import time
from ase.io import read, write
from ase.calculators.vasp import Vasp

addN="$addEleAtHere"
strName="$strNameAtHere"

startTime = time.time()
struc = read(strName)

os.environ["VASP_PP_PATH"] = "~/scripts/pseDir"
os.environ["ASE_VASP_COMMAND"] = "~/scripts/runVasp.sh vasp_gam"

ifFixAtomPosition = False
if ifFixAtomPosition:
  from ase.constraints import FixAtoms

  #fracM=0.2
  #bL=struc.cell.cellpar()[1]
  #b = FixAtoms(indices=[atom.index for atom in struc if atom.position[1]/bL <= fracM and atom.symbol == "C"])
  #c = FixAtoms(indices=[atom.index for atom in struc if atom.symbol == "S" or atom.symbol == "Mo"])
  #c = FixAtoms(indices=[i.index for i in struc if ((i.symbol == struc2[i.index].symbol) and (i.x == struc2[i.index].x) and (i.y == struc2[i.index].y) and (i.z == struc2[i.index].z)) ])

  if "arm" in "'$strName'":
    list=[i.b for i in struc if i.symbol == "C"]
    print("arm(b):", list)
    c = FixAtoms(indices=[ i.index for i in struc if i.symbol == "C" and (i.b > 0.75 or i.b < 0.25 ) ])
  else:
    list=[i.a for i in struc if i.symbol == "C"]
    print("zig(a):", list)
    c = FixAtoms(indices=[ i.index for i in struc if i.symbol == "C" and (i.a > 0.75 or i.a < 0.25 ) ])

  struc.set_constraint(c)

ifFixLatticeVector = False
if ifFixLatticeVector:
  with open("OPTCELL", "w") as f:
    f.write("111\n")
    f.write("111\n")
    f.write("110\n")

# magmom
ifSetSpin = True
if ifSetSpin:
  [ i.set("magmom", 1.0) for i in struc if i.symbol == "Fe" or i.symbol == "Co" ]
  [ i.set("magmom", 0.0) for i in struc if not ( i.symbol == "Fe" or i.symbol == "Co") ]

# kpoint
separation = 0.04
Kpoint=[]
for i in struc.get_cell().reciprocal().lengths()/separation:
  K_i = int(i) if int(i)+0.5 > i else int(i)+1
  K_i = 1 if K_i < 1 else K_i
  Kpoint.append(K_i)
#Kpoint=[3,3,1]
#Kpoint[-1]=1
#Kpoint=[1]*3
print("k-point set as:", Kpoint)

# set vasp
calc = Vasp(setups="recommended",
             directory="./",
             txt = "def.out",
             xc="PBE",
             kpar = 1, npar = 2,
             kpts=Kpoint,
             prec="Accurate",
             encut=500, ediff=1E-6, ediffg=-2E-2,
             ispin=2,
             ivdw=11,
             ismear=0, sigma=0.05,
             isif=2,
             nsw=60,
             ibrion=2,
             potim=0.5,
             lwave=True, lcharg=False,
             gamma=True,
             algo="Fast",
             lorbit=11,
             charge=-addN,
);outName="def.out"

struc.calc = calc

calc.set(txt="pro.out", encut=500, ediff=1E-6,ediffg=-1E-2,kpar=1,npar=2,ispin=2,algo="Fast",ibrion=2,lreal="Auto");outName="pro.out"

#calc.set(txt="setU.out", ldau=True, ldautype=2, ldaul=[2, -1, -1],ldauu=[3.9, 0, 0], ldauj=[0, 0, 0], lmaxmix=4);outName="setU.out"

#calc.set(txt="opt.out",nsw=100,potim=0.2,isif=3,lreal=".FALSE.");outName="opt.out"
#calc.set(txt="rex.out",nsw=200,potim=0.2,isif=2, ediffg=-1E-2, isym=0);outName="rex.out"
#calc.set(txt="bader.out",laechg=True,lcharg=True,nsw=0,ibrion=-1);outName="bader.out"
#calc.set(txt="sol.out",lsol=True,nsw=200, ibrion=1, potim=0.5);outName="sol.out"
calc.set(txt="aimd.out",encut=500,kpts=[1]*3,ibrion=0,nsw=10000,npar=2,potim=0.5,nelmin=6,
         nelm=120,ediff=1E-6,isif=2,mdalgo=2,smass=2,tebeg=300,lwave=False,isym=0);outName="aimd.out"
#calc.set(pomass)
#calc.set(txt="med.out",encut=200,nsw=60,potim=0.6,prec="Normal",kpts=[j+1 if j==0 else j for j in [int(i/2) for i in Kpoint]]);outName="med.out"

finalE = struc.get_potential_energy()

with open(outName, "r") as f:
        allContent = f.read()
        if "reached required accuracy" in allContent:
            print("Calculation succeeded!")
            write("relaxedStr.cif", read("./CONTCAR"))
            os.system("rm WAVECAR")
        else:
            print("Calculation failed!")
            write("unConverStr.cif", read("./CONTCAR"))

usedT = time.time() - startTime

print(f"final energy is {finalE}eV, using time {usedT}s.")


EOF


r= ; sed -i "s//$r/g" aseRunVasp.py
r= ; sed -i "s//$r/g" aseRunVasp.py