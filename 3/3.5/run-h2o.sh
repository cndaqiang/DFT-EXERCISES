#!/bin/bash 
#-----system-----
#
#-----end system----


#-----parameter-----
WORKDIR=$(pwd) #workdir
INPUT=$WORKDIR/INPUT_h2o #input dir name
RESULT=$WORKDIR/structure_h2o #output file
RUNDIR=$WORKDIR/h2o  #run dir
mkdir $RUNDIR
#A=$(seq 2.3 0.05 2.8 ) #a
A=(0 0.3 0.6 0.8)       #xin can shu H(11 a 0)
OLD=h    #ti huan can shu
#-----End parameter-----


#-----init-----
source $HOME/intel/composer_xe_2015/bin/compilervars.sh intel64
source $HOME/intel/mkl/bin/intel64/mklvars_intel64.sh
source $HOME/intel/impi/5.0.1.035/bin64/mpivars.sh
EXEC=/home/cndaqiang/soft/intel15/vasp.5.4.1/build/std/vasp
#-----end init-----

#-----out file-----
cd $WORKDIR
echo -e "a\tEnergy" > $RESULT  #
#-----end out file-----


#-----calculate-----
for a in ${A[@]}  #bu bian
do
echo -e "A=$a"    #bu bian
rundir=$RUNDIR/$a
cp -r $INPUT $rundir
sed -i "10s/$OLD/$a/g"  $rundir/POSCAR #10 300 ENCUT
cd $rundir
mpirun -np 17 $EXEC > rundetail
energy=$(grep "energy without entropy" $rundir/OUTCAR | tail -1 | awk '{printf"%12.6f \n",$5}')
echo -e "$a\t$energy" >> $RESULT
done
#-----End calculate-----



