extern scanf
extern printf
extern fflush

segment .data
	nilai db "%d",0
	hasil db "%d",0xa,0
	
segment .bss
	a resd 1
	
segment .text
global main
main:
	push a ;5
	push nilai
	call scanf
	add esp,8
	
	mov eax, 1
	mov ecx, [a]
	
faktorial:
	mul ecx ;kenapa mulai dari ebx soalnya mul itu otomatis mulai dari eax dan disimpan di eax
	loopne faktorial
	
	;print
	push eax
	push hasil
	call printf
	add esp,4

exit:
	push 0
    call fflush
    add esp,4
 
    mov eax, 1
    mov ebx, 0 
    int 0x80
