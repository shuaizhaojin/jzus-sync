set size 0.4, 0.8
set key autotitle
set xlabel "Discovery latency (s)"
set ylabel "Fraction of discovery"
set key bottom right
set yrange [0:1]
set xrange [0:400]
set ytics 0.1


plot 'august-ind-5000-1-syn.dat' i 4 u ($2/1000000):(1./69239) smo cum ls 1 t "1%",\
     'august-ind-5000-67-syn-searchlight-strip.dat'  u ($2/1000000):(1./69239) smo cum ls 7 t "0.67%",\
     'august-ind-5000-50-syn-searchlight-strip.dat'  u ($2/1000000):(1./69239) smo cum ls 6 t "0.5%",\
     'august-ind-5000-40-syn-searchlight-strip.dat'  u ($2/1000000):(1./69239) smo cum ls 11 t "0.4%",\
     'august-ind-5000-33-syn-searchlight-strip.dat'  u ($2/1000000):(1./69239) smo cum ls 16 t "0.33%",\
     'august-ind-5000-25-syn-searchlight-strip.dat'  u ($2/1000000):(1./69239) smo cum ls 21 t "0.25%"
