; Based on https://0xax.github.io/asm_1/

; Section .data is for initialized data or constants

section .data
    msg db  "hello, world!"

; Section non initialized variables
; section .bss

; Section .text is for code

section .text

; We must tell it where to start execution
    global _start

; Label referenced by global
_start:

    ; This is a call to sys_write (rax=1)

    ; sys_write man page: https://man7.org/linux/man-pages/man2/write.2.html
    ; syscall table: https://github.com/torvalds/linux/blob/master/arch/x86/entry/syscalls/syscall_64.tbl

    ; size_t sys_write(unsigned int fd, const char * buf, size_t count);

    ; fd - file descriptor (0, 1 and 2 for stdin stdout or stderr)
    ; buf - character array
    ; count - number of bytes written

    mov rax, 1      ; rax:  contains syscall number
    mov rdi, 1      ; rdi: pass 1st argument to functions
    mov rsi, msg    ; rsi: pointer used to pass 2nd argument to functions
    mov rdx, 13     ; rdx: pass 3rd argument to functions
    syscall


    ; This is a call to exit (rax=60)
    ; rdi = 0 means exit code = 0
    mov rax, 60
    mov rdi, 0
    syscall
