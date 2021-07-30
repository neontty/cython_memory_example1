#!/bin/sh


PYTHONPATH=./cython_memtests/ PYTHONMALLOC=malloc valgrind --leak-check=full --tool=memcheck --suppressions=valgrind-python.suppressions ./main.out


