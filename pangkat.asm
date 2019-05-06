extern scanf
extern printf
extern fflush
extern exit
 
segment .data
    input1 db "%d",0
    out1 db "%d",10,0
     
segment .bss
    a resd 1
    b resd 1
segment .text
     
global main
 
main:
    push a
    push input1
    call scanf
    add esp, 8
     
    cmp dword[a],0
    je outer
     
    call kuadrat
    jmp main
 
outer:
    push 0
    call exit
 
kuadrat :
        push b
        push input1
        call scanf
        add esp,8
        mov eax, 1
        mov ecx, dword[b]
    lope:
        mul dword[a]
         
        loop lope
         
        push    eax
        push    out1
        call    printf
        add     esp,8
          
        ret
