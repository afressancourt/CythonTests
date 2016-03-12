# Testing Cython

As I have struggled a bit to find a set of practical examples for Cython, I gathered some very basic elements I have encountered.

## Part 1: Using .pyx and compiling properly

### Test 1: Compiling a .pyx fiel and using it in another Python file.

I have adapted the example from the - very good - _Cython: a guide for python programmers_ book from O'Reilly. I have simplified the example in chapter 4 to use a very simple "Hello world".

### Test 2: Compiling a .pyx file into a standalone executable.

Here, I have adapted the example from the _Embedding Cython_ (https://github.com/cython/cython/wiki/EmbeddingCython) page. The Makefile takes the tes.pyx file and compiles a test executable.

### Test 3: Mixing cdef and deque in a .pyx file, compile as a standalone executable

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

### Test 4: Using the C implementation of a Queue in a .pyx file

This example is taken straight from the Cython documentation page [_Using C libraries_](http://docs.cython.org/src/tutorial/clibraries.html). To use the example, you need to install the _libcalg_ pointed in the documentation page. I have installed version 1.2.0 of the lib [here](https://github.com/fragglet/c-algorithms/releases).

In the `Makefile`, I have needed to include a CFLAGS and LDFLAGS to tell the compiler where the library was installed. Those values may change depending on your system.

Compilation of the .pyx file is done with:
```
make all
```

The resulting library is called from a python file, `run_test.py`. Running it on the Macbook gives the following results:
```
time python run_test.py

real    2m43.913s
user    2m32.358s
sys     0m11.459s
```
To compare with Test 3 results.

On the Ubuntu machine, we have the following results:
```
time python run_test.py 

real	0m32.093s
user	0m32.060s
sys		0m0.012s
```

### Test 5: Using the C implementation of a Queue in a .pyx file, compiled as a standalone executable

In this example, I use teh C Queue implementation used in Test 4, but I try to compile the resulting C file as a standalone executable.

In the Makefile, I have added the following options:
* `LIBCALGDIR := /usr/local/include/libcalg-1.0` has been added to the CFLAGS
* `LIBLOCALDIR := /usr/local/lib` has been added to the LDFLAGS
* I have added a dynamic link `CALGLIB := calg` to the clag library too following a compilation error.

The executable is compiled using:
```
make all
```

Running the executable gives the following results:
```
time ./test

real    3m5.715s
user    2m53.630s
sys     0m11.924s

```

On the Ubuntu machine, we have the following results:
```
time ./test
real	0m42.867s
user	0m42.836s
sys		0m0.004s
```

## Further studies

Cython's performances on Ubuntu are slightly better, but are not yet at par with PyPy's performances. Yet they are better than using teh pure Python implementation.

The reason might be that on MacOSX, teh default Clang compiler is used rather than GCC (To investigate).