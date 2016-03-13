# Test 6: Compilation option test while using C implementation of Queue in the .pyx file.

Here, we test the effect of some compilation option that can help improve the performance while running Cython. We had the following lines at the beginning of the .pyx file:

```
#cython: boundscheck=False
#cython: wraparound=False
#cython: nonecheck=False
#cython: cdivision=True
```

Compilation of the .pyx file is done with:
```
make all
```
We perform the test on the Ubuntu machine.
```
time python run_test.py 

real	0m32.405s
user	0m32.376s
sys		0m0.008s
```

The performance difference is not striking here.