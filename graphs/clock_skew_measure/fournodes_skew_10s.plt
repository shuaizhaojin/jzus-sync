set key autotitle
set xlabel "Time Elapsed (h)"
set ylabel "Relative Clock Skew (ppm)"
set key center right


plot "./Four_nodes_skew.txt" using (column(1)/360):2 title ' node1' with l ls 1,\
    "" u (column(1)/360):4 t 'node2' w l ls 6,\
    "" u (column(1)/360):5 t 'node3' w l ls 11
