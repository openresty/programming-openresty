set terminal pngcairo noenhanced background "#ffffff" fontscale 1.0 size 800, 500 enhanced

set encoding utf8
set boxwidth 1
set grid
set output "images/check-leak-pkg-path.png"

set xlabel "Elapsed Time (sec)"
set ylabel "Memory Footprint (KB)"
set yrange [1500:7700]
set xrange [0:2.1]
set style line 1 lc rgb '#009900' lt 1 lw 2 pt 7 ps 1
plot 'images/check-leak-pkg-path.dat' title '' with linespoints ls 1
