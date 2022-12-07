	.file	"s443.c"
	.text
.Ltext0:
	.comm	a,128000,16
	.comm	b,128000,16
	.comm	c,128000,16
	.comm	d,128000,16
	.p2align 4,,15
	.globl	s443
	.type	s443, @function
s443:
.LFB0:
	.file 1 "/home/sbansal/superopt-project/superopt-tests/BLR_demo/s443.c"
	.loc 1 4 2 view -0
	.cfi_startproc
	.loc 1 9 4 view .LVU1
.LBB2:
	.loc 1 9 9 view .LVU2
.LVL0:
	.loc 1 9 20 view .LVU3
.LBE2:
	.loc 1 4 2 is_stmt 0 view .LVU4
	xorl	%eax, %eax
	pxor	%xmm3, %xmm3
.LVL1:
	.p2align 4,,10
	.p2align 3
.L2:
.LBB3:
	.loc 1 10 5 is_stmt 1 view .LVU5
	.loc 1 11 6 view .LVU6
.LDL1:
	.loc 1 16 5 view .LVU7
	.loc 1 17 5 view .LVU8
	.loc 1 13 6 view .LVU9
.LDL2:
	.loc 1 19 5 view .LVU10
.LDL3:
	.loc 1 19 18 is_stmt 0 view .LVU11
	movdqa	b(%eax), %xmm1
	movdqa	d(%eax), %xmm0
	addl	$16, %eax
	.loc 1 16 18 view .LVU12
	movdqa	b-16(%eax), %xmm2
	pmulld	c-16(%eax), %xmm2
	.loc 1 16 10 view .LVU13
	paddd	a-16(%eax), %xmm2
	.loc 1 19 18 view .LVU14
	pmulld	%xmm1, %xmm1
	pcmpgtd	%xmm3, %xmm0
	.loc 1 19 10 view .LVU15
	paddd	a-16(%eax), %xmm1
	pblendvb	%xmm0, %xmm1, %xmm2
	movaps	%xmm2, a-16(%eax)
	.loc 1 21 5 is_stmt 1 view .LVU16
	.loc 1 9 29 view .LVU17
	.loc 1 9 20 view .LVU18
	cmpl	$128000, %eax
	jne	.L2
.LBE3:
	.loc 1 23 3 view .LVU19
	.loc 1 24 2 is_stmt 0 view .LVU20
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE0:
	.size	s443, .-s443
.Letext0:
	.file 2 "/usr/lib/gcc/x86_64-linux-gnu/8/include/stddef.h"
	.file 3 "/usr/include/bits/types.h"
	.file 4 "/usr/include/bits/types/struct_FILE.h"
	.file 5 "/usr/include/bits/types/FILE.h"
	.file 6 "/usr/include/stdio.h"
	.file 7 "/usr/include/time.h"
	.file 8 "/usr/include/malloc.h"
	.file 9 "/home/sbansal/superopt-project/superopt-tests/BLR_demo/globals2.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x4a1
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF62
	.byte	0xc
	.long	.LASF63
	.long	.LASF64
	.long	.Ltext0
	.long	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.long	.LASF8
	.byte	0x2
	.byte	0xd8
	.byte	0x17
	.long	0x31
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF0
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.long	.LASF1
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF2
	.uleb128 0x5
	.byte	0x4
	.long	0x53
	.uleb128 0x6
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.long	.LASF3
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.long	.LASF4
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF5
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF6
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.long	.LASF7
	.uleb128 0x2
	.long	.LASF9
	.byte	0x3
	.byte	0x2f
	.byte	0x2c
	.long	0x46
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF10
	.uleb128 0x2
	.long	.LASF11
	.byte	0x3
	.byte	0x98
	.byte	0x19
	.long	0x38
	.uleb128 0x2
	.long	.LASF12
	.byte	0x3
	.byte	0x99
	.byte	0x1b
	.long	0x77
	.uleb128 0x7
	.byte	0x4
	.uleb128 0x5
	.byte	0x4
	.long	0xaa
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF13
	.uleb128 0x3
	.byte	0xc
	.byte	0x4
	.long	.LASF14
	.uleb128 0x8
	.long	.LASF65
	.byte	0x94
	.byte	0x4
	.byte	0x31
	.byte	0x8
	.long	0x23f
	.uleb128 0x9
	.long	.LASF15
	.byte	0x4
	.byte	0x33
	.byte	0x7
	.long	0x3f
	.byte	0
	.uleb128 0x9
	.long	.LASF16
	.byte	0x4
	.byte	0x36
	.byte	0x9
	.long	0xa4
	.byte	0x4
	.uleb128 0x9
	.long	.LASF17
	.byte	0x4
	.byte	0x37
	.byte	0x9
	.long	0xa4
	.byte	0x8
	.uleb128 0x9
	.long	.LASF18
	.byte	0x4
	.byte	0x38
	.byte	0x9
	.long	0xa4
	.byte	0xc
	.uleb128 0x9
	.long	.LASF19
	.byte	0x4
	.byte	0x39
	.byte	0x9
	.long	0xa4
	.byte	0x10
	.uleb128 0x9
	.long	.LASF20
	.byte	0x4
	.byte	0x3a
	.byte	0x9
	.long	0xa4
	.byte	0x14
	.uleb128 0x9
	.long	.LASF21
	.byte	0x4
	.byte	0x3b
	.byte	0x9
	.long	0xa4
	.byte	0x18
	.uleb128 0x9
	.long	.LASF22
	.byte	0x4
	.byte	0x3c
	.byte	0x9
	.long	0xa4
	.byte	0x1c
	.uleb128 0x9
	.long	.LASF23
	.byte	0x4
	.byte	0x3d
	.byte	0x9
	.long	0xa4
	.byte	0x20
	.uleb128 0x9
	.long	.LASF24
	.byte	0x4
	.byte	0x40
	.byte	0x9
	.long	0xa4
	.byte	0x24
	.uleb128 0x9
	.long	.LASF25
	.byte	0x4
	.byte	0x41
	.byte	0x9
	.long	0xa4
	.byte	0x28
	.uleb128 0x9
	.long	.LASF26
	.byte	0x4
	.byte	0x42
	.byte	0x9
	.long	0xa4
	.byte	0x2c
	.uleb128 0x9
	.long	.LASF27
	.byte	0x4
	.byte	0x44
	.byte	0x16
	.long	0x258
	.byte	0x30
	.uleb128 0x9
	.long	.LASF28
	.byte	0x4
	.byte	0x46
	.byte	0x14
	.long	0x25e
	.byte	0x34
	.uleb128 0x9
	.long	.LASF29
	.byte	0x4
	.byte	0x48
	.byte	0x7
	.long	0x3f
	.byte	0x38
	.uleb128 0x9
	.long	.LASF30
	.byte	0x4
	.byte	0x49
	.byte	0x7
	.long	0x3f
	.byte	0x3c
	.uleb128 0x9
	.long	.LASF31
	.byte	0x4
	.byte	0x4a
	.byte	0xb
	.long	0x8a
	.byte	0x40
	.uleb128 0x9
	.long	.LASF32
	.byte	0x4
	.byte	0x4d
	.byte	0x12
	.long	0x5b
	.byte	0x44
	.uleb128 0x9
	.long	.LASF33
	.byte	0x4
	.byte	0x4e
	.byte	0xf
	.long	0x69
	.byte	0x46
	.uleb128 0x9
	.long	.LASF34
	.byte	0x4
	.byte	0x4f
	.byte	0x8
	.long	0x264
	.byte	0x47
	.uleb128 0x9
	.long	.LASF35
	.byte	0x4
	.byte	0x51
	.byte	0xf
	.long	0x274
	.byte	0x48
	.uleb128 0x9
	.long	.LASF36
	.byte	0x4
	.byte	0x59
	.byte	0xd
	.long	0x96
	.byte	0x4c
	.uleb128 0x9
	.long	.LASF37
	.byte	0x4
	.byte	0x5b
	.byte	0x17
	.long	0x27f
	.byte	0x54
	.uleb128 0x9
	.long	.LASF38
	.byte	0x4
	.byte	0x5c
	.byte	0x19
	.long	0x28a
	.byte	0x58
	.uleb128 0x9
	.long	.LASF39
	.byte	0x4
	.byte	0x5d
	.byte	0x14
	.long	0x25e
	.byte	0x5c
	.uleb128 0x9
	.long	.LASF40
	.byte	0x4
	.byte	0x5e
	.byte	0x9
	.long	0xa2
	.byte	0x60
	.uleb128 0x9
	.long	.LASF41
	.byte	0x4
	.byte	0x5f
	.byte	0xa
	.long	0x25
	.byte	0x64
	.uleb128 0x9
	.long	.LASF42
	.byte	0x4
	.byte	0x60
	.byte	0x7
	.long	0x3f
	.byte	0x68
	.uleb128 0x9
	.long	.LASF43
	.byte	0x4
	.byte	0x62
	.byte	0x8
	.long	0x290
	.byte	0x6c
	.byte	0
	.uleb128 0x2
	.long	.LASF44
	.byte	0x5
	.byte	0x7
	.byte	0x19
	.long	0xb8
	.uleb128 0xa
	.long	.LASF66
	.byte	0x4
	.byte	0x2b
	.byte	0xe
	.uleb128 0xb
	.long	.LASF45
	.uleb128 0x5
	.byte	0x4
	.long	0x253
	.uleb128 0x5
	.byte	0x4
	.long	0xb8
	.uleb128 0xc
	.long	0xaa
	.long	0x274
	.uleb128 0xd
	.long	0x31
	.byte	0
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x24b
	.uleb128 0xb
	.long	.LASF46
	.uleb128 0x5
	.byte	0x4
	.long	0x27a
	.uleb128 0xb
	.long	.LASF47
	.uleb128 0x5
	.byte	0x4
	.long	0x285
	.uleb128 0xc
	.long	0xaa
	.long	0x2a0
	.uleb128 0xd
	.long	0x31
	.byte	0x27
	.byte	0
	.uleb128 0xe
	.long	.LASF48
	.byte	0x6
	.byte	0x89
	.byte	0xe
	.long	0x2ac
	.uleb128 0x5
	.byte	0x4
	.long	0x23f
	.uleb128 0xe
	.long	.LASF49
	.byte	0x6
	.byte	0x8a
	.byte	0xe
	.long	0x2ac
	.uleb128 0xe
	.long	.LASF50
	.byte	0x6
	.byte	0x8b
	.byte	0xe
	.long	0x2ac
	.uleb128 0xc
	.long	0xa4
	.long	0x2da
	.uleb128 0xd
	.long	0x31
	.byte	0x1
	.byte	0
	.uleb128 0xe
	.long	.LASF51
	.byte	0x7
	.byte	0x9f
	.byte	0xe
	.long	0x2ca
	.uleb128 0xe
	.long	.LASF52
	.byte	0x7
	.byte	0xa0
	.byte	0xc
	.long	0x3f
	.uleb128 0xe
	.long	.LASF53
	.byte	0x7
	.byte	0xa1
	.byte	0x11
	.long	0x38
	.uleb128 0x2
	.long	.LASF54
	.byte	0x2
	.byte	0x95
	.byte	0x1a
	.long	0x3f
	.uleb128 0x3
	.byte	0x10
	.byte	0x4
	.long	.LASF55
	.uleb128 0xf
	.long	0xa2
	.long	0x320
	.uleb128 0x10
	.long	0x2fe
	.byte	0
	.uleb128 0xe
	.long	.LASF56
	.byte	0x8
	.byte	0x4e
	.byte	0x10
	.long	0x32c
	.uleb128 0x5
	.byte	0x4
	.long	0x311
	.uleb128 0x11
	.long	0x342
	.uleb128 0x10
	.long	0xa2
	.uleb128 0x10
	.long	0x4d
	.byte	0
	.uleb128 0xe
	.long	.LASF57
	.byte	0x8
	.byte	0x91
	.byte	0x26
	.long	0x354
	.uleb128 0x5
	.byte	0x4
	.long	0x332
	.uleb128 0x12
	.long	0x34e
	.uleb128 0xf
	.long	0xa2
	.long	0x36d
	.uleb128 0x10
	.long	0x25
	.uleb128 0x10
	.long	0x4d
	.byte	0
	.uleb128 0xe
	.long	.LASF58
	.byte	0x8
	.byte	0x94
	.byte	0x27
	.long	0x37f
	.uleb128 0x5
	.byte	0x4
	.long	0x359
	.uleb128 0x12
	.long	0x379
	.uleb128 0xf
	.long	0xa2
	.long	0x39d
	.uleb128 0x10
	.long	0xa2
	.uleb128 0x10
	.long	0x25
	.uleb128 0x10
	.long	0x4d
	.byte	0
	.uleb128 0xe
	.long	.LASF59
	.byte	0x8
	.byte	0x97
	.byte	0x27
	.long	0x3af
	.uleb128 0x5
	.byte	0x4
	.long	0x384
	.uleb128 0x12
	.long	0x3a9
	.uleb128 0xf
	.long	0xa2
	.long	0x3cd
	.uleb128 0x10
	.long	0x25
	.uleb128 0x10
	.long	0x25
	.uleb128 0x10
	.long	0x4d
	.byte	0
	.uleb128 0xe
	.long	.LASF60
	.byte	0x8
	.byte	0x9b
	.byte	0x27
	.long	0x3df
	.uleb128 0x5
	.byte	0x4
	.long	0x3b4
	.uleb128 0x12
	.long	0x3d9
	.uleb128 0x13
	.uleb128 0xe
	.long	.LASF61
	.byte	0x8
	.byte	0x9f
	.byte	0x26
	.long	0x3f7
	.uleb128 0x5
	.byte	0x4
	.long	0x3e4
	.uleb128 0x12
	.long	0x3f1
	.uleb128 0xc
	.long	0x3f
	.long	0x40d
	.uleb128 0x14
	.long	0x31
	.value	0x7cff
	.byte	0
	.uleb128 0x15
	.string	"a"
	.byte	0x9
	.byte	0x1d
	.byte	0x23
	.long	0x3fc
	.byte	0x10
	.uleb128 0x5
	.byte	0x3
	.long	a
	.uleb128 0x15
	.string	"b"
	.byte	0x9
	.byte	0x1d
	.byte	0x2b
	.long	0x3fc
	.byte	0x10
	.uleb128 0x5
	.byte	0x3
	.long	b
	.uleb128 0x15
	.string	"c"
	.byte	0x9
	.byte	0x1d
	.byte	0x32
	.long	0x3fc
	.byte	0x10
	.uleb128 0x5
	.byte	0x3
	.long	c
	.uleb128 0x15
	.string	"d"
	.byte	0x9
	.byte	0x1d
	.byte	0x39
	.long	0x3fc
	.byte	0x10
	.uleb128 0x5
	.byte	0x3
	.long	d
	.uleb128 0x16
	.long	.LASF67
	.byte	0x1
	.byte	0x3
	.byte	0x6
	.long	0x3f
	.long	.LFB0
	.long	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x17
	.string	"L20"
	.byte	0x1
	.byte	0xf
	.byte	0x2
	.long	.LDL1
	.uleb128 0x17
	.string	"L30"
	.byte	0x1
	.byte	0x12
	.byte	0x2
	.long	.LDL2
	.uleb128 0x17
	.string	"L50"
	.byte	0x1
	.byte	0x14
	.byte	0x2
	.long	.LDL3
	.uleb128 0x18
	.long	.Ldebug_ranges0+0
	.uleb128 0x19
	.string	"i"
	.byte	0x1
	.byte	0x9
	.byte	0xd
	.long	0x3f
	.long	.LLST0
	.long	.LVUS0
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x26
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x15
	.byte	0
	.uleb128 0x27
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x88
	.uleb128 0xb
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0xa
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.uleb128 0x2137
	.uleb128 0x17
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LVUS0:
	.uleb128 .LVU3
	.uleb128 .LVU5
.LLST0:
	.long	.LVL0-.Ltext0
	.long	.LVL1-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.long	0
	.long	0
	.section	.debug_aranges,"",@progbits
	.long	0x1c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x4
	.byte	0
	.value	0
	.value	0
	.long	.Ltext0
	.long	.Letext0-.Ltext0
	.long	0
	.long	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.long	.LBB2-.Ltext0
	.long	.LBE2-.Ltext0
	.long	.LBB3-.Ltext0
	.long	.LBE3-.Ltext0
	.long	0
	.long	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF11:
	.string	"__off_t"
.LASF16:
	.string	"_IO_read_ptr"
.LASF28:
	.string	"_chain"
.LASF8:
	.string	"size_t"
.LASF34:
	.string	"_shortbuf"
.LASF22:
	.string	"_IO_buf_base"
.LASF10:
	.string	"long long unsigned int"
.LASF9:
	.string	"__int64_t"
.LASF37:
	.string	"_codecvt"
.LASF53:
	.string	"__timezone"
.LASF2:
	.string	"long long int"
.LASF6:
	.string	"signed char"
.LASF55:
	.string	"_Float128"
.LASF29:
	.string	"_fileno"
.LASF17:
	.string	"_IO_read_end"
.LASF59:
	.string	"__realloc_hook"
.LASF1:
	.string	"long int"
.LASF15:
	.string	"_flags"
.LASF23:
	.string	"_IO_buf_end"
.LASF32:
	.string	"_cur_column"
.LASF46:
	.string	"_IO_codecvt"
.LASF31:
	.string	"_old_offset"
.LASF36:
	.string	"_offset"
.LASF56:
	.string	"__morecore"
.LASF45:
	.string	"_IO_marker"
.LASF48:
	.string	"stdin"
.LASF57:
	.string	"__free_hook"
.LASF0:
	.string	"unsigned int"
.LASF40:
	.string	"_freeres_buf"
.LASF62:
	.ascii	"GNU C11 8.4.0 -m32 -msse4.2 -mtune=generic -march=i686 -g -g"
	.ascii	" -O3 -std=c11 -fdata-sections -fno-pie -fno-strict-overflow "
	.ascii	"-fno-unit-at-a-time -fno-strict-aliasing -fno-optimize-sibli"
	.ascii	"ng-calls -fkeep-inline-functions -fwrapv -fno-reorder-blocks"
	.ascii	" -fno-jump-tables -fno-zero-initialized-in-bss -fno-caller-s"
	.ascii	"aves -fno-inline -fno-inline-functions -fno-inline-small-fun"
	.ascii	"ctions -fno-indirect-inlining -fno-partial-inlining -fno-inl"
	.ascii	"ine-functions-called-once -fno-early-inlining -fno-whole-pro"
	.ascii	"gram -fno-ipa-sra -fno-ipa-cp -fcf-protection=none -fno-stac"
	.ascii	"k-protector -fno-stack-clash-protection -fno-builtin-malloc "
	.ascii	"-fno-builtin-abort -fno-builtin-exit -fno-builtin-fscanf -fn"
	.ascii	"o-builtin-abs -fno-builtin-acos -fno-builtin-asin -fno-built"
	.ascii	"in-atan2 -fno-builtin-atan -fno-builtin-calloc -fno-builtin-"
	.ascii	"ceil -fno-builtin-cosh -fno-builtin-cos -fno-builtin-exit -f"
	.ascii	"no-builtin-exp -fno-builtin-fabs -fno-builtin-floor -fno-bui"
	.ascii	"ltin-fmod -fno-builtin-fprintf -fno-builtin-fputs -fno-built"
	.ascii	"in-frexp -fno-builtin-fscanf -fno-builtin-isalnum -fno-built"
	.ascii	"in-isalpha -fno-builtin-iscntrl -fno-builtin-isdigit -fno-bu"
	.ascii	"iltin-isgraph -fno-builtin-islower -fno-builtin-isprint -fno"
	.ascii	"-builtin-ispunct -fno-builtin-isspace -fno-builtin-isupper -"
	.ascii	"fno-builtin-isxdigit -fno-builtin-tolower -fno-builtin-toupp"
	.ascii	"er -fno-builtin-labs -fno-builtin-ldexp -fno-builtin-log10 -"
	.ascii	"fno-builtin-log -fno-builtin-malloc -fno-builtin-memchr -fno"
	.ascii	"-builtin-memcmp -fno-builtin-memcpy -fno-builtin-memset -fno"
	.ascii	"-builtin-modf -fno-builtin-pow -fno-builtin-printf -fno-buil"
	.ascii	"tin-putchar -fno-builtin-puts -fno-builtin-scanf -fno-builti"
	.ascii	"n-sinh -fno-builtin-sin -fno-builtin-snprintf -fno-builtin-s"
	.ascii	"printf -fno-builtin-sqrt -fno-builtin-sscanf -fno-builtin-st"
	.ascii	"rcat -fno-builtin-strchr -fno-builtin-strcmp -fno-builtin-st"
	.ascii	"rcpy -fno-builtin-strcspn -fno-builtin-strlen -fno-builtin-s"
	.ascii	"trncat -fno-builtin-strncmp -fno-builtin-strncpy -fno-builti"
	.ascii	"n-strpbrk -fno-builtin-strrchr -fno-builtin-strspn -fno-buil"
	.ascii	"tin-strstr -fno-builtin-tanh -fno-builtin-tan -fno-builtin-v"
	.ascii	"fprintf -fno-builtin"
	.string	"-vsprintf -fno-builtin -fasynchronous-unwind-tables"
.LASF5:
	.string	"long unsigned int"
.LASF20:
	.string	"_IO_write_ptr"
.LASF4:
	.string	"short unsigned int"
.LASF24:
	.string	"_IO_save_base"
.LASF35:
	.string	"_lock"
.LASF30:
	.string	"_flags2"
.LASF42:
	.string	"_mode"
.LASF49:
	.string	"stdout"
.LASF54:
	.string	"ptrdiff_t"
.LASF58:
	.string	"__malloc_hook"
.LASF14:
	.string	"long double"
.LASF21:
	.string	"_IO_write_end"
.LASF64:
	.string	"/home/sbansal/superopt-project/superopt-tests/build/BLR_demo"
.LASF66:
	.string	"_IO_lock_t"
.LASF65:
	.string	"_IO_FILE"
.LASF52:
	.string	"__daylight"
.LASF27:
	.string	"_markers"
.LASF63:
	.string	"/home/sbansal/superopt-project/superopt-tests/BLR_demo/s443.c"
.LASF3:
	.string	"unsigned char"
.LASF67:
	.string	"s443"
.LASF7:
	.string	"short int"
.LASF47:
	.string	"_IO_wide_data"
.LASF60:
	.string	"__memalign_hook"
.LASF33:
	.string	"_vtable_offset"
.LASF44:
	.string	"FILE"
.LASF13:
	.string	"char"
.LASF61:
	.string	"__after_morecore_hook"
.LASF12:
	.string	"__off64_t"
.LASF18:
	.string	"_IO_read_base"
.LASF26:
	.string	"_IO_save_end"
.LASF41:
	.string	"__pad5"
.LASF43:
	.string	"_unused2"
.LASF50:
	.string	"stderr"
.LASF25:
	.string	"_IO_backup_base"
.LASF39:
	.string	"_freeres_list"
.LASF38:
	.string	"_wide_data"
.LASF51:
	.string	"__tzname"
.LASF19:
	.string	"_IO_write_base"
	.ident	"GCC: (Ubuntu 8.4.0-3ubuntu2) 8.4.0"
	.section	.note.GNU-stack,"",@progbits
