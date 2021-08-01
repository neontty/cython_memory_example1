#!/bin/sh


PYTHONMALLOC=malloc valgrind --leak-check=full --tool=memcheck --show-leak-kinds=all --suppressions=valgrind-python.supp ./main.out 2> valgrind.out


