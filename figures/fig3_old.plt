#!/bin/gnuplot --persist

tomo3_x = "compression_light_tomo3_x.txt"
tomo3_y = "compression_light_tomo3_y.txt"
tomo5_z = "compression_light_tomo5_z.txt"

set xlabel "Strain (%)" font ",20"
set xrange [0:1]
set yrange [0:100]
set style data lines

set key font "Serif, 14" Left left samplen 2 width -9

set terminal png size 640,480 font "Serif, 18"
#set terminal wxt size 640,480 font "Serif, 18"

set output "fig3.png"
set ylabel "Stress (MPa)" font ",20"
plot  tomo5_z u ($1*100):($2) ls 1 title "  Isotropic", \
      tomo3_y u ($1*100):($2) ls 2 title "  Anisotropic parallel", \
      tomo3_x u ($1*100):($2) ls 3 title "  Anisotropic transverse"
unset output
unset terminal
