set size 0.4, 0.8
set key autotitle
set xlabel "Discovery latency (s)"
set ylabel "Fraction of discoveries"
set key bottom right
set yrange [0:1]
set ytics 0.1

plot "./august-ind-5000-1-syn.dat" i 4 u (column(2)/1000000.0):(($0+1)/69271) t "MASS with compensation" w l ls 1,\
     "./august-ind-5000-1-anc-searchlight-strip.dat" u (column(2)/1000000.0):(($0+1)/69271) t "MASS w/o compensation" w l ls 11,\
     "./august-ind-5000-1-dcs.dat" i 4 u (column(2)/1000000.0):(($0+1)/69271) t "DCS" w l ls 16,\
     "./august-ind-5000-1-orig.dat" i 4 u (column(2)/1000000.0):(($0+1)/69271) t "Original" w l ls 6

     
