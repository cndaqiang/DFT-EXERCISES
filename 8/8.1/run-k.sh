#!/bin/bash 
#-----system-----
#cubic Pt
#-----end system----


#-----parameter-----
WORKDIR=$(pwd) #workdir
INPUT=$WORKDIR/scf  #input dir name
RESULT=$WORKDIR/k2Energy #output file
RUNDIR=$WORKDIR/Ag-DOS-KPOINTS  #run dir
mkdir $RUNDIR
#A=$(seq 2.3 0.05 2.8 ) #a
K=( 1 2 3 4 5 6 7  8 9  10 11 12 13 14 15 16) #(5 7 9 10 11 12 13 14 15 16)
#-----End parameter-----


#-----init-----
source $HOME/intel/composer_xe_2015/bin/compilervars.sh intel64
source $HOME/intel/mkl/bin/intel64/mklvars_intel64.sh
source $HOME/intel/impi/5.0.1.035/bin64/mpivars.sh
EXEC=/home/cndaqiang/soft/intel15/vasp.5.4.1/build/std/vasp
#-----end init-----

#-----out file-----
cd $WORKDIR
#echo -e "k\tEnergy" > $RESULT  #
#-----end out file-----


#-----calculate-----
for a in ${K[@]}  #a kpoint
do
echo -e "k=$a"    #k
rundir=$RUNDIR/$a
cp -r $INPUT $rundir
cp $WORKDIR/INCAR  $rundir
sed -i "4s/14/$a/g"  $rundir/KPOINTS  #12 KPOINTS
cd $rundir
mpirun -np 35 $EXEC > rundetail
energy=$(grep "energy without entropy" $rundir/OUTCAR | tail -1 | awk '{printf"%12.6f \n",$5}')
echo -e "$a\t$energy" >> $RESULT
done
#-----End calculate-----



