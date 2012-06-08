set term epslatex
set output 'clang-graph.eps'
set xlabel 'array size'
set ylabel 'runtime (ms)'
plot 'samples/samples.txt'    using 1:2 title 'unspecialized (-O1)' with linespoint, \
     'samples/samples-Os.txt' using 1:2 title 'unspecialized (-Os)' with linespoint, \
     'samples/samples.txt'    using 1:3 title 'specialized (-O1)' with linespoint, \
     'samples/samples-Os.txt' using 1:3 title 'specialized (-Os)' with linespoint