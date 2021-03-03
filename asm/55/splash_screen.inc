A$splash_screen$69:	
C$splash_screen.c$14$0$0:	
C$splash_screen.c$16$1$25:	
G$screen_splash_screen_load$0$0:	
_screen_splash_screen_load:	
		call A$_sms_manager$163
		call A$content_manager$65
		call A$content_manager$96
		call A$_sms_manager$145
		ld hl, $0096
		push hl
		call A$timer_manager$70
		ld hl, $004B
		ex (sp), hl
		call A$timer_manager$154
		pop af
		ret
	
A$splash_screen$109:	
C$splash_screen.c$25$1$25:	
G$screen_splash_screen_update$0$:	
_screen_splash_screen_update:	
		push ix
		ld ix, $0000
		add ix, sp
		push af
		call A$timer_manager$103
		ld (ix-2), l
		ld a, $10
		push af
		inc sp
		call A$input_manager$88
		inc sp
		ld (ix-1), l
		ld a, $20
		push af
		inc sp
		call A$input_manager$130
		inc sp
		ld a, l
		or a
		jr z, A$splash_screen$174
		call A$timer_manager$185
		ld a, l
		or a
		jr z, A$splash_screen$179
		call A$storage_manager$215
		call A$timer_manager$236
		ld hl, $171C
		push hl
		ld hl, Fsplash_screen$__str_0$0$0	; Fsplash_screen$__str_0$0$0 = $121B
		push hl
		call A$font_manager$104
		pop af
		pop af
		jr A$splash_screen$179
	
A$splash_screen$174:	
C$splash_screen.c$48$2$30:	
		call A$timer_manager$236
A$splash_screen$179:	
C$splash_screen.c$53$1$27:	
		ld l, (ix+4)
		ld h, (ix+5)
		ld a, (ix-2)
		or a
		jr nz, A$splash_screen$194
		ld a, (ix-1)
		or a
		jr z, A$splash_screen$203
A$splash_screen$194:	
C$splash_screen.c$53$2$31:	
		ld (hl), $02
		jr A$splash_screen$205
	
A$splash_screen$203:	
C$splash_screen.c$57$1$27:	
		ld (hl), $01
A$splash_screen$205:	
		ld sp, ix
		pop ix
		ret
	
; Data from 121B to 121F (5 bytes)	
Fsplash_screen$__str_0$0$0:	
	.db $35 $31 $35 $30 $00