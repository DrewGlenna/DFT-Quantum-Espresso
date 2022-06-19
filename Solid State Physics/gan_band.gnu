set style data dots
set nokey
set xrange [0: 3.08885]
set yrange [  2.61714 : 26.29014]
set arrow from  1.14996,   2.61714 to  1.14996,  26.29014 nohead
set arrow from  2.47783,   2.61714 to  2.47783,  26.29014 nohead
set xtics ("G"  0.00000,"M|G"  1.14996,"K|G"  2.47783,"A"  3.08885)
 plot "gan_band.dat"
