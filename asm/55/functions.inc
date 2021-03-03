__divuint:	
		pop af
		pop hl
		pop de
		push de
		push hl
		push af
		jr __divu16
	
__divuchar:	
		ld hl, $0003
		add hl, sp
		ld e, (hl)
		dec hl
		ld l, (hl)
__divu8:	
		ld h, $00
		ld d, h
__divu16:	
		ld a, e
		and $80
		or d
		jr nz, ++
		ld b, $10
		adc hl, hl
-:	
		rla
		sub e
		jr nc, +
		add a, e
+:	
		ccf
		adc hl, hl
		djnz -
		ld e, a
		ret
	
++:	
		ld b, $09
		ld a, l
		ld l, h
		ld h, $00
		rr l
-:	
		adc hl, hl
		sbc hl, de
		jr nc, +
		add hl, de
+:	
		ccf
		rla
		djnz -
		rl b
		ld d, b
		ld e, a
		ex de, hl
		ret