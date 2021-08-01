
.PHONY: all

all: 
	python setup.py build_ext --inplace -g -v
	python setup.py install
	g++ -g -I./cython_memtests/ $(shell python3-config --includes --ldflags --cflags) -fPIE main.cpp -o main.out -lpython$(shell python --version | cut -f 2 -d " " | cut -f 1-2 -d ".")
	
clean:
	find ./cython_memtests -type f -name "*.so" -delete
	find ./cython_memtests -type f -name "*.cpp" -delete
	find ./cython_memtests -type f -name "*.c" -delete
	find ./cython_memtests -type f -name "*_api.h" -delete
	find ./cython_memtests -type f -name "*.html" -delete
	rm -rf build/ dist/ cython_debug/
	rm -rf some_cython.*.so

