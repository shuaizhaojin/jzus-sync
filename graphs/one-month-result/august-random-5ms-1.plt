set size 0.4, 0.8
set key autotitle
set xlabel "Discovery latency (s)"
set ylabel "Fraction of discoveries"
set key bottom right
set yrange [0:1]
set ytics 0.1

plot "./random-ind-5000-1-syn.dat" i 2 u ($2/1000000.0):(1./13773) t "Searchlight-S w MASS" w l ls 1 smo cum,\
     "" i 1 u ($2/1000000.0):(1./13773) t "BlindDate w MASS" w l ls 7 smo cum,\
     "" i 0 u ($2/1000000.0):(1./13773) t "Disco w MASS" w l ls 12 smo cum,\
     "./random-ind-5000-1-orig.dat" i 2 u ($2/1000000.0):(1./13773) t col(1) w l ls 2 smo cum,\
     "" i 1 u ($2/1000000.0):(1./13773) t col(1) w l ls 6 smo cum,\
     "" i 0 u ($2/1000000.0):(1./13773) t col(1) w l ls 11 smo cum

     
