#!/bin/bash 
#-----system-----
#cubic Pt
#-----end system----


#-----parameter-----
WORKDIR=$(pwd) #workdir
INPUT=$WORKDIR/INPUT #input dir name
RESULT=$WORKDIR/E2Energy #output file
RUNDIR=$WORKDIR/Pt-Fcc-ENCUT  #run dir
mkdir $RUNDIR
#A=$(seq 2.3 0.05 2.8 ) #a
#K=(5 7 9 11 12 13 14)
E=(200 250 275 300 325 350 400)
#-----End parameter-----


#-----init-----
source $HOME/intel/composer_xe_2015/bin/compilervars.sh intel64
source $HOME/intel/mkl/bin/intel64/mklvars_intel64.sh
source $HOME/intel/impi/5.0.1.035/bin64/mpivars.sh
EXEC=/home/cndaqiang/soft/intel15/vasp.5.4.1/build/std/vasp
#-----end init-----

#-----out file-----
cd $WORKDIR
echo -e "E\tEnergy" > $RESULT  #
#-----end out file-----


#-----calculate-----
for a in ${E[@]}  #E
do
echo -e "E=$a"    #k
rundir=$RUNDIR/$a
cp -r $INPUT $rundir
sed -i "10s/300/$a/g"  $rundir/INCAR #300 ENCUT
cd $rundir
mpirun -np 17 $EXEC > rundetail
energy=$(grep "energy without entropy" $rundir/OUTCAR | tail -1 | awk '{printf"%12.6f \n",$5}')
echo -e "$a\t$energy" >> $RESULT
done
#-----End calculate-----



