	.file	"get_line.c"
	.text
	.globl	bring_line
	.type	bring_line, @function
bring_line:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	%rcx, -32(%rbp)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L2
	cmpq	$1024, -32(%rbp)
	jbe	.L3
	movq	-16(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, (%rax)
	jmp	.L4
.L3:
	movq	-16(%rbp), %rax
	movq	$1024, (%rax)
.L4:
	movq	-8(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, (%rax)
	jmp	.L9
.L2:
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	cmpq	%rax, -32(%rbp)
	jbe	.L6
	cmpq	$1024, -32(%rbp)
	jbe	.L7
	movq	-16(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, (%rax)
	jmp	.L8
.L7:
	movq	-16(%rbp), %rax
	movq	$1024, (%rax)
.L8:
	movq	-8(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, (%rax)
	jmp	.L9
.L6:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_strcpy@PLT
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L9:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	bring_line, .-bring_line
	.globl	get_line
	.type	get_line, @function
get_line:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	%rdx, -56(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movb	$122, -29(%rbp)
	movq	input.0(%rip), %rax
	testq	%rax, %rax
	jne	.L11
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	fflush@PLT
	movq	$0, input.0(%rip)
	movl	$1024, %edi
	call	malloc@PLT
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L15
	jmp	.L25
.L11:
	movq	$-1, %rax
	jmp	.L23
.L25:
	movq	$-1, %rax
	jmp	.L23
.L21:
	leaq	-29(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rsi
	movl	$0, %edi
	call	read@PLT
	movl	%eax, -28(%rbp)
	cmpl	$-1, -28(%rbp)
	je	.L16
	cmpl	$0, -28(%rbp)
	jne	.L17
	movq	input.0(%rip), %rax
	testq	%rax, %rax
	jne	.L17
.L16:
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	$-1, %rax
	jmp	.L23
.L17:
	cmpl	$0, -28(%rbp)
	jne	.L18
	movq	input.0(%rip), %rax
	testq	%rax, %rax
	je	.L18
	movq	input.0(%rip), %rax
	addq	$1, %rax
	movq	%rax, input.0(%rip)
	jmp	.L19
.L18:
	movq	input.0(%rip), %rax
	cmpq	$1023, %rax
	jle	.L20
	movq	input.0(%rip), %rax
	leal	1(%rax), %edx
	movq	input.0(%rip), %rax
	movl	%eax, %ecx
	movq	-24(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	_realloc@PLT
	movq	%rax, -24(%rbp)
.L20:
	movq	input.0(%rip), %rax
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rax, %rdx
	movzbl	-29(%rbp), %eax
	movb	%al, (%rdx)
	movq	input.0(%rip), %rax
	addq	$1, %rax
	movq	%rax, input.0(%rip)
.L15:
	movzbl	-29(%rbp), %eax
	cmpb	$10, %al
	jne	.L21
.L19:
	movq	input.0(%rip), %rax
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movb	$0, (%rax)
	movq	input.0(%rip), %rax
	movq	%rax, %rcx
	movq	-24(%rbp), %rdx
	movq	-48(%rbp), %rsi
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	bring_line
	movq	input.0(%rip), %rax
	movq	%rax, -16(%rbp)
	cmpl	$0, -28(%rbp)
	je	.L22
	movq	$0, input.0(%rip)
.L22:
	movq	-16(%rbp), %rax
.L23:
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L24
	call	__stack_chk_fail@PLT
.L24:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	get_line, .-get_line
	.local	input.0
	.comm	input.0,8,8
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
