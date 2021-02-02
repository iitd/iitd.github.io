
gemm4:     file format elf64-x86-64


Disassembly of section .init:

0000000000400630 <_init>:
  400630:	48 83 ec 08          	sub    $0x8,%rsp
  400634:	48 8b 05 bd 19 20 00 	mov    0x2019bd(%rip),%rax        # 601ff8 <__gmon_start__>
  40063b:	48 85 c0             	test   %rax,%rax
  40063e:	74 02                	je     400642 <_init+0x12>
  400640:	ff d0                	callq  *%rax
  400642:	48 83 c4 08          	add    $0x8,%rsp
  400646:	c3                   	retq   

Disassembly of section .plt:

0000000000400650 <.plt>:
  400650:	ff 35 b2 19 20 00    	pushq  0x2019b2(%rip)        # 602008 <_GLOBAL_OFFSET_TABLE_+0x8>
  400656:	ff 25 b4 19 20 00    	jmpq   *0x2019b4(%rip)        # 602010 <_GLOBAL_OFFSET_TABLE_+0x10>
  40065c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400660 <free@plt>:
  400660:	ff 25 b2 19 20 00    	jmpq   *0x2019b2(%rip)        # 602018 <free@GLIBC_2.2.5>
  400666:	68 00 00 00 00       	pushq  $0x0
  40066b:	e9 e0 ff ff ff       	jmpq   400650 <.plt>

0000000000400670 <printf@plt>:
  400670:	ff 25 aa 19 20 00    	jmpq   *0x2019aa(%rip)        # 602020 <printf@GLIBC_2.2.5>
  400676:	68 01 00 00 00       	pushq  $0x1
  40067b:	e9 d0 ff ff ff       	jmpq   400650 <.plt>

0000000000400680 <gettimeofday@plt>:
  400680:	ff 25 a2 19 20 00    	jmpq   *0x2019a2(%rip)        # 602028 <gettimeofday@GLIBC_2.2.5>
  400686:	68 02 00 00 00       	pushq  $0x2
  40068b:	e9 c0 ff ff ff       	jmpq   400650 <.plt>

0000000000400690 <__assert_fail@plt>:
  400690:	ff 25 9a 19 20 00    	jmpq   *0x20199a(%rip)        # 602030 <__assert_fail@GLIBC_2.2.5>
  400696:	68 03 00 00 00       	pushq  $0x3
  40069b:	e9 b0 ff ff ff       	jmpq   400650 <.plt>

00000000004006a0 <memset@plt>:
  4006a0:	ff 25 92 19 20 00    	jmpq   *0x201992(%rip)        # 602038 <memset@GLIBC_2.2.5>
  4006a6:	68 04 00 00 00       	pushq  $0x4
  4006ab:	e9 a0 ff ff ff       	jmpq   400650 <.plt>

00000000004006b0 <fputc@plt>:
  4006b0:	ff 25 8a 19 20 00    	jmpq   *0x20198a(%rip)        # 602040 <fputc@GLIBC_2.2.5>
  4006b6:	68 05 00 00 00       	pushq  $0x5
  4006bb:	e9 90 ff ff ff       	jmpq   400650 <.plt>

00000000004006c0 <calloc@plt>:
  4006c0:	ff 25 82 19 20 00    	jmpq   *0x201982(%rip)        # 602048 <calloc@GLIBC_2.2.5>
  4006c6:	68 06 00 00 00       	pushq  $0x6
  4006cb:	e9 80 ff ff ff       	jmpq   400650 <.plt>

00000000004006d0 <fprintf@plt>:
  4006d0:	ff 25 7a 19 20 00    	jmpq   *0x20197a(%rip)        # 602050 <fprintf@GLIBC_2.2.5>
  4006d6:	68 07 00 00 00       	pushq  $0x7
  4006db:	e9 70 ff ff ff       	jmpq   400650 <.plt>

00000000004006e0 <exit@plt>:
  4006e0:	ff 25 72 19 20 00    	jmpq   *0x201972(%rip)        # 602058 <exit@GLIBC_2.2.5>
  4006e6:	68 08 00 00 00       	pushq  $0x8
  4006eb:	e9 60 ff ff ff       	jmpq   400650 <.plt>

00000000004006f0 <fwrite@plt>:
  4006f0:	ff 25 6a 19 20 00    	jmpq   *0x20196a(%rip)        # 602060 <fwrite@GLIBC_2.2.5>
  4006f6:	68 09 00 00 00       	pushq  $0x9
  4006fb:	e9 50 ff ff ff       	jmpq   400650 <.plt>

0000000000400700 <posix_memalign@plt>:
  400700:	ff 25 62 19 20 00    	jmpq   *0x201962(%rip)        # 602068 <posix_memalign@GLIBC_2.2.5>
  400706:	68 0a 00 00 00       	pushq  $0xa
  40070b:	e9 40 ff ff ff       	jmpq   400650 <.plt>

Disassembly of section .text:

0000000000400710 <_start>:
  400710:	31 ed                	xor    %ebp,%ebp
  400712:	49 89 d1             	mov    %rdx,%r9
  400715:	5e                   	pop    %rsi
  400716:	48 89 e2             	mov    %rsp,%rdx
  400719:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  40071d:	50                   	push   %rax
  40071e:	54                   	push   %rsp
  40071f:	49 c7 c0 50 0e 40 00 	mov    $0x400e50,%r8
  400726:	48 c7 c1 e0 0d 40 00 	mov    $0x400de0,%rcx
  40072d:	48 c7 c7 30 0b 40 00 	mov    $0x400b30,%rdi
  400734:	ff 15 b6 18 20 00    	callq  *0x2018b6(%rip)        # 601ff0 <__libc_start_main@GLIBC_2.2.5>
  40073a:	f4                   	hlt    
  40073b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000400740 <_dl_relocate_static_pie>:
  400740:	f3 c3                	repz retq 
  400742:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  400749:	00 00 00 
  40074c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400750 <deregister_tm_clones>:
  400750:	55                   	push   %rbp
  400751:	b8 80 20 60 00       	mov    $0x602080,%eax
  400756:	48 3d 80 20 60 00    	cmp    $0x602080,%rax
  40075c:	48 89 e5             	mov    %rsp,%rbp
  40075f:	74 17                	je     400778 <deregister_tm_clones+0x28>
  400761:	b8 00 00 00 00       	mov    $0x0,%eax
  400766:	48 85 c0             	test   %rax,%rax
  400769:	74 0d                	je     400778 <deregister_tm_clones+0x28>
  40076b:	5d                   	pop    %rbp
  40076c:	bf 80 20 60 00       	mov    $0x602080,%edi
  400771:	ff e0                	jmpq   *%rax
  400773:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  400778:	5d                   	pop    %rbp
  400779:	c3                   	retq   
  40077a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000400780 <register_tm_clones>:
  400780:	be 80 20 60 00       	mov    $0x602080,%esi
  400785:	55                   	push   %rbp
  400786:	48 81 ee 80 20 60 00 	sub    $0x602080,%rsi
  40078d:	48 89 e5             	mov    %rsp,%rbp
  400790:	48 c1 fe 03          	sar    $0x3,%rsi
  400794:	48 89 f0             	mov    %rsi,%rax
  400797:	48 c1 e8 3f          	shr    $0x3f,%rax
  40079b:	48 01 c6             	add    %rax,%rsi
  40079e:	48 d1 fe             	sar    %rsi
  4007a1:	74 15                	je     4007b8 <register_tm_clones+0x38>
  4007a3:	b8 00 00 00 00       	mov    $0x0,%eax
  4007a8:	48 85 c0             	test   %rax,%rax
  4007ab:	74 0b                	je     4007b8 <register_tm_clones+0x38>
  4007ad:	5d                   	pop    %rbp
  4007ae:	bf 80 20 60 00       	mov    $0x602080,%edi
  4007b3:	ff e0                	jmpq   *%rax
  4007b5:	0f 1f 00             	nopl   (%rax)
  4007b8:	5d                   	pop    %rbp
  4007b9:	c3                   	retq   
  4007ba:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

00000000004007c0 <__do_global_dtors_aux>:
  4007c0:	80 3d c1 18 20 00 00 	cmpb   $0x0,0x2018c1(%rip)        # 602088 <completed.7696>
  4007c7:	75 17                	jne    4007e0 <__do_global_dtors_aux+0x20>
  4007c9:	55                   	push   %rbp
  4007ca:	48 89 e5             	mov    %rsp,%rbp
  4007cd:	e8 7e ff ff ff       	callq  400750 <deregister_tm_clones>
  4007d2:	c6 05 af 18 20 00 01 	movb   $0x1,0x2018af(%rip)        # 602088 <completed.7696>
  4007d9:	5d                   	pop    %rbp
  4007da:	c3                   	retq   
  4007db:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  4007e0:	f3 c3                	repz retq 
  4007e2:	0f 1f 40 00          	nopl   0x0(%rax)
  4007e6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  4007ed:	00 00 00 

00000000004007f0 <frame_dummy>:
  4007f0:	55                   	push   %rbp
  4007f1:	48 89 e5             	mov    %rsp,%rbp
  4007f4:	5d                   	pop    %rbp
  4007f5:	eb 89                	jmp    400780 <register_tm_clones>
  4007f7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  4007fe:	00 00 

0000000000400800 <polybench_flush_cache>:
  400800:	50                   	push   %rax
  400801:	bf 00 01 40 00       	mov    $0x400100,%edi
  400806:	be 08 00 00 00       	mov    $0x8,%esi
  40080b:	e8 b0 fe ff ff       	callq  4006c0 <calloc@plt>
  400810:	66 0f 57 c0          	xorpd  %xmm0,%xmm0
  400814:	48 c7 c1 08 ff bf ff 	mov    $0xffffffffffbfff08,%rcx
  40081b:	eb 10                	jmp    40082d <polybench_flush_cache+0x2d>
  40081d:	0f 1f 00             	nopl   (%rax)
  400820:	f2 0f 58 84 c8 00 08 	addsd  0x2000800(%rax,%rcx,8),%xmm0
  400827:	00 02 
  400829:	48 83 c1 08          	add    $0x8,%rcx
  40082d:	f2 0f 58 84 c8 c8 07 	addsd  0x20007c8(%rax,%rcx,8),%xmm0
  400834:	00 02 
  400836:	f2 0f 58 84 c8 d0 07 	addsd  0x20007d0(%rax,%rcx,8),%xmm0
  40083d:	00 02 
  40083f:	f2 0f 58 84 c8 d8 07 	addsd  0x20007d8(%rax,%rcx,8),%xmm0
  400846:	00 02 
  400848:	f2 0f 58 84 c8 e0 07 	addsd  0x20007e0(%rax,%rcx,8),%xmm0
  40084f:	00 02 
  400851:	f2 0f 58 84 c8 e8 07 	addsd  0x20007e8(%rax,%rcx,8),%xmm0
  400858:	00 02 
  40085a:	f2 0f 58 84 c8 f0 07 	addsd  0x20007f0(%rax,%rcx,8),%xmm0
  400861:	00 02 
  400863:	f2 0f 58 84 c8 f8 07 	addsd  0x20007f8(%rax,%rcx,8),%xmm0
  40086a:	00 02 
  40086c:	48 85 c9             	test   %rcx,%rcx
  40086f:	75 af                	jne    400820 <polybench_flush_cache+0x20>
  400871:	f2 0f 10 0d ef 05 00 	movsd  0x5ef(%rip),%xmm1        # 400e68 <_IO_stdin_used+0x8>
  400878:	00 
  400879:	66 0f 2e c8          	ucomisd %xmm0,%xmm1
  40087d:	72 09                	jb     400888 <polybench_flush_cache+0x88>
  40087f:	48 89 c7             	mov    %rax,%rdi
  400882:	58                   	pop    %rax
  400883:	e9 d8 fd ff ff       	jmpq   400660 <free@plt>
  400888:	bf 78 0e 40 00       	mov    $0x400e78,%edi
  40088d:	be 84 0e 40 00       	mov    $0x400e84,%esi
  400892:	ba 7b 00 00 00       	mov    $0x7b,%edx
  400897:	b9 9a 0e 40 00       	mov    $0x400e9a,%ecx
  40089c:	e8 ef fd ff ff       	callq  400690 <__assert_fail@plt>
  4008a1:	66 66 66 66 66 66 2e 	data16 data16 data16 data16 data16 nopw %cs:0x0(%rax,%rax,1)
  4008a8:	0f 1f 84 00 00 00 00 
  4008af:	00 

00000000004008b0 <polybench_prepare_instruments>:
  4008b0:	50                   	push   %rax
  4008b1:	bf 00 01 40 00       	mov    $0x400100,%edi
  4008b6:	be 08 00 00 00       	mov    $0x8,%esi
  4008bb:	e8 00 fe ff ff       	callq  4006c0 <calloc@plt>
  4008c0:	66 0f 57 c0          	xorpd  %xmm0,%xmm0
  4008c4:	48 c7 c1 08 ff bf ff 	mov    $0xffffffffffbfff08,%rcx
  4008cb:	eb 10                	jmp    4008dd <polybench_prepare_instruments+0x2d>
  4008cd:	0f 1f 00             	nopl   (%rax)
  4008d0:	f2 0f 58 84 c8 00 08 	addsd  0x2000800(%rax,%rcx,8),%xmm0
  4008d7:	00 02 
  4008d9:	48 83 c1 08          	add    $0x8,%rcx
  4008dd:	f2 0f 58 84 c8 c8 07 	addsd  0x20007c8(%rax,%rcx,8),%xmm0
  4008e4:	00 02 
  4008e6:	f2 0f 58 84 c8 d0 07 	addsd  0x20007d0(%rax,%rcx,8),%xmm0
  4008ed:	00 02 
  4008ef:	f2 0f 58 84 c8 d8 07 	addsd  0x20007d8(%rax,%rcx,8),%xmm0
  4008f6:	00 02 
  4008f8:	f2 0f 58 84 c8 e0 07 	addsd  0x20007e0(%rax,%rcx,8),%xmm0
  4008ff:	00 02 
  400901:	f2 0f 58 84 c8 e8 07 	addsd  0x20007e8(%rax,%rcx,8),%xmm0
  400908:	00 02 
  40090a:	f2 0f 58 84 c8 f0 07 	addsd  0x20007f0(%rax,%rcx,8),%xmm0
  400911:	00 02 
  400913:	f2 0f 58 84 c8 f8 07 	addsd  0x20007f8(%rax,%rcx,8),%xmm0
  40091a:	00 02 
  40091c:	48 85 c9             	test   %rcx,%rcx
  40091f:	75 af                	jne    4008d0 <polybench_prepare_instruments+0x20>
  400921:	f2 0f 10 0d 3f 05 00 	movsd  0x53f(%rip),%xmm1        # 400e68 <_IO_stdin_used+0x8>
  400928:	00 
  400929:	66 0f 2e c8          	ucomisd %xmm0,%xmm1
  40092d:	72 09                	jb     400938 <polybench_prepare_instruments+0x88>
  40092f:	48 89 c7             	mov    %rax,%rdi
  400932:	58                   	pop    %rax
  400933:	e9 28 fd ff ff       	jmpq   400660 <free@plt>
  400938:	bf 78 0e 40 00       	mov    $0x400e78,%edi
  40093d:	be 84 0e 40 00       	mov    $0x400e84,%esi
  400942:	ba 7b 00 00 00       	mov    $0x7b,%edx
  400947:	b9 9a 0e 40 00       	mov    $0x400e9a,%ecx
  40094c:	e8 3f fd ff ff       	callq  400690 <__assert_fail@plt>
  400951:	66 66 66 66 66 66 2e 	data16 data16 data16 data16 data16 nopw %cs:0x0(%rax,%rax,1)
  400958:	0f 1f 84 00 00 00 00 
  40095f:	00 

0000000000400960 <polybench_timer_start>:
  400960:	48 83 ec 18          	sub    $0x18,%rsp
  400964:	bf 00 01 40 00       	mov    $0x400100,%edi
  400969:	be 08 00 00 00       	mov    $0x8,%esi
  40096e:	e8 4d fd ff ff       	callq  4006c0 <calloc@plt>
  400973:	66 0f 57 c0          	xorpd  %xmm0,%xmm0
  400977:	48 c7 c1 08 ff bf ff 	mov    $0xffffffffffbfff08,%rcx
  40097e:	eb 0d                	jmp    40098d <polybench_timer_start+0x2d>
  400980:	f2 0f 58 84 c8 00 08 	addsd  0x2000800(%rax,%rcx,8),%xmm0
  400987:	00 02 
  400989:	48 83 c1 08          	add    $0x8,%rcx
  40098d:	f2 0f 58 84 c8 c8 07 	addsd  0x20007c8(%rax,%rcx,8),%xmm0
  400994:	00 02 
  400996:	f2 0f 58 84 c8 d0 07 	addsd  0x20007d0(%rax,%rcx,8),%xmm0
  40099d:	00 02 
  40099f:	f2 0f 58 84 c8 d8 07 	addsd  0x20007d8(%rax,%rcx,8),%xmm0
  4009a6:	00 02 
  4009a8:	f2 0f 58 84 c8 e0 07 	addsd  0x20007e0(%rax,%rcx,8),%xmm0
  4009af:	00 02 
  4009b1:	f2 0f 58 84 c8 e8 07 	addsd  0x20007e8(%rax,%rcx,8),%xmm0
  4009b8:	00 02 
  4009ba:	f2 0f 58 84 c8 f0 07 	addsd  0x20007f0(%rax,%rcx,8),%xmm0
  4009c1:	00 02 
  4009c3:	f2 0f 58 84 c8 f8 07 	addsd  0x20007f8(%rax,%rcx,8),%xmm0
  4009ca:	00 02 
  4009cc:	48 85 c9             	test   %rcx,%rcx
  4009cf:	75 af                	jne    400980 <polybench_timer_start+0x20>
  4009d1:	f2 0f 10 0d 8f 04 00 	movsd  0x48f(%rip),%xmm1        # 400e68 <_IO_stdin_used+0x8>
  4009d8:	00 
  4009d9:	66 0f 2e c8          	ucomisd %xmm0,%xmm1
  4009dd:	72 55                	jb     400a34 <polybench_timer_start+0xd4>
  4009df:	48 89 c7             	mov    %rax,%rdi
  4009e2:	e8 79 fc ff ff       	callq  400660 <free@plt>
  4009e7:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
  4009ec:	31 f6                	xor    %esi,%esi
  4009ee:	e8 8d fc ff ff       	callq  400680 <gettimeofday@plt>
  4009f3:	89 c1                	mov    %eax,%ecx
  4009f5:	85 c9                	test   %ecx,%ecx
  4009f7:	74 0e                	je     400a07 <polybench_timer_start+0xa7>
  4009f9:	bf be 0e 40 00       	mov    $0x400ebe,%edi
  4009fe:	31 c0                	xor    %eax,%eax
  400a00:	89 ce                	mov    %ecx,%esi
  400a02:	e8 69 fc ff ff       	callq  400670 <printf@plt>
  400a07:	0f 57 c0             	xorps  %xmm0,%xmm0
  400a0a:	f2 48 0f 2a 44 24 08 	cvtsi2sdq 0x8(%rsp),%xmm0
  400a11:	0f 57 c9             	xorps  %xmm1,%xmm1
  400a14:	f2 48 0f 2a 4c 24 10 	cvtsi2sdq 0x10(%rsp),%xmm1
  400a1b:	f2 0f 59 0d 4d 04 00 	mulsd  0x44d(%rip),%xmm1        # 400e70 <_IO_stdin_used+0x10>
  400a22:	00 
  400a23:	f2 0f 58 c8          	addsd  %xmm0,%xmm1
  400a27:	f2 0f 11 0d 81 16 20 	movsd  %xmm1,0x201681(%rip)        # 6020b0 <polybench_t_start>
  400a2e:	00 
  400a2f:	48 83 c4 18          	add    $0x18,%rsp
  400a33:	c3                   	retq   
  400a34:	bf 78 0e 40 00       	mov    $0x400e78,%edi
  400a39:	be 84 0e 40 00       	mov    $0x400e84,%esi
  400a3e:	ba 7b 00 00 00       	mov    $0x7b,%edx
  400a43:	b9 9a 0e 40 00       	mov    $0x400e9a,%ecx
  400a48:	e8 43 fc ff ff       	callq  400690 <__assert_fail@plt>
  400a4d:	0f 1f 00             	nopl   (%rax)

0000000000400a50 <polybench_timer_stop>:
  400a50:	48 83 ec 18          	sub    $0x18,%rsp
  400a54:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
  400a59:	31 f6                	xor    %esi,%esi
  400a5b:	e8 20 fc ff ff       	callq  400680 <gettimeofday@plt>
  400a60:	89 c1                	mov    %eax,%ecx
  400a62:	85 c9                	test   %ecx,%ecx
  400a64:	74 0e                	je     400a74 <polybench_timer_stop+0x24>
  400a66:	bf be 0e 40 00       	mov    $0x400ebe,%edi
  400a6b:	31 c0                	xor    %eax,%eax
  400a6d:	89 ce                	mov    %ecx,%esi
  400a6f:	e8 fc fb ff ff       	callq  400670 <printf@plt>
  400a74:	f2 48 0f 2a 44 24 08 	cvtsi2sdq 0x8(%rsp),%xmm0
  400a7b:	f2 48 0f 2a 4c 24 10 	cvtsi2sdq 0x10(%rsp),%xmm1
  400a82:	f2 0f 59 0d e6 03 00 	mulsd  0x3e6(%rip),%xmm1        # 400e70 <_IO_stdin_used+0x10>
  400a89:	00 
  400a8a:	f2 0f 58 c8          	addsd  %xmm0,%xmm1
  400a8e:	f2 0f 11 0d 12 16 20 	movsd  %xmm1,0x201612(%rip)        # 6020a8 <polybench_t_end>
  400a95:	00 
  400a96:	48 83 c4 18          	add    $0x18,%rsp
  400a9a:	c3                   	retq   
  400a9b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000400aa0 <polybench_timer_print>:
  400aa0:	f2 0f 10 05 00 16 20 	movsd  0x201600(%rip),%xmm0        # 6020a8 <polybench_t_end>
  400aa7:	00 
  400aa8:	f2 0f 5c 05 00 16 20 	subsd  0x201600(%rip),%xmm0        # 6020b0 <polybench_t_start>
  400aaf:	00 
  400ab0:	bf b7 0e 40 00       	mov    $0x400eb7,%edi
  400ab5:	b0 01                	mov    $0x1,%al
  400ab7:	e9 b4 fb ff ff       	jmpq   400670 <printf@plt>
  400abc:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400ac0 <polybench_free_data>:
  400ac0:	e9 9b fb ff ff       	jmpq   400660 <free@plt>
  400ac5:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  400acc:	00 00 00 00 

0000000000400ad0 <polybench_alloc_data>:
  400ad0:	50                   	push   %rax
  400ad1:	48 63 d6             	movslq %esi,%rdx
  400ad4:	48 0f af d7          	imul   %rdi,%rdx
  400ad8:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  400adf:	00 
  400ae0:	48 89 e7             	mov    %rsp,%rdi
  400ae3:	be 00 10 00 00       	mov    $0x1000,%esi
  400ae8:	e8 13 fc ff ff       	callq  400700 <posix_memalign@plt>
  400aed:	85 c0                	test   %eax,%eax
  400aef:	75 0b                	jne    400afc <polybench_alloc_data+0x2c>
  400af1:	48 8b 04 24          	mov    (%rsp),%rax
  400af5:	48 85 c0             	test   %rax,%rax
  400af8:	74 02                	je     400afc <polybench_alloc_data+0x2c>
  400afa:	59                   	pop    %rcx
  400afb:	c3                   	retq   
  400afc:	48 8b 0d 7d 15 20 00 	mov    0x20157d(%rip),%rcx        # 602080 <stderr@@GLIBC_2.2.5>
  400b03:	bf e1 0e 40 00       	mov    $0x400ee1,%edi
  400b08:	be 32 00 00 00       	mov    $0x32,%esi
  400b0d:	ba 01 00 00 00       	mov    $0x1,%edx
  400b12:	e8 d9 fb ff ff       	callq  4006f0 <fwrite@plt>
  400b17:	bf 01 00 00 00       	mov    $0x1,%edi
  400b1c:	e8 bf fb ff ff       	callq  4006e0 <exit@plt>
  400b21:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  400b28:	00 00 00 
  400b2b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000400b30 <main>:
  400b30:	55                   	push   %rbp
  400b31:	41 57                	push   %r15
  400b33:	41 56                	push   %r14
  400b35:	41 55                	push   %r13
  400b37:	41 54                	push   %r12
  400b39:	53                   	push   %rbx
  400b3a:	48 83 ec 18          	sub    $0x18,%rsp
  400b3e:	49 89 f4             	mov    %rsi,%r12
  400b41:	41 89 fd             	mov    %edi,%r13d
  400b44:	bf c0 30 46 00       	mov    $0x4630c0,%edi
  400b49:	be 04 00 00 00       	mov    $0x4,%esi
  400b4e:	e8 7d ff ff ff       	callq  400ad0 <polybench_alloc_data>
  400b53:	49 89 c6             	mov    %rax,%r14
  400b56:	bf 80 58 4f 00       	mov    $0x4f5880,%edi
  400b5b:	be 04 00 00 00       	mov    $0x4,%esi
  400b60:	e8 6b ff ff ff       	callq  400ad0 <polybench_alloc_data>
  400b65:	48 89 c3             	mov    %rax,%rbx
  400b68:	bf 60 3f 5b 00       	mov    $0x5b3f60,%edi
  400b6d:	be 04 00 00 00       	mov    $0x4,%esi
  400b72:	e8 59 ff ff ff       	callq  400ad0 <polybench_alloc_data>
  400b77:	49 89 c7             	mov    %rax,%r15
  400b7a:	31 ed                	xor    %ebp,%ebp
  400b7c:	31 f6                	xor    %esi,%esi
  400b7e:	ba 00 c3 18 01       	mov    $0x118c300,%edx
  400b83:	4c 89 f7             	mov    %r14,%rdi
  400b86:	e8 15 fb ff ff       	callq  4006a0 <memset@plt>
  400b8b:	31 f6                	xor    %esi,%esi
  400b8d:	ba 00 62 3d 01       	mov    $0x13d6200,%edx
  400b92:	48 89 df             	mov    %rbx,%rdi
  400b95:	e8 06 fb ff ff       	callq  4006a0 <memset@plt>
  400b9a:	31 f6                	xor    %esi,%esi
  400b9c:	ba 80 fd 6c 01       	mov    $0x16cfd80,%edx
  400ba1:	4c 89 ff             	mov    %r15,%rdi
  400ba4:	e8 f7 fa ff ff       	callq  4006a0 <memset@plt>
  400ba9:	31 c0                	xor    %eax,%eax
  400bab:	e8 b0 fd ff ff       	callq  400960 <polybench_timer_start>
  400bb0:	4c 89 f0             	mov    %r14,%rax
  400bb3:	66 66 66 66 2e 0f 1f 	data16 data16 data16 nopw %cs:0x0(%rax,%rax,1)
  400bba:	84 00 00 00 00 00 
  400bc0:	4c 89 f9             	mov    %r15,%rcx
  400bc3:	31 d2                	xor    %edx,%edx
  400bc5:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  400bcc:	00 00 00 00 
  400bd0:	48 69 f5 a0 28 00 00 	imul   $0x28a0,%rbp,%rsi
  400bd7:	48 01 de             	add    %rbx,%rsi
  400bda:	66 0f 6e 04 96       	movd   (%rsi,%rdx,4),%xmm0
  400bdf:	66 0f 70 c0 00       	pshufd $0x0,%xmm0,%xmm0
  400be4:	be 04 00 00 00       	mov    $0x4,%esi
  400be9:	eb 21                	jmp    400c0c <main+0xdc>
  400beb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  400bf0:	f3 0f 6f 0c b1       	movdqu (%rcx,%rsi,4),%xmm1
  400bf5:	f3 0f 6f 14 b0       	movdqu (%rax,%rsi,4),%xmm2
  400bfa:	66 0f 38 40 c8       	pmulld %xmm0,%xmm1
  400bff:	66 0f fe ca          	paddd  %xmm2,%xmm1
  400c03:	f3 0f 7f 0c b0       	movdqu %xmm1,(%rax,%rsi,4)
  400c08:	48 83 c6 08          	add    $0x8,%rsi
  400c0c:	f3 0f 6f 4c b1 f0    	movdqu -0x10(%rcx,%rsi,4),%xmm1
  400c12:	f3 0f 6f 54 b0 f0    	movdqu -0x10(%rax,%rsi,4),%xmm2
  400c18:	66 0f 38 40 c8       	pmulld %xmm0,%xmm1
  400c1d:	66 0f fe ca          	paddd  %xmm2,%xmm1
  400c21:	f3 0f 7f 4c b0 f0    	movdqu %xmm1,-0x10(%rax,%rsi,4)
  400c27:	48 81 fe fc 08 00 00 	cmp    $0x8fc,%rsi
  400c2e:	72 c0                	jb     400bf0 <main+0xc0>
  400c30:	48 83 c2 01          	add    $0x1,%rdx
  400c34:	48 81 c1 f0 23 00 00 	add    $0x23f0,%rcx
  400c3b:	48 81 fa 28 0a 00 00 	cmp    $0xa28,%rdx
  400c42:	75 8c                	jne    400bd0 <main+0xa0>
  400c44:	48 83 c5 01          	add    $0x1,%rbp
  400c48:	48 05 f0 23 00 00    	add    $0x23f0,%rax
  400c4e:	48 81 fd d0 07 00 00 	cmp    $0x7d0,%rbp
  400c55:	0f 85 65 ff ff ff    	jne    400bc0 <main+0x90>
  400c5b:	31 c0                	xor    %eax,%eax
  400c5d:	e8 ee fd ff ff       	callq  400a50 <polybench_timer_stop>
  400c62:	31 c0                	xor    %eax,%eax
  400c64:	e8 37 fe ff ff       	callq  400aa0 <polybench_timer_print>
  400c69:	41 83 fd 2b          	cmp    $0x2b,%r13d
  400c6d:	7c 09                	jl     400c78 <main+0x148>
  400c6f:	49 8b 04 24          	mov    (%r12),%rax
  400c73:	80 38 00             	cmpb   $0x0,(%rax)
  400c76:	74 29                	je     400ca1 <main+0x171>
  400c78:	4c 89 f7             	mov    %r14,%rdi
  400c7b:	e8 e0 f9 ff ff       	callq  400660 <free@plt>
  400c80:	48 89 df             	mov    %rbx,%rdi
  400c83:	e8 d8 f9 ff ff       	callq  400660 <free@plt>
  400c88:	4c 89 ff             	mov    %r15,%rdi
  400c8b:	e8 d0 f9 ff ff       	callq  400660 <free@plt>
  400c90:	31 c0                	xor    %eax,%eax
  400c92:	48 83 c4 18          	add    $0x18,%rsp
  400c96:	5b                   	pop    %rbx
  400c97:	41 5c                	pop    %r12
  400c99:	41 5d                	pop    %r13
  400c9b:	41 5e                	pop    %r14
  400c9d:	41 5f                	pop    %r15
  400c9f:	5d                   	pop    %rbp
  400ca0:	c3                   	retq   
  400ca1:	48 8b 0d d8 13 20 00 	mov    0x2013d8(%rip),%rcx        # 602080 <stderr@@GLIBC_2.2.5>
  400ca8:	bf 14 0f 40 00       	mov    $0x400f14,%edi
  400cad:	be 16 00 00 00       	mov    $0x16,%esi
  400cb2:	ba 01 00 00 00       	mov    $0x1,%edx
  400cb7:	e8 34 fa ff ff       	callq  4006f0 <fwrite@plt>
  400cbc:	48 8b 3d bd 13 20 00 	mov    0x2013bd(%rip),%rdi        # 602080 <stderr@@GLIBC_2.2.5>
  400cc3:	be 2b 0f 40 00       	mov    $0x400f2b,%esi
  400cc8:	ba 3a 0f 40 00       	mov    $0x400f3a,%edx
  400ccd:	31 c0                	xor    %eax,%eax
  400ccf:	e8 fc f9 ff ff       	callq  4006d0 <fprintf@plt>
  400cd4:	4c 89 74 24 08       	mov    %r14,0x8(%rsp)
  400cd9:	4c 89 f5             	mov    %r14,%rbp
  400cdc:	45 31 ed             	xor    %r13d,%r13d
  400cdf:	45 31 e4             	xor    %r12d,%r12d
  400ce2:	31 d2                	xor    %edx,%edx
  400ce4:	66 66 66 2e 0f 1f 84 	data16 data16 nopw %cs:0x0(%rax,%rax,1)
  400ceb:	00 00 00 00 00 
  400cf0:	48 89 54 24 10       	mov    %rdx,0x10(%rsp)
  400cf5:	49 c7 c6 04 f7 ff ff 	mov    $0xfffffffffffff704,%r14
  400cfc:	44 89 6c 24 04       	mov    %r13d,0x4(%rsp)
  400d01:	44 89 24 24          	mov    %r12d,(%rsp)
  400d05:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  400d0c:	00 00 00 00 
  400d10:	44 89 e8             	mov    %r13d,%eax
  400d13:	b9 cd cc cc cc       	mov    $0xcccccccd,%ecx
  400d18:	48 0f af c1          	imul   %rcx,%rax
  400d1c:	48 c1 e8 24          	shr    $0x24,%rax
  400d20:	8d 04 80             	lea    (%rax,%rax,4),%eax
  400d23:	c1 e0 02             	shl    $0x2,%eax
  400d26:	44 01 e0             	add    %r12d,%eax
  400d29:	75 11                	jne    400d3c <main+0x20c>
  400d2b:	48 8b 35 4e 13 20 00 	mov    0x20134e(%rip),%rsi        # 602080 <stderr@@GLIBC_2.2.5>
  400d32:	bf 0a 00 00 00       	mov    $0xa,%edi
  400d37:	e8 74 f9 ff ff       	callq  4006b0 <fputc@plt>
  400d3c:	48 8b 3d 3d 13 20 00 	mov    0x20133d(%rip),%rdi        # 602080 <stderr@@GLIBC_2.2.5>
  400d43:	42 8b 94 b5 f0 23 00 	mov    0x23f0(%rbp,%r14,4),%edx
  400d4a:	00 
  400d4b:	be 3c 0f 40 00       	mov    $0x400f3c,%esi
  400d50:	31 c0                	xor    %eax,%eax
  400d52:	e8 79 f9 ff ff       	callq  4006d0 <fprintf@plt>
  400d57:	41 83 c4 ff          	add    $0xffffffff,%r12d
  400d5b:	41 83 c5 01          	add    $0x1,%r13d
  400d5f:	49 83 c6 01          	add    $0x1,%r14
  400d63:	75 ab                	jne    400d10 <main+0x1e0>
  400d65:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
  400d6a:	48 83 c2 01          	add    $0x1,%rdx
  400d6e:	44 8b 24 24          	mov    (%rsp),%r12d
  400d72:	41 81 c4 30 f8 ff ff 	add    $0xfffff830,%r12d
  400d79:	44 8b 6c 24 04       	mov    0x4(%rsp),%r13d
  400d7e:	41 81 c5 d0 07 00 00 	add    $0x7d0,%r13d
  400d85:	48 81 c5 f0 23 00 00 	add    $0x23f0,%rbp
  400d8c:	48 81 fa d0 07 00 00 	cmp    $0x7d0,%rdx
  400d93:	0f 85 57 ff ff ff    	jne    400cf0 <main+0x1c0>
  400d99:	48 8b 3d e0 12 20 00 	mov    0x2012e0(%rip),%rdi        # 602080 <stderr@@GLIBC_2.2.5>
  400da0:	be 40 0f 40 00       	mov    $0x400f40,%esi
  400da5:	ba 3a 0f 40 00       	mov    $0x400f3a,%edx
  400daa:	31 c0                	xor    %eax,%eax
  400dac:	e8 1f f9 ff ff       	callq  4006d0 <fprintf@plt>
  400db1:	48 8b 0d c8 12 20 00 	mov    0x2012c8(%rip),%rcx        # 602080 <stderr@@GLIBC_2.2.5>
  400db8:	bf 51 0f 40 00       	mov    $0x400f51,%edi
  400dbd:	be 16 00 00 00       	mov    $0x16,%esi
  400dc2:	ba 01 00 00 00       	mov    $0x1,%edx
  400dc7:	e8 24 f9 ff ff       	callq  4006f0 <fwrite@plt>
  400dcc:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
  400dd1:	e9 a2 fe ff ff       	jmpq   400c78 <main+0x148>
  400dd6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  400ddd:	00 00 00 

0000000000400de0 <__libc_csu_init>:
  400de0:	41 57                	push   %r15
  400de2:	41 56                	push   %r14
  400de4:	49 89 d7             	mov    %rdx,%r15
  400de7:	41 55                	push   %r13
  400de9:	41 54                	push   %r12
  400deb:	4c 8d 25 1e 10 20 00 	lea    0x20101e(%rip),%r12        # 601e10 <__frame_dummy_init_array_entry>
  400df2:	55                   	push   %rbp
  400df3:	48 8d 2d 1e 10 20 00 	lea    0x20101e(%rip),%rbp        # 601e18 <__init_array_end>
  400dfa:	53                   	push   %rbx
  400dfb:	41 89 fd             	mov    %edi,%r13d
  400dfe:	49 89 f6             	mov    %rsi,%r14
  400e01:	4c 29 e5             	sub    %r12,%rbp
  400e04:	48 83 ec 08          	sub    $0x8,%rsp
  400e08:	48 c1 fd 03          	sar    $0x3,%rbp
  400e0c:	e8 1f f8 ff ff       	callq  400630 <_init>
  400e11:	48 85 ed             	test   %rbp,%rbp
  400e14:	74 20                	je     400e36 <__libc_csu_init+0x56>
  400e16:	31 db                	xor    %ebx,%ebx
  400e18:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  400e1f:	00 
  400e20:	4c 89 fa             	mov    %r15,%rdx
  400e23:	4c 89 f6             	mov    %r14,%rsi
  400e26:	44 89 ef             	mov    %r13d,%edi
  400e29:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
  400e2d:	48 83 c3 01          	add    $0x1,%rbx
  400e31:	48 39 dd             	cmp    %rbx,%rbp
  400e34:	75 ea                	jne    400e20 <__libc_csu_init+0x40>
  400e36:	48 83 c4 08          	add    $0x8,%rsp
  400e3a:	5b                   	pop    %rbx
  400e3b:	5d                   	pop    %rbp
  400e3c:	41 5c                	pop    %r12
  400e3e:	41 5d                	pop    %r13
  400e40:	41 5e                	pop    %r14
  400e42:	41 5f                	pop    %r15
  400e44:	c3                   	retq   
  400e45:	90                   	nop
  400e46:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  400e4d:	00 00 00 

0000000000400e50 <__libc_csu_fini>:
  400e50:	f3 c3                	repz retq 

Disassembly of section .fini:

0000000000400e54 <_fini>:
  400e54:	48 83 ec 08          	sub    $0x8,%rsp
  400e58:	48 83 c4 08          	add    $0x8,%rsp
  400e5c:	c3                   	retq   
