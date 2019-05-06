extern printf
extern fflush
extern scanf
      
section .data
    input db "%f %f", 0
    output db "%f", 10, 0
          
section .bss
    a resd 1 ; resd untuk nilai yang belum ditentuin
    b resd 1
    result resd 1		;resultakhir
    result1 resd 1		;result kuadrat bil1
    result2 resd 1		;result kuadrat bil2
     
section .text
    global main
          
main:
    push a
    push b
    push input
    call scanf
     
    fld dword[a]		;satu masuk sto
    fld dword[a]		;satu masuk st1
    fmulp				    ;ngaliin sto*st1
    fstp dword[result1]
     
    fld dword[b]
    fld dword[b]
    fmulp
    fstp dword[result2]
     
    fld dword[result1]
    fld dword[result2]
    faddp
     
    fsqrt
    fstp qword[result]
     
    push dword[result+4]
    push dword[result]
    push output
    call printf
     
exit:
    push 0
    call fflush
    mov eax, 1
    mov ebx, 0
    int 0x80
