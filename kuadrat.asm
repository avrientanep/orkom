global main
extern printf
extern scanf
extern fflush
extern exit
 
segment .data
    scan db '%d',0
    print db '%d',10,0
    n dd 1
     
segment .text
main :
    push n
    push scan
    call scanf
    add esp,8
     
    cmp dword[n], 0
    je keluar
     
    call kuadrat
     
    jmp main
     
keluar :
    push 0
    call exit
 
kuadrat :
    mov     eax,dword[n]
    mul     dword[n]
     
    push eax
    push print
    call printf
    add esp,8 
      
    push 0
    call fflush
    add esp,4
        
