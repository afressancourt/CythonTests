all: test.so

test.so: test.pyx
	cython -a test.pyx
	python setup.py build_ext -fi

clean:
	-rm -r build test.so test.c test.html
