set key autotitle
set xlabel "Static Node"
set ylabel "Number of Trace"
set key top right
set xtics rotate nomirror 0,1

plot "./break-temp.csv" u 2:1 t 'Reference Changes' w p

     
