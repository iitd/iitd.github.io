/**
 * gemm.c: This file is part of the PolyBench/C 3.2 test suite.
 *
 *
 * Contact: Louis-Noel Pouchet <pouchet@cse.ohio-state.edu>
 * Web address: http://polybench.sourceforge.net
 */
#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <math.h>

/* Include polybench common header. */
#include <polybench.h>

/* Include benchmark-specific header. */
/* Default data type is double, default size is 4000. */
#include "gemm.h"

#include <immintrin.h>// Header files necessary for using Intel Instrinsics 
#include <emmintrin.h>

/* Array initialization. */
static
void init_array(int ni, int nj, int nk,
		DATA_TYPE *alpha,
		DATA_TYPE *beta,
		DATA_TYPE POLYBENCH_2D(C,NI,NJ,ni,nj),
		DATA_TYPE POLYBENCH_2D(A,NI,NK,ni,nk),
		DATA_TYPE POLYBENCH_2D(B,NK,NJ,nk,nj))
{
  int i, j;

  *alpha = 32412;
  *beta = 2123;
  for (i = 0; i < ni; i++)
    for (j = 0; j < nj; j++)
      C[i][j] = ((DATA_TYPE) i*j) / ni;
  for (i = 0; i < ni; i++)
    for (j = 0; j < nk; j++)
      A[i][j] = ((DATA_TYPE) i*j) / ni;
  for (i = 0; i < nk; i++)
    for (j = 0; j < nj; j++)
      B[i][j] = ((DATA_TYPE) i*j) / ni;
}


/* DCE code. Must scan the entire live-out data.
   Can be used also to check the correctness of the output. */
static
void print_array(int ni, int nj,
		 DATA_TYPE POLYBENCH_2D(C,NI,NJ,ni,nj))
{
  int i, j;

  for (i = 0; i < ni; i++)
    for (j = 0; j < nj; j++) {
	fprintf (stderr, DATA_PRINTF_MODIFIER, C[i][j]);
	if ((i * ni + j) % 20 == 0) fprintf (stderr, "\n");
    }
  fprintf (stderr, "\n");
}


/* Main computational kernel. The whole function will be timed,
   including the call and return. */
static
void kernel_gemm(int ni, int nj, int nk,
		 DATA_TYPE alpha,
		 DATA_TYPE beta,
		 DATA_TYPE POLYBENCH_2D(C,NI,NJ,ni,nj),
		 DATA_TYPE POLYBENCH_2D(A,NI,NK,ni,nk),
		 DATA_TYPE POLYBENCH_2D(B,NK,NJ,nk,nj))
{
  // start
  long temp_index_i, temp_index_j, temp_index_k;
  long ii, jj, kk;
  long j_tile, k_tile, i_tile;
  //end
  
   double* addrss0;
   double* addrss1;
   double* addrss2;
   double* addrss3;

   double* addrss_c0;
   double* addrss_c1;
   double* addrss_c2;
   double* addrss_c3;

  // Some necessary initialization 
  __mmask8 mask = _cvtu32_mask8(255);// converting the inter value 255 to 8-bit mask
  __m512d beta_vector = _mm512_setr4_pd(beta, beta, beta, beta);// creating a vector out of a scalar value beta, needed for vector arithmetic
  __m512d zerovec_512 = _mm512_setzero_pd();// zero vector initialization
  __m256d alpha_vector = _mm256_setr_pd(alpha, alpha, alpha, alpha);// initializing a vector out of a scalar
  __m256d zerovec_256 = _mm256_setzero_pd();

  /* C := alpha*A*B + beta*C */
  for (temp_index_i = 0; temp_index_i < 125; temp_index_i++)
  {
    for (temp_index_k = 0; temp_index_k < 32; temp_index_k++)
      {
	ii = temp_index_i * 32 + temp_index_k;

	for(temp_index_j = 0; temp_index_j < 125; temp_index_j++){
                int j0 = temp_index_j*32 + 0;
                int j1 = temp_index_j*32 + 8;
		int j2 = temp_index_j*32 + 16;
		int j3 = temp_index_j*32 + 24;

                addrss0 = C[ii] + j0;
                addrss1 = C[ii] + j1;
                addrss2 = C[ii] + j2;
                addrss3 = C[ii] + j3;

                // Loading contiguous double-precision (64-bit) floating-point elements from the address (those with their respective bit set in mask ), and store the results in the destination
		__m512d c0 = _mm512_maskz_expandloadu_pd(mask, addrss0);
                __m512d c1 = _mm512_maskz_expandloadu_pd(mask, addrss1);                
                __m512d c2 = _mm512_maskz_expandloadu_pd(mask, addrss2);                
                __m512d c3 = _mm512_maskz_expandloadu_pd(mask, addrss3);

		// using a specialized multiply-add combined instruction. May be, the combined special instruction is better than the 
		// successive multiply followed by add instruction in terms of performance(execution time here).
                __m512d c0_updated = _mm512_fmadd_pd(c0, beta_vector, zerovec_512);
                __m512d c1_updated = _mm512_fmadd_pd(c1, beta_vector, zerovec_512);
                __m512d c2_updated = _mm512_fmadd_pd(c2, beta_vector, zerovec_512);
                __m512d c3_updated = _mm512_fmadd_pd(c3, beta_vector, zerovec_512);

		// storing the final values into the respective addresses
                _mm512_store_pd(addrss0, c0_updated);
                _mm512_store_pd(addrss1, c1_updated);
                _mm512_store_pd(addrss2, c2_updated);
                _mm512_store_pd(addrss3, c3_updated);
	
	}
      }
  }
 

  // tiling for j loop
  for (j_tile = 0; j_tile < 4; j_tile++)
  {
	// tiling for k loop
      for (k_tile = 0; k_tile < 10; k_tile++) 
      {
	      // tiling for i loop
        for (i_tile = 0; i_tile < 63; i_tile++) 
        {
	  for (temp_index_j=0; temp_index_j < 1000; temp_index_j = temp_index_j + 4) 
          {
	    jj = 1000*j_tile + temp_index_j;
	    // Check for loop upper bounds as incrementation offset is 4
	    // make sure it doesn't cross the value 3999
	    if (jj > 3996) {
	        break;
	    }
	    for (temp_index_i = 0; temp_index_i < 63; temp_index_i = temp_index_i + 4)
            {
	        ii = 63*i_tile + temp_index_i;
		// Check for loop upper bound
		if (ii > 3996) {
		    break;
		}
		

		// Address computation for next vectoriation
                addrss_c0 = C[ii + 0] + jj;
                addrss_c1 = C[ii + 1] + jj;
		addrss_c2 = C[ii + 2] + jj;
		addrss_c3 = C[ii + 3] + jj;

                // Load contiguous active double-precision (64-bit) floating-point elements from unaligned memory
		__m256d c0 = _mm256_maskz_expandloadu_pd(mask, addrss_c0);
		__m256d c1 = _mm256_maskz_expandloadu_pd(mask, addrss_c1);
		__m256d c2 = _mm256_maskz_expandloadu_pd(mask, addrss_c2);
		__m256d c3 = _mm256_maskz_expandloadu_pd(mask, addrss_c3);

		for (temp_index_k = 0; temp_index_k < 400; temp_index_k++) {

		    kk = 400*k_tile + temp_index_k;
		    // Necessary Base Address
		    double* addrss_B_kk_jj = B[kk] + jj;
		    // mask256
		    __m256d b_mask = _mm256_maskz_expandloadu_pd(mask, addrss_B_kk_jj);

		    //Broadcast a double-precision (64-bit) floating-point element from memory to all elements of the destination vector
		    __m256d a0_vector = _mm256_broadcast_sd(A[ii] + kk);
		    __m256d a1_vector = _mm256_broadcast_sd(A[ii] + 4000 + kk);
		    __m256d a2_vector = _mm256_broadcast_sd(A[ii] + 8000 + kk);
		    __m256d a3_vector = _mm256_broadcast_sd(A[ii] + 12000 + kk);

		    // Using specialized multiply accumulate instruction
                    a0_vector = _mm256_fmadd_pd(a0_vector, alpha_vector, zerovec_256);
		    a1_vector = _mm256_fmadd_pd(a1_vector, alpha_vector, zerovec_256);
		    a2_vector = _mm256_fmadd_pd(a2_vector, alpha_vector, zerovec_256);
		    a3_vector = _mm256_fmadd_pd(a3_vector, alpha_vector, zerovec_256);
 
                    c0 = _mm256_fmadd_pd(a0_vector, b_mask, c0);
		    c1 = _mm256_fmadd_pd(a1_vector, b_mask, c1);
		    c2 = _mm256_fmadd_pd(a2_vector, b_mask, c2);
		    c3 = _mm256_fmadd_pd(a3_vector, b_mask, c3);
		    
                }
                // Updating the values of C matrix by vector store
		_mm256_store_pd(addrss_c0, c0);
                _mm256_store_pd(addrss_c1, c1);
                _mm256_store_pd(addrss_c2, c2);
                _mm256_store_pd(addrss_c3, c3);
	    } 
	  }
	}
      }
  }  
}


int main(int argc, char** argv)
{
  
  /* Retrieve problem size. */
  int ni = NI;
  int nj = NJ;
  int nk = NK;

  /* Variable declaration/allocation. */
  DATA_TYPE alpha;
  DATA_TYPE beta;
  POLYBENCH_2D_ARRAY_DECL(C,DATA_TYPE,NI,NJ,ni,nj);
  POLYBENCH_2D_ARRAY_DECL(A,DATA_TYPE,NI,NK,ni,nk);
  POLYBENCH_2D_ARRAY_DECL(B,DATA_TYPE,NK,NJ,nk,nj);

  /* Initialize array(s). */
  
  init_array (ni, nj, nk, &alpha, &beta,
	      POLYBENCH_ARRAY(C),
	      POLYBENCH_ARRAY(A),
	      POLYBENCH_ARRAY(B));

  

  /* Start timer. */
  polybench_start_instruments;

  /* Run kernel. */
  kernel_gemm (ni, nj, nk,
	       alpha, beta,
	       POLYBENCH_ARRAY(C),
	       POLYBENCH_ARRAY(A),
	       POLYBENCH_ARRAY(B));

  /* Stop and print timer. */
  polybench_stop_instruments;
  polybench_print_instruments;

  /* Prevent dead-code elimination. All live-out data must be printed
     by the function call in argument. */
  polybench_prevent_dce(print_array(ni, nj,  POLYBENCH_ARRAY(C)));

  /* Be clean. */
  POLYBENCH_FREE_ARRAY(C);
  POLYBENCH_FREE_ARRAY(A);
  POLYBENCH_FREE_ARRAY(B);

  return 0;
}
