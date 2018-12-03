#!/bin/bash 
#-----system-----
#fcc Pt
#-----end system----


#-----parameter-----
WORKDIR=$(pwd) #workdir
INPUT=$WORKDIR/INPUT #input dir name
RESULT=$WORKDIR/a2Energy #output file
RUNDIR=$WORKDIR/Pt-fcc  #run dir
mkdir $RUNDIR
A=$(seq 3.7 0.05 4.2 ) #a
#-----End parameter-----


#-----init-----
source $HOME/intel/composer_xe_2015/bin/compilervars.sh intel64
source $HOME/intel/mkl/bin/intel64/mklvars_intel64.sh
source $HOME/intel/impi/5.0.1.035/bin64/mpivars.sh
EXEC=/home/cndaqiang/soft/intel15/vasp.5.4.1/build/std/vasp
#-----end init-----

#-----out file-----
cd $WORKDIR
echo -e "a\tEnergy" > $RESULT
#-----end out file-----


#-----calculate-----
for a in ${A[@]}
do
echo -e "a=$a"
rundir=$RUNDIR/$a
cp -r $INPUT $rundir
sed -i "2s/3.976771/$a/g"  $rundir/POSCAR
cd $rundir
mpirun -np 17 $EXEC > rundetail
energy=$(grep "energy without entropy" $rundir/OUTCAR | tail -1 | awk '{printf"%12.6f \n",$5}')
echo -e "$a\t$energy" >> $RESULT
done
#-----End calculate-----



