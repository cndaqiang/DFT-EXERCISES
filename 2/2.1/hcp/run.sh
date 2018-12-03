#!/bin/bash 
#-----system-----
#hcp
#-----end system----


#-----parameter-----
WORKDIR=$(pwd) #workdir
INPUT=$WORKDIR/INPUT #input dir name
RESULT=$WORKDIR/a2c2Energy #output file
RUNDIR=$WORKDIR/Pt-hcp  #run dir
mkdir $RUNDIR
A=$(seq 2.70 0.05 3.2 ) #a
C=(1.76 1.78 ) #(1.60 1.633 1.66 1.70 1.74) #c
#-----End parameter-----


#-----init-----
source $HOME/intel/composer_xe_2015/bin/compilervars.sh intel64
source $HOME/intel/mkl/bin/intel64/mklvars_intel64.sh
source $HOME/intel/impi/5.0.1.035/bin64/mpivars.sh
EXEC=/home/cndaqiang/soft/intel15/vasp.5.4.1/build/std/vasp
#-----end init-----

#-----out file-----
cd $WORKDIR
#echo -e "a\tc\tEnergy" > $RESULT
#-----end out file-----


#-----calculate-----
for c in ${C[@]}
do
for a in ${A[@]}
do
echo -e "a=$a\tc=$c"
rundir=$RUNDIR/$a-$c
cp -r $INPUT $rundir
sed -i "2s/2.635/$a/g"  $rundir/POSCAR
sed -i "5s/1.59/$c/g"  $rundir/POSCAR
cd $rundir
mpirun -np 17 $EXEC > rundetail
energy=$(grep "energy without entropy" $rundir/OUTCAR | tail -1 | awk '{printf"%12.6f \n",$5}')
echo -e "$a\t$c\t$energy" >> $RESULT
done
done
#-----End calculate-----



