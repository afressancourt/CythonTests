all: test.so

test.so: test.pyx
	cython -a test.pyx
	CFLAGS="-I/usr/local/include/libcalg-1.0"  \
	LDFLAGS="-L/usr/local/lib"     \
	python setup.py build_ext -fi

clean:
	-rm -r build test.so test.c test.html
