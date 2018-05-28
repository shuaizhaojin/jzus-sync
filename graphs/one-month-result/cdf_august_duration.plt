set size 0.4, 0.8
set xlabel "Duration in caves (s)"
set ylabel "Fraction"
set yrange [0:1]
set xrange [0:]
set ytics 0.1

plot "august.dat" u ($1/1000000):(1./69271) smo cum w l ls 1 notitle

