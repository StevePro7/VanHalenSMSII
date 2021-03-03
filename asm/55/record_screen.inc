A$record_screen$71:	
C$record_screen.c$16$0$0:	
C$record_screen.c$18$1$29:	
G$screen_record_screen_load$0$0:	
_screen_record_screen_load:	
		call A$scroll_manager$61
		jp A$record_screen$241
	
A$record_screen$89:	
C$record_screen.c$22$1$29:	
G$screen_record_screen_update$0$:	
_screen_record_screen_update:	
		push ix
		ld ix, $0000
		add ix, sp
		ld a, $04
		push af
		inc sp
		call A$input_manager$88
		inc sp
		ld a, l
		or a
		jr z, A$record_screen$121
		call A$record_manager$177
		call A$record_screen$241
A$record_screen$121:	
C$record_screen.c$34$1$31:	
		ld a, $08
		push af
		inc sp
		call A$input_manager$88
		inc sp
		ld a, l
		or a
		jr z, A$record_screen$144
		call A$record_manager$213
		call A$record_screen$241
A$record_screen$144:	
C$record_screen.c$41$1$31:	
		ld a, $10
		push af
		inc sp
		call A$input_manager$88
		inc sp
		ld c, l
		push bc
		ld a, $20
		push af
		inc sp
		call A$input_manager$88
		inc sp
		pop bc
		ld e, (ix+4)
		ld d, (ix+5)
		ld a, c
		or a
		jr nz, A$record_screen$177
		or l
		jr z, A$record_screen$220
A$record_screen$177:	
C$record_screen.c$45$2$34:	
		push de
		xor a
		push af
		inc sp
		call A$_sms_manager$222
		inc sp
		pop de
		ld hl, G$global_record_object$0$0	; G$global_record_object$0$0 = $C02A
		ld b, (hl)
		push de
		push bc
		inc sp
		call A$record_manager$69
		inc sp
		pop de
		ld hl, G$global_record_object$0$0	; G$global_record_object$0$0 = $C02A
		ld b, (hl)
		push de
		push bc
		inc sp
		call A$cursor_manager$68
		inc sp
		call A$storage_manager$159
		pop de
		ld a, $04
		ld (de), a
		jr A$record_screen$223
	
A$record_screen$220:	
C$record_screen.c$55$1$31:	
		ld a, $05
		ld (de), a
A$record_screen$223:	
		pop ix
		ret
	
A$record_screen$241:	
C$record_screen.c$58$1$31:	
C$record_screen.c$60$1$35:	
Frecord_screen$load_record$0$0:	
		call A$_sms_manager$163
		call A$asm_manager$59
		call A$record_manager$88
		jp A$_sms_manager$145
	