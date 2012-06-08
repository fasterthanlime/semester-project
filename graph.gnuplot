set term epslatex
set output 'graph.eps'
set xlabel 'array size'
set ylabel 'runtime (ms)'
plot 'samples.txt' using 1:2 title 'unspecialized' with linespoint, 'samples.txt' using 1:3 title 'specialized' with linespoint
