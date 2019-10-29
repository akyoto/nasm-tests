	.text
	.intel_syntax noprefix
	.file	"printInt-customc.c"
	.globl	itoa                    # -- Begin function itoa
	.p2align	4, 0x90
	.type	itoa,@function
itoa:                                   # @itoa
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	mov	qword ptr [rbp - 8], rdi
	mov	qword ptr [rbp - 16], rsi
	cmp	qword ptr [rbp - 8], 0
	jge	.LBB0_2
# %bb.1:
	mov	rax, qword ptr [rbp - 16]
	mov	rcx, rax
	add	rcx, 1
	mov	qword ptr [rbp - 16], rcx
	mov	byte ptr [rax], 45
	imul	rax, qword ptr [rbp - 8], -1
	mov	qword ptr [rbp - 8], rax
.LBB0_2:
	mov	rax, qword ptr [rbp - 8]
	mov	qword ptr [rbp - 24], rax
.LBB0_3:                                # =>This Inner Loop Header: Depth=1
	mov	rax, qword ptr [rbp - 16]
	add	rax, 1
	mov	qword ptr [rbp - 16], rax
	mov	rax, qword ptr [rbp - 24]
	cqo
	mov	ecx, 10
	idiv	rcx
	mov	qword ptr [rbp - 24], rax
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=1
	cmp	qword ptr [rbp - 24], 0
	jne	.LBB0_3
# %bb.5:
	mov	rax, qword ptr [rbp - 16]
	mov	byte ptr [rax], 0
.LBB0_6:                                # =>This Inner Loop Header: Depth=1
	mov	rax, qword ptr [rbp - 8]
	cqo
	mov	ecx, 10
	idiv	rcx
	add	rdx, 48
                                        # kill: def $dl killed $dl killed $rdx
	mov	rsi, qword ptr [rbp - 16]
	mov	rdi, rsi
	add	rdi, -1
	mov	qword ptr [rbp - 16], rdi
	mov	byte ptr [rsi - 1], dl
	mov	rsi, qword ptr [rbp - 8]
	mov	rax, rsi
	cqo
	idiv	rcx
	mov	qword ptr [rbp - 8], rax
# %bb.7:                                #   in Loop: Header=BB0_6 Depth=1
	cmp	qword ptr [rbp - 8], 0
	jne	.LBB0_6
# %bb.8:
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.Lfunc_end0:
	.size	itoa, .Lfunc_end0-itoa
	.cfi_endproc
                                        # -- End function
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 64
	mov	rax, qword ptr fs:[40]
	mov	qword ptr [rbp - 8], rax
	mov	dword ptr [rbp - 36], 0
	movabs	rax, 123456789123456789
	mov	qword ptr [rbp - 48], rax
	mov	dword ptr [rbp - 52], 0
.LBB1_1:                                # =>This Inner Loop Header: Depth=1
	cmp	dword ptr [rbp - 52], 10000000
	jge	.LBB1_4
# %bb.2:                                #   in Loop: Header=BB1_1 Depth=1
	lea	rsi, [rbp - 32]
	mov	rdi, qword ptr [rbp - 48]
	call	itoa
# %bb.3:                                #   in Loop: Header=BB1_1 Depth=1
	mov	eax, dword ptr [rbp - 52]
	add	eax, 1
	mov	dword ptr [rbp - 52], eax
	jmp	.LBB1_1
.LBB1_4:
	lea	rdi, [rip + .L.str]
	xor	eax, eax
                                        # kill: def $al killed $al killed $eax
	lea	rsi, [rbp - 32]
	call	printf@PLT
	mov	rcx, qword ptr fs:[40]
	mov	rdx, qword ptr [rbp - 8]
	cmp	rcx, rdx
	jne	.LBB1_6
# %bb.5:
	xor	eax, eax
	add	rsp, 64
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.LBB1_6:
	.cfi_def_cfa rbp, 16
	call	__stack_chk_fail@PLT
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc
                                        # -- End function
	.type	iterations,@object      # @iterations
	.section	.rodata,"a",@progbits
	.globl	iterations
	.p2align	2
iterations:
	.long	10000000                # 0x989680
	.size	iterations, 4

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%s"
	.size	.L.str, 3


	.ident	"clang version 9.0.0 (tags/RELEASE_900/final)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym itoa
	.addrsig_sym printf
	.addrsig_sym __stack_chk_fail
