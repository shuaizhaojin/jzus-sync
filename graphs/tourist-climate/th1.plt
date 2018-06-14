set xlabel "Time of day (hrs)"
set ylabel "Temperature (Celsius)"
set key top right
set xdata time
set format x "%H:%M"
set xrange[8*3600:20*3600]
set yrange[16:19]
set size 0.6,1
set ytics font 'Helvetica,10'
set xtics nomirror
set ytics nomirror

plot "./th1-final.dat" u ($1*60):3 not w l ls 1


