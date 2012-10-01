#!/bin/bash

rm -rf *.gcda *.gcno a.out *.gcov lcov.info cov
gcc -fprofile-arcs -ftest-coverage  tmp.c
./a.out
gcov tmp.c
cat tmp.c.gcov


#lcov --directory . --zerocounters
#./a.out
lcov --directory . --capture -o lcov.info
mkdir cov
genhtml --frames --legend  --function-coverage  --branch-coverage  --highlight --demangle-cpp  -o ./cov lcov.info
