	.file	"ProjectSlide.c"
	.text
	.section	.rodata
	.align 32
	.type	Alpha, @object
	.size	Alpha, 96
Alpha:
	.quad	2949120
	.quad	1740963
	.quad	919876
	.quad	466945
	.quad	234378
	.quad	117303
	.quad	58666
	.quad	29334
	.quad	14667
	.quad	7333
	.quad	3666
	.quad	1833
.LC0:
	.string	"X = % 6.4f, Y = % 6.4f\n"
	.align 8
.LC2:
	.string	"cos(28.027) = % 6.4f, sin() = % 6.4f\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	$39796, -8(%rbp)
	movq	$0, -16(%rbp)
	movq	$1836777, -24(%rbp)
	movl	$0, -28(%rbp)
	jmp	.L2
.L5:
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC0, %edi
	movl	$0, %eax
	call	printf
	cmpq	$0, -24(%rbp)
	jle	.L3
	movl	-28(%rbp), %eax
	movq	-16(%rbp), %rdx
	movl	%eax, %ecx
	sarq	%cl, %rdx
	movq	-8(%rbp), %rax
	subq	%rdx, %rax
	movq	%rax, -40(%rbp)
	movl	-28(%rbp), %eax
	movq	-8(%rbp), %rdx
	movl	%eax, %ecx
	sarq	%cl, %rdx
	movq	%rdx, %rax
	addq	%rax, -16(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, -8(%rbp)
	movl	-28(%rbp), %eax
	movq	Alpha(,%rax,8), %rax
	subq	%rax, -24(%rbp)
	jmp	.L4
.L3:
	movl	-28(%rbp), %eax
	movq	-16(%rbp), %rdx
	movl	%eax, %ecx
	sarq	%cl, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -40(%rbp)
	movl	-28(%rbp), %eax
	movq	-8(%rbp), %rdx
	movl	%eax, %ecx
	sarq	%cl, %rdx
	movq	%rdx, %rax
	subq	%rax, -16(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, -8(%rbp)
	movl	-28(%rbp), %eax
	movq	Alpha(,%rax,8), %rax
	addq	%rax, -24(%rbp)
.L4:
	addl	$1, -28(%rbp)
.L2:
	cmpl	$11, -28(%rbp)
	jbe	.L5
	cvtsi2sdq	-16(%rbp), %xmm0
	movsd	.LC1(%rip), %xmm1
	movapd	%xmm0, %xmm2
	divsd	%xmm1, %xmm2
	cvtsi2sdq	-8(%rbp), %xmm0
	movsd	.LC1(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movapd	%xmm2, %xmm1
	movl	$.LC2, %edi
	movl	$2, %eax
	call	printf
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC1:
	.long	0
	.long	1089470464
	.ident	"GCC: (GNU) 8.1.1 20180712 (Red Hat 8.1.1-5)"
	.section	.note.GNU-stack,"",@progbits
