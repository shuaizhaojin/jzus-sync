set size 0.4, 0.8
set key autotitle
set xlabel "Discovery latency (s)"
set ylabel "Fraction of discoveries"
set key bottom right
#set xrange [0:350]

plot "WithMASS-CDF.dat" u (column(3)/2.0):(($0+1)/102) t 'Simul w MASS' w l ls 1,\
     "syn.dat" u (column(2)/1000000.0):(($0+1)/271) t 'Mockup w MASS' w l ls 5,\
     "NoMASS-cdf.dat" u (column(3)/2.0):(($0+1)/102) t 'Simul' w l ls 2,\
     "orig.dat" u (column(2)/1000000.0):(($0+1)/271) t 'Mockup' w l ls 6

     
