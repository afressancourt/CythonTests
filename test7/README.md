# Test 7: Compilation option test while using the C implementation of a Queue in a .pyx file, compiled as a standalone executable

We perform about the same test as in Test 6, adding the following lines at the beginning of the .pyx file.
```
#cython: boundscheck=False
#cython: wraparound=False
#cython: nonecheck=False
#cython: cdivision=True
```
We perform the test on the Ubuntu machine.
```
time ./test

real	0m42.768s
user	0m42.736s
sys		0m0.004s
```
The performance gain is not impressive here either.