workdir=$(pwd)
for i in   100 110 111
do
for j in   5 6 # 8 7-ss   # 8 #5 6 7 8
do
echo -e "$i\t$j" >>  $workdir/rundetail
cp $workdir/INCAR $workdir/$i/$j
cd $workdir/$i/$j
runvasp 35
echo -e "$i\t$j-ss" >>  $workdir/rundetail
cp $workdir/INCAR $workdir/$i/$j-ss
cd $workdir/$i/$j-ss
runvasp 35
done
done

