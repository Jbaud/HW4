#Makefile 
#define variables
objects= main.o kernel.o 
NVCC= nvcc               
execname= main

#compile
$(execname): $(objects)
	$(NVCC)  -o $(execname) $(objects)
kernel.o: kernel.cu
	$(NVCC)  -c kernel.cu  
main.o: main.cu
	$(NVCC)  -c main.cu  -Xcudafe "--diag_suppress=declared_but_not_referenced"  -Xcudafe "--diag_suppress=set_but_not_used"

clean:
	rm $(objects)



