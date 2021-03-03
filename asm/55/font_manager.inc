A$font_manager$56:	
C$font_manager.c$10$0$0:	
G$engine_font_manager_draw_char$:	
_engine_font_manager_draw_char:	
		push ix
		ld ix, $0000
		add ix, sp
		ld a, (ix+4)
		add a, $E0
		ld c, a
		push bc
		ld h, (ix+6)
		ld l, (ix+5)
		push hl
		call A$_sms_manager$607
		pop af
		pop bc
		ld hl, _font__tilemap__bin	; _font__tilemap__bin = $1722
		ld l, (hl)
		ld h, $00
		ld b, $00
		add hl, bc
		push hl
		call A$_sms_manager$652
		pop af
		pop ix
		ret
	
A$font_manager$104:	
C$font_manager.c$18$1$21:	
G$engine_font_manager_draw_text$:	
_engine_font_manager_draw_text:	
		push ix
		ld ix, $0000
		add ix, sp
		dec sp
		ld c, (ix+6)
		ld (ix-1), $00
A$font_manager$117:	
		ld a, (ix+4)
		add a, (ix-1)
		ld e, a
		ld a, (ix+5)
		adc a, $00
		ld d, a
		ld a, (de)
		or a
		jr z, A$font_manager$169
		add a, $E0
		ld b, a
		ld d, c
		inc c
		ld (ix+6), c
		push bc
		ld a, (ix+7)
		push af
		inc sp
		push de
		inc sp
		call A$_sms_manager$607
		pop af
		pop bc
		ld hl, _font__tilemap__bin	; _font__tilemap__bin = $1722
		ld e, (hl)
		ld d, $00
		ld a, b
		ld l, a
		rla
		sbc a, a
		ld h, a
		add hl, de
		push bc
		push hl
		call A$_sms_manager$652
		pop af
		pop bc
		inc (ix-1)
		jr A$font_manager$117
	
A$font_manager$169:	
		inc sp
		pop ix
		ret
	
A$font_manager$185:	
C$font_manager.c$32$1$23:	
G$engine_font_manager_draw_data$:	
_engine_font_manager_draw_data:	
		push ix
		ld ix, $0000
		add ix, sp
		push af
		ld a, (ix+6)
		ld (ix-1), a
		ld (ix-2), $00
A$font_manager$202:	
C$font_manager.c$44$2$27:	
		ld hl, $000A
		push hl
		ld l, (ix+4)
		ld h, (ix+5)
		push hl
		call __divuint
		pop af
		pop af
		ld e, l
		ld d, h
		push hl
		push de
		ld bc, $000A
		push bc
		ld c, (ix+4)
		ld b, (ix+5)
		push bc
		call __moduint
		pop af
		pop af
		ld b, l
		pop de
		pop hl
		ld (ix+4), l
		ld (ix+5), h
		ld a, b
		add a, $10
		ld c, a
		ld a, d
		or e
		jr nz, A$font_manager$258
		or b
		jr nz, A$font_manager$258
		ld a, (ix-2)
		or a
		jr z, A$font_manager$258
		ld c, $00
A$font_manager$258:	
C$font_manager.c$55$3$28:	
		ld b, (ix-1)
		dec (ix-1)
		ld a, (ix-1)
		ld (ix+6), a
		push bc
		ld a, (ix+7)
		push af
		inc sp
		push bc
		inc sp
		call A$_sms_manager$607
		pop af
		pop bc
		ld hl, _font__tilemap__bin	; _font__tilemap__bin = $1722
		ld l, (hl)
		ld h, $00
		ld a, c
		rla
		sbc a, a
		ld b, a
		add hl, bc
		push hl
		call A$_sms_manager$652
		pop af
		inc (ix-2)
		ld a, (ix-2)
		sub $05
		jr c, A$font_manager$202
		ld sp, ix
		pop ix
		ret
