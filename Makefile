#Makefile 
#define variables
objects= main.o kernel.o 
NVCC= nvcc               
execname= main

#compile
$(execname): $(objects)
	$(NVCC)  -o $(execname) $(objects)  -Xcudafe "--diag_suppress=declared_but_not_referenced"
kernel.o: kernel.cu
	$(NVCC)  -c kernel.cu  -Xcudafe "--diag_suppress=declared_but_not_referenced"
main.o: main.cu
	$(NVCC)  -c main.cu  -Xcudafe "--diag_suppress=declared_but_not_referenced"

clean:
	rm $(objects)
