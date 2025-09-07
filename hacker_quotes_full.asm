;
; hacker_quotes_full.asm
; Random geek/hacker sayings generator (30 quotes)
; Includes hacking, shellcode, exploits, reverse engineering
; Uses gettimeofday for entropy
;
; Build:
;   nasm -felf64 hacker_quotes_full.asm -o hacker_quotes_full.o
;   ld hacker_quotes_full.o -o hacker_quotes_full
; Run:
;   ./hacker_quotes_full

section .data
    timeval dq 0, 0

    ; Sayings database
    q1  db "Hacking is not breaking, it's understanding.",10,0
    q2  db "Code is poetry, bugs are haiku.",10,0
    q3  db "Geek: someone who codes at night and debugs at dawn.",10,0
    q4  db "In Linux, everything is a file – even your excuses.",10,0
    q5  db "Without logs you are blind, without backups you are naked.",10,0
    q6  db "Real hackers read the source.",10,0
    q7  db "Root doesn't ask for permission.",10,0
    q8  db "The best firewall is common sense and coffee.",10,0
    q9  db "No bugs, only features not yet discovered.",10,0
    q10 db "Keep calm and hack the planet.",10,0
    q11 db "The network always knows more than you do.",10,0
    q12 db "Debugging is like being the detective in a crime movie where you are also the murderer.",10,0
    q13 db "Coffee in, code out.",10,0
    q14 db "Good hackers borrow, great hackers read RFCs.",10,0
    q15 db "Open source is the ultimate hack: sharing knowledge.",10,0
    q16 db "Every exploit starts with curiosity.",10,0
    q17 db "Never trust input. Ever.",10,0
    q18 db "Programmers don’t sleep, they just cache.",10,0
    q19 db "In the beginning there was the command line.",10,0
    q20 db "Your password is the first line of defense. Make it count.",10,0

    ; Shellcode & low-level
    q21 db "Shellcode is poetry written in opcodes.",10,0
    q22 db "If you can’t fit it in shellcode, you don’t understand the system yet.",10,0
    q23 db "Segmentation fault is just another kind of feedback.",10,0
    q24 db "Reverse engineering: reading code backwards to move forward.",10,0
    q25 db "Assembler never lies, compilers sometimes do.",10,0

    ; Exploit / RE
    q26 db "Buffer overflows: where size really matters.",10,0
    q27 db "An exploit is just a misunderstood feature.",10,0
    q28 db "Reversers don’t trust binaries – they interrogate them.",10,0
    q29 db "Disassembly is the hacker’s X-ray vision.",10,0
    q30 db "There is no magic, only instructions and memory.",10,0

    quotes dq q1,q2,q3,q4,q5,q6,q7,q8,q9,q10, \
              q11,q12,q13,q14,q15,q16,q17,q18,q19,q20, \
              q21,q22,q23,q24,q25,q26,q27,q28,q29,q30
    n_quotes equ 30

section .text
    global _start

_start:
    ; gettimeofday(&timeval, NULL)
    mov     rax, 96
    lea     rdi, [rel timeval]
    xor     rsi, rsi
    syscall

    ; entropy = seconds + microseconds
    mov     rax, [timeval]
    mov     rdx, [timeval+8]
    add     rax, rdx

    ; index = entropy % n_quotes
    mov     rcx, n_quotes
    xor     rdx, rdx
    div     rcx
    mov     rbx, rdx

    ; load quote address
    mov     rsi, [quotes + rbx*8]

    ; print
    call    print_string

    ; exit(0)
    mov     rax, 60
    xor     rdi, rdi
    syscall

; ------------------------------
; print_string(rsi=address)
print_string:
    push    rsi
    mov     rdi, rsi
    call    strlen
    mov     rdx, rax
    pop     rsi
    mov     rax, 1
    mov     rdi, 1
    syscall
    ret

; ------------------------------
; strlen(rdi=address) -> rax=len
strlen:
    mov     rsi, rdi
.len_loop:
    cmp     byte [rsi], 0
    je      .done
    inc     rsi
    jmp     .len_loop
.done:
    mov     rax, rsi
    sub     rax, rdi
    ret
