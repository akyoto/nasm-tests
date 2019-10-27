global _start

_start:
	rdtscp        ; read time stamp counter
	mov [startTime], eax ; move counter into variable
	mov [startTime+4], edx ; move counter into variable
	mov rcx, 1

.loop:
	push rcx

	mov rax, 1        ; write(
	mov rdi, 1        ;   STDOUT_FILENO,
	mov rsi, msg      ;   "Hello, world!\n",
	mov rdx, msglen   ;   sizeof("Hello, world!\n")
	syscall           ; );

	pop rcx
	dec rcx
	jnz .loop
	
	rdtscp        ; read time stamp counter
	sub eax, [startTime] ; find the difference
	mov edx, [startTime+4] ; move counter into variable
	mov [time], eax
	mov [time+4], edx
	mov rax, [time]
	call printInt

	; exit(0)
	mov rax, 60
	mov rdi, [time]
	syscall

printInt:
.convert:
	mov rax, 10
	xor rcx, rcx
	mov byte [timeASCII+rcx], 0x30
	cmp rax, 10
	jnz .convert

	mov rsi, timeASCII
	mov rax, 1        ; write(
	mov rdi, 1        ;   STDOUT_FILENO,
	mov rdx, 10
	syscall           ; );
	ret

section .rodata
	msg: db "Hello World", 10
	msglen: equ $ - msg
	timeASCII: db "0000000000", 10

section .bss
	startTime resq 1
	time resq 1

