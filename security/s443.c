//#include "globals.h"
#define LEN 32000
#define TYPE int
extern __attribute__((aligned(16))) TYPE a[LEN],b[LEN],c[LEN],d[LEN];



 int s443()
 {
 
 //	non-logical if's
 //	arithmetic if
 
 		for (int i = 0; i < LEN; i++) {
 			if (d[i] <= (TYPE)0.) {
 				goto L20;
 			} else {
 				goto L30;
 			}
 L20:
 			a[i] += b[i] * c[i];
 			goto L50;
 L30:
 			a[i] += b[i] * b[i];
 L50:
 			;
 		}
 	return 0;
 }

