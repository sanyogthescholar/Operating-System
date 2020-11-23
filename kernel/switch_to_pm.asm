[bits 16]
; Switch to protected mode
switch_to_pm:
    ;call EnableA20
	cli
	lgdt [gdt_descriptor]

	mov eax, cr0
	or eax, 0x1
	mov cr0, eax

	jmp CODE_SEG:init_pm

;EnableA20:
    ;in al, 0x92
    ;or al, 2
    ;out 0x92, al
    ;ret

[bits 32]
init_pm:
	mov ax, DATA_SEG
	mov ds, ax
	mov ss, ax
	mov es, ax
	mov fs, ax
	mov gs, ax

	mov ebp, 0x90000
	mov esp, ebp

	call BEGIN_PM