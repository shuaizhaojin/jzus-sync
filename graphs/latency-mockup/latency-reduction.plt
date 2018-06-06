set size 0.4, 0.8
set key autotitle
set xlabel "Discovery latency (s)"
set ylabel "Fraction of discoveries"
set key bottom right
#set xrange [0:350]

plot "WithMASS-cdf.dat" u 3:(($0+1)/102) t 'With MASS' w l ls 1,\
     "NoMASS-cdf.dat" u 3:(($0+1)/102) t 'Searchlight' w l ls 5

     