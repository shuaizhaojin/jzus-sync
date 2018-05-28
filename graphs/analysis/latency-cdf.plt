set size 0.4, 0.8
set key bottom right
set ylabel "Cummulative distribution"
set xlabel "Discovery Latency (slots)"


plot \
"sl-s5.cdf"  u 3:($1/160000) w l t "Searchlight-S" ls 1,\
"bd-5.cdf"    u 3:($1/518400) w l t "BlindDate" ls 6,\
"disco-5.cdf" u 3:($1/2531281) w l t "Disco" ls 11,\
"u-5.cdf"     u 3:($1/923521) w l t "U-Connect" ls 16


#"bd1.cdf"    u 3:($1/324000000) w l t "BlindDate* 1%"   ls 2,\
#"sl-s1.cdf"  u 3:($1/100000000) w l t "Searchlight-S* 1%" ls 6,\
#"disco1.cdf" u 3:($1/1458552481) w l t "Disco 1%"      ls 10,\
#"u1.cdf"     u 3:($1/519885601) w l t "U-Connect 1%"   ls 14
