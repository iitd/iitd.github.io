	.section .text
.LNDBG_TX:
# mark_description "Intel(R) C Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.3.199 Build 20190206";
# mark_description "-I ../polybench-c-3.2/utilities/ -g -O3 -DPOLYBENCH_TIME -DEXTRALARGE_DATASET -DDATA_TYPE_IS_INT -S";
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
# parameter 1(argc): %edi
# parameter 2(argv): %rsi
..B1.1:                         # Preds ..B1.0
                                # Execution count [1.00e+00]
	.cfi_startproc
..___tag_value_main.2:
..L3:
                                                          #162.1
..LN0:
	.file   1 "../gemm-handopt/gemm-handopt.c"
	.loc    1  162  is_stmt 1
        pushq     %rbp                                          #162.1
	.cfi_def_cfa_offset 16
..LN1:
        movq      %rsp, %rbp                                    #162.1
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
..LN2:
        andq      $-128, %rsp                                   #162.1
..LN3:
        pushq     %r12                                          #162.1
..LN4:
        pushq     %r13                                          #162.1
..LN5:
        pushq     %r14                                          #162.1
..LN6:
        pushq     %r15                                          #162.1
..LN7:
        pushq     %rbx                                          #162.1
..LN8:
        subq      $88, %rsp                                     #162.1
	.cfi_escape 0x10, 0x03, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xd8, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0c, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xf8, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0d, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xf0, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0e, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xe8, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0f, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xe0, 0xff, 0xff, 0xff, 0x22
..LN9:
        movq      %rsi, %rbx                                    #162.1
..LN10:
        movl      %edi, %r12d                                   #162.1
..LN11:
        xorl      %esi, %esi                                    #162.1
..LN12:
        movl      $3, %edi                                      #162.1
..LN13:
        call      __intel_new_feature_proc_init                 #162.1
..LN14:
                                # LOE rbx r12d
..B1.89:                        # Preds ..B1.1
                                # Execution count [1.00e+00]
..LN15:
        stmxcsr   (%rsp)                                        #162.1
..LN16:
	.loc    1  172  prologue_end  is_stmt 1
        movl      $16000000, %edi                               #172.3
..LN17:
        movl      $8, %esi                                      #172.3
..LN18:
	.loc    1  162  is_stmt 1
        orl       $32832, (%rsp)                                #162.1
..LN19:
        ldmxcsr   (%rsp)                                        #162.1
..___tag_value_main.13:
..LN20:
	.loc    1  172  is_stmt 1
#       polybench_alloc_data(unsigned long long, int)
        call      polybench_alloc_data                          #172.3
..___tag_value_main.14:
..LN21:
                                # LOE rax rbx r12d
..B1.88:                        # Preds ..B1.89
                                # Execution count [1.00e+00]
..LN22:
        movq      %rax, %r14                                    #172.3
..LN23:
                                # LOE rbx r14 r12d
..B1.2:                         # Preds ..B1.88
                                # Execution count [1.00e+00]
..LN24:
	.loc    1  173  is_stmt 1
        movl      $16000000, %edi                               #173.3
..LN25:
        movl      $8, %esi                                      #173.3
..___tag_value_main.15:
..LN26:
#       polybench_alloc_data(unsigned long long, int)
        call      polybench_alloc_data                          #173.3
..___tag_value_main.16:
..LN27:
                                # LOE rax rbx r14 r12d
..B1.90:                        # Preds ..B1.2
                                # Execution count [1.00e+00]
..LN28:
        movq      %rax, %r15                                    #173.3
..LN29:
                                # LOE rbx r14 r15 r12d
..B1.3:                         # Preds ..B1.90
                                # Execution count [1.00e+00]
..LN30:
	.loc    1  174  is_stmt 1
        movl      $16000000, %edi                               #174.3
..LN31:
        movl      $8, %esi                                      #174.3
..___tag_value_main.17:
..LN32:
#       polybench_alloc_data(unsigned long long, int)
        call      polybench_alloc_data                          #174.3
..___tag_value_main.18:
..LN33:
                                # LOE rax rbx r14 r15 r12d
..B1.91:                        # Preds ..B1.3
                                # Execution count [1.00e+00]
..LN34:
        movq      %rax, %r13                                    #174.3
..LN35:
                                # LOE rbx r13 r14 r15 r12d
..B1.4:                         # Preds ..B1.91
                                # Execution count [3.76e-01]
..LN36:
	.loc    1  36  is_stmt 1
        movq      %r14, %rcx                                    #36.3
..LN37:
        xorl      %r10d, %r10d                                  #36.3
..LN38:
	.loc    1  41  is_stmt 1
        movdqu    .L_2il0floatpacket.0(%rip), %xmm4             #41.7
..LN39:
        pxor      %xmm2, %xmm2                                  #41.7
..LN40:
        movups    .L_2il0floatpacket.1(%rip), %xmm3             #41.37
..LN41:
	.loc    1  36  is_stmt 1
        xorl      %r8d, %r8d                                    #36.3
..LN42:
	.loc    1  38  is_stmt 1
        movsd     .L_2il0floatpacket.2(%rip), %xmm1             #38.37
..LN43:
	.loc    1  36  is_stmt 1
        movq      %rcx, 8(%rsp)                                 #36.3[spill]
..LN44:
                                # LOE rcx rbx r8 r13 r14 r15 r10d r12d xmm1 xmm2 xmm3 xmm4
..B1.5:                         # Preds ..B1.19 ..B1.4
                                # Execution count [4.23e+00]
..L20:
                # optimization report
                # %s was not vectorized: inner loop was already vectorized
..LN45:
	.loc    1  37  is_stmt 1
        movq      %rcx, %r11                                    #37.5
..LN46:
        andq      $15, %r11                                     #37.5
..LN47:
        movl      %r11d, %r11d                                  #37.5
..LN48:
        testl     %r11d, %r11d                                  #37.5
..LN49:
        je        ..B1.8        # Prob 50%                      #37.5
..LN50:
                                # LOE rcx rbx r8 r11 r13 r14 r15 r10d r12d xmm1 xmm2 xmm3 xmm4
..B1.6:                         # Preds ..B1.5
                                # Execution count [4.23e+00]
..LN51:
        testl     $7, %r11d                                     #37.5
..LN52:
        jne       ..B1.78       # Prob 10%                      #37.5
..LN53:
                                # LOE rcx rbx r8 r13 r14 r15 r10d r12d xmm1 xmm2 xmm3 xmm4
..B1.7:                         # Preds ..B1.6
                                # Execution count [4.23e+00]
..L21:
                # optimization report
                # PEELED LOOP FOR VECTORIZATION
..LN54:
	.loc    1  38  is_stmt 1
        movq      %r8, (%rcx)                                   #38.7
..LN55:
	.loc    1  37  is_stmt 1
        movl      $1, %r11d                                     #37.5
..LN56:
                                # LOE rcx rbx r8 r11 r13 r14 r15 r10d r12d xmm1 xmm2 xmm3 xmm4
..B1.8:                         # Preds ..B1.7 ..B1.5
                                # Execution count [4.23e+00]
..LN57:
        movl      %r11d, %eax                                   #37.5
..LN58:
	.loc    1  38  is_stmt 1
        pxor      %xmm0, %xmm0                                  #38.30
..LN59:
	.loc    1  37  is_stmt 1
        negl      %eax                                          #37.5
..LN60:
	.loc    1  38  is_stmt 1
        lea       1(%r11), %edx                                 #38.7
..LN61:
        cvtsi2sd  %r10d, %xmm0                                  #38.30
..LN62:
	.loc    1  37  is_stmt 1
        andl      $7, %eax                                      #37.5
..LN63:
	.loc    1  38  is_stmt 1
        movd      %r11d, %xmm5                                  #38.7
..LN64:
	.loc    1  37  is_stmt 1
        negl      %eax                                          #37.5
..LN65:
	.loc    1  38  is_stmt 1
        movd      %edx, %xmm6                                   #38.7
..LN66:
        punpckldq %xmm6, %xmm5                                  #38.7
..LN67:
        unpcklpd  %xmm0, %xmm0                                  #38.30
..LN68:
        punpcklqdq %xmm2, %xmm5                                 #38.7
..LN69:
	.loc    1  37  is_stmt 1
        lea       4000(%rax), %esi                              #37.5
..LN70:
        movl      %esi, %r9d                                    #37.5
..LN71:
        lea       (%rcx,%r11,8), %rdx                           #37.5
        .align    16,0x90
..LN72:
                                # LOE rdx rcx rbx r8 r9 r11 r13 r14 r15 eax esi r10d r12d xmm0 xmm1 xmm2 xmm3 xmm4 xmm5
..B1.9:                         # Preds ..B1.9 ..B1.8
                                # Execution count [2.35e+01]
..L22:
                # optimization report
                # LOOP WAS UNROLLED BY 4
                # LOOP WAS VECTORIZED
                # VECTORIZATION SPEEDUP COEFFECIENT 1.741211
                # VECTOR TRIP COUNT IS KNOWN CONSTANT
                # VECTOR LENGTH 2
                # NORMALIZED VECTORIZATION OVERHEAD 0.078125
                # MAIN VECTOR TYPE: 64-bits floating point
..LN73:
	.loc    1  38  is_stmt 1
        cvtdq2pd  %xmm5, %xmm6                                  #38.32
..LN74:
        paddd     %xmm4, %xmm5                                  #38.7
..LN75:
	.loc    1  37  is_stmt 1
        addq      $8, %r11                                      #37.5
..LN76:
	.loc    1  38  is_stmt 1
        cvtdq2pd  %xmm5, %xmm7                                  #38.32
..LN77:
        mulpd     %xmm0, %xmm6                                  #38.32
..LN78:
        mulpd     %xmm0, %xmm7                                  #38.32
..LN79:
        divpd     %xmm3, %xmm6                                  #38.37
..LN80:
        paddd     %xmm4, %xmm5                                  #38.7
..LN81:
        cvtdq2pd  %xmm5, %xmm8                                  #38.32
..LN82:
        divpd     %xmm3, %xmm7                                  #38.37
..LN83:
        paddd     %xmm4, %xmm5                                  #38.7
..LN84:
        cvtdq2pd  %xmm5, %xmm9                                  #38.32
..LN85:
        mulpd     %xmm0, %xmm8                                  #38.32
..LN86:
        mulpd     %xmm0, %xmm9                                  #38.32
..LN87:
        divpd     %xmm3, %xmm8                                  #38.37
..LN88:
        divpd     %xmm3, %xmm9                                  #38.37
..LN89:
        movups    %xmm6, (%rdx)                                 #38.7
..LN90:
        paddd     %xmm4, %xmm5                                  #38.7
..LN91:
        movups    %xmm7, 16(%rdx)                               #38.7
..LN92:
        movups    %xmm8, 32(%rdx)                               #38.7
..LN93:
        movups    %xmm9, 48(%rdx)                               #38.7
..LN94:
	.loc    1  37  is_stmt 1
        addq      $64, %rdx                                     #37.5
..LN95:
        cmpq      %r9, %r11                                     #37.5
..LN96:
        jb        ..B1.9        # Prob 81%                      #37.5
..LN97:
                                # LOE rdx rcx rbx r8 r9 r11 r13 r14 r15 eax esi r10d r12d xmm0 xmm1 xmm2 xmm3 xmm4 xmm5
..B1.10:                        # Preds ..B1.9
                                # Execution count [4.23e+00]
..LN98:
        lea       4001(%rax), %edx                              #37.5
..LN99:
        cmpl      $4000, %edx                                   #37.5
..LN100:
        ja        ..B1.19       # Prob 50%                      #37.5
..LN101:
                                # LOE rcx rbx r8 r9 r13 r14 r15 eax esi r10d r12d xmm0 xmm1 xmm2 xmm3 xmm4
..B1.11:                        # Preds ..B1.10
                                # Execution count [4.23e+00]
..LN102:
        movl      %esi, %edx                                    #37.5
..LN103:
        negl      %edx                                          #37.5
..LN104:
        addl      $4000, %edx                                   #37.5
..LN105:
        cmpl      $2, %edx                                      #37.5
..LN106:
        jb        ..B1.82       # Prob 10%                      #37.5
..LN107:
                                # LOE rcx rbx r8 r9 r13 r14 r15 eax edx esi r10d r12d xmm0 xmm1 xmm2 xmm3 xmm4
..B1.12:                        # Preds ..B1.11
                                # Execution count [4.23e+00]
..LN108:
	.loc    1  38  is_stmt 1
        addl      $4001, %eax                                   #38.7
..LN109:
        movd      %esi, %xmm5                                   #38.7
..LN110:
	.loc    1  37  is_stmt 1
        xorl      %r11d, %r11d                                  #37.5
..LN111:
	.loc    1  38  is_stmt 1
        movd      %eax, %xmm6                                   #38.7
..LN112:
	.loc    1  37  is_stmt 1
        movl      %edx, %eax                                    #37.5
..LN113:
	.loc    1  38  is_stmt 1
        punpckldq %xmm6, %xmm5                                  #38.7
..LN114:
	.loc    1  37  is_stmt 1
        andl      $-2, %eax                                     #37.5
..LN115:
	.loc    1  38  is_stmt 1
        punpcklqdq %xmm2, %xmm5                                 #38.7
..LN116:
                                # LOE rcx rbx r8 r9 r13 r14 r15 eax edx esi r10d r11d r12d xmm0 xmm1 xmm2 xmm3 xmm4 xmm5
..B1.13:                        # Preds ..B1.13 ..B1.12
                                # Execution count [2.35e+01]
..L23:
                # optimization report
                # LOOP WAS VECTORIZED
                # REMAINDER LOOP FOR VECTORIZATION
                # VECTORIZATION SPEEDUP COEFFECIENT 1.409180
                # VECTOR TRIP COUNT IS ESTIMATED CONSTANT
                # VECTOR LENGTH 2
                # NORMALIZED VECTORIZATION OVERHEAD 0.281250
                # MAIN VECTOR TYPE: 64-bits floating point
..LN117:
	.loc    1  37  is_stmt 1
..LN118:
	.loc    1  38  is_stmt 1
        cvtdq2pd  %xmm5, %xmm6                                  #38.32
..LN119:
        mulpd     %xmm0, %xmm6                                  #38.32
..LN120:
        divpd     %xmm3, %xmm6                                  #38.37
..LN121:
	.loc    1  37  is_stmt 1
        addl      $2, %r11d                                     #37.5
..LN122:
	.loc    1  38  is_stmt 1
        paddd     %xmm4, %xmm5                                  #38.7
..LN123:
        movups    %xmm6, (%rcx,%r9,8)                           #38.7
..LN124:
	.loc    1  37  is_stmt 1
        addq      $2, %r9                                       #37.5
..LN125:
        cmpl      %eax, %r11d                                   #37.5
..LN126:
        jb        ..B1.13       # Prob 81%                      #37.5
..LN127:
                                # LOE rcx rbx r8 r9 r13 r14 r15 eax edx esi r10d r11d r12d xmm0 xmm1 xmm2 xmm3 xmm4 xmm5
..B1.15:                        # Preds ..B1.13 ..B1.82 ..B1.78
                                # Execution count [4.23e+00]
..LN128:
        cmpl      %edx, %eax                                    #37.5
..LN129:
        jae       ..B1.19       # Prob 0%                       #37.5
..LN130:
                                # LOE rcx rbx r8 r13 r14 r15 eax edx esi r10d r12d xmm1 xmm2 xmm3 xmm4
..B1.16:                        # Preds ..B1.15
                                # Execution count [4.23e+00]
..LN131:
	.loc    1  38  is_stmt 1
        pxor      %xmm0, %xmm0                                  #38.30
..LN132:
        cvtsi2sd  %r10d, %xmm0                                  #38.30
..LN133:
                                # LOE rcx rbx r8 r13 r14 r15 eax edx esi r10d r12d xmm0 xmm1 xmm2 xmm3 xmm4
..B1.17:                        # Preds ..B1.17 ..B1.16
                                # Execution count [2.35e+01]
..L24:
                # optimization report
                # REMAINDER LOOP FOR VECTORIZATION
                # VECTORIZATION SPEEDUP COEFFECIENT 1.409180
                # VECTOR TRIP COUNT IS ESTIMATED CONSTANT
                # VECTOR LENGTH 2
                # NORMALIZED VECTORIZATION OVERHEAD 0.281250
..LN134:
	.loc    1  37  is_stmt 1
..LN135:
	.loc    1  38  is_stmt 1
        pxor      %xmm5, %xmm5                                  #38.32
..LN136:
        lea       (%rsi,%rax), %r9d                             #38.7
..LN137:
        cvtsi2sd  %r9d, %xmm5                                   #38.32
..LN138:
        mulsd     %xmm0, %xmm5                                  #38.32
..LN139:
	.loc    1  37  is_stmt 1
        incl      %eax                                          #37.5
..LN140:
	.loc    1  38  is_stmt 1
        divsd     %xmm1, %xmm5                                  #38.37
..LN141:
        movslq    %r9d, %r9                                     #38.7
..LN142:
        movsd     %xmm5, (%rcx,%r9,8)                           #38.7
..LN143:
	.loc    1  37  is_stmt 1
        cmpl      %edx, %eax                                    #37.5
..LN144:
        jb        ..B1.17       # Prob 81%                      #37.5
..LN145:
                                # LOE rcx rbx r8 r13 r14 r15 eax edx esi r10d r12d xmm0 xmm1 xmm2 xmm3 xmm4
..B1.19:                        # Preds ..B1.17 ..B1.15 ..B1.10
                                # Execution count [4.23e+00]
..LN146:
	.loc    1  36  is_stmt 1
        incl      %r10d                                         #36.3
..LN147:
        addq      $32000, %rcx                                  #36.3
..LN148:
        cmpl      $4000, %r10d                                  #36.3
..LN149:
        jb        ..B1.5        # Prob 91%                      #36.3
..LN150:
                                # LOE rcx rbx r8 r13 r14 r15 r10d r12d xmm1 xmm2 xmm3 xmm4
..B1.20:                        # Preds ..B1.19
                                # Execution count [3.76e-01]
..LN151:
	.loc    1  39  is_stmt 1
        movq      %rbx, (%rsp)                                  #39.3[spill]
..LN152:
        xorl      %r9d, %r9d                                    #39.3
..LN153:
        movq      %r15, %r8                                     #39.3
..LN154:
        movq      %r13, %rsi                                    #39.3
..LN155:
        xorl      %eax, %eax                                    #39.3
..LN156:
                                # LOE rax rsi r8 r13 r14 r15 r9d r12d xmm1 xmm2 xmm3 xmm4
..B1.21:                        # Preds ..B1.40 ..B1.20
                                # Execution count [4.23e+00]
..L26:
                # optimization report
                # LOOP WAS FUSED
                # %s was not vectorized: inner loop was already vectorized
..LN157:
	.loc    1  40  is_stmt 1
        movq      %rsi, %r10                                    #40.5
..LN158:
        andq      $15, %r10                                     #40.5
..LN159:
        movl      %r10d, %r10d                                  #40.5
..LN160:
        testl     %r10d, %r10d                                  #40.5
..LN161:
        je        ..B1.24       # Prob 50%                      #40.5
..LN162:
                                # LOE rax rsi r8 r10 r13 r14 r15 r9d r12d xmm1 xmm2 xmm3 xmm4
..B1.22:                        # Preds ..B1.21
                                # Execution count [4.23e+00]
..LN163:
        testl     $7, %r10d                                     #40.5
..LN164:
        jne       ..B1.81       # Prob 10%                      #40.5
..LN165:
                                # LOE rax rsi r8 r13 r14 r15 r9d r12d xmm1 xmm2 xmm3 xmm4
..B1.23:                        # Preds ..B1.22
                                # Execution count [4.23e+00]
..L27:
                # optimization report
                # LOOP WAS FUSED
                # PEELED LOOP FOR VECTORIZATION
..LN166:
	.loc    1  41  is_stmt 1
        movq      %rax, (%r8)                                   #41.7
..LN167:
	.loc    1  40  is_stmt 1
        movl      $1, %r10d                                     #40.5
..LN168:
	.loc    1  44  is_stmt 1
        movq      %rax, (%rsi)                                  #44.7
..LN169:
                                # LOE rax rsi r8 r10 r13 r14 r15 r9d r12d xmm1 xmm2 xmm3 xmm4
..B1.24:                        # Preds ..B1.23 ..B1.21
                                # Execution count [2.35e+01]
..LN170:
	.loc    1  40  is_stmt 1
        movl      %r10d, %ecx                                   #40.5
..LN171:
	.loc    1  41  is_stmt 1
        lea       1(%r10), %ebx                                 #41.7
..LN172:
	.loc    1  40  is_stmt 1
        negl      %ecx                                          #40.5
..LN173:
	.loc    1  41  is_stmt 1
        movd      %r10d, %xmm5                                  #41.7
..LN174:
	.loc    1  40  is_stmt 1
        andl      $7, %ecx                                      #40.5
..LN175:
	.loc    1  41  is_stmt 1
        pxor      %xmm0, %xmm0                                  #41.30
..LN176:
	.loc    1  40  is_stmt 1
        negl      %ecx                                          #40.5
..LN177:
	.loc    1  41  is_stmt 1
        movd      %ebx, %xmm6                                   #41.7
..LN178:
        punpckldq %xmm6, %xmm5                                  #41.7
..LN179:
        cvtsi2sd  %r9d, %xmm0                                   #41.30
..LN180:
        punpcklqdq %xmm2, %xmm5                                 #41.7
..LN181:
	.loc    1  40  is_stmt 1
        lea       (%r8,%r10,8), %r11                            #40.5
..LN182:
        lea       4000(%rcx), %edx                              #40.5
..LN183:
        movl      %edx, %ebx                                    #40.5
..LN184:
        testq     $15, %r11                                     #40.5
..LN185:
        je        ..B1.28       # Prob 60%                      #40.5
..LN186:
                                # LOE rax rbx rsi r8 r10 r13 r14 r15 edx ecx r9d r12d xmm0 xmm1 xmm2 xmm3 xmm4 xmm5
..B1.25:                        # Preds ..B1.24
                                # Execution count [4.23e+00]
..LN187:
        lea       (%rsi,%r10,8), %rdi                           #40.5
..LN188:
	.loc    1  41  is_stmt 1
        unpcklpd  %xmm0, %xmm0                                  #41.30
..LN189:
	.loc    1  40  is_stmt 1
        lea       (%r8,%r10,8), %r11                            #40.5
        .align    16,0x90
..LN190:
                                # LOE rax rbx rsi rdi r8 r10 r11 r13 r14 r15 edx ecx r9d r12d xmm0 xmm1 xmm2 xmm3 xmm4 xmm5
..B1.26:                        # Preds ..B1.26 ..B1.25
                                # Execution count [2.35e+01]
..L28:
                # optimization report
                # LOOP WAS FUSED
                # LOOP WAS UNROLLED BY 4
                # LOOP WAS VECTORIZED
                # VECTORIZATION SPEEDUP COEFFECIENT 1.715820
                # ALTERNATE ALIGNMENT VECTOR LOOP
                # VECTOR TRIP COUNT IS KNOWN CONSTANT
                # VECTOR LENGTH 2
                # NORMALIZED VECTORIZATION OVERHEAD 0.058594
..LN191:
	.loc    1  41  is_stmt 1
        cvtdq2pd  %xmm5, %xmm6                                  #41.32
..LN192:
        paddd     %xmm4, %xmm5                                  #41.7
..LN193:
	.loc    1  40  is_stmt 1
        addq      $8, %r10                                      #40.5
..LN194:
	.loc    1  41  is_stmt 1
        cvtdq2pd  %xmm5, %xmm7                                  #41.32
..LN195:
        mulpd     %xmm0, %xmm6                                  #41.32
..LN196:
        mulpd     %xmm0, %xmm7                                  #41.32
..LN197:
        divpd     %xmm3, %xmm6                                  #41.37
..LN198:
        paddd     %xmm4, %xmm5                                  #41.7
..LN199:
        cvtdq2pd  %xmm5, %xmm8                                  #41.32
..LN200:
        divpd     %xmm3, %xmm7                                  #41.37
..LN201:
        paddd     %xmm4, %xmm5                                  #41.7
..LN202:
        cvtdq2pd  %xmm5, %xmm9                                  #41.32
..LN203:
        mulpd     %xmm0, %xmm8                                  #41.32
..LN204:
        movups    %xmm6, (%r11)                                 #41.7
..LN205:
        mulpd     %xmm0, %xmm9                                  #41.32
..LN206:
        divpd     %xmm3, %xmm8                                  #41.37
..LN207:
        divpd     %xmm3, %xmm9                                  #41.37
..LN208:
	.loc    1  44  is_stmt 1
        movups    %xmm6, (%rdi)                                 #44.7
..LN209:
	.loc    1  41  is_stmt 1
        paddd     %xmm4, %xmm5                                  #41.7
..LN210:
        movups    %xmm7, 16(%r11)                               #41.7
..LN211:
	.loc    1  44  is_stmt 1
        movups    %xmm7, 16(%rdi)                               #44.7
..LN212:
	.loc    1  41  is_stmt 1
        movups    %xmm8, 32(%r11)                               #41.7
..LN213:
	.loc    1  44  is_stmt 1
        movups    %xmm8, 32(%rdi)                               #44.7
..LN214:
	.loc    1  41  is_stmt 1
        movups    %xmm9, 48(%r11)                               #41.7
..LN215:
	.loc    1  44  is_stmt 1
        movups    %xmm9, 48(%rdi)                               #44.7
..LN216:
	.loc    1  40  is_stmt 1
        addq      $64, %r11                                     #40.5
..LN217:
        addq      $64, %rdi                                     #40.5
..LN218:
        cmpq      %rbx, %r10                                    #40.5
..LN219:
        jb        ..B1.26       # Prob 82%                      #40.5
..LN220:
        jmp       ..B1.31       # Prob 100%                     #40.5
..LN221:
                                # LOE rax rbx rsi rdi r8 r10 r11 r13 r14 r15 edx ecx r9d r12d xmm0 xmm1 xmm2 xmm3 xmm4 xmm5
..B1.28:                        # Preds ..B1.24
                                # Execution count [4.23e+00]
..LN222:
        lea       (%rsi,%r10,8), %rdi                           #40.5
..LN223:
	.loc    1  41  is_stmt 1
        unpcklpd  %xmm0, %xmm0                                  #41.30
..LN224:
	.loc    1  40  is_stmt 1
        lea       (%r8,%r10,8), %r11                            #40.5
        .align    16,0x90
..LN225:
                                # LOE rax rbx rsi rdi r8 r10 r11 r13 r14 r15 edx ecx r9d r12d xmm0 xmm1 xmm2 xmm3 xmm4 xmm5
..B1.29:                        # Preds ..B1.29 ..B1.28
                                # Execution count [2.35e+01]
..L29:
                # optimization report
                # LOOP WAS FUSED
                # LOOP WAS UNROLLED BY 4
                # LOOP WAS VECTORIZED
                # VECTORIZATION SPEEDUP COEFFECIENT 1.715820
                # VECTOR TRIP COUNT IS KNOWN CONSTANT
                # VECTOR LENGTH 2
                # NORMALIZED VECTORIZATION OVERHEAD 0.058594
                # MAIN VECTOR TYPE: 64-bits floating point
..LN226:
	.loc    1  41  is_stmt 1
        cvtdq2pd  %xmm5, %xmm6                                  #41.32
..LN227:
        paddd     %xmm4, %xmm5                                  #41.7
..LN228:
	.loc    1  40  is_stmt 1
        addq      $8, %r10                                      #40.5
..LN229:
	.loc    1  41  is_stmt 1
        cvtdq2pd  %xmm5, %xmm7                                  #41.32
..LN230:
        mulpd     %xmm0, %xmm6                                  #41.32
..LN231:
        mulpd     %xmm0, %xmm7                                  #41.32
..LN232:
        divpd     %xmm3, %xmm6                                  #41.37
..LN233:
        paddd     %xmm4, %xmm5                                  #41.7
..LN234:
        cvtdq2pd  %xmm5, %xmm8                                  #41.32
..LN235:
        divpd     %xmm3, %xmm7                                  #41.37
..LN236:
        paddd     %xmm4, %xmm5                                  #41.7
..LN237:
        cvtdq2pd  %xmm5, %xmm9                                  #41.32
..LN238:
        mulpd     %xmm0, %xmm8                                  #41.32
..LN239:
        mulpd     %xmm0, %xmm9                                  #41.32
..LN240:
        divpd     %xmm3, %xmm8                                  #41.37
..LN241:
        divpd     %xmm3, %xmm9                                  #41.37
..LN242:
        movups    %xmm6, (%r11)                                 #41.7
..LN243:
        paddd     %xmm4, %xmm5                                  #41.7
..LN244:
	.loc    1  44  is_stmt 1
        movups    %xmm6, (%rdi)                                 #44.7
..LN245:
	.loc    1  41  is_stmt 1
        movups    %xmm7, 16(%r11)                               #41.7
..LN246:
	.loc    1  44  is_stmt 1
        movups    %xmm7, 16(%rdi)                               #44.7
..LN247:
	.loc    1  41  is_stmt 1
        movups    %xmm8, 32(%r11)                               #41.7
..LN248:
	.loc    1  44  is_stmt 1
        movups    %xmm8, 32(%rdi)                               #44.7
..LN249:
	.loc    1  41  is_stmt 1
        movups    %xmm9, 48(%r11)                               #41.7
..LN250:
	.loc    1  40  is_stmt 1
        addq      $64, %r11                                     #40.5
..LN251:
	.loc    1  44  is_stmt 1
        movups    %xmm9, 48(%rdi)                               #44.7
..LN252:
	.loc    1  40  is_stmt 1
        addq      $64, %rdi                                     #40.5
..LN253:
        cmpq      %rbx, %r10                                    #40.5
..LN254:
        jb        ..B1.29       # Prob 82%                      #40.5
..LN255:
                                # LOE rax rbx rsi rdi r8 r10 r11 r13 r14 r15 edx ecx r9d r12d xmm0 xmm1 xmm2 xmm3 xmm4 xmm5
..B1.31:                        # Preds ..B1.29 ..B1.26
                                # Execution count [3.39e+00]
..LN256:
        lea       4001(%rcx), %ebx                              #40.5
..LN257:
        cmpl      $4000, %ebx                                   #40.5
..LN258:
        ja        ..B1.40       # Prob 50%                      #40.5
..LN259:
                                # LOE rax rsi r8 r13 r14 r15 edx ecx r9d r12d xmm0 xmm1 xmm2 xmm3 xmm4
..B1.32:                        # Preds ..B1.31
                                # Execution count [4.23e+00]
..LN260:
        movl      %edx, %r10d                                   #40.5
..LN261:
        negl      %r10d                                         #40.5
..LN262:
        addl      $4000, %r10d                                  #40.5
..LN263:
        cmpl      $2, %r10d                                     #40.5
..LN264:
        jb        ..B1.80       # Prob 10%                      #40.5
..LN265:
                                # LOE rax rsi r8 r13 r14 r15 edx ecx r9d r10d r12d xmm0 xmm1 xmm2 xmm3 xmm4
..B1.33:                        # Preds ..B1.32
                                # Execution count [4.23e+00]
..LN266:
	.loc    1  41  is_stmt 1
        movd      %edx, %xmm5                                   #41.7
..LN267:
        lea       4001(%rcx), %ebx                              #41.7
..LN268:
	.loc    1  40  is_stmt 1
        movl      %r10d, %r11d                                  #40.5
..LN269:
        andl      $-2, %r11d                                    #40.5
..LN270:
	.loc    1  41  is_stmt 1
        movd      %ebx, %xmm6                                   #41.7
..LN271:
	.loc    1  40  is_stmt 1
        xorl      %ebx, %ebx                                    #40.5
..LN272:
	.loc    1  41  is_stmt 1
        punpckldq %xmm6, %xmm5                                  #41.7
..LN273:
        punpcklqdq %xmm2, %xmm5                                 #41.7
..LN274:
                                # LOE rax rsi r8 r13 r14 r15 edx ecx ebx r9d r10d r11d r12d xmm0 xmm1 xmm2 xmm3 xmm4 xmm5
..B1.34:                        # Preds ..B1.34 ..B1.33
                                # Execution count [2.35e+01]
..L30:
                # optimization report
                # LOOP WAS FUSED
                # LOOP WAS VECTORIZED
                # REMAINDER LOOP FOR VECTORIZATION
                # VECTORIZATION HAS UNALIGNED MEMORY REFERENCES
                # VECTORIZATION SPEEDUP COEFFECIENT 1.396484
                # VECTOR TRIP COUNT IS ESTIMATED CONSTANT
                # VECTOR LENGTH 2
                # NORMALIZED VECTORIZATION OVERHEAD 0.203125
                # MAIN VECTOR TYPE: 64-bits floating point
..LN275:
	.loc    1  40  is_stmt 1
..LN276:
	.loc    1  41  is_stmt 1
        cvtdq2pd  %xmm5, %xmm6                                  #41.32
..LN277:
        mulpd     %xmm0, %xmm6                                  #41.32
..LN278:
        divpd     %xmm3, %xmm6                                  #41.37
..LN279:
        paddd     %xmm4, %xmm5                                  #41.7
..LN280:
        lea       4000(%rbx,%rcx), %edi                         #41.7
..LN281:
        movslq    %edi, %rdi                                    #41.7
..LN282:
	.loc    1  40  is_stmt 1
        addl      $2, %ebx                                      #40.5
..LN283:
	.loc    1  41  is_stmt 1
        movups    %xmm6, (%r8,%rdi,8)                           #41.7
..LN284:
	.loc    1  44  is_stmt 1
        movups    %xmm6, (%rsi,%rdi,8)                          #44.7
..LN285:
	.loc    1  40  is_stmt 1
        cmpl      %r11d, %ebx                                   #40.5
..LN286:
        jb        ..B1.34       # Prob 82%                      #40.5
..LN287:
                                # LOE rax rsi r8 r13 r14 r15 edx ecx ebx r9d r10d r11d r12d xmm0 xmm1 xmm2 xmm3 xmm4 xmm5
..B1.36:                        # Preds ..B1.34 ..B1.80 ..B1.81
                                # Execution count [4.23e+00]
..LN288:
        cmpl      %r10d, %r11d                                  #40.5
..LN289:
        jae       ..B1.40       # Prob 0%                       #40.5
..LN290:
                                # LOE rax rsi r8 r13 r14 r15 edx r9d r10d r11d r12d xmm1 xmm2 xmm3 xmm4
..B1.37:                        # Preds ..B1.36
                                # Execution count [4.23e+00]
..LN291:
	.loc    1  41  is_stmt 1
        pxor      %xmm0, %xmm0                                  #41.30
..LN292:
        cvtsi2sd  %r9d, %xmm0                                   #41.30
..LN293:
                                # LOE rax rsi r8 r13 r14 r15 edx r9d r10d r11d r12d xmm0 xmm1 xmm2 xmm3 xmm4
..B1.38:                        # Preds ..B1.38 ..B1.37
                                # Execution count [2.35e+01]
..L31:
                # optimization report
                # LOOP WAS FUSED
                # REMAINDER LOOP FOR VECTORIZATION
                # VECTORIZATION SPEEDUP COEFFECIENT 1.396484
                # VECTOR TRIP COUNT IS ESTIMATED CONSTANT
                # VECTOR LENGTH 2
                # NORMALIZED VECTORIZATION OVERHEAD 0.203125
..LN294:
	.loc    1  40  is_stmt 1
..LN295:
	.loc    1  41  is_stmt 1
        pxor      %xmm5, %xmm5                                  #41.32
..LN296:
        lea       (%rdx,%r11), %ecx                             #41.7
..LN297:
        cvtsi2sd  %ecx, %xmm5                                   #41.32
..LN298:
        mulsd     %xmm0, %xmm5                                  #41.32
..LN299:
	.loc    1  40  is_stmt 1
        incl      %r11d                                         #40.5
..LN300:
	.loc    1  41  is_stmt 1
        divsd     %xmm1, %xmm5                                  #41.37
..LN301:
        movslq    %ecx, %rcx                                    #41.7
..LN302:
        movsd     %xmm5, (%r8,%rcx,8)                           #41.7
..LN303:
	.loc    1  44  is_stmt 1
        movsd     %xmm5, (%rsi,%rcx,8)                          #44.7
..LN304:
	.loc    1  40  is_stmt 1
        cmpl      %r10d, %r11d                                  #40.5
..LN305:
        jb        ..B1.38       # Prob 82%                      #40.5
..LN306:
                                # LOE rax rsi r8 r13 r14 r15 edx r9d r10d r11d r12d xmm0 xmm1 xmm2 xmm3 xmm4
..B1.40:                        # Preds ..B1.38 ..B1.36 ..B1.31
                                # Execution count [4.23e+00]
..LN307:
	.loc    1  39  is_stmt 1
        incl      %r9d                                          #39.3
..LN308:
        addq      $32000, %r8                                   #39.3
..LN309:
        addq      $32000, %rsi                                  #39.3
..LN310:
        cmpl      $4000, %r9d                                   #39.3
..LN311:
        jb        ..B1.21       # Prob 91%                      #39.3
..LN312:
                                # LOE rax rsi r8 r13 r14 r15 r9d r12d xmm1 xmm2 xmm3 xmm4
..B1.41:                        # Preds ..B1.40
                                # Execution count [1.00e+00]
..LN313:
	.loc    1  186  is_stmt 1
        xorl      %eax, %eax                                    #186.3
..LN314:
        movq      (%rsp), %rbx                                  #[spill]
..___tag_value_main.32:
..LN315:
#       polybench_timer_start()
        call      polybench_timer_start                         #186.3
..___tag_value_main.33:
..LN316:
                                # LOE rbx r13 r14 r15 r12d
..B1.42:                        # Preds ..B1.41
                                # Execution count [1.02e+00]
..LN317:
	.loc    1  80  is_stmt 1
        vbroadcastsd .L_2il0floatpacket.4(%rip), %zmm0          #80.20
..LN318:
	.loc    1  87  is_stmt 1
        xorb      %dl, %dl                                      #87.3
..LN319:
        movq      %r14, %rax                                    #87.3
..LN320:
                                # LOE rax rbx r13 r14 r15 r12d dl zmm0
..B1.43:                        # Preds ..B1.47 ..B1.42
                                # Execution count [1.25e+02]
..L35:
                # optimization report
                # LOOP WITH USER VECTOR INTRINSICS
                # %s was not vectorized: vector dependence prevents vectorization%s
                # VECTOR TRIP COUNT IS KNOWN CONSTANT
..LN321:
	.loc    1  88  is_stmt 1
        xorb      %sil, %sil                                    #88.5
..LN322:
        movq      %rax, %rcx                                    #88.5
..LN323:
                                # LOE rax rcx rbx r13 r14 r15 r12d dl sil zmm0
..B1.44:                        # Preds ..B1.46 ..B1.43
                                # Execution count [4.00e+03]
..L36:
                # optimization report
                # LOOP WITH USER VECTOR INTRINSICS
                # %s was not vectorized: vector dependence prevents vectorization%s
                # VECTOR TRIP COUNT IS KNOWN CONSTANT
..LN324:
	.loc    1  90  is_stmt 1
        xorb      %r9b, %r9b                                    #90.7
..LN325:
	.loc    1  89  is_stmt 1
        movq      %rcx, %r8                                     #89.7
        .align    16,0x90
..LN326:
                                # LOE rax rcx rbx r8 r13 r14 r15 r12d dl sil r9b zmm0
..B1.45:                        # Preds ..B1.45 ..B1.44
                                # Execution count [5.00e+05]
..L37:
                # optimization report
                # LOOP WITH USER VECTOR INTRINSICS
                # %s was not vectorized: vector dependence prevents vectorization%s
                # VECTOR TRIP COUNT IS KNOWN CONSTANT
..LN327:
	.loc    1  90  is_stmt 1
..LN328:
	.loc    1  98  is_stmt 1
        vmulpd    (%r8), %zmm0, %zmm1                           #98.14
..LN329:
	.loc    1  90  is_stmt 1
        incb      %r9b                                          #90.7
..LN330:
	.loc    1  99  is_stmt 1
        vmulpd    64(%r8), %zmm0, %zmm2                         #99.14
..LN331:
	.loc    1  100  is_stmt 1
        vmulpd    128(%r8), %zmm0, %zmm3                        #100.14
..LN332:
	.loc    1  101  is_stmt 1
        vmulpd    192(%r8), %zmm0, %zmm4                        #101.14
..LN333:
	.loc    1  103  is_stmt 1
        vmovups   %zmm1, (%r8)                                  #103.25
..LN334:
	.loc    1  104  is_stmt 1
        vmovups   %zmm2, 64(%r8)                                #104.25
..LN335:
	.loc    1  105  is_stmt 1
        vmovups   %zmm3, 128(%r8)                               #105.25
..LN336:
	.loc    1  106  is_stmt 1
        vmovups   %zmm4, 192(%r8)                               #106.25
..LN337:
	.loc    1  90  is_stmt 1
        addq      $256, %r8                                     #90.7
..LN338:
        cmpb      $125, %r9b                                    #90.7
..LN339:
        jb        ..B1.45       # Prob 99%                      #90.7
..LN340:
                                # LOE rax rcx rbx r8 r13 r14 r15 r12d dl sil r9b zmm0
..B1.46:                        # Preds ..B1.45
                                # Execution count [4.00e+03]
..LN341:
	.loc    1  88  is_stmt 1
        incb      %sil                                          #88.5
..LN342:
        addq      $32000, %rcx                                  #88.5
..LN343:
        cmpb      $32, %sil                                     #88.5
..LN344:
        jb        ..B1.44       # Prob 96%                      #88.5
..LN345:
                                # LOE rax rcx rbx r13 r14 r15 r12d dl sil zmm0
..B1.47:                        # Preds ..B1.46
                                # Execution count [1.25e+02]
..LN346:
	.loc    1  87  is_stmt 1
        incb      %dl                                           #87.3
..LN347:
        addq      $1024000, %rax                                #87.3
..LN348:
        cmpb      $125, %dl                                     #87.3
..LN349:
        jb        ..B1.43       # Prob 99%                      #87.3
..LN350:
                                # LOE rax rbx r13 r14 r15 r12d dl zmm0
..B1.48:                        # Preds ..B1.47
                                # Execution count [0.00e+00]
..LN351:
	.loc    1  112  is_stmt 1
        xorl      %edx, %edx                                    #112.3
..LN352:
                                # LOE rbx r13 r14 r15 edx r12d
..B1.85:                        # Preds ..B1.48
                                # Execution count [0.00e+00]
..LN353:
        vzeroupper                                              #
..LN354:
        xorl      %ecx, %ecx                                    #
..LN355:
        movl      %r12d, 16(%rsp)                               #[spill]
..LN356:
        movq      %rbx, (%rsp)                                  #[spill]
..LN357:
                                # LOE rcx r13 r14 r15 edx
..B1.49:                        # Preds ..B1.61 ..B1.85
                                # Execution count [0.00e+00]
..L39:
                # optimization report
                # LOOP WITH USER VECTOR INTRINSICS
                # %s was not vectorized: vector dependence prevents vectorization%s
                # VECTOR TRIP COUNT IS KNOWN CONSTANT
..LN358:
..LN359:
	.loc    1  113  is_stmt 1
        movq      %rcx, %rax                                    #113.5
..LN360:
                                # LOE rax r13 r14 r15 edx
..B1.50:                        # Preds ..B1.60 ..B1.49
                                # Execution count [0.00e+00]
..L41:
                # optimization report
                # LOOP WITH USER VECTOR INTRINSICS
                # %s was not vectorized: vector dependence prevents vectorization%s
                # VECTOR TRIP COUNT IS KNOWN CONSTANT
..LN361:
	.loc    1  131  is_stmt 1
        imulq     $3200, %rax, %rsi                             #131.28
..LN362:
	.loc    1  77  is_stmt 1
        imulq     $12800000, %rax, %rbx                         #77.3
..LN363:
	.loc    1  123  is_stmt 1
        imull     $1000, %edx, %r9d                             #123.26
..LN364:
	.loc    1  114  is_stmt 1
        xorl      %r8d, %r8d                                    #114.7
..LN365:
	.loc    1  131  is_stmt 1
        addq      %r15, %rsi                                    #131.28
..LN366:
	.loc    1  141  is_stmt 1
        addq      %r13, %rbx                                    #141.28
..LN367:
                                # LOE rax rbx rsi r13 r14 r15 edx r8d r9d
..B1.51:                        # Preds ..B1.59 ..B1.50
                                # Execution count [7.80e+01]
..L42:
                # optimization report
                # LOOP WITH USER VECTOR INTRINSICS
                # %s was not vectorized: vector dependence prevents vectorization%s
                # VECTOR TRIP COUNT IS KNOWN CONSTANT
..LN368:
	.loc    1  114  is_stmt 1
..LN369:
	.loc    1  77  is_stmt 1
        movl      %r8d, %r11d                                   #77.3
..LN370:
	.loc    1  115  is_stmt 1
        xorl      %r10d, %r10d                                  #115.2
..LN371:
	.loc    1  77  is_stmt 1
        shll      $6, %r11d                                     #77.3
..LN372:
        movq      %rax, 48(%rsp)                                #77.3[spill]
..LN373:
        movl      %edx, 40(%rsp)                                #77.3[spill]
..LN374:
        movq      %r13, 32(%rsp)                                #77.3[spill]
..LN375:
        movq      %r15, 24(%rsp)                                #77.3[spill]
..LN376:
                                # LOE rbx rsi r14 r8d r9d r10d r11d
..B1.52:                        # Preds ..B1.58 ..B1.51
                                # Execution count [9.77e+03]
..L46:
                # optimization report
                # LOOP WITH USER VECTOR INTRINSICS
                # %s was not vectorized: loop with multiple exits cannot be vectorized unless it meets search loop idiom criteria
                # VECTOR TRIP COUNT IS KNOWN CONSTANT
..LN377:
	.loc    1  115  is_stmt 1
..LN378:
	.loc    1  119  is_stmt 1
        xorl      %ecx, %ecx                                    #119.4
..LN379:
	.loc    1  123  is_stmt 1
        lea       (%r9,%r10,8), %eax                            #123.26
..LN380:
        lea       (%r14,%rax,8), %rdx                           #123.26
..LN381:
	.loc    1  141  is_stmt 1
        lea       (%rbx,%rax,8), %rax                           #141.28
..LN382:
                                # LOE rax rdx rbx rsi r14 ecx r8d r9d r10d r11d
..B1.53:                        # Preds ..B1.86 ..B1.52
                                # Execution count [3.91e+04]
..L48:
                # optimization report
                # LOOP WITH USER VECTOR INTRINSICS
                # %s was not vectorized: loop with multiple exits cannot be vectorized unless it meets search loop idiom criteria
                # VECTOR TRIP COUNT IS KNOWN CONSTANT
..LN383:
	.loc    1  119  is_stmt 1
..LN384:
	.loc    1  77  is_stmt 1
        lea       (%r11,%rcx,4), %r12d                          #77.3
..LN385:
	.loc    1  121  is_stmt 1
        cmpl      $3996, %r12d                                  #121.21
..LN386:
        jg        ..B1.58       # Prob 20%                      #121.21
..LN387:
                                # LOE rax rdx rbx rsi r12 r14 ecx r8d r9d r10d r11d
..B1.54:                        # Preds ..B1.53
                                # Execution count [3.13e+04]
..LN388:
	.loc    1  128  is_stmt 1
        xorl      %r15d, %r15d                                  #128.6
..LN389:
	.loc    1  77  is_stmt 1
        imulq     $32000, %r12, %rdi                            #77.3
..LN390:
	.loc    1  128  is_stmt 1
        vbroadcastsd .L_2il0floatpacket.3(%rip), %zmm9          #128.6
..LN391:
	.loc    1  123  is_stmt 1
        vmovups   (%rdx,%rdi), %zmm3                            #123.26
..LN392:
	.loc    1  124  is_stmt 1
        vmovups   32000(%rdx,%rdi), %zmm2                       #124.26
..LN393:
	.loc    1  125  is_stmt 1
        vmovups   64000(%rdx,%rdi), %zmm1                       #125.26
..LN394:
	.loc    1  126  is_stmt 1
        vmovups   96000(%rdx,%rdi), %zmm0                       #126.26
..LN395:
	.loc    1  128  is_stmt 1
        xorl      %r12d, %r12d                                  #128.6
..LN396:
	.loc    1  131  is_stmt 1
        lea       (%rsi,%rdi), %r13                             #131.28
        .align    16,0x90
..LN397:
                                # LOE rax rdx rbx rsi rdi r12 r13 r14 r15 ecx r8d r9d r10d r11d zmm0 zmm1 zmm2 zmm3 zmm9
..B1.55:                        # Preds ..B1.55 ..B1.54
                                # Execution count [1.25e+07]
..L49:
                # optimization report
                # PEELED LOOP
                # LOOP WITH USER VECTOR INTRINSICS
                # %s was not vectorized: vector dependence prevents vectorization%s
                # VECTOR TRIP COUNT IS KNOWN CONSTANT
..LN398:
	.loc    1  128  is_stmt 1
..LN399:
	.loc    1  136  is_stmt 1
        vmulpd    (%r13,%r15,8){1to8}, %zmm9, %zmm4             #136.20
..LN400:
	.loc    1  137  is_stmt 1
        vmulpd    32000(%r13,%r15,8){1to8}, %zmm9, %zmm5        #137.13
..LN401:
	.loc    1  138  is_stmt 1
        vmulpd    64000(%r13,%r15,8){1to8}, %zmm9, %zmm6        #138.13
..LN402:
	.loc    1  139  is_stmt 1
        vmulpd    96000(%r13,%r15,8){1to8}, %zmm9, %zmm8        #139.13
..LN403:
	.loc    1  141  is_stmt 1
        vmovups   (%r12,%rax), %zmm7                            #141.28
..LN404:
	.loc    1  128  is_stmt 1
        incq      %r15                                          #128.6
..LN405:
        addq      $32000, %r12                                  #128.6
..LN406:
	.loc    1  143  is_stmt 1
        vfmadd231pd %zmm4, %zmm7, %zmm3                         #143.20
..LN407:
	.loc    1  144  is_stmt 1
        vfmadd231pd %zmm5, %zmm7, %zmm2                         #144.13
..LN408:
	.loc    1  145  is_stmt 1
        vfmadd231pd %zmm6, %zmm7, %zmm1                         #145.13
..LN409:
	.loc    1  146  is_stmt 1
        vfmadd231pd %zmm8, %zmm7, %zmm0                         #146.13
..LN410:
	.loc    1  128  is_stmt 1
        cmpq      $400, %r15                                    #128.6
..LN411:
        jb        ..B1.55       # Prob 99%                      #128.6
..LN412:
                                # LOE rax rdx rbx rsi rdi r12 r13 r14 r15 ecx r8d r9d r10d r11d zmm0 zmm1 zmm2 zmm3 zmm9
..B1.56:                        # Preds ..B1.55
                                # Execution count [3.13e+04]
..LN413:
	.loc    1  119  is_stmt 1
        incl      %ecx                                          #119.4
..LN414:
	.loc    1  149  is_stmt 1
        vmovups   %zmm3, (%rdx,%rdi)                            #149.22
..LN415:
	.loc    1  150  is_stmt 1
        vmovups   %zmm2, 32000(%rdx,%rdi)                       #150.29
..LN416:
	.loc    1  151  is_stmt 1
        vmovups   %zmm1, 64000(%rdx,%rdi)                       #151.29
..LN417:
	.loc    1  152  is_stmt 1
        vmovups   %zmm0, 96000(%rdx,%rdi)                       #152.29
..LN418:
	.loc    1  119  is_stmt 1
        cmpl      $16, %ecx                                     #119.4
..LN419:
        jae       ..B1.87       # Prob 6%                       #119.4
..LN420:
                                # LOE rax rdx rbx rsi r14 ecx r8d r9d r10d r11d
..B1.86:                        # Preds ..B1.56
                                # Execution count [2.93e+04]
..LN421:
        vzeroupper                                              #
..LN422:
        jmp       ..B1.53       # Prob 100%                     #
..LN423:
                                # LOE rax rdx rbx rsi r14 ecx r8d r9d r10d r11d
..B1.87:                        # Preds ..B1.56
                                # Execution count [1.95e+03]
..LN424:
        vzeroupper                                              #
..LN425:
                                # LOE rbx rsi r14 r8d r9d r10d r11d
..B1.58:                        # Preds ..B1.53 ..B1.87
                                # Execution count [9.77e+03]
..LN426:
	.loc    1  115  is_stmt 1
        incl      %r10d                                         #115.2
..LN427:
        cmpl      $125, %r10d                                   #115.2
..LN428:
        jb        ..B1.52       # Prob 99%                      #115.2
..LN429:
                                # LOE rbx rsi r14 r8d r9d r10d r11d
..B1.59:                        # Preds ..B1.58
                                # Execution count [9.77e+03]
..LN430:
	.loc    1  114  is_stmt 1
        incl      %r8d                                          #114.7
..LN431:
        movq      48(%rsp), %rax                                #[spill]
..LN432:
        movl      40(%rsp), %edx                                #[spill]
..LN433:
        movq      32(%rsp), %r13                                #[spill]
..LN434:
        movq      24(%rsp), %r15                                #[spill]
..LN435:
        cmpl      $63, %r8d                                     #114.7
..LN436:
        jb        ..B1.51       # Prob 98%                      #114.7
..LN437:
                                # LOE rax rbx rsi r13 r14 r15 edx r8d r9d
..B1.60:                        # Preds ..B1.59
                                # Execution count [4.00e+01]
..LN438:
	.loc    1  113  is_stmt 1
        incq      %rax                                          #113.5
..LN439:
        cmpq      $10, %rax                                     #113.5
..LN440:
        jb        ..B1.50       # Prob 90%                      #113.5
..LN441:
                                # LOE rax r13 r14 r15 edx
..B1.61:                        # Preds ..B1.60
                                # Execution count [4.00e+00]
..LN442:
	.loc    1  112  is_stmt 1
        incl      %edx                                          #112.3
..LN443:
        xorl      %ecx, %ecx                                    #
..LN444:
        cmpl      $4, %edx                                      #112.3
..LN445:
        jb        ..B1.49       # Prob 75%                      #112.3
..LN446:
                                # LOE rcx r13 r14 r15 edx
..B1.62:                        # Preds ..B1.61
                                # Execution count [1.00e+00]
..LN447:
	.loc    1  196  is_stmt 1
        xorl      %eax, %eax                                    #196.3
..LN448:
        movl      16(%rsp), %r12d                               #[spill]
..LN449:
        movq      (%rsp), %rbx                                  #[spill]
..___tag_value_main.55:
..LN450:
#       polybench_timer_stop()
        call      polybench_timer_stop                          #196.3
..___tag_value_main.56:
..LN451:
                                # LOE rbx r13 r14 r15 r12d
..B1.63:                        # Preds ..B1.62
                                # Execution count [1.00e+00]
..LN452:
	.loc    1  197  is_stmt 1
        xorl      %eax, %eax                                    #197.3
..___tag_value_main.58:
..LN453:
#       polybench_timer_print()
        call      polybench_timer_print                         #197.3
..___tag_value_main.59:
..LN454:
                                # LOE rbx r13 r14 r15 r12d
..B1.64:                        # Preds ..B1.63
                                # Execution count [1.00e+00]
..LN455:
	.loc    1  201  is_stmt 1
        cmpl      $42, %r12d                                    #201.3
..LN456:
        jle       ..B1.74       # Prob 50%                      #201.3
..LN457:
                                # LOE rbx r13 r14 r15
..B1.65:                        # Preds ..B1.64
                                # Execution count [5.00e-01]
..LN458:
        movl      $.L_2__STRING.2, %esi                         #201.3
..LN459:
        movq      (%rbx), %rdi                                  #201.3
..L60:                                                          #201.3
..LN460:
        movb      (%rdi), %dl                                   #201.3
..LN461:
        cmpb      (%rsi), %dl                                   #201.3
..LN462:
        jne       ..L62         # Prob 50%                      #201.3
..LN463:
        testb     %dl, %dl                                      #201.3
..LN464:
        je        ..L61         # Prob 50%                      #201.3
..LN465:
        movb      1(%rdi), %dl                                  #201.3
..LN466:
        cmpb      1(%rsi), %dl                                  #201.3
..LN467:
        jne       ..L62         # Prob 50%                      #201.3
..LN468:
        addq      $2, %rdi                                      #201.3
..LN469:
        addq      $2, %rsi                                      #201.3
..LN470:
        testb     %dl, %dl                                      #201.3
..LN471:
        jne       ..L60         # Prob 50%                      #201.3
..L61:                                                          #
..LN472:
        xorl      %eax, %eax                                    #201.3
..LN473:
        jmp       ..L63         # Prob 100%                     #201.3
..L62:                                                          #
..LN474:
        sbbl      %eax, %eax                                    #201.3
..LN475:
        orl       $1, %eax                                      #201.3
..L63:                                                          #
..LN476:
                                # LOE r13 r14 r15 eax
..B1.92:                        # Preds ..B1.65
                                # Execution count [5.00e-01]
..LN477:
        testl     %eax, %eax                                    #201.3
..LN478:
        jne       ..B1.74       # Prob 78%                      #201.3
..LN479:
                                # LOE r13 r14 r15
..B1.66:                        # Preds ..B1.92
                                # Execution count [4.40e-02]
..LN480:
	.loc    1  56  is_stmt 1
        xorl      %eax, %eax                                    #56.8
..LN481:
        xorl      %edx, %edx                                    #56.12
..LN482:
        movq      %r14, (%rsp)                                  #56.12[spill]
..LN483:
        xorl      %ebx, %ebx                                    #56.12
..LN484:
        movq      %r13, 32(%rsp)                                #56.12[spill]
..LN485:
        movq      %r15, 24(%rsp)                                #56.12[spill]
..LN486:
        movq      8(%rsp), %r14                                 #56.12[spill]
..LN487:
                                # LOE rdx r14 eax ebx
..B1.67:                        # Preds ..B1.72 ..B1.66
                                # Execution count [4.95e-01]
..L67:
                # optimization report
                # %s was not vectorized: vector dependence prevents vectorization%s
                # VECTOR TRIP COUNT IS KNOWN CONSTANT
..LN488:
..LN489:
	.loc    1  59  is_stmt 1
        movl      %eax, 8(%rsp)                                 #59.11[spill]
..LN490:
	.loc    1  57  is_stmt 1
        xorl      %r13d, %r13d                                  #57.10
..LN491:
        movq      %rdx, %r12                                    #57.14
..LN492:
	.loc    1  59  is_stmt 1
        movl      %ebx, %r15d                                   #59.11
..LN493:
                                # LOE r12 r14 ebx r13d r15d
..B1.68:                        # Preds ..B1.71 ..B1.67
                                # Execution count [2.75e+00]
..L70:
                # optimization report
                # %s was not vectorized: vector dependence prevents vectorization%s
                # VECTOR TRIP COUNT IS KNOWN CONSTANT
..LN494:
	.loc    1  57  is_stmt 1
..LN495:
	.loc    1  58  is_stmt 1
        movsd     (%r14,%r12,8), %xmm0                          #58.2
..LN496:
        movl      $.L_2__STRING.0, %esi                         #58.2
..LN497:
        movl      $1, %eax                                      #58.2
..LN498:
        movq      stderr(%rip), %rdi                            #58.2
..LN499:
#       fprintf(FILE *__restrict__, const char *__restrict__, ...)
        call      fprintf                                       #58.2
..LN500:
                                # LOE r12 r14 ebx r13d r15d
..B1.69:                        # Preds ..B1.68
                                # Execution count [2.75e+00]
..LN501:
	.loc    1  59  is_stmt 1
        movl      $1717986919, %eax                             #59.21
..LN502:
        movl      %r15d, %ecx                                   #59.21
..LN503:
        imull     %r15d                                         #59.21
..LN504:
        sarl      $31, %ecx                                     #59.21
..LN505:
        sarl      $3, %edx                                      #59.21
..LN506:
        subl      %ecx, %edx                                    #59.21
..LN507:
        lea       (%rdx,%rdx,4), %esi                           #59.21
..LN508:
        shll      $2, %esi                                      #59.21
..LN509:
        cmpl      %r15d, %esi                                   #59.27
..LN510:
        jne       ..B1.71       # Prob 78%                      #59.27
..LN511:
                                # LOE r12 r14 ebx r13d r15d
..B1.70:                        # Preds ..B1.69
                                # Execution count [6.05e-01]
..LN512:
        movl      $10, %edi                                     #59.30
..LN513:
        movq      stderr(%rip), %rsi                            #59.30
..LN514:
        call      fputc                                         #59.30
..LN515:
                                # LOE r12 r14 ebx r13d r15d
..B1.71:                        # Preds ..B1.69 ..B1.70
                                # Execution count [2.75e+00]
..LN516:
	.loc    1  57  is_stmt 1
        incl      %r13d                                         #57.25
..LN517:
        incq      %r12                                          #57.25
..LN518:
        incl      %r15d                                         #57.25
..LN519:
        cmpl      $4000, %r13d                                  #57.21
..LN520:
        jl        ..B1.68       # Prob 82%                      #57.21
..LN521:
                                # LOE r12 r14 ebx r13d r15d
..B1.72:                        # Preds ..B1.71
                                # Execution count [5.50e-01]
..LN522:
        movl      8(%rsp), %eax                                 #[spill]
..LN523:
	.loc    1  56  is_stmt 1
        addl      $4000, %ebx                                   #56.23
..LN524:
        incl      %eax                                          #56.23
..LN525:
        addq      $32000, %r14                                  #56.23
..LN526:
        xorl      %edx, %edx                                    #
..LN527:
        cmpl      $4000, %eax                                   #56.19
..LN528:
        jl        ..B1.67       # Prob 82%                      #56.19
..LN529:
                                # LOE rdx r14 eax ebx
..B1.73:                        # Preds ..B1.72
                                # Execution count [1.10e-01]
..LN530:
	.loc    1  61  is_stmt 1
        movl      $10, %edi                                     #61.3
..LN531:
        movq      stderr(%rip), %rsi                            #61.3
..LN532:
        movq      32(%rsp), %r13                                #[spill]
..LN533:
        movq      24(%rsp), %r15                                #[spill]
..LN534:
        movq      (%rsp), %r14                                  #[spill]
..LN535:
        call      fputc                                         #61.3
..LN536:
                                # LOE r13 r14 r15
..B1.74:                        # Preds ..B1.64 ..B1.92 ..B1.73
                                # Execution count [1.00e+00]
..LN537:
	.loc    1  204  is_stmt 1
        movq      %r14, %rdi                                    #204.3
..LN538:
#       free(void *)
        call      free                                          #204.3
..LN539:
                                # LOE r13 r15
..B1.75:                        # Preds ..B1.74
                                # Execution count [1.00e+00]
..LN540:
	.loc    1  205  is_stmt 1
        movq      %r15, %rdi                                    #205.3
..LN541:
#       free(void *)
        call      free                                          #205.3
..LN542:
                                # LOE r13
..B1.76:                        # Preds ..B1.75
                                # Execution count [1.00e+00]
..LN543:
	.loc    1  206  is_stmt 1
        movq      %r13, %rdi                                    #206.3
..LN544:
#       free(void *)
        call      free                                          #206.3
..LN545:
                                # LOE
..B1.77:                        # Preds ..B1.76
                                # Execution count [1.00e+00]
..LN546:
	.loc    1  208  is_stmt 1
        xorl      %eax, %eax                                    #208.10
..LN547:
	.loc    1  208  epilogue_begin  is_stmt 1
        addq      $88, %rsp                                     #208.10
	.cfi_restore 3
..LN548:
        popq      %rbx                                          #208.10
	.cfi_restore 15
..LN549:
        popq      %r15                                          #208.10
	.cfi_restore 14
..LN550:
        popq      %r14                                          #208.10
	.cfi_restore 13
..LN551:
        popq      %r13                                          #208.10
	.cfi_restore 12
..LN552:
        popq      %r12                                          #208.10
..LN553:
        movq      %rbp, %rsp                                    #208.10
..LN554:
        popq      %rbp                                          #208.10
	.cfi_def_cfa 7, 8
	.cfi_restore 6
..LN555:
        ret                                                     #208.10
	.cfi_def_cfa 6, 16
	.cfi_escape 0x10, 0x03, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xd8, 0xff, 0xff, 0xff, 0x22
	.cfi_offset 6, -16
	.cfi_escape 0x10, 0x0c, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xf8, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0d, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xf0, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0e, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xe8, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0f, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xe0, 0xff, 0xff, 0xff, 0x22
..LN556:
                                # LOE
..B1.78:                        # Preds ..B1.6
                                # Execution count [4.23e-01]: Infreq
..LN557:
	.loc    1  37  is_stmt 1
        xorl      %esi, %esi                                    #37.5
..LN558:
        movl      $4000, %edx                                   #37.5
..LN559:
        xorl      %eax, %eax                                    #37.5
..LN560:
        jmp       ..B1.15       # Prob 100%                     #37.5
..LN561:
                                # LOE rcx rbx r8 r13 r14 r15 eax edx esi r10d r12d xmm1 xmm2 xmm3 xmm4
..B1.80:                        # Preds ..B1.32
                                # Execution count [4.23e-01]: Infreq
..LN562:
	.loc    1  40  is_stmt 1
        xorl      %r11d, %r11d                                  #40.5
..LN563:
        jmp       ..B1.36       # Prob 100%                     #40.5
..LN564:
                                # LOE rax rsi r8 r13 r14 r15 edx r9d r10d r11d r12d xmm1 xmm2 xmm3 xmm4
..B1.81:                        # Preds ..B1.22
                                # Execution count [4.23e-01]: Infreq
..LN565:
        xorl      %edx, %edx                                    #40.5
..LN566:
        movl      $4000, %r10d                                  #40.5
..LN567:
        xorl      %r11d, %r11d                                  #40.5
..LN568:
        jmp       ..B1.36       # Prob 100%                     #40.5
..LN569:
                                # LOE rax rsi r8 r13 r14 r15 edx r9d r10d r11d r12d xmm1 xmm2 xmm3 xmm4
..B1.82:                        # Preds ..B1.11
                                # Execution count [4.23e-01]: Infreq
..LN570:
	.loc    1  37  is_stmt 1
        xorl      %eax, %eax                                    #37.5
..LN571:
        jmp       ..B1.15       # Prob 100%                     #37.5
        .align    16,0x90
..LN572:
                                # LOE rcx rbx r8 r13 r14 r15 eax edx esi r10d r12d xmm1 xmm2 xmm3 xmm4
..LN573:
	.cfi_endproc
# mark_end;
	.type	main,@function
	.size	main,.-main
..LNmain.574:
.LNmain:
	.data
	.file   2 "/home/prash/intel/compilers_and_libraries_2019.3.199/linux/compiler/include/icc/zmmintrin.h"
# -- End  main
	.section .rodata, "a"
	.align 16
	.align 16
.L_2il0floatpacket.0:
	.long	0x00000002,0x00000002,0x00000002,0x00000002
	.type	.L_2il0floatpacket.0,@object
	.size	.L_2il0floatpacket.0,16
	.align 16
.L_2il0floatpacket.1:
	.long	0x00000000,0x40af4000,0x00000000,0x40af4000
	.type	.L_2il0floatpacket.1,@object
	.size	.L_2il0floatpacket.1,16
	.align 8
.L_2il0floatpacket.2:
	.long	0x00000000,0x40af4000
	.type	.L_2il0floatpacket.2,@object
	.size	.L_2il0floatpacket.2,8
	.align 8
.L_2il0floatpacket.3:
	.long	0x00000000,0x40dfa700
	.type	.L_2il0floatpacket.3,@object
	.size	.L_2il0floatpacket.3,8
	.align 8
.L_2il0floatpacket.4:
	.long	0x00000000,0x40a09600
	.type	.L_2il0floatpacket.4,@object
	.size	.L_2il0floatpacket.4,8
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
	.section .debug_opt_report, ""
..L93:
	.ascii ".itt_notify_tab\0"
	.word	258
	.word	48
	.long	23
	.long	..L94 - ..L93
	.long	48
	.long	..L95 - ..L93
	.long	377
	.long	0x00000008,0x00000000
	.long	0
	.long	0
	.long	0
	.long	1
	.quad	..L20
	.long	28
	.long	5
	.quad	..L21
	.long	28
	.long	19
	.quad	..L22
	.long	28
	.long	31
	.quad	..L23
	.long	28
	.long	50
	.quad	..L24
	.long	28
	.long	69
	.quad	..L26
	.long	28
	.long	88
	.quad	..L27
	.long	28
	.long	102
	.quad	..L28
	.long	28
	.long	114
	.quad	..L29
	.long	28
	.long	133
	.quad	..L30
	.long	28
	.long	152
	.quad	..L31
	.long	28
	.long	171
	.quad	..L35
	.long	28
	.long	190
	.quad	..L36
	.long	28
	.long	207
	.quad	..L37
	.long	28
	.long	224
	.quad	..L39
	.long	28
	.long	241
	.quad	..L41
	.long	28
	.long	258
	.quad	..L42
	.long	28
	.long	275
	.quad	..L46
	.long	28
	.long	292
	.quad	..L48
	.long	28
	.long	309
	.quad	..L49
	.long	28
	.long	326
	.quad	..L67
	.long	28
	.long	343
	.quad	..L70
	.long	28
	.long	360
..L94:
	.long	1769238639
	.long	1635412333
	.long	1852795252
	.long	1885696607
	.long	1601466991
	.long	1936876918
	.long	7237481
	.long	1769238639
	.long	1635412333
	.long	1852795252
	.long	1885696607
	.long	7631471
..L95:
	.long	-2062548224
	.long	-2146431742
	.long	-2139062144
	.long	-2139062144
	.long	185059456
	.long	-2139062256
	.long	-2139062144
	.long	302284928
	.long	-2139062256
	.long	-2138472320
	.long	-2138931072
	.long	-1014501448
	.long	269615830
	.long	-2139062144
	.long	-2139062144
	.long	-1736406400
	.long	-626866214
	.long	-2146430462
	.long	-2139062144
	.long	-2139062144
	.long	-627539832
	.long	47882951
	.long	-2138042355
	.long	-2139062144
	.long	-2139062144
	.long	269158344
	.long	-2139062128
	.long	-2139062144
	.long	269616256
	.long	-2139062128
	.long	-2139059840
	.long	-394231168
	.long	-706500627
	.long	-1877995006
	.long	-2139062144
	.long	-2139062135
	.long	-303529854
	.long	47571847
	.long	-2138042350
	.long	-2139062144
	.long	-1971289984
	.long	-942034814
	.long	302176674
	.long	-2139058160
	.long	-2139062144
	.long	-2138537856
	.long	-1563960912
	.long	269484761
	.long	-2139062144
	.long	-2139062144
	.long	-2119139192
	.long	268533888
	.long	-2139062256
	.long	-2139062144
	.long	-1333753728
	.long	25198721
	.long	-2139090928
	.long	-2139062144
	.long	-2138537856
	.long	-2139061840
	.long	-2146430975
	.long	-2139062144
	.long	-2004844416
	.long	-2138984320
	.long	269484416
	.long	-2139062144
	.long	-2139062144
	.long	-2119139192
	.long	268533888
	.long	-2139062256
	.long	-2139062144
	.long	-1333753728
	.long	25198721
	.long	-2139090928
	.long	-2139062144
	.long	-2138537856
	.long	-2139060496
	.long	-2146430975
	.long	-2139062144
	.long	-2004844416
	.long	-2138640256
	.long	269484416
	.long	-2139062112
	.long	-2139062144
	.long	-2119139192
	.long	268533888
	.long	-2139062256
	.long	-2139062144
	.long	-1333755776
	.long	25198721
	.long	-2139090928
	.long	-2139062144
	.long	-2139062144
	.long	-2139061840
	.byte	1
	.section .note.GNU-stack, ""
	.file   3 "/usr/include/stdio.h"
	.file   4 "/usr/include/x86_64-linux-gnu/bits/libio.h"
	.file   5 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file   6 "/home/prash/intel/compilers_and_libraries_2019.3.199/linux/compiler/include/stddef.h"
// -- Begin DWARF2 SEGMENT .debug_info
	.section .debug_info
.debug_info_seg:
	.align 1
	.4byte 0x00000706
	.2byte 0x0004
	.4byte .debug_abbrev_seg
	.byte 0x08
//	DW_TAG_compile_unit:
	.byte 0x01
//	DW_AT_comp_dir:
	.4byte .debug_str
//	DW_AT_name:
	.4byte .debug_str+0x26
//	DW_AT_producer:
	.4byte .debug_str+0x45
	.4byte .debug_str+0xb1
//	DW_AT_language:
	.byte 0x01
//	DW_AT_use_UTF8:
	.byte 0x01
//	DW_AT_low_pc:
	.8byte 0x0000000000000000
//	DW_AT_ranges:
	.4byte .debug_ranges_seg+0x30
	.byte 0x01
//	DW_AT_stmt_list:
	.4byte .debug_line_seg
//	DW_TAG_base_type:
	.byte 0x02
//	DW_AT_byte_size:
	.byte 0x04
//	DW_AT_encoding:
	.byte 0x05
//	DW_AT_name:
	.4byte 0x00746e69
//	DW_TAG_subprogram:
	.byte 0x03
//	DW_AT_decl_line:
	.byte 0xa1
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x0000002f
//	DW_AT_prototyped:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x115
	.4byte .debug_str+0x115
//	DW_AT_low_pc:
	.8byte ..L3
//	DW_AT_high_pc:
	.8byte ..LNmain.574-..L3
	.byte 0x01
//	DW_AT_external:
	.byte 0x01
//	DW_TAG_formal_parameter:
	.byte 0x04
//	DW_AT_decl_line:
	.byte 0xa1
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x0000002f
//	DW_AT_name:
	.4byte .debug_str+0x11a
//	DW_AT_location:
	.2byte 0x5501
//	DW_TAG_formal_parameter:
	.byte 0x04
//	DW_AT_decl_line:
	.byte 0xa1
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x000002d7
//	DW_AT_name:
	.4byte .debug_str+0x124
//	DW_AT_location:
	.2byte 0x5401
//	DW_TAG_variable:
	.byte 0x05
//	DW_AT_decl_line:
	.byte 0xa5
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x696e
	.byte 0x00
//	DW_AT_type:
	.4byte 0x0000002f
//	DW_TAG_variable:
	.byte 0x05
//	DW_AT_decl_line:
	.byte 0xa6
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x6a6e
	.byte 0x00
//	DW_AT_type:
	.4byte 0x0000002f
//	DW_TAG_variable:
	.byte 0x05
//	DW_AT_decl_line:
	.byte 0xa7
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x6b6e
	.byte 0x00
//	DW_AT_type:
	.4byte 0x0000002f
//	DW_TAG_variable:
	.byte 0x06
//	DW_AT_decl_line:
	.byte 0xaa
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x130
//	DW_AT_type:
	.4byte 0x000002fd
//	DW_TAG_variable:
	.byte 0x06
//	DW_AT_decl_line:
	.byte 0xab
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x136
//	DW_AT_type:
	.4byte 0x000002fd
//	DW_TAG_variable:
	.byte 0x07
//	DW_AT_decl_line:
	.byte 0xac
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x0043
//	DW_AT_type:
	.4byte 0x0000032e
//	DW_AT_location:
	.2byte 0x5e01
//	DW_TAG_variable:
	.byte 0x07
//	DW_AT_decl_line:
	.byte 0xad
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x0041
//	DW_AT_type:
	.4byte 0x00000343
//	DW_AT_location:
	.2byte 0x5f01
//	DW_TAG_variable:
	.byte 0x07
//	DW_AT_decl_line:
	.byte 0xae
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x0042
//	DW_AT_type:
	.4byte 0x00000358
//	DW_AT_location:
	.2byte 0x5d01
//	DW_TAG_inlined_subroutine:
	.byte 0x08
//	DW_AT_low_pc:
	.8byte ..LN480
//	DW_AT_high_pc:
	.8byte ..LN537-..LN480
//	DW_AT_abstract_origin:
	.4byte 0x0000036d
//	DW_AT_call_line:
	.byte 0xc9
//	DW_AT_call_column:
	.byte 0x03
//	DW_AT_call_file:
	.byte 0x01
//	DW_TAG_formal_parameter:
	.byte 0x09
//	DW_AT_decl_line:
	.byte 0x33
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x0000002f
//	DW_AT_name:
	.2byte 0x696e
	.byte 0x00
//	DW_TAG_formal_parameter:
	.byte 0x09
//	DW_AT_decl_line:
	.byte 0x33
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x0000002f
//	DW_AT_name:
	.2byte 0x6a6e
	.byte 0x00
//	DW_TAG_formal_parameter:
	.byte 0x09
//	DW_AT_decl_line:
	.byte 0x34
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x0000038b
//	DW_AT_name:
	.2byte 0x0043
//	DW_TAG_variable:
	.byte 0x07
//	DW_AT_decl_line:
	.byte 0x36
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x0069
//	DW_AT_type:
	.4byte 0x0000002f
//	DW_AT_location:
	.2byte 0x5001
//	DW_TAG_variable:
	.byte 0x07
//	DW_AT_decl_line:
	.byte 0x36
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x006a
//	DW_AT_type:
	.4byte 0x0000002f
//	DW_AT_location:
	.2byte 0x5d01
	.byte 0x00
//	DW_TAG_inlined_subroutine:
	.byte 0x08
//	DW_AT_low_pc:
	.8byte ..LN317
//	DW_AT_high_pc:
	.8byte ..LN447-..LN317
//	DW_AT_abstract_origin:
	.4byte 0x0000039b
//	DW_AT_call_line:
	.byte 0xbd
//	DW_AT_call_column:
	.byte 0x03
//	DW_AT_call_file:
	.byte 0x01
//	DW_TAG_formal_parameter:
	.byte 0x09
//	DW_AT_decl_line:
	.byte 0x44
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x0000002f
//	DW_AT_name:
	.2byte 0x696e
	.byte 0x00
//	DW_TAG_formal_parameter:
	.byte 0x09
//	DW_AT_decl_line:
	.byte 0x44
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x0000002f
//	DW_AT_name:
	.2byte 0x6a6e
	.byte 0x00
//	DW_TAG_formal_parameter:
	.byte 0x09
//	DW_AT_decl_line:
	.byte 0x44
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x0000002f
//	DW_AT_name:
	.2byte 0x6b6e
	.byte 0x00
//	DW_TAG_formal_parameter:
	.byte 0x0a
//	DW_AT_decl_line:
	.byte 0x45
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x000002fd
//	DW_AT_name:
	.4byte .debug_str+0x130
//	DW_TAG_formal_parameter:
	.byte 0x0a
//	DW_AT_decl_line:
	.byte 0x46
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x000002fd
//	DW_AT_name:
	.4byte .debug_str+0x136
//	DW_TAG_formal_parameter:
	.byte 0x09
//	DW_AT_decl_line:
	.byte 0x47
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x000003d2
//	DW_AT_name:
	.2byte 0x0043
//	DW_TAG_formal_parameter:
	.byte 0x09
//	DW_AT_decl_line:
	.byte 0x48
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x000003e2
//	DW_AT_name:
	.2byte 0x0041
//	DW_TAG_formal_parameter:
	.byte 0x09
//	DW_AT_decl_line:
	.byte 0x49
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x000003f2
//	DW_AT_name:
	.2byte 0x0042
//	DW_TAG_variable:
	.byte 0x07
//	DW_AT_decl_line:
	.byte 0x4b
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x6962
	.byte 0x00
//	DW_AT_type:
	.4byte 0x0000002f
//	DW_AT_location:
	.2byte 0x5801
//	DW_TAG_variable:
	.byte 0x05
//	DW_AT_decl_line:
	.byte 0x4b
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x6a62
	.byte 0x00
//	DW_AT_type:
	.4byte 0x0000002f
//	DW_TAG_variable:
	.byte 0x05
//	DW_AT_decl_line:
	.byte 0x4b
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x6b62
	.byte 0x00
//	DW_AT_type:
	.4byte 0x0000002f
//	DW_TAG_variable:
	.byte 0x07
//	DW_AT_decl_line:
	.byte 0x4c
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x6974
	.byte 0x00
//	DW_AT_type:
	.4byte 0x0000002f
//	DW_AT_location:
	.2byte 0x5201
//	DW_TAG_variable:
	.byte 0x07
//	DW_AT_decl_line:
	.byte 0x4c
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x6a74
	.byte 0x00
//	DW_AT_type:
	.4byte 0x0000002f
//	DW_AT_location:
	.2byte 0x5a01
//	DW_TAG_variable:
	.byte 0x05
//	DW_AT_decl_line:
	.byte 0x4c
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x6b74
	.byte 0x00
//	DW_AT_type:
	.4byte 0x0000002f
//	DW_TAG_variable:
	.byte 0x05
//	DW_AT_decl_line:
	.byte 0x4d
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x0069
//	DW_AT_type:
	.4byte 0x0000002f
//	DW_TAG_variable:
	.byte 0x05
//	DW_AT_decl_line:
	.byte 0x4d
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x006a
//	DW_AT_type:
	.4byte 0x0000002f
//	DW_TAG_variable:
	.byte 0x05
//	DW_AT_decl_line:
	.byte 0x4d
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x006b
//	DW_AT_type:
	.4byte 0x0000002f
//	DW_TAG_variable:
	.byte 0x06
//	DW_AT_decl_line:
	.byte 0x4f
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x153
//	DW_AT_type:
	.4byte 0x00000402
//	DW_TAG_variable:
	.byte 0x0b
//	DW_AT_decl_line:
	.byte 0x50
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x16e
//	DW_AT_type:
	.4byte 0x00000402
//	DW_AT_location:
	.2byte 0x6101
//	DW_TAG_variable:
	.byte 0x06
//	DW_AT_decl_line:
	.byte 0x51
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x174
//	DW_AT_type:
	.4byte 0x00000402
//	DW_TAG_variable:
	.byte 0x07
//	DW_AT_decl_line:
	.byte 0x52
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x0061
//	DW_AT_type:
	.4byte 0x00000402
//	DW_AT_location:
	.2byte 0x6501
//	DW_TAG_variable:
	.byte 0x07
//	DW_AT_decl_line:
	.byte 0x52
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x3161
	.byte 0x00
//	DW_AT_type:
	.4byte 0x00000402
//	DW_AT_location:
	.2byte 0x6601
//	DW_TAG_variable:
	.byte 0x07
//	DW_AT_decl_line:
	.byte 0x52
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x3261
	.byte 0x00
//	DW_AT_type:
	.4byte 0x00000402
//	DW_AT_location:
	.2byte 0x6701
//	DW_TAG_variable:
	.byte 0x07
//	DW_AT_decl_line:
	.byte 0x52
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x3361
	.byte 0x00
//	DW_AT_type:
	.4byte 0x00000402
//	DW_AT_location:
	.2byte 0x6901
//	DW_TAG_variable:
	.byte 0x07
//	DW_AT_decl_line:
	.byte 0x53
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x0062
//	DW_AT_type:
	.4byte 0x00000402
//	DW_AT_location:
	.2byte 0x6801
//	DW_TAG_variable:
	.byte 0x05
//	DW_AT_decl_line:
	.byte 0x54
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x0063
//	DW_AT_type:
	.4byte 0x00000402
//	DW_TAG_variable:
	.byte 0x07
//	DW_AT_decl_line:
	.byte 0x54
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x3163
	.byte 0x00
//	DW_AT_type:
	.4byte 0x00000402
//	DW_AT_location:
	.2byte 0x6301
//	DW_TAG_variable:
	.byte 0x05
//	DW_AT_decl_line:
	.byte 0x54
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x3263
	.byte 0x00
//	DW_AT_type:
	.4byte 0x00000402
//	DW_TAG_variable:
	.byte 0x05
//	DW_AT_decl_line:
	.byte 0x54
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x3363
	.byte 0x00
//	DW_AT_type:
	.4byte 0x00000402
	.byte 0x00
//	DW_TAG_inlined_subroutine:
	.byte 0x0c
//	DW_AT_ranges:
	.4byte .debug_ranges_seg
//	DW_AT_entry_pc:
	.8byte ..LN36
//	DW_AT_abstract_origin:
	.4byte 0x0000042d
//	DW_AT_call_line:
	.byte 0xb2
//	DW_AT_call_column:
	.byte 0x03
//	DW_AT_call_file:
	.byte 0x01
//	DW_TAG_formal_parameter:
	.byte 0x09
//	DW_AT_decl_line:
	.byte 0x19
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x0000002f
//	DW_AT_name:
	.2byte 0x696e
	.byte 0x00
//	DW_TAG_formal_parameter:
	.byte 0x09
//	DW_AT_decl_line:
	.byte 0x19
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x0000002f
//	DW_AT_name:
	.2byte 0x6a6e
	.byte 0x00
//	DW_TAG_formal_parameter:
	.byte 0x09
//	DW_AT_decl_line:
	.byte 0x19
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x0000002f
//	DW_AT_name:
	.2byte 0x6b6e
	.byte 0x00
//	DW_TAG_formal_parameter:
	.byte 0x0a
//	DW_AT_decl_line:
	.byte 0x1a
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x00000464
//	DW_AT_name:
	.4byte .debug_str+0x130
//	DW_TAG_formal_parameter:
	.byte 0x0a
//	DW_AT_decl_line:
	.byte 0x1b
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x00000464
//	DW_AT_name:
	.4byte .debug_str+0x136
//	DW_TAG_formal_parameter:
	.byte 0x09
//	DW_AT_decl_line:
	.byte 0x1c
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x00000469
//	DW_AT_name:
	.2byte 0x0043
//	DW_TAG_formal_parameter:
	.byte 0x09
//	DW_AT_decl_line:
	.byte 0x1d
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x00000479
//	DW_AT_name:
	.2byte 0x0041
//	DW_TAG_formal_parameter:
	.byte 0x09
//	DW_AT_decl_line:
	.byte 0x1e
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x00000489
//	DW_AT_name:
	.2byte 0x0042
//	DW_TAG_variable:
	.byte 0x07
//	DW_AT_decl_line:
	.byte 0x20
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x0069
//	DW_AT_type:
	.4byte 0x0000002f
//	DW_AT_location:
	.2byte 0x5101
//	DW_TAG_variable:
	.byte 0x05
//	DW_AT_decl_line:
	.byte 0x20
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x006a
//	DW_AT_type:
	.4byte 0x0000002f
	.byte 0x00
	.byte 0x00
//	DW_TAG_pointer_type:
	.byte 0x0d
//	DW_AT_type:
	.4byte 0x000002dc
//	DW_TAG_pointer_type:
	.byte 0x0d
//	DW_AT_type:
	.4byte 0x000002e1
//	DW_TAG_base_type:
	.byte 0x0e
//	DW_AT_byte_size:
	.byte 0x01
//	DW_AT_encoding:
	.byte 0x06
//	DW_AT_name:
	.4byte .debug_str+0x11f
//	DW_TAG_pointer_type:
	.byte 0x0d
//	DW_AT_type:
	.4byte 0x000002ed
//	DW_TAG_array_type:
	.byte 0x0f
//	DW_AT_type:
	.4byte 0x000002fd
//	DW_AT_byte_size:
	.4byte 0x07a12000
//	DW_TAG_subrange_type:
	.byte 0x10
//	DW_AT_upper_bound:
	.2byte 0x0f9f
//	DW_TAG_subrange_type:
	.byte 0x10
//	DW_AT_upper_bound:
	.2byte 0x0f9f
	.byte 0x00
//	DW_TAG_base_type:
	.byte 0x0e
//	DW_AT_byte_size:
	.byte 0x08
//	DW_AT_encoding:
	.byte 0x04
//	DW_AT_name:
	.4byte .debug_str+0x129
//	DW_TAG_pointer_type:
	.byte 0x0d
//	DW_AT_type:
	.4byte 0x00000309
//	DW_TAG_array_type:
	.byte 0x0f
//	DW_AT_type:
	.4byte 0x000002fd
//	DW_AT_byte_size:
	.4byte 0x07a12000
//	DW_TAG_subrange_type:
	.byte 0x10
//	DW_AT_upper_bound:
	.2byte 0x0f9f
//	DW_TAG_subrange_type:
	.byte 0x10
//	DW_AT_upper_bound:
	.2byte 0x0f9f
	.byte 0x00
//	DW_TAG_pointer_type:
	.byte 0x0d
//	DW_AT_type:
	.4byte 0x0000031e
//	DW_TAG_array_type:
	.byte 0x0f
//	DW_AT_type:
	.4byte 0x000002fd
//	DW_AT_byte_size:
	.4byte 0x07a12000
//	DW_TAG_subrange_type:
	.byte 0x10
//	DW_AT_upper_bound:
	.2byte 0x0f9f
//	DW_TAG_subrange_type:
	.byte 0x10
//	DW_AT_upper_bound:
	.2byte 0x0f9f
	.byte 0x00
//	DW_TAG_pointer_type:
	.byte 0x0d
//	DW_AT_type:
	.4byte 0x00000333
//	DW_TAG_array_type:
	.byte 0x0f
//	DW_AT_type:
	.4byte 0x000002fd
//	DW_AT_byte_size:
	.4byte 0x07a12000
//	DW_TAG_subrange_type:
	.byte 0x10
//	DW_AT_upper_bound:
	.2byte 0x0f9f
//	DW_TAG_subrange_type:
	.byte 0x10
//	DW_AT_upper_bound:
	.2byte 0x0f9f
	.byte 0x00
//	DW_TAG_pointer_type:
	.byte 0x0d
//	DW_AT_type:
	.4byte 0x00000348
//	DW_TAG_array_type:
	.byte 0x0f
//	DW_AT_type:
	.4byte 0x000002fd
//	DW_AT_byte_size:
	.4byte 0x07a12000
//	DW_TAG_subrange_type:
	.byte 0x10
//	DW_AT_upper_bound:
	.2byte 0x0f9f
//	DW_TAG_subrange_type:
	.byte 0x10
//	DW_AT_upper_bound:
	.2byte 0x0f9f
	.byte 0x00
//	DW_TAG_pointer_type:
	.byte 0x0d
//	DW_AT_type:
	.4byte 0x0000035d
//	DW_TAG_array_type:
	.byte 0x0f
//	DW_AT_type:
	.4byte 0x000002fd
//	DW_AT_byte_size:
	.4byte 0x07a12000
//	DW_TAG_subrange_type:
	.byte 0x10
//	DW_AT_upper_bound:
	.2byte 0x0f9f
//	DW_TAG_subrange_type:
	.byte 0x10
//	DW_AT_upper_bound:
	.2byte 0x0f9f
	.byte 0x00
//	DW_TAG_subprogram:
	.byte 0x11
//	DW_AT_decl_line:
	.byte 0x33
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_declaration:
	.byte 0x01
//	DW_AT_prototyped:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x13b
	.4byte .debug_str+0x13b
//	DW_AT_inline:
	.byte 0x01
//	DW_TAG_formal_parameter:
	.byte 0x12
//	DW_AT_type:
	.4byte 0x0000002f
//	DW_TAG_formal_parameter:
	.byte 0x12
//	DW_AT_type:
	.4byte 0x0000002f
//	DW_TAG_formal_parameter:
	.byte 0x12
//	DW_AT_type:
	.4byte 0x0000038b
	.byte 0x00
//	DW_TAG_pointer_type:
	.byte 0x0d
//	DW_AT_type:
	.4byte 0x00000390
//	DW_TAG_array_type:
	.byte 0x13
//	DW_AT_type:
	.4byte 0x000002fd
//	DW_AT_byte_size:
	.2byte 0x7d00
//	DW_TAG_subrange_type:
	.byte 0x10
//	DW_AT_upper_bound:
	.2byte 0x0f9f
	.byte 0x00
//	DW_TAG_subprogram:
	.byte 0x11
//	DW_AT_decl_line:
	.byte 0x44
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_declaration:
	.byte 0x01
//	DW_AT_prototyped:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x147
	.4byte .debug_str+0x147
//	DW_AT_inline:
	.byte 0x01
//	DW_TAG_formal_parameter:
	.byte 0x12
//	DW_AT_type:
	.4byte 0x0000002f
//	DW_TAG_formal_parameter:
	.byte 0x12
//	DW_AT_type:
	.4byte 0x0000002f
//	DW_TAG_formal_parameter:
	.byte 0x12
//	DW_AT_type:
	.4byte 0x0000002f
//	DW_TAG_formal_parameter:
	.byte 0x12
//	DW_AT_type:
	.4byte 0x000002fd
//	DW_TAG_formal_parameter:
	.byte 0x12
//	DW_AT_type:
	.4byte 0x000002fd
//	DW_TAG_formal_parameter:
	.byte 0x12
//	DW_AT_type:
	.4byte 0x000003d2
//	DW_TAG_formal_parameter:
	.byte 0x12
//	DW_AT_type:
	.4byte 0x000003e2
//	DW_TAG_formal_parameter:
	.byte 0x12
//	DW_AT_type:
	.4byte 0x000003f2
	.byte 0x00
//	DW_TAG_pointer_type:
	.byte 0x0d
//	DW_AT_type:
	.4byte 0x000003d7
//	DW_TAG_array_type:
	.byte 0x13
//	DW_AT_type:
	.4byte 0x000002fd
//	DW_AT_byte_size:
	.2byte 0x7d00
//	DW_TAG_subrange_type:
	.byte 0x10
//	DW_AT_upper_bound:
	.2byte 0x0f9f
	.byte 0x00
//	DW_TAG_pointer_type:
	.byte 0x0d
//	DW_AT_type:
	.4byte 0x000003e7
//	DW_TAG_array_type:
	.byte 0x13
//	DW_AT_type:
	.4byte 0x000002fd
//	DW_AT_byte_size:
	.2byte 0x7d00
//	DW_TAG_subrange_type:
	.byte 0x10
//	DW_AT_upper_bound:
	.2byte 0x0f9f
	.byte 0x00
//	DW_TAG_pointer_type:
	.byte 0x0d
//	DW_AT_type:
	.4byte 0x000003f7
//	DW_TAG_array_type:
	.byte 0x13
//	DW_AT_type:
	.4byte 0x000002fd
//	DW_AT_byte_size:
	.2byte 0x7d00
//	DW_TAG_subrange_type:
	.byte 0x10
//	DW_AT_upper_bound:
	.2byte 0x0f9f
	.byte 0x00
//	DW_TAG_typedef:
	.byte 0x14
//	DW_AT_decl_line:
	.byte 0x44
//	DW_AT_decl_file:
	.byte 0x02
//	DW_AT_name:
	.4byte .debug_str+0x15a
//	DW_AT_type:
	.4byte 0x0000040d
//	DW_TAG_union_type:
	.byte 0x15
//	DW_AT_decl_line:
	.byte 0x42
//	DW_AT_decl_file:
	.byte 0x02
//	DW_AT_byte_size:
	.byte 0x40
//	DW_AT_name:
	.4byte .debug_str+0x15a
//	DW_TAG_member:
	.byte 0x16
//	DW_AT_decl_line:
	.byte 0x43
//	DW_AT_decl_file:
	.byte 0x02
//	DW_AT_data_member_location:
	.2byte 0x2302
	.byte 0x00
//	DW_AT_name:
	.4byte .debug_str+0x162
//	DW_AT_type:
	.4byte 0x00000424
	.byte 0x00
//	DW_TAG_array_type:
	.byte 0x17
//	DW_AT_type:
	.4byte 0x000002fd
//	DW_AT_byte_size:
	.byte 0x40
//	DW_TAG_subrange_type:
	.byte 0x18
//	DW_AT_upper_bound:
	.byte 0x07
	.byte 0x00
//	DW_TAG_subprogram:
	.byte 0x11
//	DW_AT_decl_line:
	.byte 0x19
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_declaration:
	.byte 0x01
//	DW_AT_prototyped:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x17a
	.4byte .debug_str+0x17a
//	DW_AT_inline:
	.byte 0x01
//	DW_TAG_formal_parameter:
	.byte 0x12
//	DW_AT_type:
	.4byte 0x0000002f
//	DW_TAG_formal_parameter:
	.byte 0x12
//	DW_AT_type:
	.4byte 0x0000002f
//	DW_TAG_formal_parameter:
	.byte 0x12
//	DW_AT_type:
	.4byte 0x0000002f
//	DW_TAG_formal_parameter:
	.byte 0x12
//	DW_AT_type:
	.4byte 0x00000464
//	DW_TAG_formal_parameter:
	.byte 0x12
//	DW_AT_type:
	.4byte 0x00000464
//	DW_TAG_formal_parameter:
	.byte 0x12
//	DW_AT_type:
	.4byte 0x00000469
//	DW_TAG_formal_parameter:
	.byte 0x12
//	DW_AT_type:
	.4byte 0x00000479
//	DW_TAG_formal_parameter:
	.byte 0x12
//	DW_AT_type:
	.4byte 0x00000489
	.byte 0x00
//	DW_TAG_pointer_type:
	.byte 0x0d
//	DW_AT_type:
	.4byte 0x000002fd
//	DW_TAG_pointer_type:
	.byte 0x0d
//	DW_AT_type:
	.4byte 0x0000046e
//	DW_TAG_array_type:
	.byte 0x13
//	DW_AT_type:
	.4byte 0x000002fd
//	DW_AT_byte_size:
	.2byte 0x7d00
//	DW_TAG_subrange_type:
	.byte 0x10
//	DW_AT_upper_bound:
	.2byte 0x0f9f
	.byte 0x00
//	DW_TAG_pointer_type:
	.byte 0x0d
//	DW_AT_type:
	.4byte 0x0000047e
//	DW_TAG_array_type:
	.byte 0x13
//	DW_AT_type:
	.4byte 0x000002fd
//	DW_AT_byte_size:
	.2byte 0x7d00
//	DW_TAG_subrange_type:
	.byte 0x10
//	DW_AT_upper_bound:
	.2byte 0x0f9f
	.byte 0x00
//	DW_TAG_pointer_type:
	.byte 0x0d
//	DW_AT_type:
	.4byte 0x0000048e
//	DW_TAG_array_type:
	.byte 0x13
//	DW_AT_type:
	.4byte 0x000002fd
//	DW_AT_byte_size:
	.2byte 0x7d00
//	DW_TAG_subrange_type:
	.byte 0x10
//	DW_AT_upper_bound:
	.2byte 0x0f9f
	.byte 0x00
//	DW_TAG_variable:
	.byte 0x19
//	DW_AT_decl_line:
	.byte 0x89
//	DW_AT_decl_file:
	.byte 0x03
//	DW_AT_name:
	.4byte .debug_str+0x185
//	DW_AT_type:
	.4byte 0x000004a6
//	DW_AT_declaration:
	.byte 0x01
//	DW_AT_external:
	.byte 0x01
//	DW_TAG_pointer_type:
	.byte 0x0d
//	DW_AT_type:
	.4byte 0x000004ab
//	DW_TAG_structure_type:
	.byte 0x1a
//	DW_AT_decl_line:
	.byte 0xf5
//	DW_AT_decl_file:
	.byte 0x04
//	DW_AT_byte_size:
	.byte 0xd8
//	DW_AT_name:
	.4byte .debug_str+0x18c
//	DW_TAG_member:
	.byte 0x16
//	DW_AT_decl_line:
	.byte 0xf6
//	DW_AT_decl_file:
	.byte 0x04
//	DW_AT_data_member_location:
	.2byte 0x2302
	.byte 0x00
//	DW_AT_name:
	.4byte .debug_str+0x195
//	DW_AT_type:
	.4byte 0x0000002f
//	DW_TAG_member:
	.byte 0x16
//	DW_AT_decl_line:
	.byte 0xfb
//	DW_AT_decl_file:
	.byte 0x04
//	DW_AT_data_member_location:
	.2byte 0x2302
	.byte 0x08
//	DW_AT_name:
	.4byte .debug_str+0x19c
//	DW_AT_type:
	.4byte 0x000002dc
//	DW_TAG_member:
	.byte 0x16
//	DW_AT_decl_line:
	.byte 0xfc
//	DW_AT_decl_file:
	.byte 0x04
//	DW_AT_data_member_location:
	.2byte 0x2302
	.byte 0x10
//	DW_AT_name:
	.4byte .debug_str+0x1a9
//	DW_AT_type:
	.4byte 0x000002dc
//	DW_TAG_member:
	.byte 0x16
//	DW_AT_decl_line:
	.byte 0xfd
//	DW_AT_decl_file:
	.byte 0x04
//	DW_AT_data_member_location:
	.2byte 0x2302
	.byte 0x18
//	DW_AT_name:
	.4byte .debug_str+0x1b6
//	DW_AT_type:
	.4byte 0x000002dc
//	DW_TAG_member:
	.byte 0x16
//	DW_AT_decl_line:
	.byte 0xfe
//	DW_AT_decl_file:
	.byte 0x04
//	DW_AT_data_member_location:
	.2byte 0x2302
	.byte 0x20
//	DW_AT_name:
	.4byte .debug_str+0x1c4
//	DW_AT_type:
	.4byte 0x000002dc
//	DW_TAG_member:
	.byte 0x16
//	DW_AT_decl_line:
	.byte 0xff
//	DW_AT_decl_file:
	.byte 0x04
//	DW_AT_data_member_location:
	.2byte 0x2302
	.byte 0x28
//	DW_AT_name:
	.4byte .debug_str+0x1d3
//	DW_AT_type:
	.4byte 0x000002dc
//	DW_TAG_member:
	.byte 0x1b
//	DW_AT_decl_line:
	.2byte 0x0100
//	DW_AT_decl_file:
	.byte 0x04
//	DW_AT_data_member_location:
	.2byte 0x2302
	.byte 0x30
//	DW_AT_name:
	.4byte .debug_str+0x1e1
//	DW_AT_type:
	.4byte 0x000002dc
//	DW_TAG_member:
	.byte 0x1b
//	DW_AT_decl_line:
	.2byte 0x0101
//	DW_AT_decl_file:
	.byte 0x04
//	DW_AT_data_member_location:
	.2byte 0x2302
	.byte 0x38
//	DW_AT_name:
	.4byte .debug_str+0x1ef
//	DW_AT_type:
	.4byte 0x000002dc
//	DW_TAG_member:
	.byte 0x1b
//	DW_AT_decl_line:
	.2byte 0x0102
//	DW_AT_decl_file:
	.byte 0x04
//	DW_AT_data_member_location:
	.2byte 0x2302
	.byte 0x40
//	DW_AT_name:
	.4byte .debug_str+0x1fc
//	DW_AT_type:
	.4byte 0x000002dc
//	DW_TAG_member:
	.byte 0x1b
//	DW_AT_decl_line:
	.2byte 0x0104
//	DW_AT_decl_file:
	.byte 0x04
//	DW_AT_data_member_location:
	.2byte 0x2302
	.byte 0x48
//	DW_AT_name:
	.4byte .debug_str+0x208
//	DW_AT_type:
	.4byte 0x000002dc
//	DW_TAG_member:
	.byte 0x1b
//	DW_AT_decl_line:
	.2byte 0x0105
//	DW_AT_decl_file:
	.byte 0x04
//	DW_AT_data_member_location:
	.2byte 0x2302
	.byte 0x50
//	DW_AT_name:
	.4byte .debug_str+0x216
//	DW_AT_type:
	.4byte 0x000002dc
//	DW_TAG_member:
	.byte 0x1b
//	DW_AT_decl_line:
	.2byte 0x0106
//	DW_AT_decl_file:
	.byte 0x04
//	DW_AT_data_member_location:
	.2byte 0x2302
	.byte 0x58
//	DW_AT_name:
	.4byte .debug_str+0x226
//	DW_AT_type:
	.4byte 0x000002dc
//	DW_TAG_member:
	.byte 0x1b
//	DW_AT_decl_line:
	.2byte 0x0108
//	DW_AT_decl_file:
	.byte 0x04
//	DW_AT_data_member_location:
	.2byte 0x2302
	.byte 0x60
//	DW_AT_name:
	.4byte .debug_str+0x233
//	DW_AT_type:
	.4byte 0x0000066d
//	DW_TAG_member:
	.byte 0x1b
//	DW_AT_decl_line:
	.2byte 0x010a
//	DW_AT_decl_file:
	.byte 0x04
//	DW_AT_data_member_location:
	.2byte 0x2302
	.byte 0x68
//	DW_AT_name:
	.4byte .debug_str+0x258
//	DW_AT_type:
	.4byte 0x000004a6
//	DW_TAG_member:
	.byte 0x1b
//	DW_AT_decl_line:
	.2byte 0x010c
//	DW_AT_decl_file:
	.byte 0x04
//	DW_AT_data_member_location:
	.2byte 0x2302
	.byte 0x70
//	DW_AT_name:
	.4byte .debug_str+0x25f
//	DW_AT_type:
	.4byte 0x0000002f
//	DW_TAG_member:
	.byte 0x1b
//	DW_AT_decl_line:
	.2byte 0x0110
//	DW_AT_decl_file:
	.byte 0x04
//	DW_AT_data_member_location:
	.2byte 0x2302
	.byte 0x74
//	DW_AT_name:
	.4byte .debug_str+0x267
//	DW_AT_type:
	.4byte 0x0000002f
//	DW_TAG_member:
	.byte 0x1b
//	DW_AT_decl_line:
	.2byte 0x0112
//	DW_AT_decl_file:
	.byte 0x04
//	DW_AT_data_member_location:
	.2byte 0x2302
	.byte 0x78
//	DW_AT_name:
	.4byte .debug_str+0x26f
//	DW_AT_type:
	.4byte 0x000006a5
//	DW_TAG_member:
	.byte 0x1b
//	DW_AT_decl_line:
	.2byte 0x0116
//	DW_AT_decl_file:
	.byte 0x04
//	DW_AT_data_member_location:
	.4byte 0x01802303
//	DW_AT_name:
	.4byte .debug_str+0x288
//	DW_AT_type:
	.4byte 0x000006b7
//	DW_TAG_member:
	.byte 0x1b
//	DW_AT_decl_line:
	.2byte 0x0117
//	DW_AT_decl_file:
	.byte 0x04
//	DW_AT_data_member_location:
	.4byte 0x01822303
//	DW_AT_name:
	.4byte .debug_str+0x2a3
//	DW_AT_type:
	.4byte 0x000002e1
//	DW_TAG_member:
	.byte 0x1b
//	DW_AT_decl_line:
	.2byte 0x0118
//	DW_AT_decl_file:
	.byte 0x04
//	DW_AT_data_member_location:
	.4byte 0x01832303
//	DW_AT_name:
	.4byte .debug_str+0x2b2
//	DW_AT_type:
	.4byte 0x000006be
//	DW_TAG_member:
	.byte 0x1b
//	DW_AT_decl_line:
	.2byte 0x011c
//	DW_AT_decl_file:
	.byte 0x04
//	DW_AT_data_member_location:
	.4byte 0x01882303
//	DW_AT_name:
	.4byte .debug_str+0x2bc
//	DW_AT_type:
	.4byte 0x000006c7
//	DW_TAG_member:
	.byte 0x1b
//	DW_AT_decl_line:
	.2byte 0x0125
//	DW_AT_decl_file:
	.byte 0x04
//	DW_AT_data_member_location:
	.4byte 0x01902303
//	DW_AT_name:
	.4byte .debug_str+0x273
//	DW_AT_type:
	.4byte 0x000006de
//	DW_TAG_member:
	.byte 0x1b
//	DW_AT_decl_line:
	.2byte 0x012d
//	DW_AT_decl_file:
	.byte 0x04
//	DW_AT_data_member_location:
	.4byte 0x01982303
//	DW_AT_name:
	.4byte .debug_str+0x2dc
//	DW_AT_type:
	.4byte 0x000006e9
//	DW_TAG_member:
	.byte 0x1b
//	DW_AT_decl_line:
	.2byte 0x012e
//	DW_AT_decl_file:
	.byte 0x04
//	DW_AT_data_member_location:
	.4byte 0x01a02303
//	DW_AT_name:
	.4byte .debug_str+0x2e3
//	DW_AT_type:
	.4byte 0x000006e9
//	DW_TAG_member:
	.byte 0x1b
//	DW_AT_decl_line:
	.2byte 0x012f
//	DW_AT_decl_file:
	.byte 0x04
//	DW_AT_data_member_location:
	.4byte 0x01a82303
//	DW_AT_name:
	.4byte .debug_str+0x2ea
//	DW_AT_type:
	.4byte 0x000006e9
//	DW_TAG_member:
	.byte 0x1b
//	DW_AT_decl_line:
	.2byte 0x0130
//	DW_AT_decl_file:
	.byte 0x04
//	DW_AT_data_member_location:
	.4byte 0x01b02303
//	DW_AT_name:
	.4byte .debug_str+0x2f1
//	DW_AT_type:
	.4byte 0x000006e9
//	DW_TAG_member:
	.byte 0x1b
//	DW_AT_decl_line:
	.2byte 0x0132
//	DW_AT_decl_file:
	.byte 0x04
//	DW_AT_data_member_location:
	.4byte 0x01b82303
//	DW_AT_name:
	.4byte .debug_str+0x2f8
//	DW_AT_type:
	.4byte 0x000006ee
//	DW_TAG_member:
	.byte 0x1b
//	DW_AT_decl_line:
	.2byte 0x0133
//	DW_AT_decl_file:
	.byte 0x04
//	DW_AT_data_member_location:
	.4byte 0x01c02303
//	DW_AT_name:
	.4byte .debug_str+0x314
//	DW_AT_type:
	.4byte 0x0000002f
//	DW_TAG_member:
	.byte 0x1b
//	DW_AT_decl_line:
	.2byte 0x0135
//	DW_AT_decl_file:
	.byte 0x04
//	DW_AT_data_member_location:
	.4byte 0x01c42303
//	DW_AT_name:
	.4byte .debug_str+0x31a
//	DW_AT_type:
	.4byte 0x00000700
	.byte 0x00
//	DW_TAG_pointer_type:
	.byte 0x0d
//	DW_AT_type:
	.4byte 0x00000672
//	DW_TAG_structure_type:
	.byte 0x1a
//	DW_AT_decl_line:
	.byte 0xa0
//	DW_AT_decl_file:
	.byte 0x04
//	DW_AT_byte_size:
	.byte 0x18
//	DW_AT_name:
	.4byte .debug_str+0x23c
//	DW_TAG_member:
	.byte 0x16
//	DW_AT_decl_line:
	.byte 0xa1
//	DW_AT_decl_file:
	.byte 0x04
//	DW_AT_data_member_location:
	.2byte 0x2302
	.byte 0x00
//	DW_AT_name:
	.4byte .debug_str+0x247
//	DW_AT_type:
	.4byte 0x0000066d
//	DW_TAG_member:
	.byte 0x16
//	DW_AT_decl_line:
	.byte 0xa2
//	DW_AT_decl_file:
	.byte 0x04
//	DW_AT_data_member_location:
	.2byte 0x2302
	.byte 0x08
//	DW_AT_name:
	.4byte .debug_str+0x24d
//	DW_AT_type:
	.4byte 0x000004a6
//	DW_TAG_member:
	.byte 0x16
//	DW_AT_decl_line:
	.byte 0xa6
//	DW_AT_decl_file:
	.byte 0x04
//	DW_AT_data_member_location:
	.2byte 0x2302
	.byte 0x10
//	DW_AT_name:
	.4byte .debug_str+0x253
//	DW_AT_type:
	.4byte 0x0000002f
	.byte 0x00
//	DW_TAG_typedef:
	.byte 0x14
//	DW_AT_decl_line:
	.byte 0x8c
//	DW_AT_decl_file:
	.byte 0x05
//	DW_AT_name:
	.4byte .debug_str+0x27b
//	DW_AT_type:
	.4byte 0x000006b0
//	DW_TAG_base_type:
	.byte 0x0e
//	DW_AT_byte_size:
	.byte 0x08
//	DW_AT_encoding:
	.byte 0x05
//	DW_AT_name:
	.4byte .debug_str+0x283
//	DW_TAG_base_type:
	.byte 0x0e
//	DW_AT_byte_size:
	.byte 0x02
//	DW_AT_encoding:
	.byte 0x07
//	DW_AT_name:
	.4byte .debug_str+0x294
//	DW_TAG_array_type:
	.byte 0x17
//	DW_AT_type:
	.4byte 0x000002e1
//	DW_AT_byte_size:
	.byte 0x01
//	DW_TAG_subrange_type:
	.byte 0x18
//	DW_AT_upper_bound:
	.byte 0x00
	.byte 0x00
//	DW_TAG_pointer_type:
	.byte 0x0d
//	DW_AT_type:
	.4byte 0x000006cc
//	DW_TAG_typedef:
	.byte 0x14
//	DW_AT_decl_line:
	.byte 0x9a
//	DW_AT_decl_file:
	.byte 0x04
//	DW_AT_name:
	.4byte .debug_str+0x2c2
//	DW_AT_type:
	.4byte 0x000006d7
//	DW_TAG_base_type:
	.byte 0x0e
//	DW_AT_byte_size:
	.byte 0x00
//	DW_AT_encoding:
	.byte 0x05
//	DW_AT_name:
	.4byte .debug_str+0x2cd
//	DW_TAG_typedef:
	.byte 0x14
//	DW_AT_decl_line:
	.byte 0x8d
//	DW_AT_decl_file:
	.byte 0x05
//	DW_AT_name:
	.4byte .debug_str+0x2d2
//	DW_AT_type:
	.4byte 0x000006b0
//	DW_TAG_pointer_type:
	.byte 0x0d
//	DW_AT_type:
	.4byte 0x000006d7
//	DW_TAG_typedef:
	.byte 0x14
//	DW_AT_decl_line:
	.byte 0x2f
//	DW_AT_decl_file:
	.byte 0x06
//	DW_AT_name:
	.4byte .debug_str+0x2ff
//	DW_AT_type:
	.4byte 0x000006f9
//	DW_TAG_base_type:
	.byte 0x0e
//	DW_AT_byte_size:
	.byte 0x08
//	DW_AT_encoding:
	.byte 0x07
//	DW_AT_name:
	.4byte .debug_str+0x306
//	DW_TAG_array_type:
	.byte 0x17
//	DW_AT_type:
	.4byte 0x000002e1
//	DW_AT_byte_size:
	.byte 0x14
//	DW_TAG_subrange_type:
	.byte 0x18
//	DW_AT_upper_bound:
	.byte 0x13
	.byte 0x00
	.byte 0x00
// -- Begin DWARF2 SEGMENT .debug_line
	.section .debug_line
.debug_line_seg:
	.align 1
// -- Begin DWARF2 SEGMENT .debug_abbrev
	.section .debug_abbrev
.debug_abbrev_seg:
	.align 1
	.byte 0x01
	.byte 0x11
	.byte 0x01
	.byte 0x1b
	.byte 0x0e
	.byte 0x03
	.byte 0x0e
	.byte 0x25
	.byte 0x0e
	.2byte 0x7681
	.byte 0x0e
	.byte 0x13
	.byte 0x0b
	.byte 0x53
	.byte 0x0c
	.byte 0x11
	.byte 0x01
	.byte 0x55
	.byte 0x17
	.byte 0x6a
	.byte 0x0c
	.byte 0x10
	.byte 0x17
	.2byte 0x0000
	.byte 0x02
	.byte 0x24
	.byte 0x00
	.byte 0x0b
	.byte 0x0b
	.byte 0x3e
	.byte 0x0b
	.byte 0x03
	.byte 0x08
	.2byte 0x0000
	.byte 0x03
	.byte 0x2e
	.byte 0x01
	.byte 0x3b
	.byte 0x0b
	.byte 0x3a
	.byte 0x0b
	.byte 0x49
	.byte 0x13
	.byte 0x27
	.byte 0x0c
	.byte 0x03
	.byte 0x0e
	.2byte 0x4087
	.byte 0x0e
	.byte 0x11
	.byte 0x01
	.byte 0x12
	.byte 0x07
	.byte 0x6a
	.byte 0x0c
	.byte 0x3f
	.byte 0x0c
	.2byte 0x0000
	.byte 0x04
	.byte 0x05
	.byte 0x00
	.byte 0x3b
	.byte 0x0b
	.byte 0x3a
	.byte 0x0b
	.byte 0x49
	.byte 0x13
	.byte 0x03
	.byte 0x0e
	.byte 0x02
	.byte 0x18
	.2byte 0x0000
	.byte 0x05
	.byte 0x34
	.byte 0x00
	.byte 0x3b
	.byte 0x0b
	.byte 0x3a
	.byte 0x0b
	.byte 0x03
	.byte 0x08
	.byte 0x49
	.byte 0x13
	.2byte 0x0000
	.byte 0x06
	.byte 0x34
	.byte 0x00
	.byte 0x3b
	.byte 0x0b
	.byte 0x3a
	.byte 0x0b
	.byte 0x03
	.byte 0x0e
	.byte 0x49
	.byte 0x13
	.2byte 0x0000
	.byte 0x07
	.byte 0x34
	.byte 0x00
	.byte 0x3b
	.byte 0x0b
	.byte 0x3a
	.byte 0x0b
	.byte 0x03
	.byte 0x08
	.byte 0x49
	.byte 0x13
	.byte 0x02
	.byte 0x18
	.2byte 0x0000
	.byte 0x08
	.byte 0x1d
	.byte 0x01
	.byte 0x11
	.byte 0x01
	.byte 0x12
	.byte 0x07
	.byte 0x31
	.byte 0x13
	.byte 0x59
	.byte 0x0b
	.byte 0x57
	.byte 0x0b
	.byte 0x58
	.byte 0x0b
	.2byte 0x0000
	.byte 0x09
	.byte 0x05
	.byte 0x00
	.byte 0x3b
	.byte 0x0b
	.byte 0x3a
	.byte 0x0b
	.byte 0x49
	.byte 0x13
	.byte 0x03
	.byte 0x08
	.2byte 0x0000
	.byte 0x0a
	.byte 0x05
	.byte 0x00
	.byte 0x3b
	.byte 0x0b
	.byte 0x3a
	.byte 0x0b
	.byte 0x49
	.byte 0x13
	.byte 0x03
	.byte 0x0e
	.2byte 0x0000
	.byte 0x0b
	.byte 0x34
	.byte 0x00
	.byte 0x3b
	.byte 0x0b
	.byte 0x3a
	.byte 0x0b
	.byte 0x03
	.byte 0x0e
	.byte 0x49
	.byte 0x13
	.byte 0x02
	.byte 0x18
	.2byte 0x0000
	.byte 0x0c
	.byte 0x1d
	.byte 0x01
	.byte 0x55
	.byte 0x17
	.byte 0x52
	.byte 0x01
	.byte 0x31
	.byte 0x13
	.byte 0x59
	.byte 0x0b
	.byte 0x57
	.byte 0x0b
	.byte 0x58
	.byte 0x0b
	.2byte 0x0000
	.byte 0x0d
	.byte 0x0f
	.byte 0x00
	.byte 0x49
	.byte 0x13
	.2byte 0x0000
	.byte 0x0e
	.byte 0x24
	.byte 0x00
	.byte 0x0b
	.byte 0x0b
	.byte 0x3e
	.byte 0x0b
	.byte 0x03
	.byte 0x0e
	.2byte 0x0000
	.byte 0x0f
	.byte 0x01
	.byte 0x01
	.byte 0x49
	.byte 0x13
	.byte 0x0b
	.byte 0x06
	.2byte 0x0000
	.byte 0x10
	.byte 0x21
	.byte 0x00
	.byte 0x2f
	.byte 0x05
	.2byte 0x0000
	.byte 0x11
	.byte 0x2e
	.byte 0x01
	.byte 0x3b
	.byte 0x0b
	.byte 0x3a
	.byte 0x0b
	.byte 0x3c
	.byte 0x0c
	.byte 0x27
	.byte 0x0c
	.byte 0x03
	.byte 0x0e
	.2byte 0x4087
	.byte 0x0e
	.byte 0x20
	.byte 0x0b
	.2byte 0x0000
	.byte 0x12
	.byte 0x05
	.byte 0x00
	.byte 0x49
	.byte 0x13
	.2byte 0x0000
	.byte 0x13
	.byte 0x01
	.byte 0x01
	.byte 0x49
	.byte 0x13
	.byte 0x0b
	.byte 0x05
	.2byte 0x0000
	.byte 0x14
	.byte 0x16
	.byte 0x00
	.byte 0x3b
	.byte 0x0b
	.byte 0x3a
	.byte 0x0b
	.byte 0x03
	.byte 0x0e
	.byte 0x49
	.byte 0x13
	.2byte 0x0000
	.byte 0x15
	.byte 0x17
	.byte 0x01
	.byte 0x3b
	.byte 0x0b
	.byte 0x3a
	.byte 0x0b
	.byte 0x0b
	.byte 0x0b
	.byte 0x03
	.byte 0x0e
	.2byte 0x0000
	.byte 0x16
	.byte 0x0d
	.byte 0x00
	.byte 0x3b
	.byte 0x0b
	.byte 0x3a
	.byte 0x0b
	.byte 0x38
	.byte 0x18
	.byte 0x03
	.byte 0x0e
	.byte 0x49
	.byte 0x13
	.2byte 0x0000
	.byte 0x17
	.byte 0x01
	.byte 0x01
	.byte 0x49
	.byte 0x13
	.byte 0x0b
	.byte 0x0b
	.2byte 0x0000
	.byte 0x18
	.byte 0x21
	.byte 0x00
	.byte 0x2f
	.byte 0x0b
	.2byte 0x0000
	.byte 0x19
	.byte 0x34
	.byte 0x00
	.byte 0x3b
	.byte 0x0b
	.byte 0x3a
	.byte 0x0b
	.byte 0x03
	.byte 0x0e
	.byte 0x49
	.byte 0x13
	.byte 0x3c
	.byte 0x0c
	.byte 0x3f
	.byte 0x0c
	.2byte 0x0000
	.byte 0x1a
	.byte 0x13
	.byte 0x01
	.byte 0x3b
	.byte 0x0b
	.byte 0x3a
	.byte 0x0b
	.byte 0x0b
	.byte 0x0b
	.byte 0x03
	.byte 0x0e
	.2byte 0x0000
	.byte 0x1b
	.byte 0x0d
	.byte 0x00
	.byte 0x3b
	.byte 0x05
	.byte 0x3a
	.byte 0x0b
	.byte 0x38
	.byte 0x18
	.byte 0x03
	.byte 0x0e
	.byte 0x49
	.byte 0x13
	.2byte 0x0000
	.byte 0x00
// -- Begin DWARF2 SEGMENT .debug_str
	.section .debug_str,"MS",@progbits,1
.debug_str_seg:
	.align 1
	.8byte 0x72702f656d6f682f
	.8byte 0x6b726f772f687361
	.8byte 0x6f632f647469692d
	.8byte 0x62616c2f3932376c
	.4byte 0x73612f33
	.2byte 0x006d
	.8byte 0x2d6d6d65672f2e2e
	.8byte 0x2f74706f646e6168
	.8byte 0x6e61682d6d6d6567
	.4byte 0x74706f64
	.2byte 0x632e
	.byte 0x00
	.8byte 0x2952286c65746e49
	.8byte 0x6c65746e49204320
	.8byte 0x4320343620295228
	.8byte 0x2072656c69706d6f
	.8byte 0x6c70706120726f66
	.8byte 0x736e6f6974616369
	.8byte 0x676e696e6e757220
	.8byte 0x65746e49206e6f20
	.8byte 0x2c3436202952286c
	.8byte 0x6e6f697372655620
	.8byte 0x2e332e302e393120
	.8byte 0x6c69754220393931
	.8byte 0x3230393130322064
	.4byte 0x000a3630
	.8byte 0x6f702f2e2e20492d
	.8byte 0x2d68636e6562796c
	.8byte 0x74752f322e332d63
	.8byte 0x2f73656974696c69
	.8byte 0x20334f2d20672d20
	.8byte 0x4542594c4f50442d
	.8byte 0x454d49545f48434e
	.8byte 0x4152545845442d20
	.8byte 0x41445f454752414c
	.8byte 0x442d205445534154
	.8byte 0x5059545f41544144
	.8byte 0x544e495f53495f45
	.4byte 0x00532d20
	.4byte 0x6e69616d
	.byte 0x00
	.4byte 0x63677261
	.byte 0x00
	.4byte 0x72616863
	.byte 0x00
	.4byte 0x76677261
	.byte 0x00
	.4byte 0x62756f64
	.2byte 0x656c
	.byte 0x00
	.4byte 0x68706c61
	.2byte 0x0061
	.4byte 0x61746562
	.byte 0x00
	.8byte 0x72615f746e697270
	.4byte 0x00796172
	.8byte 0x675f6c656e72656b
	.4byte 0x006d6d65
	.4byte 0x706c615f
	.2byte 0x6168
	.byte 0x00
	.8byte 0x00643231356d5f5f
	.8byte 0x5f643231356d5f5f
	.4byte 0x00343666
	.4byte 0x7465625f
	.2byte 0x0061
	.4byte 0x72657a5f
	.2byte 0x006f
	.8byte 0x7272615f74696e69
	.2byte 0x7961
	.byte 0x00
	.4byte 0x65647473
	.2byte 0x7272
	.byte 0x00
	.8byte 0x454c49465f4f495f
	.byte 0x00
	.4byte 0x616c665f
	.2byte 0x7367
	.byte 0x00
	.8byte 0x646165725f4f495f
	.4byte 0x7274705f
	.byte 0x00
	.8byte 0x646165725f4f495f
	.4byte 0x646e655f
	.byte 0x00
	.8byte 0x646165725f4f495f
	.4byte 0x7361625f
	.2byte 0x0065
	.8byte 0x746972775f4f495f
	.4byte 0x61625f65
	.2byte 0x6573
	.byte 0x00
	.8byte 0x746972775f4f495f
	.4byte 0x74705f65
	.2byte 0x0072
	.8byte 0x746972775f4f495f
	.4byte 0x6e655f65
	.2byte 0x0064
	.8byte 0x5f6675625f4f495f
	.4byte 0x65736162
	.byte 0x00
	.8byte 0x5f6675625f4f495f
	.4byte 0x00646e65
	.8byte 0x657661735f4f495f
	.4byte 0x7361625f
	.2byte 0x0065
	.8byte 0x6b6361625f4f495f
	.8byte 0x00657361625f7075
	.8byte 0x657661735f4f495f
	.4byte 0x646e655f
	.byte 0x00
	.8byte 0x7372656b72616d5f
	.byte 0x00
	.8byte 0x6b72616d5f4f495f
	.2byte 0x7265
	.byte 0x00
	.4byte 0x78656e5f
	.2byte 0x0074
	.4byte 0x7562735f
	.2byte 0x0066
	.4byte 0x736f705f
	.byte 0x00
	.4byte 0x6168635f
	.2byte 0x6e69
	.byte 0x00
	.8byte 0x006f6e656c69665f
	.8byte 0x00327367616c665f
	.8byte 0x66666f5f646c6f5f
	.4byte 0x00746573
	.8byte 0x00745f66666f5f5f
	.4byte 0x676e6f6c
	.byte 0x00
	.8byte 0x6c6f635f7275635f
	.4byte 0x006e6d75
	.8byte 0x64656e6769736e75
	.4byte 0x6f687320
	.2byte 0x7472
	.byte 0x00
	.8byte 0x5f656c626174765f
	.4byte 0x7366666f
	.2byte 0x7465
	.byte 0x00
	.8byte 0x756274726f68735f
	.2byte 0x0066
	.4byte 0x636f6c5f
	.2byte 0x006b
	.8byte 0x6b636f6c5f4f495f
	.2byte 0x745f
	.byte 0x00
	.4byte 0x64696f76
	.byte 0x00
	.8byte 0x5f343666666f5f5f
	.2byte 0x0074
	.4byte 0x61705f5f
	.2byte 0x3164
	.byte 0x00
	.4byte 0x61705f5f
	.2byte 0x3264
	.byte 0x00
	.4byte 0x61705f5f
	.2byte 0x3364
	.byte 0x00
	.4byte 0x61705f5f
	.2byte 0x3464
	.byte 0x00
	.4byte 0x61705f5f
	.2byte 0x3564
	.byte 0x00
	.4byte 0x657a6973
	.2byte 0x745f
	.byte 0x00
	.8byte 0x64656e6769736e75
	.4byte 0x6e6f6c20
	.2byte 0x0067
	.4byte 0x646f6d5f
	.2byte 0x0065
	.8byte 0x32646573756e755f
	.byte 0x00
// -- Begin DWARF2 SEGMENT .debug_ranges
	.section .debug_ranges
.debug_ranges_seg:
	.align 1
	.8byte ..LN36
	.8byte ..LN313
	.8byte ..LN557
	.8byte ..LNmain.574
	.8byte 0x0000000000000000
	.8byte 0x0000000000000000
	.8byte ..L3
	.8byte ..LNmain.574
	.8byte 0x0000000000000000
	.8byte 0x0000000000000000
	.section .text
.LNDBG_TXe:
# End
