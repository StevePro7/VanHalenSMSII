A$title_screen$81:	
C$title_screen.c$20$0$0:	
C$title_screen.c$22$1$28:	
C$title_screen.c$25$1$28:	
G$screen_title_screen_load$0$0:	
_screen_title_screen_load:	
		call A$_sms_manager$163
		call A$content_manager$65
		call A$content_manager$263
		call A$content_manager$145
		ld hl, $150A
		push hl
		ld hl, Ftitle_screen$__str_0$0$0	; Ftitle_screen$__str_0$0$0 = $129F
		push hl
		call A$font_manager$104
		pop af
		ld hl, $0C06
		ex (sp), hl
		ld hl, Ftitle_screen$__str_1$0$0	; Ftitle_screen$__str_1$0$0 = $12AB
		push hl
		call A$font_manager$104
		pop af
		ld hl, $0C14
		ex (sp), hl
		ld hl, Ftitle_screen$__str_2$0$0	; Ftitle_screen$__str_2$0$0 = $12B2
		push hl
		call A$font_manager$104
		pop af
		ld hl, $171C
		ex (sp), hl
		ld hl, Ftitle_screen$__str_3$0$0	; Ftitle_screen$__str_3$0$0 = $12B9
		push hl
		call A$font_manager$104
		pop af
		pop af
		call A$_sms_manager$145
		ld hl, $0032
		push hl
		call A$timer_manager$70
		ld hl, $004B
		ex (sp), hl
		call A$timer_manager$154
		pop af
		xor a
		push af
		inc sp
		call A$record_manager$69
		inc sp
		call A$storage_manager$65
		ld a, l
		or a
		jr z, A$title_screen$174
		call A$storage_manager$126
A$title_screen$174:	
C$title_screen.c$48$1$28:	
		ld hl, G$global_record_object$0$0	; G$global_record_object$0$0 = $C02A
		ld b, (hl)
		push bc
		inc sp
		call A$record_manager$69
		inc sp
		ld hl, G$global_record_object$0$0	; G$global_record_object$0$0 = $C02A
		ld b, (hl)
		push bc
		inc sp
		call A$cursor_manager$68
		inc sp
		ld hl, Ftitle_screen$event_stage$0$0	; Ftitle_screen$event_stage$0$0 = $C054
		ld (hl), $00
		ld hl, Ftitle_screen$flash$0$0	; Ftitle_screen$flash$0$0 = $C055
		ld (hl), $00
		ret
	
; Data from 129F to 12AA (12 bytes)	
Ftitle_screen$__str_0$0$0:	
	.db $50 $52 $45 $53 $53 $20 $53 $54 $41 $52 $54 $00
	
; Data from 12AB to 12B1 (7 bytes)	
Ftitle_screen$__str_1$0$0:	
	.db $52 $45 $43 $4F $52 $44 $00
	
; Data from 12B2 to 12B8 (7 bytes)	
Ftitle_screen$__str_2$0$0:	
	.db $43 $4F $56 $45 $52 $53 $00
	
; Data from 12B9 to 12BD (5 bytes)	
Ftitle_screen$__str_3$0$0:	
	.db $56 $31 $2E $30 $00
	
A$title_screen$229:	
C$title_screen.c$55$1$28:	
G$screen_title_screen_update$0$0:	
_screen_title_screen_update:	
		push ix
		ld ix, $0000
		add ix, sp
		push af
		dec sp
		ld a, (ix+4)
		ld (ix-2), a
		ld a, (ix+5)
		ld (ix-1), a
		ld a, (Ftitle_screen$event_stage$0$0)	; Ftitle_screen$event_stage$0$0 = $C054
		dec a
		jr nz, A$title_screen$299
		call A$timer_manager$185
		ld c, l
		ld a, c
		or a
		jr z, A$title_screen$280
		push bc
		ld hl, $150A
		push hl
		ld hl, Ftitle_screen$__str_4$0$0	; Ftitle_screen$__str_4$0$0 = $1371
		push hl
		call A$font_manager$104
		pop af
		ld hl, _font__palette__bin + 3	; _font__palette__bin + 3 = $1715
		ex (sp), hl
		ld hl, Ftitle_screen$__str_4$0$0	; Ftitle_screen$__str_4$0$0 = $1371
		push hl
		call A$font_manager$104
		pop af
		pop af
		pop bc
A$title_screen$280:	
C$title_screen.c$69$2$32:	
		ld a, c
		or a
		jr z, A$title_screen$286
		ld c, $03
		jr A$title_screen$288
	
A$title_screen$286:	
		ld c, $02
A$title_screen$288:	
		ld l, (ix-2)
		ld h, (ix-1)
		ld (hl), c
		jr A$title_screen$384
	
A$title_screen$299:	
C$title_screen.c$73$1$31:	
		call A$timer_manager$103
		ld (ix-3), l
		ld a, l
		or a
		jr z, A$title_screen$346
		ld hl, Ftitle_screen$flash$0$0	; Ftitle_screen$flash$0$0 = $C055
		ld a, $01
		sub (hl)
		ld (hl), a
		ld a, (Ftitle_screen$flash$0$0)	; Ftitle_screen$flash$0$0 = $C055
		or a
		jr z, A$title_screen$335
		ld hl, $150A
		push hl
		ld hl, Ftitle_screen$__str_4$0$0	; Ftitle_screen$__str_4$0$0 = $1371
		push hl
		call A$font_manager$104
		pop af
		pop af
		jr A$title_screen$346
	
A$title_screen$335:	
C$title_screen.c$83$3$36:	
		ld hl, $150A
		push hl
		ld hl, Ftitle_screen$__str_5$0$0	; Ftitle_screen$__str_5$0$0 = $137D
		push hl
		call A$font_manager$104
		pop af
		pop af
A$title_screen$346:	
C$title_screen.c$87$1$31:	
		ld a, $10
		push af
		inc sp
		call A$input_manager$88
		inc sp
		ld a, l
		or a
		jr z, A$title_screen$380
		ld hl, $150A
		push hl
		ld hl, Ftitle_screen$__str_5$0$0	; Ftitle_screen$__str_5$0$0 = $137D
		push hl
		call A$font_manager$104
		pop af
		pop af
		call A$audio_manager$60
		ld hl, Ftitle_screen$event_stage$0$0	; Ftitle_screen$event_stage$0$0 = $C054
		ld (hl), $01
A$title_screen$380:	
C$title_screen.c$96$1$31:	
		ld l, (ix-2)
		ld h, (ix-1)
		ld (hl), $02
A$title_screen$384:	
		ld sp, ix
		pop ix
		ret
	
; Data from 1371 to 137C (12 bytes)	
Ftitle_screen$__str_4$0$0:	
	.dsb 11, $20
	.db $00
	
; Data from 137D to 1388 (12 bytes)	
Ftitle_screen$__str_5$0$0:	
	.db $50 $52 $45 $53 $53 $20 $53 $54 $41 $52 $54 $00