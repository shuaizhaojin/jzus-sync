
set style data histogram
set style histogram clustered gap 1
set style fill solid 0.4 border
set xtics rotate nomirror
set key top left
set ytics nomirror font ',10'
set xlabel "Caves at Mogao Grottoes"
set ylabel "Average Inter-arrival Time (min)"
set size 0.6,1

plot \
"./visiting_frequency_81.dat" using (column(5)/60):xticlabel(1) title "Average Inter-Arrival Time",\
'' u (column(6)/60):xticlabel(1) t "Corresponding Priority" 
