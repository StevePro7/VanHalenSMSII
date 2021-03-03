A$cursor_manager$68:	
C$cursor_manager.c$13$0$0:	
C$cursor_manager.c$15$1$23:	
G$engine_cursor_manager_init$0$0:	
_engine_cursor_manager_init:	
		ld bc, G$global_cursor_object$0$0	; G$global_cursor_object$0$0 = $C026
		xor a
		ld (bc), a
		ld hl, G$global_cursor_object$0$0 + 1	; G$global_cursor_object$0$0 + 1 = $C027
		ld (hl), $00
		push bc
		ld a, $03
		push af
		inc sp
		ld hl, $0005
		add hl, sp
		ld a, (hl)
		push af
		inc sp
		call __divuchar
		pop af
		ld a, l
		pop bc
		ld (bc), a
		ld a, $03
		push af
		inc sp
		ld hl, $0003
		add hl, sp
		ld a, (hl)
		push af
		inc sp
		call __moduchar
		pop af
		ld c, l
		ld hl, G$global_cursor_object$0$0 + 1	; G$global_cursor_object$0$0 + 1 = $C027
		ld (hl), c
		jp A$cursor_manager$682
	
A$cursor_manager$129:	
C$cursor_manager.c$24$1$23:	
G$engine_cursor_manager_load$0$0:	
_engine_cursor_manager_load:	
		push ix
		ld ix, $0000
		add ix, sp
		push af
		push af
		ld (ix-3), $00
A$cursor_manager$142:	
C$cursor_manager.c$33$2$26:	
		ld a, $4A
		add a, (ix-3)
		ld (ix-2), a
		ld a, $11
		adc a, $00
		ld (ix-1), a
		ld c, $00
A$cursor_manager$153:	
C$cursor_manager.c$35$5$29:	
		ld l, c
		add hl, hl
		add hl, bc
		ld a, l
		add a, (ix-3)
		ld e, a
		ld hl, G$cursor_gridX$0$0	; G$cursor_gridX$0$0 = $1146
		ld b, $00
		add hl, bc
		ld b, (hl)
		ld l, (ix-2)
		ld h, (ix-1)
		ld a, (hl)
		ld (ix-4), a
		ld h, $00
		ld l, e
		add hl, hl
		ld de, G$cursor_album$0$0	; G$cursor_album$0$0 = $C14A
		add hl, de
		ld e, (hl)
		inc hl
		ld d, (hl)
		ld a, (ix-4)
		add a, (ix+4)
		push bc
		push af
		inc sp
		push bc
		inc sp
		push de
		call A$font_manager$104
		pop af
		pop af
		pop bc
		inc c
		ld a, c
		sub $04
		jr c, A$cursor_manager$153
		inc (ix-3)
		ld a, (ix-3)
		sub $03
		jr c, A$cursor_manager$142
		ld sp, ix
		pop ix
		ret
	
A$cursor_manager$235:	
C$cursor_manager.c$45$2$26:	
C$cursor_manager.c$47$1$30:	
C$cursor_manager.c$48$1$30:	
G$engine_cursor_manager_save$0$0:	
_engine_cursor_manager_save:	
		ld a, (G$global_cursor_object$0$0)	; G$global_cursor_object$0$0 = $C026
		ld c, a
		add a, a
		add a, c
		ld c, a
		ld hl, G$global_cursor_object$0$0	; G$global_cursor_object$0$0 = $C026
		inc hl
		ld l, (hl)
		add hl, bc
		ret
	
A$cursor_manager$258:	
C$cursor_manager.c$51$1$30:	
G$engine_cursor_manager_draw$0$0:	
_engine_cursor_manager_draw:	
		push ix
		ld ix, $0000
		add ix, sp
		push af
		push af
		ld hl, G$global_cursor_object$0$0	; G$global_cursor_object$0$0 = $C026
		inc hl
		inc hl
		ld c, (hl)
		ld hl, G$global_cursor_object$0$0	; G$global_cursor_object$0$0 = $C026
		inc hl
		inc hl
		inc hl
		ld b, (hl)
		push bc
		ld hl, $0120
		push hl
		push bc
		call A$_sms_manager$696
		pop af
		pop af
		pop bc
		ld a, c
		add a, $28
		ld e, a
		push bc
		push de
		ld hl, $0125
		push hl
		push bc
		inc sp
		ld a, e
		push af
		inc sp
		call A$_sms_manager$696
		pop af
		pop af
		pop de
		pop bc
		ld a, b
		add a, $10
		ld d, a
		push bc
		push de
		ld hl, $012C
		push hl
		ld e, c
		push de
		call A$_sms_manager$696
		pop af
		pop af
		pop de
		push de
		ld hl, $0131
		push hl
		push de
		call A$_sms_manager$696
		pop af
		pop af
		pop de
		pop bc
		ld a, c
		add a, $08
		ld (ix-4), a
		push bc
		push de
		ld hl, $0121
		push hl
		push bc
		inc sp
		ld a, (ix-4)
		push af
		inc sp
		call A$_sms_manager$696
		pop af
		pop af
		pop de
		pop bc
		ld a, c
		add a, $10
		ld (ix-1), a
		push bc
		push de
		ld hl, $0122
		push hl
		push bc
		inc sp
		ld a, (ix-1)
		push af
		inc sp
		call A$_sms_manager$696
		pop af
		pop af
		pop de
		pop bc
		ld a, c
		add a, $18
		ld (ix-2), a
		push bc
		push de
		ld hl, $0123
		push hl
		push bc
		inc sp
		ld a, (ix-2)
		push af
		inc sp
		call A$_sms_manager$696
		pop af
		pop af
		pop de
		pop bc
		ld a, c
		add a, $20
		ld (ix-3), a
		push bc
		push de
		ld hl, $0124
		push hl
		push bc
		inc sp
		ld a, (ix-3)
		push af
		inc sp
		call A$_sms_manager$696
		pop af
		pop af
		pop de
		pop bc
		ld a, b
		add a, $08
		ld b, a
		push bc
		push de
		ld hl, $0126
		push hl
		push bc
		call A$_sms_manager$696
		pop af
		pop af
		pop de
		pop bc
		push de
		ld hl, $012B
		push hl
		push bc
		inc sp
		ld a, e
		push af
		inc sp
		call A$_sms_manager$696
		pop af
		pop af
		pop de
		push de
		ld hl, $012D
		push hl
		push de
		inc sp
		ld a, (ix-4)
		push af
		inc sp
		call A$_sms_manager$696
		pop af
		pop af
		pop de
		push de
		ld hl, $012E
		push hl
		push de
		inc sp
		ld a, (ix-1)
		push af
		inc sp
		call A$_sms_manager$696
		pop af
		pop af
		pop de
		push de
		ld hl, $012F
		push hl
		push de
		inc sp
		ld a, (ix-2)
		push af
		inc sp
		call A$_sms_manager$696
		pop af
		pop af
		pop de
		ld hl, $0130
		push hl
		push de
		inc sp
		ld a, (ix-3)
		push af
		inc sp
		call A$_sms_manager$696
		ld sp, ix
		pop ix
		ret
	
A$cursor_manager$523:	
C$cursor_manager.c$81$1$31:	
C$cursor_manager.c$83$1$32:	
G$engine_cursor_manager_decX$0$0:	
_engine_cursor_manager_decX:	
		ld bc, G$global_cursor_object$0$0	; G$global_cursor_object$0$0 = $C026
		ld a, (bc)
		or a
		jr nz, A$cursor_manager$540
		ld a, $03
		ld (bc), a
		jp A$cursor_manager$682
	
A$cursor_manager$540:	
C$cursor_manager.c$90$2$34:	
		add a, $FF
		ld (bc), a
		jp A$cursor_manager$682
	
A$cursor_manager$562:	
C$cursor_manager.c$95$1$32:	
C$cursor_manager.c$97$1$35:	
G$engine_cursor_manager_incX$0$0:	
_engine_cursor_manager_incX:	
		ld bc, G$global_cursor_object$0$0	; G$global_cursor_object$0$0 = $C026
		ld a, (bc)
		cp $03
		jr nz, A$cursor_manager$579
		xor a
		ld (bc), a
		jp A$cursor_manager$682
	
A$cursor_manager$579:	
C$cursor_manager.c$104$2$37:	
		inc a
		ld (bc), a
		jp A$cursor_manager$682
	
A$cursor_manager$604:	
C$cursor_manager.c$109$1$35:	
C$cursor_manager.c$111$1$38:	
C$cursor_manager.c$112$1$38:	
G$engine_cursor_manager_decY$0$0:	
_engine_cursor_manager_decY:	
		ld bc, G$global_cursor_object$0$0 + 1	; G$global_cursor_object$0$0 + 1 = $C027
		ld a, (bc)
		or a
		jr nz, A$cursor_manager$618
		ld a, $02
		ld (bc), a
		jp A$cursor_manager$682
	
A$cursor_manager$618:	
C$cursor_manager.c$118$2$40:	
		add a, $FF
		ld (bc), a
		jp A$cursor_manager$682
	
A$cursor_manager$643:	
C$cursor_manager.c$123$1$38:	
C$cursor_manager.c$125$1$41:	
C$cursor_manager.c$126$1$41:	
G$engine_cursor_manager_incY$0$0:	
_engine_cursor_manager_incY:	
		ld bc, G$global_cursor_object$0$0 + 1	; G$global_cursor_object$0$0 + 1 = $C027
		ld a, (bc)
		cp $02
		jr nz, A$cursor_manager$657
		xor a
		ld (bc), a
		jp A$cursor_manager$682
	
A$cursor_manager$657:	
C$cursor_manager.c$132$2$43:	
		inc a
		ld (bc), a
		jp A$cursor_manager$682
	
A$cursor_manager$682:	
C$cursor_manager.c$138$1$41:	
C$cursor_manager.c$140$1$44:	
C$cursor_manager.c$141$1$44:	
Fcursor_manager$update_values$0$:	
		ld bc, G$cursor_gridX$0$0	; G$cursor_gridX$0$0 = $1146
		ld hl, G$global_cursor_object$0$0	; G$global_cursor_object$0$0 = $C026
		ld l, (hl)
		ld h, $00
		add hl, bc
		ld c, (hl)
		ld de, G$cursor_gridY$0$0	; G$cursor_gridY$0$0 = $114A
		ld hl, G$global_cursor_object$0$0	; G$global_cursor_object$0$0 = $C026
		inc hl
		ld l, (hl)
		ld h, $00
		add hl, de
		ld e, (hl)
		dec c
		ld a, c
		rlca
		rlca
		rlca
		and $F8
		ld d, a
		ld hl, G$global_cursor_object$0$0 + 2	; G$global_cursor_object$0$0 + 2 = $C028
		ld (hl), d
		ld bc, G$global_cursor_object$0$0 + 3	; G$global_cursor_object$0$0 + 3 = $C029
		dec e
		ld a, e
		rlca
		rlca
		rlca
		and $F8
		ld e, a
		ld (bc), a
		inc d
		ld (hl), d
		dec e
		ld a, e
		ld (bc), a
		ret
	
