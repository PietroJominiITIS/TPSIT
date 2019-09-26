	.file	"main.c"
	.text
	.globl	CSV_tokenize_line
	.type	CSV_tokenize_line, @function
CSV_tokenize_line:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$72, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movl	%edx, -68(%rbp)
	movq	$0, -32(%rbp)
	movl	-68(%rbp), %eax
	salq	$3, %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -24(%rbp)
	movq	-64(%rbp), %rdx
	movq	-56(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strtok@PLT
	movq	%rax, -40(%rbp)
	jmp	.L2
.L4:
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	addq	$1, %rax
	movq	-24(%rbp), %rdx
	movq	-32(%rbp), %rcx
	salq	$3, %rcx
	leaq	(%rdx,%rcx), %rbx
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, (%rbx)
	movq	-24(%rbp), %rax
	movq	-32(%rbp), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	-40(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy@PLT
	movq	-32(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -32(%rbp)
	movq	-64(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	strtok@PLT
	movq	%rax, -40(%rbp)
.L2:
	movq	-32(%rbp), %rdx
	movl	-68(%rbp), %eax
	cmpq	%rax, %rdx
	jnb	.L3
	cmpq	$0, -40(%rbp)
	jne	.L4
.L3:
	movq	-32(%rbp), %rax
	movq	-24(%rbp), %rdx
	addq	$72, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	CSV_tokenize_line, .-CSV_tokenize_line
	.globl	CSV_get_header
	.type	CSV_get_header, @function
CSV_get_header:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$88, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	%rdi, -104(%rbp)
	movq	%rsi, -112(%rbp)
	movl	%edx, -116(%rbp)
	movl	%ecx, -120(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	movq	%rsp, %rax
	movq	%rax, %rbx
	movq	-104(%rbp), %rax
	movl	$0, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	fseek@PLT
	movq	$0, -80(%rbp)
	movl	-116(%rbp), %eax
	movl	%eax, %edx
	subq	$1, %rdx
	movq	%rdx, -96(%rbp)
	movl	%eax, %edx
	movq	%rdx, %r14
	movl	$0, %r15d
	movl	%eax, %edx
	movq	%rdx, %r12
	movl	$0, %r13d
	movl	%eax, %edx
	movl	$16, %eax
	subq	$1, %rax
	addq	%rdx, %rax
	movl	$16, %esi
	movl	$0, %edx
	divq	%rsi
	imulq	$16, %rax, %rax
	subq	%rax, %rsp
	movq	%rsp, %rax
	addq	$0, %rax
	movq	%rax, -88(%rbp)
	movl	-116(%rbp), %ecx
	movq	-88(%rbp), %rax
	movq	-104(%rbp), %rdx
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	fgets@PLT
	testq	%rax, %rax
	je	.L7
	movq	-88(%rbp), %rax
	movl	-120(%rbp), %edx
	movq	-112(%rbp), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	CSV_tokenize_line
	movq	%rax, -80(%rbp)
	movq	%rdx, -72(%rbp)
.L7:
	movq	-80(%rbp), %rax
	movq	-72(%rbp), %rdx
	movq	%rbx, %rsp
	movq	-56(%rbp), %rbx
	xorq	%fs:40, %rbx
	je	.L9
	call	__stack_chk_fail@PLT
.L9:
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	CSV_get_header, .-CSV_get_header
	.globl	CSV_parse
	.type	CSV_parse, @function
CSV_parse:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$120, %rsp
	.cfi_offset 13, -24
	.cfi_offset 12, -32
	.cfi_offset 3, -40
	movq	%rdi, -104(%rbp)
	movq	%rsi, -112(%rbp)
	movl	%edx, -116(%rbp)
	movq	%rcx, -128(%rbp)
	movl	%r8d, -120(%rbp)
	movl	%r9d, -132(%rbp)
	movq	24(%rbp), %rax
	movq	%rax, -144(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -40(%rbp)
	xorl	%eax, %eax
	movq	%rsp, %rax
	movq	%rax, %rbx
	movq	-112(%rbp), %rax
	movq	%rax, -96(%rbp)
	movl	-116(%rbp), %eax
	imull	-120(%rbp), %eax
	movl	%eax, %edx
	movq	-112(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -88(%rbp)
	movl	16(%rbp), %eax
	movl	%eax, %edx
	subq	$1, %rdx
	movq	%rdx, -80(%rbp)
	movl	%eax, %edx
	movq	%rdx, %r12
	movl	$0, %r13d
	movl	%eax, %edx
	movq	%rdx, %r10
	movl	$0, %r11d
	movl	%eax, %edx
	movl	$16, %eax
	subq	$1, %rax
	addq	%rdx, %rax
	movl	$16, %edi
	movl	$0, %edx
	divq	%rdi
	imulq	$16, %rax, %rax
	subq	%rax, %rsp
	movq	%rsp, %rax
	addq	$0, %rax
	movq	%rax, -72(%rbp)
	jmp	.L11
.L13:
	movq	-72(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	leaq	-1(%rax), %rdx
	movq	-72(%rbp), %rax
	movb	$0, (%rax,%rdx)
	movq	-72(%rbp), %rax
	movl	-132(%rbp), %edx
	movq	-128(%rbp), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	CSV_tokenize_line
	movq	%rax, -64(%rbp)
	movq	%rdx, -56(%rbp)
	movq	-64(%rbp), %rsi
	movq	-56(%rbp), %rdx
	movq	-96(%rbp), %rcx
	movq	-144(%rbp), %rax
	movq	%rcx, %rdi
	call	*%rax
	leaq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	CSV_free_parsed_row
	movl	-116(%rbp), %eax
	addq	%rax, -96(%rbp)
.L11:
	movq	-96(%rbp), %rax
	cmpq	-88(%rbp), %rax
	jnb	.L12
	movl	16(%rbp), %ecx
	movq	-72(%rbp), %rax
	movq	-104(%rbp), %rdx
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	fgets@PLT
	testq	%rax, %rax
	jne	.L13
.L12:
	movq	-96(%rbp), %rax
	subq	-112(%rbp), %rax
	movl	-116(%rbp), %esi
	cqto
	idivq	%rsi
	movq	%rbx, %rsp
	movq	-40(%rbp), %rbx
	xorq	%fs:40, %rbx
	je	.L15
	call	__stack_chk_fail@PLT
.L15:
	leaq	-24(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	CSV_parse, .-CSV_parse
	.globl	CSV_free_parsed_row
	.type	CSV_free_parsed_row, @function
CSV_free_parsed_row:
.LFB9:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L17
.L18:
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movl	-4(%rbp), %edx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
	addl	$1, -4(%rbp)
.L17:
	movl	-4(%rbp), %edx
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	cmpq	%rax, %rdx
	jb	.L18
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	CSV_free_parsed_row, .-CSV_free_parsed_row
	.globl	my_tokens_to_struct
	.type	my_tokens_to_struct, @function
my_tokens_to_struct:
.LFB10:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, %rax
	movq	%rdx, %rcx
	movq	%rcx, %rdx
	movq	%rax, -32(%rbp)
	movq	%rdx, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, %edx
	movq	-8(%rbp), %rax
	movl	%edx, (%rax)
	movq	-24(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	strdup@PLT
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 8(%rax)
	movq	-24(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	strdup@PLT
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 16(%rax)
	movq	-24(%rbp), %rax
	addq	$24, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, %edx
	movq	-8(%rbp), %rax
	movl	%edx, 24(%rax)
	movq	-24(%rbp), %rax
	addq	$32, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	strdup@PLT
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 32(%rax)
	movq	-24(%rbp), %rax
	addq	$40, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	strdup@PLT
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 40(%rax)
	movq	-24(%rbp), %rax
	addq	$48, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atof@PLT
	movq	%xmm0, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 48(%rax)
	movq	-24(%rbp), %rax
	addq	$56, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atof@PLT
	movq	%xmm0, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 56(%rax)
	movq	-24(%rbp), %rax
	addq	$64, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atof@PLT
	movq	%xmm0, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 64(%rax)
	movq	-24(%rbp), %rax
	addq	$72, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atof@PLT
	movq	%xmm0, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 72(%rax)
	movq	-24(%rbp), %rax
	addq	$80, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atof@PLT
	movq	%xmm0, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 80(%rax)
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	my_tokens_to_struct, .-my_tokens_to_struct
	.section	.rodata
.LC0:
	.string	","
.LC1:
	.string	"r"
.LC2:
	.string	"./vgsales.csv"
.LC3:
	.string	"Rank to display? "
.LC4:
	.string	"%d"
.LC5:
	.string	"\t - Rank: %d"
.LC6:
	.string	"\n\t - Name: %s"
.LC7:
	.string	"\n\t - Platform: %s"
.LC8:
	.string	"\n\t - year: %d"
.LC9:
	.string	"\n\t - Genre: %s"
.LC10:
	.string	"\n\t - Publisher: %s"
.LC11:
	.string	"\n\t - NA_Sales: %f"
.LC12:
	.string	"\n\t - Eu_Sales: %f"
.LC13:
	.string	"\n\t - JP_Sales: %f"
.LC14:
	.string	"\n\t - Other_Sales: %f"
.LC15:
	.string	"\n\t - Global_Sales: %f"
	.text
	.globl	main
	.type	main, @function
main:
.LFB11:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$104, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	movq	%rsp, %rax
	movq	%rax, %rbx
	movl	$30000, -128(%rbp)
	movl	$100, -124(%rbp)
	movl	$1024, -120(%rbp)
	leaq	.LC0(%rip), %rax
	movq	%rax, -112(%rbp)
	leaq	.LC1(%rip), %rsi
	leaq	.LC2(%rip), %rdi
	call	fopen@PLT
	movq	%rax, -104(%rbp)
	cmpq	$0, -104(%rbp)
	jne	.L23
	movl	$-1, %eax
	jmp	.L24
.L23:
	movl	-124(%rbp), %ecx
	movl	-120(%rbp), %edx
	movq	-112(%rbp), %rsi
	movq	-104(%rbp), %rax
	movq	%rax, %rdi
	call	CSV_get_header
	movq	%rax, -80(%rbp)
	movq	%rdx, -72(%rbp)
	movl	-128(%rbp), %eax
	subq	$1, %rax
	movq	%rax, -96(%rbp)
	movl	-128(%rbp), %eax
	movl	%eax, %eax
	movq	%rax, %r14
	movl	$0, %r15d
	imulq	$704, %r15, %rdx
	imulq	$0, %r14, %rax
	leaq	(%rdx,%rax), %rcx
	movl	$704, %eax
	mulq	%r14
	addq	%rdx, %rcx
	movq	%rcx, %rdx
	movl	-128(%rbp), %edx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movl	-128(%rbp), %eax
	movl	%eax, %eax
	movq	%rax, %r12
	movl	$0, %r13d
	imulq	$704, %r13, %rdx
	imulq	$0, %r12, %rax
	leaq	(%rdx,%rax), %rcx
	movl	$704, %eax
	mulq	%r12
	addq	%rdx, %rcx
	movq	%rcx, %rdx
	movl	-128(%rbp), %edx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	movl	$16, %eax
	subq	$1, %rax
	addq	%rdx, %rax
	movl	$16, %esi
	movl	$0, %edx
	divq	%rsi
	imulq	$16, %rax, %rax
	subq	%rax, %rsp
	movq	%rsp, %rax
	addq	$7, %rax
	shrq	$3, %rax
	salq	$3, %rax
	movq	%rax, -88(%rbp)
	movq	-88(%rbp), %rsi
	movl	-124(%rbp), %r8d
	movl	-128(%rbp), %edi
	movq	-112(%rbp), %rdx
	movq	-104(%rbp), %rax
	leaq	my_tokens_to_struct(%rip), %rcx
	pushq	%rcx
	movl	-120(%rbp), %ecx
	pushq	%rcx
	movl	%r8d, %r9d
	movl	%edi, %r8d
	movq	%rdx, %rcx
	movl	$88, %edx
	movq	%rax, %rdi
	call	CSV_parse
	addq	$16, %rsp
	movl	%eax, -116(%rbp)
	movq	-104(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-136(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC4(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-136(%rbp), %eax
	subl	$1, %eax
	movl	%eax, -136(%rbp)
	movl	-136(%rbp), %eax
	movq	-88(%rbp), %rcx
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movl	(%rax), %eax
	movl	%eax, %esi
	leaq	.LC5(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-136(%rbp), %eax
	movq	-88(%rbp), %rcx
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC6(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-136(%rbp), %eax
	movq	-88(%rbp), %rcx
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	addq	$16, %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC7(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-136(%rbp), %eax
	movq	-88(%rbp), %rcx
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	addq	$24, %rax
	movl	(%rax), %eax
	movl	%eax, %esi
	leaq	.LC8(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-136(%rbp), %eax
	movq	-88(%rbp), %rcx
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	addq	$32, %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC9(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-136(%rbp), %eax
	movq	-88(%rbp), %rcx
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	addq	$40, %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC10(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-136(%rbp), %eax
	movq	-88(%rbp), %rcx
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	addq	$48, %rax
	movsd	(%rax), %xmm0
	leaq	.LC11(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	movl	-136(%rbp), %eax
	movq	-88(%rbp), %rcx
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	addq	$56, %rax
	movsd	(%rax), %xmm0
	leaq	.LC12(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	movl	-136(%rbp), %eax
	movq	-88(%rbp), %rcx
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	addq	$64, %rax
	movsd	(%rax), %xmm0
	leaq	.LC13(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	movl	-136(%rbp), %eax
	movq	-88(%rbp), %rcx
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	addq	$72, %rax
	movsd	(%rax), %xmm0
	leaq	.LC14(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	movl	-136(%rbp), %eax
	movq	-88(%rbp), %rcx
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	addq	$80, %rax
	movsd	(%rax), %xmm0
	leaq	.LC15(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	movl	$10, %edi
	call	putchar@PLT
	movl	$0, -132(%rbp)
	jmp	.L25
.L26:
	movq	-88(%rbp), %rcx
	movl	-132(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-88(%rbp), %rcx
	movl	-132(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	addq	$40, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-88(%rbp), %rcx
	movl	-132(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	addq	$16, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-88(%rbp), %rcx
	movl	-132(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	addq	$32, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
	addl	$1, -132(%rbp)
.L25:
	movl	-132(%rbp), %eax
	cmpl	%eax, -116(%rbp)
	ja	.L26
	movl	$0, %eax
.L24:
	movq	%rbx, %rsp
	movq	-56(%rbp), %rbx
	xorq	%fs:40, %rbx
	je	.L28
	call	__stack_chk_fail@PLT
.L28:
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 8.3.0-6ubuntu1) 8.3.0"
	.section	.note.GNU-stack,"",@progbits
