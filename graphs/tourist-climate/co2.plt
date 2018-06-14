set xlabel "Time of day (hrs)"
set ylabel "Carbon Dioxide (ppm)"
set key top right
set xdata time
set format x "%H:%M"
set xrange[8*3600:20*3600]
set yrange[400:1200]
set size 0.6,0.8
set ytics font 'Helvetica,10'
set xtics nomirror
set ytics nomirror
set y2tics
set y2label "Number of Tourists"



plot "./co2-final.dat" u ($1*60):3 not w l ls 1,\
"./tourists.dat" u ($1*60):3 axes x1y2 w boxes fs pattern 3 lc rgb "purple" title "Number of Tourists"
