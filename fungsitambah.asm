global main
extern printf, scanf
  
section .data
    fmt_out     db      "%d", 10, 0
    input1 db "%d",0
      
segment .bss
    a resd 1
    b resd 1
  
section .text
  
    sum_double:
                push    ebp                     ; save old ebp
                mov     ebp, esp                ; set new ebp
                  
                mov     eax, 0
                mov     eax, [ebp+8]            ; eax = a   --> a
                add     eax, [ebp+12]           ; eax += b  --> a + b
                  
                push    eax
                push    fmt_out
                call    printf
                add     esp, 8
                  
                mov     esp, ebp                ; deallocate local vars
                pop     ebp                     ; restore old ebp
                ret
    main:
                push a
                push input1
                call scanf
                add esp, 8
  
                push b
                push input1
                call scanf
                add esp, 8
  
                push    dword [b]
                push    dword [a]
                call    sum_double
                add     esp, 8
  
                ; printf("%d\n", eax)
                  
  
                ; return 0
                mov     eax, 0
                ret
