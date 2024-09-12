; to run program use nasm -f elf64 {filename}.asm -o {filename}.o 
; and then ld {filename}.o -o {filename}
; ./{filename}

; db stands for define bytes, and 10 is for new line \n. 
section .data
  text db "What is your name? "
  text2 db "Hello, "

section .bss
  ; resb -> reserve bytes
  name resb 16

section .text
  global _start

; Comparisons
; cmp register, register/value
; cmp rax, 23

; Conditional Jump
; cmp rax, 23
; je _doThis
; je -> jump if equals

; Registers as Pointers
; mov rax, [rbx] 

; Calls
; call _printHello

_start:
  call _printText1
  call _getName
  call _printText2
  call _printName

  

  ; rax, rdi, rdx, and rsi are 64-bit registers.
  ; jmp _start -> recursive function in asm lul.
  ;mov rax, 1
  ;mov rdi, 1
  ;mov rsi, text
  ;mov rdx, 14
  ; syscall is a request from program to kernel.
  ;syscall

  ;mov rax, 60
  ;mov rdi, 60
  ;syscall

_getName:
  ; Getting user input.
  mov rax, 0
  mov rdi, 0
  mov rsi, name
  mov rdx, 16
  syscall
  ret

_printText1:
  mov rax, 1 
  mov rdi, 1 
  mov rsi, text
  mov rdx, 19
  syscall
  ret

_printText2:
  mov rax, 1
  mov rdi, 1 
  mov rsi, text2 
  mov rdx, 7
  syscall
  ret

_printName:
  mov rax, 1 
  mov rdi, 1 
  mov rsi, name 
  mov rdx, 16
  syscall
  ret
