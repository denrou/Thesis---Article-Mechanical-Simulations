reset

load 'xyborder.cfg'
load 'grid.cfg'
load 'moreland.pal'

set terminal postscript portrait enhanced color font 'Helvetica,18'  
set output 'sup_fig2.eps'
set size 1
set size ratio 0.8

set tmargin 0
set bmargin 0
set lmargin 3
set rmargin 0

# 3,1 to draw 2 plots in 1 columne the 3th box is used for xtics
set multiplot layout 3,1 columnsfirst  title " \n"

FILE1 = "rupt_fract_bonds_light_tomo3_x.txt"
FILE2 = "rupt_fract_bonds_light_tomo3_y.txt"
FILE3 = "rupt_fract_bonds_light_tomo5_z.txt"

#unset title
set xlabel ''
set xrange [0:1]
set xtics textcolor "white"
set ylabel 'broken bonds (bb)'

set style data lines

unset key

set label 1 at  0.65, 800000 'Isotropic' center rotate by 53 front tc lt 1
set label 2 at  0.8, 720000 'Anisotropic //' center rotate by 50 front tc lt 2
set label 3 at  0.8, 250000 'Anisotropic {/Symbol \136}' center rotate by 10 front tc lt 3
plot  FILE3 u ($1*100):($2) lt 9 title "Isotropic", \
      FILE2 u ($1*100):($2) title "Anisotropic //", \
      FILE1 u ($1*100):($2) title 'Anisotropic {/Symbol \136}'

set xlabel 'Strain (%)'
set ylabel 'bb / bb_{frac}'
set xtics tc ls 101

set label 4 at 0.2, 1.15 'fracture' center tc lt 4
plot  FILE3 u ($1*100):($2/939173) title "Isotropic", \
      FILE2 u ($1*100):($2/789437) title "Anisotropic //", \
      FILE1 u ($1*100):($2/82338) title 'Anisotropic {/Symbol \136}', \
      1

unset multiplot
unset output
# Appel extérieur à epstopdf pour transformer le fichier eps en pdf.
!epstopdf --outfile=sup_fig2.pdf sup_fig2.eps
