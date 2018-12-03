dir=$(pwd)
cd /home/cndaqiang/work/vasp/DFT-homework/4/4.5-0.25/hcp
echo "$(pwd)" > $dir/runtail
runvasp 35
cd /home/cndaqiang/work/vasp/DFT-homework/4/4.6/Pt-OH-H-fcc
echo "$(pwd)" > $dir/runtail
runvasp 35
 

