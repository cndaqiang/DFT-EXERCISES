S=18.6966756*2
MILE=110
Ebulk=-3.7286165
DIR=$(pwd)
N=(0 15 16)
for i in 1 2
do
dir=$DIR/$i
#ssenergy=$(cat $dir-ss/OUTCAR |grep "TOTEN" | tail -1 | awk '{printf"%12.6f \n",$5}') # dan dian
sfenergy=$(cat $dir/OUTCAR |grep "TOTEN"| tail -1 | awk '{printf"%12.6f \n",$5}') #surface
ssenergy=$sfenergy
#cat $dir/OUTCAR 
#echo "scale=7;(1/2*($ssenergy-$j*$Ebulk)+($sfenergy-$ssenergy))/${S[i]}"
SE=$(echo "scale=7;(1/2*($ssenergy-${N[$i]}*$Ebulk)+($sfenergy-$ssenergy))/$S" | bc)
echo -e "$i\t$SE"
done

