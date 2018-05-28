set size 0.4, 0.8
set key autotitle
set xlabel "Discovery latency (s)"
set ylabel "Fraction of discoveries"
set key bottom right
set xrange [-10:350]

plot "./august-ind-5000-1-dcs.dat" i 2 u (column(2)/1000000.0):(($0+1)/69271) t col(1) w l ls 1,\
     "" i 4 u (column(2)/1000000.0):(($0+1)/69271) t col(1) w l ls 11,\
     "" i 3 u (column(2)/1000000.0):(($0+1)/69271) t col(1) w l ls 17,\
     "" i 0 u (column(2)/1000000.0):(($0+1)/69271) t col(1) w l ls 6,\
     "" i 1 u (column(2)/1000000.0):(($0+1)/69271) t col(1) w l ls 16

     
