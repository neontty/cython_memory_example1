# Getting Started

```
./make_venv.sh
source venv/bin/activate
make 
./valgrind_main.sh
less valgrind.out
```


#Notes

You may have to change the `-lpythonX.X` flag in the g++ line in the Makefile to get it to compile for your version of python

required packages: 
```
g++
valgrind
python3-dev
```
