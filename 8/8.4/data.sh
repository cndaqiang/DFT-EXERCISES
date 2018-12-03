DIR=$(pwd) 
echo -e "atom\tno\tspin\tAFM" > result
echo -e "atom\tno\tspin\tAFM" > energy
for i in Co   MnBi   MnF2  
do
no=$(sed -n "3, 1p" $DIR/$i/CONTCAR |awk '{print $1}')
noe=`grep "TOTEN" $DIR/$i/OUTCAR | tail -1|awk '{printf"%12.6f \n",$5}'`

spin=$(sed -n "3, 1p" $DIR/$i-ISPIN/CONTCAR |awk '{print $1}')
se=`grep "TOTEN" $DIR/$i-ISPIN/OUTCAR | tail -1|awk '{printf"%12.6f \n",$5}'`

afm=$(sed -n "3, 1p" $DIR/$i-ISPIN-AFM/CONTCAR |awk '{print $1}')
afme=`grep "TOTEN" $DIR/$i-ISPIN-AFM/OUTCAR | tail -1|awk '{printf"%12.6f \n",$5}'`

echo -e "$i\t$no\t$spin\t$afm" >> result
echo -e "$i\t$noe\t$se\t$afme" >> energy
done



