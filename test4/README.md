# Test 4: Using the C implementation of a Queue in a .pyx file

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

On the Ubuntu machine, We need to set the `LD_LIBRARY_PATH` variable by typing:
```
export LD_LIBRARY_PATH=/usr/local/lib
```

Then, we have the following results:
```
time python run_test.py 
real	0m32.197s
user	0m32.152s
sys		0m0.028s
```