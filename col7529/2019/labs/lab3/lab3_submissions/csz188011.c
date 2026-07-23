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
  int bi, bj, bk;
  int ti, tj, tk;
  int i, j, k;

  __m512d _alpha = _mm512_set1_pd(alpha);
  __m512d _beta  = _mm512_set1_pd(beta);
  __m512d _zero  = _mm512_setzero_pd();
  __m512d a, a1, a2, a3;
  __m512d b;
  __m512d c, c1, c2, c3;

  /* C := beta*C */
  for(bi=0; bi<125; bi++) {
    for(ti=0; ti<32; ti++) {
      i = 32*bi + ti;
      for(bj=0; bj<125; bj++) {
        j  = bj*32;

        c  = _mm512_load_pd(C[i]+j);
        c1 = _mm512_load_pd(C[i]+j+8);                
        c2 = _mm512_load_pd(C[i]+j+16);                
        c3 = _mm512_load_pd(C[i]+j+24);

        c  = _mm512_fmadd_pd(c, _beta, _zero);
        c1 = _mm512_fmadd_pd(c1, _beta, _zero);
        c2 = _mm512_fmadd_pd(c2, _beta, _zero);
        c3 = _mm512_fmadd_pd(c3, _beta, _zero);

        _mm512_store_pd(C[i]+j, c);
        _mm512_store_pd(C[i]+j+8, c1);
        _mm512_store_pd(C[i]+j+16, c2);
        _mm512_store_pd(C[i]+j+24, c3);
      }
    }
  }

  /* C := C + alpha*A.B */
  for (bj=0; bj<4; bj++) {
    for (bk=0; bk<10; bk++) {
      for (bi=0; bi<63; bi++) {
	    for (tj=0; tj<1000; tj=tj+8) {
	      j = 1000*bj + tj;
	      if (j > 3992) break;
	    
	      for (ti=0; ti<64; ti=ti+4) {
	        i = 64*bi + ti;
            if (i > 3996) break;

	        c  = _mm512_load_pd(C[i]+j);
	        c1 = _mm512_load_pd(C[i+1]+j);
	        c2 = _mm512_load_pd(C[i+2]+j);
	        c3 = _mm512_load_pd(C[i+3]+j);

	        for (tk=0; tk<400; tk++) {
	          k = 400*bk + tk;

	          a  = _mm512_set1_pd(A[i][k]);
	          a1 = _mm512_set1_pd(A[i+1][k]);
	          a2 = _mm512_set1_pd(A[i+2][k]);
	          a3 = _mm512_set1_pd(A[i+3][k]);

              a  = _mm512_fmadd_pd(a, _alpha, _zero);
	          a1 = _mm512_fmadd_pd(a1, _alpha, _zero);
	          a2 = _mm512_fmadd_pd(a2, _alpha, _zero);
	          a3 = _mm512_fmadd_pd(a3, _alpha, _zero);
 
	          b  = _mm512_load_pd(B[k]+j);

              c  = _mm512_fmadd_pd(a, b, c);
	          c1 = _mm512_fmadd_pd(a1, b, c1);
	          c2 = _mm512_fmadd_pd(a2, b, c2);
	          c3 = _mm512_fmadd_pd(a3, b, c3);
            }
                
	        _mm512_store_pd(C[i]+j, c);
            _mm512_store_pd(C[i+1]+j, c1);
            _mm512_store_pd(C[i+2]+j, c2);
            _mm512_store_pd(C[i+3]+j, c3);
	      }
	    }
      }
    }
  }  
}


int main(int argc, char** argv)
{
  //fprintf(stderr, "main begin");
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
  //fprintf(stderr, "init begin");
  init_array (ni, nj, nk, &alpha, &beta,
	      POLYBENCH_ARRAY(C),
	      POLYBENCH_ARRAY(A),
	      POLYBENCH_ARRAY(B));

  //fprintf(stderr, "init done");

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
