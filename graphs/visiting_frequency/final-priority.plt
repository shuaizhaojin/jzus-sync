
set style data histogram
set style histogram clustered gap 1
set style fill solid 0.4 border
#set xtics rotate nomirror
set key top left
set ytics nomirror font ',10'
set xlabel "Static Nodes in Mock-up Scenario"
set ylabel "Priority"
#set xtics ("S1" 1,"S2" 2,"S3" 3,"S4" 4,"S5" 5,"S6" 6,"S7" 7,"S8" 8,"S9" 9,"S10" 10)
set size 0.6,1

plot \
"./final-priority.dat" using (column(2)/60000.0):xticlabels(1) title "Final Priority"
