set xlabel "Time of day (hrs)"
set ylabel "Static Node"
set key top right
set xdata time
set format x "%H:%M"
set xrange[7*3600:18*3600]
set yrange[0.5:12.5]
set size 0.5,1.3
set ytics font 'Helvetica,10'
set xtics nomirror
set ytics nomirror
set ytics ("S1" 1,"S2" 2,"S3" 3,"S4" 4,"S5" 5,"S6" 6,"S7" 7,"S8" 8,"S9" 9,"S10" 10)

#set xtics ("8:00" 8,"9:00" 9,"10:00" 10,"11:00" 11,"12:00" 12,"13:00" 13,"14:00" 14,"15:00" 15,"16:00" 16,"17:00" 17,"18:00" 18)
set arrow 1 from 50+28800,graph 0 to 50+28800,12  as 7
set arrow 2 from 31820+28800,graph 0 to 31820+28800,12 as 7
set label 'First node enters' at  50+28800+60, 11 
set label 'Last node exits' at 31820+28800-60, 11 right

plot "./convergence-1.dat" u ($1/1000000+28800):2 not w p pt 6 ps .3
#3xticlabel($1/1000000/60/60+8) not w p pt 6 ps .3
