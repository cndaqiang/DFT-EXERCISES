DIR=$(pwd) 
echo -e "atom\tno\tspin" > result
for i in N-N   O-C   O-O   
do
no=$(sed -n "11, 1p" $DIR/$i/CONTCAR |awk '{print $1}')
spin=$(sed -n "11, 1p" $DIR/$i-SPIN/CONTCAR |awk '{print $1}')
echo -e "$i\t$no\t$spin" >> result
done



