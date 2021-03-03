A$scroll_screen$62:	
C$scroll_screen.c$14$0$0:	
C$scroll_screen.c$16$1$24:	
G$screen_scroll_screen_load$0$0:	
_screen_scroll_screen_load:	
		ld hl, Fscroll_screen$offset$0$0	; Fscroll_screen$offset$0$0 = $C056
		ld (hl), $00
		ret
	
A$scroll_screen$78:	
C$scroll_screen.c$19$1$24:	
G$screen_scroll_screen_update$0$:	
_screen_scroll_screen_update:	
		dec sp
		ld a, (Fscroll_screen$offset$0$0)	; Fscroll_screen$offset$0$0 = $C056
		sub $20
		jr nz, A$scroll_screen$88
		ld a, $01
		jr A$scroll_screen$90
	
A$scroll_screen$88:	
		xor a
A$scroll_screen$90:	
		inc sp
		push af
		inc sp
		ld iy, Fscroll_screen$offset$0$0	; Fscroll_screen$offset$0$0 = $C056
		ld b, (iy+0)
		inc (iy+0)
		push bc
		inc sp
		call A$_sms_manager$222
		inc sp
		ld a, $10
		push af
		inc sp
		call A$input_manager$88
		inc sp
		ld c, l
		ld hl, $0003
		add hl, sp
		ld a, (hl)
		inc hl
		ld h, (hl)
		ld l, a
		ld a, c
		or a
		jr nz, A$scroll_screen$136
		ld iy, $0000
		add iy, sp
		ld a, (iy+0)
		or a
		jr z, A$scroll_screen$160
A$scroll_screen$136:	
C$scroll_screen.c$30$2$27:	
		push hl
		ld a, $04
		push af
		inc sp
		call A$scroll_manager$94
		inc sp
		ld a, $20
		push af
		inc sp
		call A$_sms_manager$222
		inc sp
		pop hl
		ld (hl), $04
		jr A$scroll_screen$162
	
A$scroll_screen$160:	
C$scroll_screen.c$37$1$26:	
		ld (hl), $03
A$scroll_screen$162:	
		inc sp
		ret