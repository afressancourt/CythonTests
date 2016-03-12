# Test 5: Using the C implementation of a Queue in a .pyx file, compiled as a standalone executable

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