set style data histogram
set style histogram clustered gap 1
set style fill solid 0.4 border
set xtics nomirror
set key top right
set ytics nomirror font ',10'
set xlabel "Time of day (hrs)"
set ylabel "Number of tourists in cave"
set xdata time
set format x "%H:%M"
set xrange[8*3600:20*3600]
set size 0.6,1

plot \
"./tourists.dat" u ($1*60):3 w boxes fs pattern 3 lc rgb "purple" title "Number of Tourists"
