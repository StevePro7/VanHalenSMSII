;.section "ASM manager" free
.section "engine_asm_manager_clear_VRAM:" free
engine_asm_manager_clear_VRAM:	
		ld a, $00
		out (Port_VDPAddress), a
		ld a, $40
		out (Port_VDPAddress), a
		ld bc, $4000
.ends

.section "asm_loop:" free
asm_loop:	
		ld a, $00
		out (Port_VDPData), a
		dec bc
		ld a, b
		or c
		jp nz, asm_loop
		ret

;.ends
.ends
.ends
