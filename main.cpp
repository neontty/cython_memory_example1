

#include "Python.h"
#include "mystruct.h"
#include "some_cython_api.h"
#include <stdio.h>

void make_instance_and_call_cython() {
	mystruct* instance = new mystruct();
	
	if (assign_data_to_struct(instance) < 0) {
		PyErr_PrintEx(errno);
	}

	if (assign_data_to_struct2(instance) < 0) {
		PyErr_PrintEx(errno);
	}

	//printf("vec new size %lu\n", instance->vec.size());
	//printf("vec end value %d\n", instance->vec[instance->vec.size()-1]);
	
	delete instance;
}


int main(int argc, char** argv) {
	
	Py_Initialize();
	
	int r = import_some_cython();
	
	if (r < 0) {
		printf("failed to import some cython\n");
		PyErr_PrintEx(errno);
		return 1;
	}
	
	for (int i = 0; i < 10000; i++) {
		make_instance_and_call_cython();
	}
	
	Py_Finalize();
	
	return 0;
}

