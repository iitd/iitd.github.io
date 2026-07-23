# mark_description "Intel(R) C Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.3.199 Build 20190206";
# mark_description "-I ../polybench-c-3.2/utilities/ -O3 -DPOLYBENCH_TIME -DDATA_TYPE_IS_INT -DEXTRALARGE_DATASET -S -fsource-as";
# mark_description "m -lcilkrts -xavx";
	.file "gemm-handopt.c"
	.text
..TXTST0:
.L_2__routine_start_main_0:
# -- Begin  main
	.text
# mark_begin;
       .align    16,0x90
	.globl main
# --- main(int, char **)
main:
# parameter 1: %edi
# parameter 2: %rsi
..B1.1:                         # Preds ..B1.0
                                # Execution count [1.00e+00]

### {

	.cfi_startproc
..___tag_value_main.1:
..L2:
                                                          #189.1
        pushq     %rbp                                          #189.1
	.cfi_def_cfa_offset 16
        movq      %rsp, %rbp                                    #189.1
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
        andq      $-128, %rsp                                   #189.1
        pushq     %r12                                          #189.1
        pushq     %r13                                          #189.1
        pushq     %r14                                          #189.1
        pushq     %r15                                          #189.1
        pushq     %rbx                                          #189.1
        subq      $600, %rsp                                    #189.1
	.cfi_escape 0x10, 0x03, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xd8, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0c, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xf8, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0d, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xf0, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0e, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xe8, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0f, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xe0, 0xff, 0xff, 0xff, 0x22
        movq      %rsi, %r12                                    #189.1
        movl      %edi, %ebx                                    #189.1
        movl      $71678, %esi                                  #189.1
        movl      $3, %edi                                      #189.1
        call      __intel_new_feature_proc_init                 #189.1
                                # LOE r12 ebx
..B1.85:                        # Preds ..B1.1
                                # Execution count [1.00e+00]
        vstmxcsr  (%rsp)                                        #189.1

###   //fprintf(stderr, "main begin");
###   /* Retrieve problem size. */
###   int ni = NI;
###   int nj = NJ;
###   int nk = NK;
### 
###   /* Variable declaration/allocation. */
###   DATA_TYPE alpha;
###   DATA_TYPE beta;
###   POLYBENCH_2D_ARRAY_DECL(C,DATA_TYPE,NI,NJ,ni,nj);

        movl      $16000000, %edi                               #199.3
        movl      $8, %esi                                      #199.3
        orl       $32832, (%rsp)                                #189.1
        vldmxcsr  (%rsp)                                        #189.1
..___tag_value_main.11:
#       polybench_alloc_data(unsigned long long, int)
        call      polybench_alloc_data                          #199.3
..___tag_value_main.12:
                                # LOE rax r12 ebx
..B1.84:                        # Preds ..B1.85
                                # Execution count [1.00e+00]
        movq      %rax, %r14                                    #199.3
                                # LOE r12 r14 ebx
..B1.2:                         # Preds ..B1.84
                                # Execution count [1.00e+00]

###   POLYBENCH_2D_ARRAY_DECL(A,DATA_TYPE,NI,NK,ni,nk);

        movl      $16000000, %edi                               #200.3
        movl      $8, %esi                                      #200.3
..___tag_value_main.13:
#       polybench_alloc_data(unsigned long long, int)
        call      polybench_alloc_data                          #200.3
..___tag_value_main.14:
                                # LOE rax r12 r14 ebx
..B1.86:                        # Preds ..B1.2
                                # Execution count [1.00e+00]
        movq      %rax, %r13                                    #200.3
                                # LOE r12 r13 r14 ebx
..B1.3:                         # Preds ..B1.86
                                # Execution count [1.00e+00]

###   POLYBENCH_2D_ARRAY_DECL(B,DATA_TYPE,NK,NJ,nk,nj);

        movl      $16000000, %edi                               #201.3
        movl      $8, %esi                                      #201.3
..___tag_value_main.15:
#       polybench_alloc_data(unsigned long long, int)
        call      polybench_alloc_data                          #201.3
..___tag_value_main.16:
                                # LOE rax r12 r13 r14 ebx
..B1.87:                        # Preds ..B1.3
                                # Execution count [1.00e+00]
        movq      %rax, %r15                                    #201.3
                                # LOE r12 r13 r14 r15 ebx
..B1.4:                         # Preds ..B1.87
                                # Execution count [3.76e-01]

### 
###   /* Initialize array(s). */
###   //fprintf(stderr, "init begin");
###   init_array (ni, nj, nk, &alpha, &beta,

        vmovdqu   .L_2il0floatpacket.0(%rip), %xmm2             #205.3
        xorl      %r8d, %r8d                                    #205.3
        vmovupd   .L_2il0floatpacket.1(%rip), %ymm3             #205.3
        xorl      %edx, %edx                                    #205.3
        vmovsd    .L_2il0floatpacket.2(%rip), %xmm1             #205.3
                                # LOE rdx r12 r13 r14 r15 ebx r8d xmm1 xmm2 ymm3
..B1.5:                         # Preds ..B1.17 ..B1.4
                                # Execution count [4.23e+00]
        lea       (%r15,%rdx), %r9                              #205.3
        movq      %r9, %rax                                     #205.3
        andq      $31, %rax                                     #205.3
        movl      %eax, %eax                                    #205.3
        testl     %eax, %eax                                    #205.3
        je        ..B1.10       # Prob 50%                      #205.3
                                # LOE rax rdx r9 r12 r13 r14 r15 ebx r8d xmm1 xmm2 ymm3
..B1.6:                         # Preds ..B1.5
                                # Execution count [4.23e+00]
        vxorpd    %xmm0, %xmm0, %xmm0                           #205.3
        lea       (%r14,%rdx), %r10                             #205.3
        vcvtsi2sd %r8d, %xmm0, %xmm0                            #205.3
        xorl      %esi, %esi                                    #205.3
        xorl      %r11d, %r11d                                  #205.3
        lea       (%r13,%rdx), %rcx                             #205.3
        testb     $7, %al                                       #205.3
        jne       ..B1.15       # Prob 10%                      #205.3
                                # LOE rax rdx rcx r9 r10 r11 r12 r13 r14 r15 ebx esi r8d xmm0 xmm1 xmm2 ymm3
..B1.7:                         # Preds ..B1.6
                                # Execution count [4.23e+00]
        negl      %eax                                          #205.3
        addl      $32, %eax                                     #205.3
        shrl      $3, %eax                                      #205.3
                                # LOE rax rdx rcx r9 r10 r11 r12 r13 r14 r15 ebx esi r8d xmm0 xmm1 xmm2 ymm3
..B1.8:                         # Preds ..B1.8 ..B1.7
                                # Execution count [2.35e+01]
        vxorpd    %xmm4, %xmm4, %xmm4                           #205.3
        vcvtsi2sd %esi, %xmm4, %xmm4                            #205.3
        vmulsd    %xmm4, %xmm0, %xmm5                           #205.3
        incl      %esi                                          #205.3
        vdivsd    %xmm1, %xmm5, %xmm6                           #205.3
        vmovsd    %xmm6, (%r10,%r11,8)                          #205.3
        vmovsd    %xmm6, (%rcx,%r11,8)                          #205.3
        vmovsd    %xmm6, (%r9,%r11,8)                           #205.3
        incq      %r11                                          #205.3
        cmpl      %eax, %esi                                    #205.3
        jb        ..B1.8        # Prob 81%                      #205.3
        jmp       ..B1.11       # Prob 100%                     #205.3
                                # LOE rax rdx rcx r9 r10 r11 r12 r13 r14 r15 ebx esi r8d xmm0 xmm1 xmm2 ymm3
..B1.10:                        # Preds ..B1.5
                                # Execution count [2.12e+00]
        vxorpd    %xmm0, %xmm0, %xmm0                           #205.3
        lea       (%r14,%rdx), %r10                             #205.3
        vcvtsi2sd %r8d, %xmm0, %xmm0                            #205.3
        lea       (%r13,%rdx), %rcx                             #205.3
                                # LOE rax rdx rcx r9 r10 r12 r13 r14 r15 ebx r8d xmm0 xmm1 xmm2 ymm3
..B1.11:                        # Preds ..B1.8 ..B1.10
                                # Execution count [4.23e+00]
        movl      %eax, %esi                                    #205.3
        lea       1(%rax), %r11d                                #205.3
        negl      %esi                                          #205.3
        vmovd     %eax, %xmm5                                   #205.3
        andl      $3, %esi                                      #205.3
        negl      %esi                                          #205.3
        vmovd     %r11d, %xmm6                                  #205.3
        lea       2(%rax), %r11d                                #205.3
        vunpcklpd %xmm0, %xmm0, %xmm4                           #205.3
        addl      $4000, %esi                                   #205.3
        vpunpckldq %xmm6, %xmm5, %xmm9                          #205.3
        vmovd     %r11d, %xmm7                                  #205.3
        lea       3(%rax), %r11d                                #205.3
        vmovd     %r11d, %xmm8                                  #205.3
        movl      %esi, %r11d                                   #205.3
        vpunpckldq %xmm8, %xmm7, %xmm10                         #205.3
        vinsertf128 $1, %xmm4, %ymm4, %ymm4                     #205.3
        vpunpcklqdq %xmm10, %xmm9, %xmm5                        #205.3
                                # LOE rax rdx rcx r9 r10 r11 r12 r13 r14 r15 ebx esi r8d xmm0 xmm1 xmm2 xmm5 ymm3 ymm4
..B1.12:                        # Preds ..B1.12 ..B1.11
                                # Execution count [2.35e+01]
        vcvtdq2pd %xmm5, %ymm6                                  #205.3
        vpaddd    %xmm2, %xmm5, %xmm5                           #205.3
        vmulpd    %ymm6, %ymm4, %ymm7                           #205.3
        vdivpd    %ymm3, %ymm7, %ymm8                           #205.3
        vmovupd   %xmm8, (%r10,%rax,8)                          #205.3
        vextractf128 $1, %ymm8, 16(%r10,%rax,8)                 #205.3
        vmovupd   %xmm8, (%rcx,%rax,8)                          #205.3
        vextractf128 $1, %ymm8, 16(%rcx,%rax,8)                 #205.3
        vmovupd   %ymm8, (%r9,%rax,8)                           #205.3
        addq      $4, %rax                                      #205.3
        cmpq      %r11, %rax                                    #205.3
        jb        ..B1.12       # Prob 81%                      #205.3
                                # LOE rax rdx rcx r9 r10 r11 r12 r13 r14 r15 ebx esi r8d xmm0 xmm1 xmm2 xmm5 ymm3 ymm4
..B1.13:                        # Preds ..B1.12
                                # Execution count [3.81e+00]
        cmpl      $4000, %esi                                   #205.3
        jae       ..B1.17       # Prob 0%                       #205.3
                                # LOE rdx rcx r9 r10 r12 r13 r14 r15 ebx esi r8d xmm0 xmm1 xmm2 ymm3
..B1.15:                        # Preds ..B1.6 ..B1.13 ..B1.15
                                # Execution count [2.35e+01]
        vxorpd    %xmm4, %xmm4, %xmm4                           #205.3
        vcvtsi2sd %esi, %xmm4, %xmm4                            #205.3
        vmulsd    %xmm4, %xmm0, %xmm5                           #205.3
        vdivsd    %xmm1, %xmm5, %xmm6                           #205.3
        movslq    %esi, %rsi                                    #205.3
        vmovsd    %xmm6, (%r10,%rsi,8)                          #205.3
        vmovsd    %xmm6, (%rcx,%rsi,8)                          #205.3
        vmovsd    %xmm6, (%r9,%rsi,8)                           #205.3
        incl      %esi                                          #205.3
        cmpl      $4000, %esi                                   #205.3
        jb        ..B1.15       # Prob 81%                      #205.3
                                # LOE rdx rcx r9 r10 r12 r13 r14 r15 ebx esi r8d xmm0 xmm1 xmm2 ymm3
..B1.17:                        # Preds ..B1.15 ..B1.13
                                # Execution count [4.23e+00]
        incl      %r8d                                          #205.3
        addq      $32000, %rdx                                  #205.3
        cmpl      $4000, %r8d                                   #205.3
        jb        ..B1.5        # Prob 91%                      #205.3
                                # LOE rdx r12 r13 r14 r15 ebx r8d xmm1 xmm2 ymm3
..B1.18:                        # Preds ..B1.17
                                # Execution count [1.00e+00]

### 	      POLYBENCH_ARRAY(C),
### 	      POLYBENCH_ARRAY(A),
### 	      POLYBENCH_ARRAY(B));
### 
###   //fprintf(stderr, "init done");
### 
###   /* Start timer. */
###   polybench_start_instruments;

        xorl      %eax, %eax                                    #213.3
        vzeroupper                                              #213.3
..___tag_value_main.17:
#       polybench_timer_start()
        call      polybench_timer_start                         #213.3
..___tag_value_main.18:
                                # LOE r12 r13 r14 r15 ebx
..B1.19:                        # Preds ..B1.18
                                # Execution count [1.03e+00]

### 
###   /* Run kernel. */
###   kernel_gemm (ni, nj, nk,

        movq      %r14, %rsi                                    #216.3
        xorl      %r8d, %r8d                                    #216.3
        vmovupd   .L_2il0floatpacket.3(%rip), %ymm2             #205.3
        xorl      %r9d, %r9d                                    #216.3
        vmovupd   .L_2il0floatpacket.4(%rip), %xmm1             #205.3
        vmovsd    .L_2il0floatpacket.5(%rip), %xmm0             #205.3
        movq      %rsi, 16(%rsp)                                #216.3[spill]
                                # LOE rsi r9 r12 r13 r14 r15 ebx r8d xmm0 xmm1 ymm2
..B1.20:                        # Preds ..B1.36 ..B1.19
                                # Execution count [5.00e+05]
        movq      %rsi, %rdx                                    #216.3
        andq      $31, %rdx                                     #216.3
        je        ..B1.25       # Prob 50%                      #216.3
                                # LOE rdx rsi r9 r12 r13 r14 r15 ebx r8d xmm0 xmm1 ymm2
..B1.21:                        # Preds ..B1.20
                                # Execution count [5.00e+05]
        testq     $7, %rdx                                      #216.3
        jne       ..B1.78       # Prob 10%                      #216.3
                                # LOE rdx rsi r9 r12 r13 r14 r15 ebx r8d xmm0 xmm1 ymm2
..B1.22:                        # Preds ..B1.21
                                # Execution count [5.00e+05]
        negq      %rdx                                          #216.3
        xorl      %eax, %eax                                    #216.3
        addq      $32, %rdx                                     #216.3
        shrq      $3, %rdx                                      #216.3
                                # LOE rax rdx rsi r9 r12 r13 r14 r15 ebx r8d xmm0 xmm1 ymm2
..B1.23:                        # Preds ..B1.23 ..B1.22
                                # Execution count [1.60e+07]
        vmulsd    (%rsi,%rax,8), %xmm0, %xmm3                   #216.3
        vmovsd    %xmm3, (%rsi,%rax,8)                          #216.3
        incq      %rax                                          #216.3
        cmpq      %rdx, %rax                                    #216.3
        jb        ..B1.23       # Prob 96%                      #216.3
                                # LOE rax rdx rsi r9 r12 r13 r14 r15 ebx r8d xmm0 xmm1 ymm2
..B1.25:                        # Preds ..B1.23 ..B1.20
                                # Execution count [5.00e+05]
        movq      %rdx, %r10                                    #216.3
        lea       (%rsi,%rdx,8), %rax                           #216.3
        negq      %r10                                          #216.3
        addq      $32, %r10                                     #216.3
        andq      $7, %r10                                      #216.3
        negq      %r10                                          #216.3
        lea       32(%r10), %rcx                                #216.3
                                # LOE rax rdx rcx rsi r9 r10 r12 r13 r14 r15 ebx r8d xmm0 xmm1 ymm2
..B1.26:                        # Preds ..B1.26 ..B1.25
                                # Execution count [1.60e+07]
        vmulpd    (%rax), %ymm2, %ymm3                          #216.3
        addq      $8, %rdx                                      #216.3
        vmulpd    32(%rax), %ymm2, %ymm4                        #216.3
        vmovupd   %ymm3, (%rax)                                 #216.3
        vmovupd   %ymm4, 32(%rax)                               #216.3
        addq      $64, %rax                                     #216.3
        cmpq      %rcx, %rdx                                    #216.3
        jb        ..B1.26       # Prob 96%                      #216.3
                                # LOE rax rdx rcx rsi r9 r10 r12 r13 r14 r15 ebx r8d xmm0 xmm1 ymm2
..B1.27:                        # Preds ..B1.26
                                # Execution count [5.00e+05]
        lea       33(%r10), %rax                                #216.3
        cmpq      $32, %rax                                     #216.3
        ja        ..B1.36       # Prob 50%                      #216.3
                                # LOE rcx rsi r9 r10 r12 r13 r14 r15 ebx r8d xmm0 xmm1 ymm2
..B1.28:                        # Preds ..B1.27
                                # Execution count [5.00e+05]
        movq      %rcx, %rdx                                    #216.3
        negq      %rdx                                          #216.3
        addq      $32, %rdx                                     #216.3
        cmpq      $2, %rdx                                      #216.3
        jl        ..B1.81       # Prob 10%                      #216.3
                                # LOE rdx rcx rsi r9 r10 r12 r13 r14 r15 ebx r8d xmm0 xmm1 ymm2
..B1.29:                        # Preds ..B1.28
                                # Execution count [5.00e+05]
        xorl      %r11d, %r11d                                  #216.3
        lea       32(%r9,%r10), %rax                            #216.3
        lea       (%r14,%rax,8), %r10                           #216.3
        movq      %rdx, %rax                                    #216.3
        andq      $-2, %rax                                     #216.3
                                # LOE rax rdx rcx rsi r9 r10 r11 r12 r13 r14 r15 ebx r8d xmm0 xmm1 ymm2
..B1.30:                        # Preds ..B1.30 ..B1.29
                                # Execution count [1.60e+07]
        vmulpd    (%r10), %xmm1, %xmm3                          #216.3
        addq      $2, %r11                                      #216.3
        vmovupd   %xmm3, (%r10)                                 #216.3
        addq      $16, %r10                                     #216.3
        cmpq      %rax, %r11                                    #216.3
        jb        ..B1.30       # Prob 96%                      #216.3
                                # LOE rax rdx rcx rsi r9 r10 r11 r12 r13 r14 r15 ebx r8d xmm0 xmm1 ymm2
..B1.32:                        # Preds ..B1.30 ..B1.81 ..B1.78
                                # Execution count [5.00e+05]
        cmpq      %rdx, %rax                                    #216.3
        jae       ..B1.36       # Prob 0%                       #216.3
                                # LOE rax rdx rcx rsi r9 r12 r13 r14 r15 ebx r8d xmm0 xmm1 ymm2
..B1.33:                        # Preds ..B1.32
                                # Execution count [5.00e+05]
        addq      %r9, %rcx                                     #216.3
        lea       (%r14,%rcx,8), %rcx                           #216.3
        lea       (%rcx,%rax,8), %rcx                           #216.3
                                # LOE rax rdx rcx rsi r9 r12 r13 r14 r15 ebx r8d xmm0 xmm1 ymm2
..B1.34:                        # Preds ..B1.34 ..B1.33
                                # Execution count [1.60e+07]
        vmulsd    (%rcx), %xmm0, %xmm3                          #216.3
        incq      %rax                                          #216.3
        vmovsd    %xmm3, (%rcx)                                 #216.3
        addq      $8, %rcx                                      #216.3
        cmpq      %rdx, %rax                                    #216.3
        jb        ..B1.34       # Prob 96%                      #216.3
                                # LOE rax rdx rcx rsi r9 r12 r13 r14 r15 ebx r8d xmm0 xmm1 ymm2
..B1.36:                        # Preds ..B1.34 ..B1.32 ..B1.27
                                # Execution count [5.00e+05]
        incl      %r8d                                          #216.3
        addq      $32, %r9                                      #216.3
        addq      $256, %rsi                                    #216.3
        cmpl      $500000, %r8d                                 #216.3
        jb        ..B1.20       # Prob 99%                      #216.3
                                # LOE rsi r9 r12 r13 r14 r15 ebx r8d xmm0 xmm1 ymm2
..B1.37:                        # Preds ..B1.36
                                # Execution count [0.00e+00]
        xorb      %al, %al                                      #216.3
        xorl      %r9d, %r9d                                    #216.3
        vmovupd   .L_2il0floatpacket.6(%rip), %ymm1             #205.3
        vmovsd    .L_2il0floatpacket.7(%rip), %xmm0             #205.3
        movl      %ebx, (%rsp)                                  #216.3[spill]
        movq      %r12, 8(%rsp)                                 #216.3[spill]
                                # LOE r9 r13 r14 r15 al
..B1.38:                        # Preds ..B1.60 ..B1.37
                                # Execution count [0.00e+00]
        xorl      %edi, %edi                                    #216.3
        movb      %al, 24(%rsp)                                 #216.3[spill]
        xorl      %r8d, %r8d                                    #216.3
                                # LOE rdi r8 r9 r13 r14 r15
..B1.39:                        # Preds ..B1.59 ..B1.38
                                # Execution count [0.00e+00]
        imulq     $3200, %rdi, %r10                             #216.3
        xorl      %r11d, %r11d                                  #216.3
        lea       (%r15,%r9), %rax                              #216.3
        addq      %r8, %rax                                     #216.3
        lea       (%r14,%r9), %r12                              #216.3
        movq      %rax, 32(%rsp)                                #216.3[spill]
        addq      %r13, %r10                                    #216.3
                                # LOE rdi r8 r9 r10 r11 r12 r13 r14 r15
..B1.40:                        # Preds ..B1.58 ..B1.39
                                # Execution count [3.95e+01]
        imulq     $2016000, %r11, %rbx                          #216.3
        movq      %r11, %rax                                    #216.3
        xorl      %ecx, %ecx                                    #216.3
        shlq      $6, %rax                                      #216.3
        lea       (%r12,%rbx), %rdx                             #216.3
        movq      %r14, 64(%rsp)                                #216.3[spill]
        subq      %r11, %rax                                    #216.3
        movq      %r10, 88(%rsp)                                #216.3[spill]
        addq      %r10, %rbx                                    #216.3
        movq      %r12, 96(%rsp)                                #216.3[spill]
        xorl      %esi, %esi                                    #216.3
        movq      %r11, 104(%rsp)                               #216.3[spill]
        movq      %rdi, 112(%rsp)                               #216.3[spill]
        movq      %r15, 80(%rsp)                                #216.3[spill]
        xorb      %r15b, %r15b                                  #216.3
        movq      %r13, 72(%rsp)                                #216.3[spill]
        movq      32(%rsp), %r14                                #216.3[spill]
                                # LOE rax rdx rbx rsi r8 r9 r14 ecx r15b
..B1.41:                        # Preds ..B1.57 ..B1.40
                                # Execution count [9.94e+03]
        movq      %rax, 40(%rsp)                                #216.3[spill]
        movb      %r15b, %r10b                                  #216.3
        movq      %rdx, 48(%rsp)                                #216.3[spill]
        lea       (%rdx,%rsi), %r13                             #216.3
        movl      %ecx, 56(%rsp)                                #216.3[spill]
        lea       (%r14,%rsi), %r11                             #216.3
        movq      80(%rsp), %r14                                #216.3[spill]
        xorl      %r12d, %r12d                                  #216.3
        movq      %rax, %rdi                                    #216.3
                                # LOE rbx rsi rdi r8 r9 r11 r12 r13 r14 r10b
..B1.42:                        # Preds ..B1.55 ..B1.41
                                # Execution count [3.96e+04]
        cmpq      $3996, %rdi                                   #216.3
        jg        ..B1.56       # Prob 20%                      #216.3
                                # LOE rbx rsi rdi r8 r9 r11 r12 r13 r14 r10b
..B1.43:                        # Preds ..B1.42
                                # Execution count [3.17e+04]
        vmovsd    32016(%r12,%r13), %xmm0                       #216.3
        lea       96000(%rbx,%r12), %rcx                        #216.3
        vxorpd    %xmm7, %xmm7, %xmm7                           #216.3
        lea       (%rbx,%r12), %r15                             #216.3
        vmovapd   %xmm7, %xmm6                                  #216.3
        vmovapd   %xmm6, %xmm3                                  #216.3
        vmovapd   %xmm3, %xmm5                                  #216.3
        vmovapd   %xmm5, %xmm14                                 #216.3
        vmovapd   %xmm14, %xmm13                                #216.3
        vmovapd   %xmm13, %xmm12                                #216.3
        vmovsd    %xmm0, 416(%rsp)                              #216.3[spill]
        vmovapd   %xmm12, %xmm10                                #216.3
        vmovsd    32000(%r12,%r13), %xmm2                       #216.3
        vmovsd    32008(%r12,%r13), %xmm4                       #216.3
        vmovsd    32024(%r12,%r13), %xmm15                      #216.3
        vmovsd    64000(%r12,%r13), %xmm0                       #216.3
        vmovsd    64008(%r12,%r13), %xmm8                       #216.3
        vmovsd    64016(%r12,%r13), %xmm9                       #216.3
        vmovsd    64024(%r12,%r13), %xmm1                       #216.3
        andq      $31, %rcx                                     #216.3
        je        ..B1.48       # Prob 50%                      #216.3
                                # LOE rcx rbx rsi rdi r8 r9 r11 r12 r13 r14 r15 r10b xmm0 xmm1 xmm2 xmm3 xmm4 xmm5 xmm6 xmm7 xmm8 xmm9 xmm10 xmm12 xmm13 xmm14 xmm15
..B1.44:                        # Preds ..B1.43
                                # Execution count [3.17e+04]
        testq     $7, %rcx                                      #216.3
        jne       ..B1.79       # Prob 10%                      #216.3
                                # LOE rcx rbx rsi rdi r8 r9 r11 r12 r13 r14 r15 r10b xmm0 xmm1 xmm2 xmm3 xmm4 xmm5 xmm6 xmm7 xmm8 xmm9 xmm10 xmm12 xmm13 xmm14 xmm15
..B1.45:                        # Preds ..B1.44
                                # Execution count [3.17e+04]
        negq      %rcx                                          #216.3
        xorl      %edx, %edx                                    #216.3
        addq      $32, %rcx                                     #216.3
        xorl      %eax, %eax                                    #216.3
        shrq      $3, %rcx                                      #216.3
        vmovsd    %xmm9, 448(%rsp)                              #216.3[spill]
        vmovsd    %xmm0, 440(%rsp)                              #216.3[spill]
        vmovsd    %xmm15, 432(%rsp)                             #216.3[spill]
        vmovsd    %xmm4, 456(%rsp)                              #216.3[spill]
        vmovsd    %xmm2, 424(%rsp)                              #216.3[spill]
        vmovsd    %xmm12, 464(%rsp)                             #216.3[spill]
        vmovsd    %xmm13, 472(%rsp)                             #216.3[spill]
        vmovsd    %xmm14, 480(%rsp)                             #216.3[spill]
                                # LOE rax rdx rcx rbx rsi rdi r8 r9 r11 r12 r13 r14 r15 r10b xmm1 xmm3 xmm5 xmm6 xmm7 xmm8 xmm10
..B1.46:                        # Preds ..B1.46 ..B1.45
                                # Execution count [1.27e+07]
        vmovsd    .L_2il0floatpacket.7(%rip), %xmm15            #216.3
        vmulsd    (%r15,%rdx,8), %xmm15, %xmm14                 #216.3
        vmulsd    32000(%r15,%rdx,8), %xmm15, %xmm13            #216.3
        vmulsd    64000(%r15,%rdx,8), %xmm15, %xmm12            #216.3
        vmulsd    96000(%r15,%rdx,8), %xmm15, %xmm4             #216.3
        vmovsd    (%rax,%r11), %xmm0                            #216.3
        incq      %rdx                                          #216.3
        vmulsd    %xmm0, %xmm14, %xmm15                         #216.3
        vmovsd    8(%rax,%r11), %xmm9                           #216.3
        vaddsd    %xmm15, %xmm7, %xmm7                          #216.3
        vmulsd    %xmm9, %xmm14, %xmm15                         #216.3
        vmovsd    16(%rax,%r11), %xmm11                         #216.3
        vaddsd    %xmm15, %xmm6, %xmm6                          #216.3
        vmulsd    %xmm11, %xmm14, %xmm15                        #216.3
        vmovsd    24(%rax,%r11), %xmm2                          #216.3
        addq      $32000, %rax                                  #216.3
        vmulsd    %xmm2, %xmm14, %xmm14                         #216.3
        vaddsd    %xmm15, %xmm3, %xmm3                          #216.3
        vaddsd    %xmm14, %xmm5, %xmm5                          #216.3
        vmulsd    %xmm13, %xmm0, %xmm14                         #216.3
        vaddsd    424(%rsp), %xmm14, %xmm15                     #216.3[spill]
        vmulsd    %xmm13, %xmm9, %xmm14                         #216.3
        vmovsd    %xmm15, 424(%rsp)                             #216.3[spill]
        vaddsd    456(%rsp), %xmm14, %xmm15                     #216.3[spill]
        vmulsd    %xmm13, %xmm11, %xmm14                        #216.3
        vmulsd    %xmm13, %xmm2, %xmm13                         #216.3
        vmovsd    %xmm15, 456(%rsp)                             #216.3[spill]
        vaddsd    416(%rsp), %xmm14, %xmm15                     #216.3[spill]
        vmulsd    %xmm12, %xmm0, %xmm14                         #216.3
        vaddsd    432(%rsp), %xmm13, %xmm13                     #216.3[spill]
        vmulsd    %xmm4, %xmm0, %xmm0                           #216.3
        vmovsd    %xmm13, 432(%rsp)                             #216.3[spill]
        vmulsd    %xmm12, %xmm9, %xmm13                         #216.3
        vaddsd    480(%rsp), %xmm0, %xmm0                       #216.3[spill]
        vmulsd    %xmm4, %xmm9, %xmm9                           #216.3
        vaddsd    %xmm13, %xmm8, %xmm8                          #216.3
        vmovsd    %xmm0, 480(%rsp)                              #216.3[spill]
        vmovsd    %xmm15, 416(%rsp)                             #216.3[spill]
        vaddsd    472(%rsp), %xmm9, %xmm0                       #216.3[spill]
        vmulsd    %xmm12, %xmm11, %xmm9                         #216.3
        vaddsd    440(%rsp), %xmm14, %xmm15                     #216.3[spill]
        vmulsd    %xmm4, %xmm11, %xmm11                         #216.3
        vmulsd    %xmm12, %xmm2, %xmm12                         #216.3
        vaddsd    448(%rsp), %xmm9, %xmm13                      #216.3[spill]
        vmulsd    %xmm4, %xmm2, %xmm2                           #216.3
        vaddsd    %xmm12, %xmm1, %xmm1                          #216.3
        vaddsd    %xmm2, %xmm10, %xmm10                         #216.3
        vmovsd    %xmm0, 472(%rsp)                              #216.3[spill]
        vmovsd    %xmm15, 440(%rsp)                             #216.3[spill]
        vmovsd    %xmm13, 448(%rsp)                             #216.3[spill]
        vaddsd    464(%rsp), %xmm11, %xmm0                      #216.3[spill]
        vmovsd    %xmm0, 464(%rsp)                              #216.3[spill]
        cmpq      %rcx, %rdx                                    #216.3
        jb        ..B1.46       # Prob 99%                      #216.3
                                # LOE rax rdx rcx rbx rsi rdi r8 r9 r11 r12 r13 r14 r15 r10b xmm0 xmm1 xmm3 xmm5 xmm6 xmm7 xmm8 xmm10 xmm13 xmm15
..B1.47:                        # Preds ..B1.46
                                # Execution count [3.17e+04]
        vmovapd   %xmm0, %xmm12                                 #
        vmovapd   %xmm13, %xmm9                                 #
        vmovapd   %xmm15, %xmm0                                 #
        vmovsd    432(%rsp), %xmm15                             #[spill]
        vmovsd    456(%rsp), %xmm4                              #[spill]
        vmovsd    424(%rsp), %xmm2                              #[spill]
        vmovsd    472(%rsp), %xmm13                             #[spill]
        vmovsd    480(%rsp), %xmm14                             #[spill]
                                # LOE rcx rbx rsi rdi r8 r9 r11 r12 r13 r14 r15 r10b xmm0 xmm1 xmm2 xmm3 xmm4 xmm5 xmm6 xmm7 xmm8 xmm9 xmm10 xmm12 xmm13 xmm14 xmm15
..B1.48:                        # Preds ..B1.47 ..B1.43
                                # Execution count [3.17e+04]
        imulq     $32000, %rcx, %rax                            #216.3
        movq      %rcx, %rdx                                    #216.3
        vxorpd    %xmm11, %xmm11, %xmm11                        #216.3
        negq      %rdx                                          #216.3
        vmovsd    %xmm7, %xmm11, %xmm7                          #216.3
        addq      $400, %rdx                                    #216.3
        addq      %r8, %rax                                     #216.3
        andq      $3, %rdx                                      #216.3
        vmovsd    %xmm9, %xmm11, %xmm9                          #216.3
        vmovsd    %xmm1, %xmm11, %xmm1                          #216.3
        vmovsd    %xmm14, %xmm11, %xmm14                        #216.3
        vmovsd    %xmm13, %xmm11, %xmm13                        #216.3
        vmovsd    %xmm12, %xmm11, %xmm12                        #216.3
        vmovsd    %xmm10, %xmm11, %xmm10                        #216.3
        vmovsd    %xmm5, %xmm11, %xmm5                          #216.3
        negq      %rdx                                          #216.3
        addq      %rsi, %rax                                    #216.3
        vmovsd    %xmm4, %xmm11, %xmm4                          #216.3
        vmovsd    %xmm15, %xmm11, %xmm15                        #216.3
        vmovsd    %xmm0, %xmm11, %xmm0                          #216.3
        vmovsd    %xmm8, %xmm11, %xmm8                          #216.3
        movq      %r9, 120(%rsp)                                #216.3[spill]
        addq      $400, %rdx                                    #216.3
        addq      %r9, %rax                                     #216.3
        vmovaps   %xmm7, %xmm7                                  #216.3
        vmovups   %ymm7, 128(%rsp)                              #216.3[spill]
        vmovsd    %xmm6, %xmm11, %xmm7                          #216.3
        vmovsd    %xmm3, %xmm11, %xmm6                          #216.3
        vmovsd    %xmm2, %xmm11, %xmm3                          #216.3
        vmovsd    416(%rsp), %xmm2                              #216.3[spill]
        vmovsd    %xmm2, %xmm11, %xmm2                          #216.3
        vmovaps   %xmm7, %xmm7                                  #216.3
        vmovaps   %xmm6, %xmm6                                  #216.3
        vmovaps   %xmm9, %xmm9                                  #216.3
        vmovaps   %xmm1, %xmm1                                  #216.3
        vmovaps   %xmm14, %xmm14                                #216.3
        vmovaps   %xmm13, %xmm13                                #216.3
        vmovaps   %xmm12, %xmm12                                #216.3
        vmovaps   %xmm10, %xmm10                                #216.3
        vmovaps   %xmm5, %xmm5                                  #216.3
        vmovaps   %xmm3, %xmm3                                  #216.3
        vmovaps   %xmm4, %xmm4                                  #216.3
        vmovaps   %xmm2, %xmm2                                  #216.3
        vmovaps   %xmm15, %xmm15                                #216.3
        vmovaps   %xmm0, %xmm0                                  #216.3
        vmovaps   %xmm8, %xmm8                                  #216.3
        vmovups   %ymm10, 256(%rsp)                             #216.3[spill]
        vmovups   %ymm12, 288(%rsp)                             #216.3[spill]
        vmovups   %ymm13, 224(%rsp)                             #216.3[spill]
        vmovups   %ymm14, 192(%rsp)                             #216.3[spill]
        vmovups   %ymm1, 320(%rsp)                              #216.3[spill]
        vmovups   %ymm9, 160(%rsp)                              #216.3[spill]
        vmovups   %ymm6, 384(%rsp)                              #216.3[spill]
        vmovups   %ymm7, 352(%rsp)                              #216.3[spill]
                                # LOE rax rdx rcx rbx rsi rdi r8 r11 r12 r13 r14 r15 r10b ymm0 ymm2 ymm3 ymm4 ymm5 ymm8 ymm15
..B1.49:                        # Preds ..B1.49 ..B1.48
                                # Execution count [1.27e+07]
        vmovupd   .L_2il0floatpacket.6(%rip), %ymm9             #216.3
        lea       (%rax,%r14), %r9                              #216.3
        vmovups   (%r9), %xmm11                                 #216.3
        vmovups   32000(%r9), %xmm7                             #216.3
        vmulpd    (%r15,%rcx,8), %ymm9, %ymm13                  #216.3
        vmovups   16(%r9), %xmm6                                #216.3
        vmulpd    32000(%r15,%rcx,8), %ymm9, %ymm12             #216.3
        vmulpd    64000(%r15,%rcx,8), %ymm9, %ymm14             #216.3
        vmulpd    96000(%r15,%rcx,8), %ymm9, %ymm9              #216.3
        addq      $4, %rcx                                      #216.3
        addq      $128000, %rax                                 #216.3
        vinsertf128 $1, 64000(%r9), %ymm11, %ymm10              #216.3
        vmovups   32016(%r9), %xmm11                            #216.3
        vinsertf128 $1, 96000(%r9), %ymm7, %ymm7                #216.3
        vinsertf128 $1, 64016(%r9), %ymm6, %ymm1                #216.3
        vinsertf128 $1, 96016(%r9), %ymm11, %ymm6               #216.3
        vunpcklpd %ymm7, %ymm10, %ymm11                         #216.3
        vunpckhpd %ymm7, %ymm10, %ymm10                         #216.3
        vunpcklpd %ymm6, %ymm1, %ymm7                           #216.3
        vunpckhpd %ymm6, %ymm1, %ymm1                           #216.3
        vmulpd    %ymm11, %ymm13, %ymm6                         #216.3
        vaddpd    128(%rsp), %ymm6, %ymm6                       #216.3[spill]
        vmovups   %ymm6, 128(%rsp)                              #216.3[spill]
        vmulpd    %ymm10, %ymm13, %ymm6                         #216.3
        vaddpd    352(%rsp), %ymm6, %ymm6                       #216.3[spill]
        vmovups   %ymm6, 352(%rsp)                              #216.3[spill]
        vmulpd    %ymm7, %ymm13, %ymm6                          #216.3
        vmulpd    %ymm1, %ymm13, %ymm13                         #216.3
        vaddpd    384(%rsp), %ymm6, %ymm6                       #216.3[spill]
        vaddpd    %ymm13, %ymm5, %ymm5                          #216.3
        vmulpd    %ymm10, %ymm12, %ymm13                        #216.3
        vmovups   %ymm6, 384(%rsp)                              #216.3[spill]
        vmulpd    %ymm11, %ymm12, %ymm6                         #216.3
        vaddpd    %ymm13, %ymm4, %ymm4                          #216.3
        vmulpd    %ymm10, %ymm14, %ymm13                        #216.3
        vmulpd    %ymm10, %ymm9, %ymm10                         #216.3
        vaddpd    %ymm6, %ymm3, %ymm3                           #216.3
        vaddpd    %ymm13, %ymm8, %ymm8                          #216.3
        vmulpd    %ymm7, %ymm12, %ymm6                          #216.3
        vmulpd    %ymm1, %ymm12, %ymm12                         #216.3
        vaddpd    %ymm6, %ymm2, %ymm2                           #216.3
        vaddpd    %ymm12, %ymm15, %ymm15                        #216.3
        vmulpd    %ymm11, %ymm14, %ymm6                         #216.3
        vmulpd    %ymm11, %ymm9, %ymm11                         #216.3
        vaddpd    %ymm6, %ymm0, %ymm0                           #216.3
        vaddpd    224(%rsp), %ymm10, %ymm6                      #216.3[spill]
        .byte     144                                           #216.3
        vaddpd    192(%rsp), %ymm11, %ymm12                     #216.3[spill]
        vmulpd    %ymm7, %ymm14, %ymm10                         #216.3
        vmulpd    %ymm1, %ymm14, %ymm14                         #216.3
        vmulpd    %ymm7, %ymm9, %ymm7                           #216.3
        vmulpd    %ymm1, %ymm9, %ymm1                           #216.3
        vmovups   %ymm6, 224(%rsp)                              #216.3[spill]
        vmovups   %ymm12, 192(%rsp)                             #216.3[spill]
        vaddpd    160(%rsp), %ymm10, %ymm11                     #216.3[spill]
        vaddpd    320(%rsp), %ymm14, %ymm6                      #216.3[spill]
        vaddpd    288(%rsp), %ymm7, %ymm10                      #216.3[spill]
        vaddpd    256(%rsp), %ymm1, %ymm9                       #216.3[spill]
        vmovups   %ymm11, 160(%rsp)                             #216.3[spill]
        vmovups   %ymm6, 320(%rsp)                              #216.3[spill]
        vmovups   %ymm10, 288(%rsp)                             #216.3[spill]
        vmovups   %ymm9, 256(%rsp)                              #216.3[spill]
        cmpq      %rdx, %rcx                                    #216.3
        jb        ..B1.49       # Prob 99%                      #216.3
                                # LOE rax rdx rcx rbx rsi rdi r8 r11 r12 r13 r14 r15 r10b ymm0 ymm2 ymm3 ymm4 ymm5 ymm6 ymm8 ymm9 ymm10 ymm11 ymm12 ymm15
..B1.50:                        # Preds ..B1.49
                                # Execution count [3.17e+04]
        vmovaps   %ymm12, %ymm14                                #
        vmovaps   %ymm10, %ymm12                                #
        vmovaps   %ymm9, %ymm10                                 #
        vmovups   224(%rsp), %ymm13                             #[spill]
        vmovaps   %ymm6, %ymm1                                  #
        vmovaps   %ymm11, %ymm9                                 #
        vmovups   384(%rsp), %ymm6                              #[spill]
        vmovups   352(%rsp), %ymm7                              #[spill]
        movq      120(%rsp), %r9                                #[spill]
        vextractf128 $1, %ymm10, %xmm11                         #216.3
        vaddpd    %xmm11, %xmm10, %xmm10                        #216.3
        vunpckhpd %xmm10, %xmm10, %xmm11                        #216.3
        vaddsd    %xmm11, %xmm10, %xmm10                        #216.3
        vextractf128 $1, %ymm12, %xmm11                         #216.3
        vaddpd    %xmm11, %xmm12, %xmm12                        #216.3
        vunpckhpd %xmm12, %xmm12, %xmm11                        #216.3
        vaddsd    %xmm11, %xmm12, %xmm12                        #216.3
        vextractf128 $1, %ymm13, %xmm11                         #216.3
        vaddpd    %xmm11, %xmm13, %xmm13                        #216.3
        vunpckhpd %xmm13, %xmm13, %xmm11                        #216.3
        vaddsd    %xmm11, %xmm13, %xmm13                        #216.3
        vextractf128 $1, %ymm14, %xmm11                         #216.3
        vaddpd    %xmm11, %xmm14, %xmm14                        #216.3
        vunpckhpd %xmm14, %xmm14, %xmm11                        #216.3
        vaddsd    %xmm11, %xmm14, %xmm14                        #216.3
        vextractf128 $1, %ymm1, %xmm11                          #216.3
        vaddpd    %xmm11, %xmm1, %xmm1                          #216.3
        vunpckhpd %xmm1, %xmm1, %xmm11                          #216.3
        vaddsd    %xmm11, %xmm1, %xmm1                          #216.3
        vextractf128 $1, %ymm9, %xmm11                          #216.3
        vaddpd    %xmm11, %xmm9, %xmm9                          #216.3
        vunpckhpd %xmm9, %xmm9, %xmm11                          #216.3
        vaddsd    %xmm11, %xmm9, %xmm9                          #216.3
        vextractf128 $1, %ymm8, %xmm11                          #216.3
        vaddpd    %xmm11, %xmm8, %xmm8                          #216.3
        vunpckhpd %xmm8, %xmm8, %xmm11                          #216.3
        vaddsd    %xmm11, %xmm8, %xmm8                          #216.3
        vextractf128 $1, %ymm0, %xmm11                          #216.3
        vaddpd    %xmm11, %xmm0, %xmm0                          #216.3
        vunpckhpd %xmm0, %xmm0, %xmm11                          #216.3
        vaddsd    %xmm11, %xmm0, %xmm0                          #216.3
        vextractf128 $1, %ymm15, %xmm11                         #216.3
        vaddpd    %xmm11, %xmm15, %xmm15                        #216.3
        vunpckhpd %xmm15, %xmm15, %xmm11                        #216.3
        vaddsd    %xmm11, %xmm15, %xmm15                        #216.3
        vextractf128 $1, %ymm2, %xmm11                          #216.3
        vaddpd    %xmm11, %xmm2, %xmm2                          #216.3
        vunpckhpd %xmm2, %xmm2, %xmm11                          #216.3
        vaddsd    %xmm11, %xmm2, %xmm2                          #216.3
        vmovsd    %xmm2, 416(%rsp)                              #216.3[spill]
        vextractf128 $1, %ymm4, %xmm2                           #216.3
        vaddpd    %xmm2, %xmm4, %xmm4                           #216.3
        vunpckhpd %xmm4, %xmm4, %xmm11                          #216.3
        vaddsd    %xmm11, %xmm4, %xmm4                          #216.3
        vextractf128 $1, %ymm3, %xmm2                           #216.3
        vaddpd    %xmm2, %xmm3, %xmm3                           #216.3
        vunpckhpd %xmm3, %xmm3, %xmm11                          #216.3
        vaddsd    %xmm11, %xmm3, %xmm2                          #216.3
        vextractf128 $1, %ymm5, %xmm3                           #216.3
        vaddpd    %xmm3, %xmm5, %xmm5                           #216.3
        vunpckhpd %xmm5, %xmm5, %xmm11                          #216.3
        vaddsd    %xmm11, %xmm5, %xmm5                          #216.3
        vextractf128 $1, %ymm6, %xmm3                           #216.3
        vaddpd    %xmm3, %xmm6, %xmm6                           #216.3
        vunpckhpd %xmm6, %xmm6, %xmm11                          #216.3
        vaddsd    %xmm11, %xmm6, %xmm3                          #216.3
        vextractf128 $1, %ymm7, %xmm6                           #216.3
        vaddpd    %xmm6, %xmm7, %xmm7                           #216.3
        vunpckhpd %xmm7, %xmm7, %xmm11                          #216.3
        vaddsd    %xmm11, %xmm7, %xmm6                          #216.3
        vmovups   128(%rsp), %ymm7                              #216.3[spill]
        vextractf128 $1, %ymm7, %xmm11                          #216.3
        vaddpd    %xmm11, %xmm7, %xmm7                          #216.3
        vunpckhpd %xmm7, %xmm7, %xmm11                          #216.3
        vaddsd    %xmm11, %xmm7, %xmm7                          #216.3
                                # LOE rdx rbx rsi rdi r8 r9 r11 r12 r13 r14 r15 r10b xmm0 xmm1 xmm2 xmm3 xmm4 xmm5 xmm6 xmm7 xmm8 xmm9 xmm10 xmm12 xmm13 xmm14 xmm15
..B1.51:                        # Preds ..B1.50 ..B1.79
                                # Execution count [3.17e+04]
        imulq     $32000, %rdx, %rax                            #216.3
        cmpq      $400, %rdx                                    #216.3
        jae       ..B1.55       # Prob 0%                       #216.3
                                # LOE rax rdx rbx rsi rdi r8 r9 r11 r12 r13 r14 r15 r10b xmm0 xmm1 xmm2 xmm3 xmm4 xmm5 xmm6 xmm7 xmm8 xmm9 xmm10 xmm12 xmm13 xmm14 xmm15
..B1.52:                        # Preds ..B1.51
                                # Execution count [3.17e+04]
        vmovsd    %xmm1, 504(%rsp)                              #[spill]
        vmovsd    %xmm9, 448(%rsp)                              #[spill]
        vmovsd    %xmm8, 496(%rsp)                              #[spill]
        vmovsd    %xmm0, 440(%rsp)                              #[spill]
        vmovsd    %xmm15, 432(%rsp)                             #[spill]
        vmovsd    %xmm2, 424(%rsp)                              #[spill]
        vmovsd    %xmm3, 488(%rsp)                              #[spill]
        vmovsd    %xmm6, 512(%rsp)                              #[spill]
                                # LOE rax rdx rbx rsi rdi r8 r9 r11 r12 r13 r14 r15 r10b xmm4 xmm5 xmm7 xmm10 xmm12 xmm13 xmm14
..B1.53:                        # Preds ..B1.53 ..B1.52
                                # Execution count [1.27e+07]
        vmovsd    .L_2il0floatpacket.7(%rip), %xmm15            #216.3
        vmulsd    (%r15,%rdx,8), %xmm15, %xmm11                 #216.3
        vmulsd    32000(%r15,%rdx,8), %xmm15, %xmm8             #216.3
        vmulsd    64000(%r15,%rdx,8), %xmm15, %xmm9             #216.3
        vmulsd    96000(%r15,%rdx,8), %xmm15, %xmm2             #216.3
        vmovsd    (%rax,%r11), %xmm0                            #216.3
        incq      %rdx                                          #216.3
        vmulsd    %xmm0, %xmm11, %xmm15                         #216.3
        vmovsd    8(%rax,%r11), %xmm6                           #216.3
        vaddsd    %xmm15, %xmm7, %xmm7                          #216.3
        vmulsd    %xmm6, %xmm11, %xmm15                         #216.3
        vmovsd    16(%rax,%r11), %xmm1                          #216.3
        vmovsd    24(%rax,%r11), %xmm3                          #216.3
        addq      $32000, %rax                                  #216.3
        vaddsd    512(%rsp), %xmm15, %xmm15                     #216.3[spill]
        vmovsd    %xmm15, 512(%rsp)                             #216.3[spill]
        vmulsd    %xmm1, %xmm11, %xmm15                         #216.3
        vmulsd    %xmm3, %xmm11, %xmm11                         #216.3
        vaddsd    488(%rsp), %xmm15, %xmm15                     #216.3[spill]
        vaddsd    %xmm11, %xmm5, %xmm5                          #216.3
        vmulsd    %xmm8, %xmm0, %xmm11                          #216.3
        vmovsd    %xmm15, 488(%rsp)                             #216.3[spill]
        vaddsd    424(%rsp), %xmm11, %xmm15                     #216.3[spill]
        vmulsd    %xmm8, %xmm6, %xmm11                          #216.3
        vmovsd    %xmm15, 424(%rsp)                             #216.3[spill]
        vaddsd    %xmm11, %xmm4, %xmm4                          #216.3
        vmulsd    %xmm8, %xmm1, %xmm15                          #216.3
        vmulsd    %xmm8, %xmm3, %xmm8                           #216.3
        vaddsd    416(%rsp), %xmm15, %xmm11                     #216.3[spill]
        vaddsd    432(%rsp), %xmm8, %xmm8                       #216.3[spill]
        vmovsd    %xmm11, 416(%rsp)                             #216.3[spill]
        vmulsd    %xmm9, %xmm0, %xmm11                          #216.3
        vmulsd    %xmm2, %xmm0, %xmm0                           #216.3
        vaddsd    440(%rsp), %xmm11, %xmm15                     #216.3[spill]
        vaddsd    %xmm0, %xmm14, %xmm14                         #216.3
        vmulsd    %xmm9, %xmm6, %xmm0                           #216.3
        vmulsd    %xmm2, %xmm6, %xmm6                           #216.3
        vmovsd    %xmm8, 432(%rsp)                              #216.3[spill]
        vaddsd    %xmm6, %xmm13, %xmm13                         #216.3
        vaddsd    496(%rsp), %xmm0, %xmm8                       #216.3[spill]
        vmulsd    %xmm9, %xmm1, %xmm0                           #216.3
        vmulsd    %xmm9, %xmm3, %xmm9                           #216.3
        vmulsd    %xmm2, %xmm1, %xmm1                           #216.3
        vaddsd    448(%rsp), %xmm0, %xmm6                       #216.3[spill]
        vmulsd    %xmm2, %xmm3, %xmm2                           #216.3
        vaddsd    504(%rsp), %xmm9, %xmm0                       #216.3[spill]
        vaddsd    %xmm1, %xmm12, %xmm12                         #216.3
        vaddsd    %xmm2, %xmm10, %xmm10                         #216.3
        vmovsd    %xmm15, 440(%rsp)                             #216.3[spill]
        vmovsd    %xmm8, 496(%rsp)                              #216.3[spill]
        vmovsd    %xmm6, 448(%rsp)                              #216.3[spill]
        vmovsd    %xmm0, 504(%rsp)                              #216.3[spill]
        cmpq      $400, %rdx                                    #216.3
        jb        ..B1.53       # Prob 99%                      #216.3
                                # LOE rax rdx rbx rsi rdi r8 r9 r11 r12 r13 r14 r15 r10b xmm0 xmm4 xmm5 xmm6 xmm7 xmm8 xmm10 xmm12 xmm13 xmm14 xmm15
..B1.54:                        # Preds ..B1.53
                                # Execution count [3.17e+04]
        vmovapd   %xmm0, %xmm1                                  #
        vmovapd   %xmm6, %xmm9                                  #
        vmovapd   %xmm15, %xmm0                                 #
        vmovsd    432(%rsp), %xmm15                             #[spill]
        vmovsd    424(%rsp), %xmm2                              #[spill]
        vmovsd    488(%rsp), %xmm3                              #[spill]
        vmovsd    512(%rsp), %xmm6                              #[spill]
                                # LOE rbx rsi rdi r8 r9 r11 r12 r13 r14 r10b xmm0 xmm1 xmm2 xmm3 xmm4 xmm5 xmm6 xmm7 xmm8 xmm9 xmm10 xmm12 xmm13 xmm14 xmm15
..B1.55:                        # Preds ..B1.54 ..B1.51
                                # Execution count [3.17e+04]
        vmovsd    %xmm1, 64024(%r12,%r13)                       #216.3
        incb      %r10b                                         #216.3
        vmovsd    %xmm8, 64008(%r12,%r13)                       #216.3
        addq      $4, %rdi                                      #216.3
        vmovsd    %xmm4, 32008(%r12,%r13)                       #216.3
        vmovsd    %xmm2, 32000(%r12,%r13)                       #216.3
        vmovsd    %xmm0, 64000(%r12,%r13)                       #216.3
        vmovsd    416(%rsp), %xmm0                              #216.3[spill]
        vmovsd    %xmm9, 64016(%r12,%r13)                       #216.3
        vmovsd    %xmm15, 32024(%r12,%r13)                      #216.3
        vmovsd    %xmm0, 32016(%r12,%r13)                       #216.3
        vaddsd    96024(%r12,%r13), %xmm10, %xmm1               #216.3
        vaddsd    96016(%r12,%r13), %xmm12, %xmm2               #216.3
        vaddsd    96008(%r12,%r13), %xmm13, %xmm4               #216.3
        vaddsd    96000(%r12,%r13), %xmm14, %xmm8               #216.3
        vaddsd    24(%r12,%r13), %xmm5, %xmm5                   #216.3
        vaddsd    16(%r12,%r13), %xmm3, %xmm3                   #216.3
        vaddsd    8(%r12,%r13), %xmm6, %xmm6                    #216.3
        vaddsd    (%r12,%r13), %xmm7, %xmm7                     #216.3
        vmovsd    %xmm1, 96024(%r12,%r13)                       #216.3
        vmovsd    %xmm2, 96016(%r12,%r13)                       #216.3
        vmovsd    %xmm4, 96008(%r12,%r13)                       #216.3
        vmovsd    %xmm8, 96000(%r12,%r13)                       #216.3
        vmovsd    %xmm5, 24(%r12,%r13)                          #216.3
        vmovsd    %xmm3, 16(%r12,%r13)                          #216.3
        vmovsd    %xmm6, 8(%r12,%r13)                           #216.3
        vmovsd    %xmm7, (%r12,%r13)                            #216.3
        addq      $128000, %r12                                 #216.3
        cmpb      $16, %r10b                                    #216.3
        jb        ..B1.42       # Prob 93%                      #216.3
                                # LOE rbx rsi rdi r8 r9 r11 r12 r13 r14 r10b
..B1.56:                        # Preds ..B1.42 ..B1.55
                                # Execution count [2.01e+03]
        movq      40(%rsp), %rax                                #[spill]
        xorb      %r15b, %r15b                                  #
        movq      48(%rsp), %rdx                                #[spill]
        movl      56(%rsp), %ecx                                #[spill]
        movq      32(%rsp), %r14                                #[spill]
                                # LOE rax rdx rbx rsi r8 r9 r14 ecx r15b
..B1.57:                        # Preds ..B1.56
                                # Execution count [9.94e+03]
        incl      %ecx                                          #216.3
        addq      $32, %rsi                                     #216.3
        cmpl      $250, %ecx                                    #216.3
        jb        ..B1.41       # Prob 99%                      #216.3
                                # LOE rax rdx rbx rsi r8 r9 r14 ecx r15b
..B1.58:                        # Preds ..B1.57
                                # Execution count [9.94e+03]
        movq      104(%rsp), %r11                               #[spill]
        incq      %r11                                          #216.3
        movq      88(%rsp), %r10                                #[spill]
        movq      96(%rsp), %r12                                #[spill]
        movq      112(%rsp), %rdi                               #[spill]
        movq      80(%rsp), %r15                                #[spill]
        movq      72(%rsp), %r13                                #[spill]
        movq      64(%rsp), %r14                                #[spill]
        cmpq      $63, %r11                                     #216.3
        jb        ..B1.40       # Prob 98%                      #216.3
                                # LOE rdi r8 r9 r10 r11 r12 r13 r14 r15
..B1.59:                        # Preds ..B1.58
                                # Execution count [4.01e+01]
        incq      %rdi                                          #216.3
        addq      $12800000, %r8                                #216.3
        cmpq      $10, %rdi                                     #216.3
        jb        ..B1.39       # Prob 90%                      #216.3
                                # LOE rdi r8 r9 r13 r14 r15
..B1.60:                        # Preds ..B1.59
                                # Execution count [4.01e+00]
        movb      24(%rsp), %al                                 #[spill]
        addq      $8000, %r9                                    #216.3
        incb      %al                                           #216.3
        cmpb      $4, %al                                       #216.3
        jb        ..B1.38       # Prob 75%                      #216.3
                                # LOE r9 r13 r14 r15 al
..B1.61:                        # Preds ..B1.60
                                # Execution count [1.00e+00]

### 	       alpha, beta,
### 	       POLYBENCH_ARRAY(C),
### 	       POLYBENCH_ARRAY(A),
### 	       POLYBENCH_ARRAY(B));
### 
###   /* Stop and print timer. */
###   polybench_stop_instruments;

        xorl      %eax, %eax                                    #223.3
        movl      (%rsp), %ebx                                  #[spill]
        movq      8(%rsp), %r12                                 #[spill]
        vzeroupper                                              #223.3
..___tag_value_main.148:
#       polybench_timer_stop()
        call      polybench_timer_stop                          #223.3
..___tag_value_main.149:
                                # LOE r12 r13 r14 r15 ebx
..B1.62:                        # Preds ..B1.61
                                # Execution count [1.00e+00]

###   polybench_print_instruments;

        xorl      %eax, %eax                                    #224.3
..___tag_value_main.150:
#       polybench_timer_print()
        call      polybench_timer_print                         #224.3
..___tag_value_main.151:
                                # LOE r12 r13 r14 r15 ebx
..B1.63:                        # Preds ..B1.62
                                # Execution count [1.00e+00]

### 
###   /* Prevent dead-code elimination. All live-out data must be printed
###      by the function call in argument. */
###   polybench_prevent_dce(print_array(ni, nj,  POLYBENCH_ARRAY(C)));

        cmpl      $42, %ebx                                     #228.3
        jle       ..B1.73       # Prob 50%                      #228.3
                                # LOE r12 r13 r14 r15
..B1.64:                        # Preds ..B1.63
                                # Execution count [5.00e-01]
        movl      $.L_2__STRING.2, %esi                         #228.3
        movq      (%r12), %rdi                                  #228.3
..L152:                                                         #228.3
        movb      (%rdi), %dl                                   #228.3
        cmpb      (%rsi), %dl                                   #228.3
        jne       ..L154        # Prob 50%                      #228.3
        testb     %dl, %dl                                      #228.3
        je        ..L153        # Prob 50%                      #228.3
        movb      1(%rdi), %dl                                  #228.3
        cmpb      1(%rsi), %dl                                  #228.3
        jne       ..L154        # Prob 50%                      #228.3
        addq      $2, %rdi                                      #228.3
        addq      $2, %rsi                                      #228.3
        testb     %dl, %dl                                      #228.3
        jne       ..L152        # Prob 50%                      #228.3
..L153:                                                         #
        xorl      %eax, %eax                                    #228.3
        jmp       ..L155        # Prob 100%                     #228.3
..L154:                                                         #
        sbbl      %eax, %eax                                    #228.3
        orl       $1, %eax                                      #228.3
..L155:                                                         #
                                # LOE r13 r14 r15 eax
..B1.88:                        # Preds ..B1.64
                                # Execution count [5.00e-01]
        testl     %eax, %eax                                    #228.3
        jne       ..B1.73       # Prob 78%                      #228.3
                                # LOE r13 r14 r15
..B1.65:                        # Preds ..B1.88
                                # Execution count [4.40e-02]
        xorl      %eax, %eax                                    #228.3
        movq      %r14, 64(%rsp)                                #228.3[spill]
        xorl      %ebx, %ebx                                    #228.3
        movq      %r15, 80(%rsp)                                #228.3[spill]
        movq      %r13, 72(%rsp)                                #228.3[spill]
        movq      16(%rsp), %r14                                #228.3[spill]
                                # LOE r14 eax ebx
..B1.66:                        # Preds ..B1.71 ..B1.65
                                # Execution count [4.95e-01]
        movl      %eax, (%rsp)                                  #228.3[spill]
        xorl      %r13d, %r13d                                  #228.3
        xorl      %r12d, %r12d                                  #228.3
        movl      %ebx, %r15d                                   #228.3
                                # LOE r12 r14 ebx r13d r15d
..B1.67:                        # Preds ..B1.70 ..B1.66
                                # Execution count [2.75e+00]
        movl      $.L_2__STRING.0, %esi                         #228.3
        movl      $1, %eax                                      #228.3
        vmovsd    (%r14,%r12,8), %xmm0                          #228.3
        movq      stderr(%rip), %rdi                            #228.3
#       fprintf(FILE *__restrict__, const char *__restrict__, ...)
        call      fprintf                                       #228.3
                                # LOE r12 r14 ebx r13d r15d
..B1.68:                        # Preds ..B1.67
                                # Execution count [2.75e+00]
        movl      $1717986919, %eax                             #228.3
        movl      %r15d, %ecx                                   #228.3
        imull     %r15d                                         #228.3
        sarl      $31, %ecx                                     #228.3
        sarl      $3, %edx                                      #228.3
        subl      %ecx, %edx                                    #228.3
        lea       (%rdx,%rdx,4), %esi                           #228.3
        shll      $2, %esi                                      #228.3
        cmpl      %r15d, %esi                                   #228.3
        jne       ..B1.70       # Prob 78%                      #228.3
                                # LOE r12 r14 ebx r13d r15d
..B1.69:                        # Preds ..B1.68
                                # Execution count [6.05e-01]
        movl      $10, %edi                                     #228.3
        movq      stderr(%rip), %rsi                            #228.3
        call      fputc                                         #228.3
                                # LOE r12 r14 ebx r13d r15d
..B1.70:                        # Preds ..B1.69 ..B1.68
                                # Execution count [2.75e+00]
        incl      %r13d                                         #228.3
        incq      %r12                                          #228.3
        incl      %r15d                                         #228.3
        cmpl      $4000, %r13d                                  #228.3
        jl        ..B1.67       # Prob 82%                      #228.3
                                # LOE r12 r14 ebx r13d r15d
..B1.71:                        # Preds ..B1.70
                                # Execution count [5.50e-01]
        movl      (%rsp), %eax                                  #[spill]
        addl      $4000, %ebx                                   #228.3
        incl      %eax                                          #228.3
        addq      $32000, %r14                                  #228.3
        cmpl      $4000, %eax                                   #228.3
        jl        ..B1.66       # Prob 82%                      #228.3
                                # LOE r14 eax ebx
..B1.72:                        # Preds ..B1.71
                                # Execution count [1.10e-01]
        movl      $10, %edi                                     #228.3
        movq      stderr(%rip), %rsi                            #228.3
        movq      80(%rsp), %r15                                #[spill]
        movq      72(%rsp), %r13                                #[spill]
        movq      64(%rsp), %r14                                #[spill]
        call      fputc                                         #228.3
                                # LOE r13 r14 r15
..B1.73:                        # Preds ..B1.72 ..B1.63 ..B1.88
                                # Execution count [1.00e+00]

### 
###   /* Be clean. */
###   POLYBENCH_FREE_ARRAY(C);

        movq      %r14, %rdi                                    #231.3
#       free(void *)
        call      free                                          #231.3
                                # LOE r13 r15
..B1.74:                        # Preds ..B1.73
                                # Execution count [1.00e+00]

###   POLYBENCH_FREE_ARRAY(A);

        movq      %r13, %rdi                                    #232.3
#       free(void *)
        call      free                                          #232.3
                                # LOE r15
..B1.75:                        # Preds ..B1.74
                                # Execution count [1.00e+00]

###   POLYBENCH_FREE_ARRAY(B);

        movq      %r15, %rdi                                    #233.3
#       free(void *)
        call      free                                          #233.3
                                # LOE
..B1.76:                        # Preds ..B1.75
                                # Execution count [1.00e+00]

### 
###   return 0;

        xorl      %eax, %eax                                    #235.10
        addq      $600, %rsp                                    #235.10
	.cfi_restore 3
        popq      %rbx                                          #235.10
	.cfi_restore 15
        popq      %r15                                          #235.10
	.cfi_restore 14
        popq      %r14                                          #235.10
	.cfi_restore 13
        popq      %r13                                          #235.10
	.cfi_restore 12
        popq      %r12                                          #235.10
        movq      %rbp, %rsp                                    #235.10
        popq      %rbp                                          #235.10
	.cfi_def_cfa 7, 8
	.cfi_restore 6
        ret                                                     #235.10
	.cfi_def_cfa 6, 16
	.cfi_escape 0x10, 0x03, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xd8, 0xff, 0xff, 0xff, 0x22
	.cfi_offset 6, -16
	.cfi_escape 0x10, 0x0c, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xf8, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0d, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xf0, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0e, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xe8, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0f, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xe0, 0xff, 0xff, 0xff, 0x22
                                # LOE
..B1.78:                        # Preds ..B1.21
                                # Execution count [5.00e+04]: Infreq
        xorl      %ecx, %ecx                                    #216.3
        movl      $32, %edx                                     #216.3
        xorl      %eax, %eax                                    #216.3
        jmp       ..B1.32       # Prob 100%                     #216.3
                                # LOE rax rdx rcx rsi r9 r12 r13 r14 r15 ebx r8d xmm0 xmm1 ymm2
..B1.79:                        # Preds ..B1.44
                                # Execution count [3.17e+03]: Infreq
        xorl      %edx, %edx                                    #216.3
        jmp       ..B1.51       # Prob 100%                     #216.3
                                # LOE rdx rbx rsi rdi r8 r9 r11 r12 r13 r14 r15 r10b xmm0 xmm1 xmm2 xmm3 xmm4 xmm5 xmm6 xmm7 xmm8 xmm9 xmm10 xmm12 xmm13 xmm14 xmm15
..B1.81:                        # Preds ..B1.28
                                # Execution count [5.00e+04]: Infreq
        xorl      %eax, %eax                                    #216.3
        jmp       ..B1.32       # Prob 100%                     #216.3
        .align    16,0x90
                                # LOE rax rdx rcx rsi r9 r12 r13 r14 r15 ebx r8d xmm0 xmm1 ymm2
	.cfi_endproc
# mark_end;
	.type	main,@function
	.size	main,.-main
..LNmain.0:
	.data
# -- End  main
	.section .rodata, "a"
	.align 32
	.align 32
.L_2il0floatpacket.1:
	.long	0x00000000,0x40af4000,0x00000000,0x40af4000,0x00000000,0x40af4000,0x00000000,0x40af4000
	.type	.L_2il0floatpacket.1,@object
	.size	.L_2il0floatpacket.1,32
	.align 32
.L_2il0floatpacket.3:
	.long	0x00000000,0x40a09600,0x00000000,0x40a09600,0x00000000,0x40a09600,0x00000000,0x40a09600
	.type	.L_2il0floatpacket.3,@object
	.size	.L_2il0floatpacket.3,32
	.align 32
.L_2il0floatpacket.6:
	.long	0x00000000,0x40dfa700,0x00000000,0x40dfa700,0x00000000,0x40dfa700,0x00000000,0x40dfa700
	.type	.L_2il0floatpacket.6,@object
	.size	.L_2il0floatpacket.6,32
	.align 16
.L_2il0floatpacket.0:
	.long	0x00000004,0x00000004,0x00000004,0x00000004
	.type	.L_2il0floatpacket.0,@object
	.size	.L_2il0floatpacket.0,16
	.align 16
.L_2il0floatpacket.4:
	.long	0x00000000,0x40a09600,0x00000000,0x40a09600
	.type	.L_2il0floatpacket.4,@object
	.size	.L_2il0floatpacket.4,16
	.align 8
.L_2il0floatpacket.2:
	.long	0x00000000,0x40af4000
	.type	.L_2il0floatpacket.2,@object
	.size	.L_2il0floatpacket.2,8
	.align 8
.L_2il0floatpacket.5:
	.long	0x00000000,0x40a09600
	.type	.L_2il0floatpacket.5,@object
	.size	.L_2il0floatpacket.5,8
	.align 8
.L_2il0floatpacket.7:
	.long	0x00000000,0x40dfa700
	.type	.L_2il0floatpacket.7,@object
	.size	.L_2il0floatpacket.7,8
	.section .rodata.str1.4, "aMS",@progbits,1
	.align 4
	.align 4
.L_2__STRING.2:
	.byte	0
	.type	.L_2__STRING.2,@object
	.size	.L_2__STRING.2,1
	.space 3, 0x00 	# pad
	.align 4
.L_2__STRING.0:
	.long	841887781
	.long	2123372
	.type	.L_2__STRING.0,@object
	.size	.L_2__STRING.0,8
	.data
	.section .note.GNU-stack, ""
# End
