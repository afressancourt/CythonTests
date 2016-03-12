# Test 3: Mixing cdef and deque in a .pyx file, compile as a standalone executable

In this test, I have tried to look whether we could have a gain regarding queueing on a simple case. A loop tries M times to queue and deque N integers. The Python queue used is deque as it is by far the most efficient queue implementation on this language. We compare with test.py which does the exact same thing in pure Python.

Cython compilation is done using:
```
make all
```
The resulting executable embeds all that is needed. We time execution using:
`time ./test`

We get the following results on a Macbook Pro, core i5 2,6 GHz running OSX 10.10.5:
```
time ./test

real    3m24.561s
user    3m23.260s
sys     0m0.966s
```

In comparison, running the pure Python implementation gives:
```
time python test.py

real    1m42.602s
user    1m41.628s
sys     0m0.824s
```

And running the pure Python implementation on PyPy gives:
```
time python test.py

real    0m35.665s
user    0m32.592s
sys     0m2.725s
```

On a Ubuntu 15.04 machine with a Intel Core i7-4770 CPU @ 3.40GHz, we have:
```
time ./test

real	1m46.972s
user	1m46.892s
sys		0m0.020s
```

While running the pure Python implementation gives:
```
time python test.py 

real	1m2.885s
user	1m2.840s
sys		0m0.008s
```

And Pypy gives:
```
time python test.py 

real	0m20.122s
user	0m20.056s
sys		0m0.052s
```