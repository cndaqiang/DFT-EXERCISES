releax=( 2x2_4_releax  3_releax)
fugailv=( 0.25 0.33 )
weizhi=( 1-top  2-qiao  fcc  hcp )
EO=`grep "TOTEN" O/OUTCAR | tail -1|awk '{printf"%12.6f \n",$5}'`

for i in  0 1 
	do
	echo ${releax[$i]}
	Eslab=`grep "TOTEN" ${releax[$i]}/OUTCAR | tail -1|awk '{printf"%12.6f \n",$5}'`
	for j in ${weizhi[@]}
		do
		EOS=`grep "TOTEN" ${fugailv[$i]}/$j/OUTCAR | tail -1|awk '{printf"%12.6f \n",$5}'`
		XE=$(echo  -e "scale=7;$EOS-$EO-$Eslab" | bc)
		echo  -e "${fugailv[$i]}\t$j\t${XE}"
	done
done	
		
