#include "kernel.cuh"

__global__ void norm (float *d_Input, float *d_Output, int n) {
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    __shared__ int row, mu, sigma;
    if (col < n){
        mu = (float)0.0;
        for (row=0; row < n; row++)
            mu += d_Input[col*n+row];
        mu /= (float) n;

        __syncthreads();

        sigma = (float)0.0;
        for (row=0; row < n; row++)
            sigma += powf(d_Input[col*n+row] - mu, (float)2.0);
        sigma /= (float) n;

        __syncthreads();

        for (row=0; row < n; row++) {
            if (sigma == (float)0.0)
                d_Output[row*n+col] = (float)0.0;
            else
                d_Output[row*n+col] = (d_Input[col*n+row] - mu) / sigma;
        }
    }
}