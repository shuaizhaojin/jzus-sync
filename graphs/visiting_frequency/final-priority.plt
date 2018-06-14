set boxwidth 0.5 absolute
set style fill pattern border
set style histogram clustered gap 1
#set xtics rotate nomirror
set xrange[0:11]
set yrange[0:60]
set key top right
set ytics nomirror font ',10'
set xlabel "Static Nodes in Mock-up Scenario"
set ylabel "Priority (min)"
set xtics ("S1" 1,"S2" 2,"S3" 3,"S4" 4,"S5" 5,"S6" 6,"S7" 7,"S8" 8,"S9" 9,"S10" 10)
set size 0.6,1

plot "./final-priority-1.dat" u 1:($2/60000.0) w boxes fs pattern 3 lc rgb "purple" title "Final Priority"
