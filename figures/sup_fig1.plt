reset

load 'xyborder.cfg'
load 'grid.cfg'
load 'moreland.pal'

set terminal postscript portrait enhanced color font 'Helvetica,18'  
set output 'sup_fig1.eps'
set size 1
set size ratio 0.8

FILE1 = "compression_light_tomo3_x.txt"
FILE2 = "compression_light_tomo3_y.txt"
FILE3 = "compression_light_tomo5_z.txt"

set xlabel 'Strain (%)'
set xrange [0:1]
set ylabel 'Strength (MPa)'

set style data lines

unset key

set label 1 at  0.3, 40 'Anisotropic //' center rotate by 60 front tc lt 2
set label 2 at  0.4, 35 'Isotropic' center rotate by 55 front tc lt 1
set label 3 at  0.35, 13 'Anisotropic {/Symbol \136}' center rotate by 20 front tc lt 3
plot  FILE2 u ($1*100):($2) title "Isotropic", \
      FILE3 u ($1*100):($2) title "Anisotropic //", \
      FILE1 u ($1*100):($2) title 'Anisotropic {/Symbol \136}'


unset output
# Appel extérieur à epstopdf pour transformer le fichier eps en pdf.
!epstopdf --outfile=sup_fig1.pdf sup_fig1.eps
