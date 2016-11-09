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
	$(NVCC)  -c main.cu

clean:
	rm $(objects)
