set size 0.4, 0.8
set key autotitle
set xlabel "Beacon Interval (s)"
set ylabel "Normalized Relative Clock Skew (ppm)"
set key center right
set logscale x
set xrange [9:130]
set xtics add (20,30,40,50,60,80,120)
set yrange [4:-4]

#ymax = 1001
#unset ytics
#set yrange [-log10(ymax):log10(ymax)]
#set ytics ("0" 0, "1" 1, '' 0.5, '' -0.5, "-1" -1)
#set for [i=2:log10(ymax)] ytics add (sprintf("%g",10**(i-1)) i) # Add major tics
#set for [i=1:log10(ymax)] for [j=2:9] ytics add ("" log10(10**i*j) 1) # Add minor tics
#set for [j=-9:9] ytics add ("" j/10. 1) # Add minor tics between 0 and 1
#set for [i=2:log10(ymax)] ytics add (sprintf("%g",-10**(i-1)) -i) # Add major tics
#set for [i=1:log10(ymax)] for [j=2:9] ytics add ("" -log10(10**i*j) 1) # Add minor tics

#set arrow from 0.09, 1 to 150,1 as 7
#set arrow from 0.09,-1 to 150,-1 as 7

#set ytics ('-100' -3, '-10' -2, '-1' -1, 0, '1' 1, '10' 2, '100' 3, '' 0.5, '' -0.5,\
# .1 1, .2 1, .3 1, .4 1, .6 1, .7 1, .8 1, .9 1,\
#-.1 1, -.2 1, -.3 1, -.4 1, -.6 1, -.7 1, -.8 1, -.9 1,
#(log10(2)) 1,\
#(log10(3)) 1,\
#(log10(4)) 1,\
#(log10(5)) 1,\
#(log10(6)) 1,\
#(log10(7)) 1,\
#(log10(8)) 1,\
#(log10(9)) 1)


plot "./skew_measurement_average_variance.dat" u 1:($2+1.8) w l not ls 7 lw 1,\
"" u 1:($2+1.8):3 w error not ls 1 lw 1 pt 2
#plot "./skew_measurement_average_variance.dat" u 1:(($2+2.06) < 0.1 ? ($2+2.06)*10 : log10($2+2.06) + 2) w l not ls 7 lw 1
#     "" u 1:($2 < 0.1 ? $2*10 : (log10($2)+2)):(sqrt($3) < 0.1 ? sqrt($3) * 10 : log10(sqrt($3)+2)) w errorbars not ls 1 lw 1 pt 2

