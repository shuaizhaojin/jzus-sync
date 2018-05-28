set size 0.4, 0.8
set key bottom
set ylabel "Cummulative distribution"
set xlabel "Discovery Latency (slots)"
set yrange [0:1]
set ytics 0.1

plot \
"sl-s5.cdf" u 3:($1/160000) w l t "Searchlight-S, p=40" ls 2,\
"sl-s-.cdf" u 3:($1/422500) w l t "Searchlight-S+1/2,  p=50" ls 7,\
"sl-s+.cdf" u 3:($1/810000) w l t "Searchlight-S+1, p=60" ls 12

#"sl7+1.cdf" u 3:($1/640000) w l t "Searchlight+ 7.5%, p=40" ls 1,\
#"sl6-1.cdf" u 3:($1/640000) w l t "Searchlight- 6.3%, p=40" ls 2,\

