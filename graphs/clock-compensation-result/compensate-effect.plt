#set size 0.4, 0.8
set xlabel "Elapsed time (h)"
set ylabel "Clock drift (ms)"
set key top left
set xrange[0:3]
#set yrange[0:130]

#set xtics 5
#set mxtics 5

#set ytics 20
#set mytics 4

plot "./M26-328.txt-final" u ($2/32768.0/3600.0):11 t "Clock Skew: 0.75ppm" w l ls 2,\
     "./M21-328.txt-final" u ($2/32768.0/3600.0):11 t "Clock Skew: 0.87ppm" w l ls 7
     #"./M23-328.txt-final" u ($2/32768.0/3600.0):11 t "Clock Skew: 1.53ppm" w l ls 12

           
