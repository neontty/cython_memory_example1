
from setuptools import setup, Extension, find_packages
from Cython.Build import cythonize
import sys

try:
    import multiprocessing
    nthreads = multiprocessing.cpu_count()
except:
    print("failed to import multiprocessing, building on one core")
    nthreads = 0

define_macros = [("NPY_NO_DEPRECATED_API", "NPY_1_7_API_VERSION")]

print("define macros", define_macros)

extensions = []

try:
    import numpy as np
    numpy_headers = [np.get_include()]
except:
    print("could not import a library necessary for building cython extensions")
    exit(1)
    
cpp_headers = ['./']
cpp_libs = []

include_dirs = numpy_headers + cpp_headers

extensions = cythonize([Extension("*", ["./*/*.pyx"],
                                  include_dirs=include_dirs,
                                  libraries=cpp_libs,
                                  define_macros=define_macros,
                                 )
                       ],
                       nthreads=nthreads,
                       annotate=True,
                       compiler_directives={'language_level':'3'},
                       gdb_debug=True)
                       
                       
setup(
    python_requires=">=3",
    ext_modules=extensions,
)
