# distutils: language = c++

from libcpp.vector cimport vector
import numpy as np
from cpython cimport array


cdef extern from "mystruct.h":
    struct mystruct:
        vector[int] vec


cdef copy_pyobj_to_int_vector(vector[int]& vec, py_object):
    cdef int sz = len(py_object)
    if sz <= 0:
        return
    
    vec.resize(sz)
    
    cdef int[::1] vec_view = <int [:sz]>vec.data()
    
    cdef int[:] object_view
    if isinstance(py_object, list):
        object_view = array.array('i', py_object)
    elif isinstance(py_object, np.ndarray):
        object_view = np.asarray(py_object, dtype=np.intc)
    else:
        raise ValueError("Error: only us this function to translate lists or np arrays to int vector")
    
    # copy assignment
    vec_view[:] = object_view
    
    
cdef api int assign_data_to_struct(mystruct* instance) except -1:
    obj = np.arange(50)
    copy_pyobj_to_int_vector(instance.vec, obj)
    return 0

    
cdef api int assign_data_to_struct2(mystruct* instance) except -1:
    obj = [0,1,2,3,4,5,6,7,8,9]*10
    copy_pyobj_to_int_vector(instance.vec, obj)
    return 0
