# Testing Cython

As I have struggled a bit to find a set of practical examples for Cython, I gathered some very basic elements I have encountered.

## Test 1: Compiling a .pyx fiel and using it in another Python file.

I have adapted the example from the - very good - _Cython: a guide for python programmers_ book from O'Reilly. I have simplified the example in chapter 4 to use a very simple "Hello world".

## Test 2: Compiling a .pyx file into a standalone executable.

Here, I have adapted the example from the _Embedding Cython_ (https://github.com/cython/cython/wiki/EmbeddingCython) page. The Makefile takes the tes.pyx file and compiles a test executable.

## Test 3: Mixing cdef and deque in a .pyx file, compile as a standalone executable

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

## Test 4: Using the c implementation of a Queue in a .pyx file

This example is taken straight from the Cython documentation page [_Using C libraries_](http://docs.cython.org/src/tutorial/clibraries.html). To use the example, you need to install the _libcalg_ pointed in the documentation page. I have installed version 1.2.0 of the lib [here](https://github.com/fragglet/c-algorithms/releases).

In the `Makefile`, I have needed to include a CFLAGS and LDFLAGS to tell the compiler where the library was installed. Those values may change depending on your system.

Compilation of the .pyx file is done with:
```
make all
```

The resulting library is called from a python file, `run_test.py`. Running it gives the following results:
``$
time python run_test.py

real    2m43.913s
user    2m32.358s
sys     0m11.459s
```
To compare with test 3 results.

