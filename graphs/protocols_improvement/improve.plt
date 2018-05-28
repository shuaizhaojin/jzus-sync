set size 0.4, 0.8
set key bottom right
set xlabel "Duty cycle (%)"
set ylabel "Improvement"
set yrange [0:]
set xrange [0.4:]
set logscale x
set xtics add (0.5, 2,3,4,5,6,7,8,9)

plot "./four_protocols.dat" using 1:(($2-$6)/$2) t 'Disco' w lp ls 1,\
     "./four_protocols.dat" u 1:(($3-$7)/$3) t 'U-Connect' w lp ls 6,\
     "./four_protocols.dat" u 1:(($4-$8)/$4) t 'BlindDate' w lp ls 11,\
     "./four_protocols.dat" u 1:(($5-$9)/$5) t 'Searchlight-S' w lp ls 16
 
