	.text
	.intel_syntax noprefix
	.file	"printInt-custom2.c"
	.globl	itoa                    # -- Begin function itoa
	.p2align	4, 0x90
	.type	itoa,@function
itoa:                                   # @itoa
	.cfi_startproc
# %bb.0:
	test	rdi, rdi
	jns	.LBB0_2
# %bb.1:
	mov	byte ptr [rsi], 45
	inc	rsi
	neg	rdi
.LBB0_2:
	mov	rcx, -2
	movabs	r8, 7378697629483820647
	.p2align	4, 0x90
.LBB0_3:                                # =>This Inner Loop Header: Depth=1
	mov	rax, rdi
	imul	r8
	mov	rax, rdx
	shr	rax, 63
	sar	rdx, 2
	add	rdx, rax
	lea	eax, [rdx + rdx]
	lea	r9d, [rax + 4*rax]
	mov	eax, edi
	sub	eax, r9d
	add	al, 48
	mov	byte ptr [rsi + rcx + 2], al
	add	rdi, 9
	inc	rcx
	cmp	rdi, 18
	mov	rdi, rdx
	ja	.LBB0_3
# %bb.4:
	mov	byte ptr [rsi + rcx + 2], 0
	mov	dl, byte ptr [rsi]
	mov	byte ptr [rsi], al
	mov	byte ptr [rsi + rcx + 1], dl
	cmp	rcx, 2
	jl	.LBB0_7
# %bb.5:
	add	rcx, rsi
	add	rsi, 2
	.p2align	4, 0x90
.LBB0_6:                                # =>This Inner Loop Header: Depth=1
	movzx	eax, byte ptr [rcx]
	movzx	edx, byte ptr [rsi - 1]
	mov	byte ptr [rsi - 1], al
	mov	byte ptr [rcx], dl
	dec	rcx
	cmp	rcx, rsi
	lea	rsi, [rsi + 1]
	ja	.LBB0_6
.LBB0_7:
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
	push	r15
	.cfi_def_cfa_offset 24
	push	r14
	.cfi_def_cfa_offset 32
	push	r13
	.cfi_def_cfa_offset 40
	push	r12
	.cfi_def_cfa_offset 48
	push	rbx
	.cfi_def_cfa_offset 56
	sub	rsp, 40
	.cfi_def_cfa_offset 96
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov	rax, qword ptr fs:[40]
	mov	qword ptr [rsp + 32], rax
	lea	r9, [rsp + 17]
	xor	r11d, r11d
	movabs	r14, 7378697629483820647
	movabs	r13, -6640827866535438581
	movabs	r15, 2361183241434822607
	.p2align	4, 0x90
.LBB1_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_2 Depth 2
                                        #     Child Loop BB1_4 Depth 2
	mov	r10, rsp
	movabs	rcx, 123456789123456789
	.p2align	4, 0x90
.LBB1_2:                                #   Parent Loop BB1_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	mov	rax, rcx
	imul	r14
	mov	rsi, rdx
	mov	rax, rdx
	shr	rax, 63
	sar	rsi, 2
	add	rsi, rax
	lea	edi, [rsi + rsi]
	mov	rax, rsi
	imul	r14
	mov	r8, rdx
	lea	ebp, [rdi + 4*rdi]
	mov	rax, rcx
	imul	r13
	mov	rdi, rdx
	add	rdi, rcx
	mov	eax, ecx
	sub	eax, ebp
	mov	r12, r10
	add	al, 48
	mov	byte ptr [r10], al
	mov	rax, r8
	shr	rax, 63
	shr	r8d, 2
	add	r8d, eax
	add	r8d, r8d
	lea	eax, [r8 + 4*r8]
	sub	esi, eax
	add	sil, 48
	mov	byte ptr [r10 + 1], sil
	mov	rax, rdi
	shr	rax, 63
	sar	rdi, 6
	add	rdi, rax
	mov	rax, rdi
	imul	r14
	mov	rax, rdx
	shr	rax, 63
	shr	edx, 2
	add	edx, eax
	add	edx, edx
	lea	eax, [rdx + 4*rdx]
	sub	edi, eax
	add	dil, 48
	lea	rsi, [r10 + 2]
	mov	rax, rcx
	imul	r15
	mov	byte ptr [r10 + 2], dil
	mov	rcx, rdx
	mov	rax, rdx
	shr	rax, 63
	sar	rcx, 7
	add	rcx, rax
	add	r10, 3
	cmp	rsi, r9
	jne	.LBB1_2
# %bb.3:                                #   in Loop: Header=BB1_1 Depth=1
	mov	byte ptr [r12 + 3], 0
	mov	al, byte ptr [rsp]
	mov	byte ptr [rsp], 49
	mov	byte ptr [rsp + 17], al
	lea	rax, [rsp + 2]
	lea	rcx, [rsp + 16]
	.p2align	4, 0x90
.LBB1_4:                                #   Parent Loop BB1_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movzx	edx, byte ptr [rcx]
	movzx	ebx, byte ptr [rax - 1]
	mov	byte ptr [rax - 1], dl
	mov	byte ptr [rcx], bl
	dec	rcx
	cmp	rcx, rax
	lea	rax, [rax + 1]
	ja	.LBB1_4
# %bb.5:                                #   in Loop: Header=BB1_1 Depth=1
	inc	r11d
	cmp	r11d, 10000000
	jne	.LBB1_1
# %bb.6:
	lea	rdi, [rip + .L.str]
	mov	rsi, rsp
	xor	eax, eax
	call	printf@PLT
	mov	rax, qword ptr fs:[40]
	cmp	rax, qword ptr [rsp + 32]
	jne	.LBB1_8
# %bb.7:
	xor	eax, eax
	add	rsp, 40
	.cfi_def_cfa_offset 56
	pop	rbx
	.cfi_def_cfa_offset 48
	pop	r12
	.cfi_def_cfa_offset 40
	pop	r13
	.cfi_def_cfa_offset 32
	pop	r14
	.cfi_def_cfa_offset 24
	pop	r15
	.cfi_def_cfa_offset 16
	pop	rbp
	.cfi_def_cfa_offset 8
	ret
.LBB1_8:
	.cfi_def_cfa_offset 96
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
	.addrsig_sym __stack_chk_fail
