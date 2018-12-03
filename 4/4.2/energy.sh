S=(7.940560 11.229613 6.876727)
MILE=(100 110 111)
Ebulk=-6.045927275
DIR=$(pwd)
for i in 0  1 2
do
for j in 5 6  7 8 
do
dir=$DIR/${MILE[$i]}/$j
ssenergy=$(cat $dir-ss/OUTCAR |grep "TOTEN" | tail -1 | awk '{printf"%12.6f \n",$5}') # dan dian
sfenergy=$(cat $dir/OUTCAR |grep "TOTEN"| tail -1 | awk '{printf"%12.6f \n",$5}') #surface
#cat $dir/OUTCAR 
#echo "scale=7;(1/2*($ssenergy-$j*$Ebulk)+($sfenergy-$ssenergy))/${S[i]}"
SE=$(echo "scale=7;(1/2*($ssenergy-$j*$Ebulk)+($sfenergy-$ssenergy))/${S[i]}" | bc)
echo -e "${MILE[$i]}\t$j\t$SE"
done
done


