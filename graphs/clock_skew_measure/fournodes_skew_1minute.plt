set size 0.4, 0.8
set key autotitle
set xlabel "Time Elapsed (h)"
set ylabel "Relative Skew (ppm)"
set key right center
set xrange [0:13]

set label "Node 1" at graph 0.85, 0.85
set label "Node 2" at graph 0.85, 0.3
set label "Node 3" at graph 0.85, 0.15

plot "./node1_skew_final.txt" u (column(1)/60):(column(2)-0.8) not w p ls 1 pt 7 ps 0.5,\
     "./node4_skew_final.txt" u (column(1)/60):(column(2)) not w p ls 6 pt 7 ps 0.5,\
     "./node5_skew_final.txt" u (column(1)/60):(column(2)) not w p ls 11 pt 7 ps 0.5

     
