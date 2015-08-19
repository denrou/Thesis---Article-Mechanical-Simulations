#!/bin/gnuplot --persist

tomo3_x = "rupt_fract_bonds_light_tomo3_x.txt"
tomo3_y = "rupt_fract_bonds_light_tomo3_y.txt"
tomo5_z = "rupt_fract_bonds_light_tomo5_z.txt"

set xlabel "Strain (%)" font ",20"
set xrange [0:1]
set style data lines

set key font "Serif, 14" Left left samplen 2 width -7

set terminal png size 640,480 font "Serif, 18"
#set terminal wxt size 640,480 font "Serif, 18"

set output "fig4.png"
set ylabel "Fractured Bonds (x 10⁵)" font ",20"
plot  tomo5_z u ($1*100):($2/100000) ls 1 title "  Isotropic", \
      tomo3_y u ($1*100):($2/100000) ls 2 title "  Anisotropic parallel", \
      tomo3_x u ($1*100):($2/100000) ls 3 title "  Anisotropic transverse"
unset output
