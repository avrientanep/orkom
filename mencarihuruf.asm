extern printf
extern fflush
extern scanf
     
section .data
    input db "%s %s", 0
    print db "%d", 10, 0
    no db "tidak ada", 10, 0
    
         
section .bss
	string1 resb 51		;panjang string ditambah nul
	cari resb 2		;panjang string yg dicari ditambah nul
        
section .text
    global main
         
main:
	cld			;biar ngebaca string dari depan
	push cari		
	push string1
	push input
	call scanf
	
	mov ecx, 50		;buat menyimpan counter
	mov edi, string1	;buat nyimpen string (esi,edi, dan al)
	mov eax, [cari]		;nah kalo scasb dia cuman bisa make angka atau char(al,ax,eax) dan string (edi)
	repne scasb		;repne : buat looping sampe ketemu yg sama dengan yg dicari kalo ga ada looping terus
				;scasb : buat bandingin satu satu
	
	
	mov eax, 50		;ini buat simpen total awal
	sub eax, ecx		;letaknya = 50-45 = 5
	mov ebx, 0		;ebx buat nyimpen angka 0
	cmp ecx, ebx		;dibandingin kalo ecx=0
	je langsung		;dia lompat ke langsung
	
	push eax
	push print
	call printf
	jmp exit

langsung:
	push no
	call printf
	jmp exit
	
exit:
	push 0
	call fflush
    	mov eax, 1
    	mov ebx, 0
    	int 0x80
