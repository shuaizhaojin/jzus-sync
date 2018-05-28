set style data histogram
set style histogram clustered gap 1
set style fill solid 0.4 border
set key top right
set xlabel "Duty cycle"
set ylabel "Improvement"

plot "./four_protocols.dat" using ($2/$3):xtic(1) t 'Disco' fs pattern 1,\
     "./four_protocols.dat" u ($5/$6):xtic(1) t 'Uconnect' fs pattern 2,\
     "./four_protocols.dat" u ($8/$9):xtic(1) t 'Searchlight' fs pattern 3,\
     "./four_protocols.dat" u ($11/$12):xtic(1) t 'BlindDate' fs pattern 4
 
