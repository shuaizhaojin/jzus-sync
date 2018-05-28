set size 0.4, 0.8
set xlabel "Elapsed time (h)"
set ylabel "Clock drift (ms)"
set key left
set xrange[0:15]
set yrange[0:130]

set xtics 5
set mxtics 5

set ytics 20
set mytics 4

plot "cdc.csv" u ($1/1000/60/60):($2-$1) t "No compensation" w l ls 1,\
           ""  u ($1/1000/60/60):($3-$1) t "With compensation" w l ls 2
           
