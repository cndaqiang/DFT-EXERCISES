DIR=$(pwd) 
for i in N-N  N-N-SPIN  O-C  O-C-SPIN  O-O  O-O-SPIN ; do cd $DIR/$i; runvasp 35 ;done
