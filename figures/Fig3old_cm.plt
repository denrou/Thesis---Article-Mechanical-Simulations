reset 
set terminal postscript portrait enhanced color font 'Helvetica,18'  
tomo3_x = "compression_light_tomo3_x.txt"
tomo3_y = "compression_light_tomo3_y.txt"
tomo5_z = "compression_light_tomo5_z.txt"
set output 'fig3.eps'
set size 1.,1.
#set origin 0,0
set size ratio .8
set border linewidth 1
set style line 1 lc rgb 'blue' lt 1  lw 4    
set style line 2 lc rgb 'red' lt 2  lw 4    
set style line 3 lc rgb 'black' lt 1  lw 4    

set xlabel 'Axial Strain (%)'
set ylabel 'Axial Stress (MPa)'
set xrange [0:1]
set yrange [0:100]
#set style data lines

set key top left

#set terminal png size 640,480 font "Serif, 18"
#set terminal wxt size 640,480 font "Serif, 18"
plot  tomo5_z u ($1*100):($2) w l ls 2 title "Isotropic",\
      tomo3_y u ($1*100):($2) w l ls 1 title "Anisotropic parallel", \
      tomo3_x u ($1*100):($2) w l ls 3 title "Anisotropic transverse"
      
set output
# Appel extérieur à epstopdf pour transformer le fichier eps en pdf.
!epstopdf --outfile=fig3.pdf fig3.eps