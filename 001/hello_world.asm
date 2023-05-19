; Section .data is for constants

section .data
    msg db  "hello, world!"

; Section .text is for code

section .text

; We must tell it where to start execution
    global _start

; Label referenced by global
_start:

    ; This is a call to sys_write (rax=1)

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
