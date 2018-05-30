set xlabel "Time of day (hrs)"
set ylabel "Static Node (In order of visiting frequency)"
set key top right
set xdata time
set format x "%H:%M"
set xrange[8*3600:19*3600]
set yrange[0.5:35.5]
set size 0.5,1.3
set ytics font 'Helvetica,10'
set xtics nomirror
set ytics nomirror
#set ytics ("16" 1, "130" 2, "148" 3,"100" 4,"257" 5,"94" 6,"10" 7,"427" 8,"249" 9,"237" 10,"407" 11,"246" 12,"71" 13,"202" 14,"204" 15,"390" 16,"79" 17,"419" 18,"46" 19,"12" 20,"323" 21,"331" 22,"9" 23,"384" 24,"29" 25,"367" 26,"409" 27,"397" 28,"172" 29,"244" 30,"231" 31,"296" 32,"292" 33,"152" 34,"334" 35,"171" 36,"55" 37,"328" 38)
set ytics ("100" 1,"16" 2,"130" 3,"148" 4,"328" 5,"10" 6,"94" 7,"257" 8,"407" 9,"246" 10,"71" 11,"55" 12,"202" 13,"79" 14,"12" 15,"384" 16,"427" 17,"367" 18,"409" 19,"237" 20,"29" 21,"397" 22,"249" 23,"152" 24,"244" 25,"171" 26,"231" 27,"203" 28,"172" 29,"331" 30,"204" 31,"296" 32,"292" 33,"46" 34,"323" 35)

#set xtics ("8:00" 8,"9:00" 9,"10:00" 10,"11:00" 11,"12:00" 12,"13:00" 13,"14:00" 14,"15:00" 15,"16:00" 16,"17:00" 17,"18:00" 18)
set arrow 1 from 2350+28800,graph 0 to 2350+28800,40  as 7
set arrow 2 from 37142+28800,graph 0 to 37142+28800,40 as 7
set label 'First node enters' at  3117+28800+60, 39.5 
set label 'Last node exits' at 31922+28800-60, 39.5 right

plot "./august-1-mod.csv" u ($1/1000000+28800):3 not w p pt 6 ps .3
#3xticlabel($1/1000000/60/60+8) not w p pt 6 ps .3
