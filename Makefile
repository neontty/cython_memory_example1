
.PHONY: all

all: 
	python setup.py -j $(shell nproc) build_ext --inplace -g -v
	python setup.py install
	export PYTHONPATH=./cython_memtests/
	g++ -g -I./cython_memtests/ `python-config --ldflags` `python-config --cflags` -lpython main.cpp -o main.out 
	
clean:
	find . -type f -name "*.so" -delete
	find . -type f -name "*_api.h" -delete
	rm -rf build/ dist/ cython_debug/
	find . -type -d -name "__pycache__" -delete
	find . -type f -name "*.html" -delete

