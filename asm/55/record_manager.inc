A$record_manager$69:	
C$record_manager.c$12$0$0:	
C$record_manager.c$14$1$19:	
C$record_manager.c$15$1$19:	
G$engine_record_manager_init$0$0:	
_engine_record_manager_init:	
		ld hl, G$global_record_object$0$0	; G$global_record_object$0$0 = $C02A
		ld iy, $0002
		add iy, sp
		ld a, (iy+0)
		ld (hl), a
		ret
	
A$record_manager$88:	
C$record_manager.c$17$1$19:	
G$engine_record_manager_load$0$0:	
_engine_record_manager_load:	
		push ix
		ld ix, $0000
		add ix, sp
		dec sp
		ld a, (G$global_record_object$0$0)	; G$global_record_object$0$0 = $C02A
		ld (ix-1), a
		ld l, a
		ld h, $00
		add hl, hl
		ld c, l
		ld b, h
		ld hl, G$record_tiles_data$0$0	; G$record_tiles_data$0$0 = $C162
		add hl, bc
		ld e, (hl)
		inc hl
		ld d, (hl)
		ld hl, G$record_tilemap_data$0$0	; G$record_tilemap_data$0$0 = $C17A
		add hl, bc
		ld c, (hl)
		inc hl
		ld b, (hl)
		ld a, (ix-1)
		add a, $89
		ld l, a
		ld a, $00
		adc a, $11
		ld h, a
		ld h, (hl)
		push bc
		push de
		push hl
		inc sp
		call A$_sms_manager$181
		inc sp
		pop de
		ld hl, $0000
		push hl
		push de
		call A$_sms_manager$400
		pop af
		ld hl, $0000
		ex (sp), hl
		call A$_sms_manager$432
		pop af
		pop af
		ld hl, (G$record_palette_data$0$0)	; G$record_palette_data$0$0 = $C192
		push hl
		call A$_sms_manager$472
		pop af
		inc sp
		pop ix
		ret
	
A$record_manager$177:	
C$record_manager.c$34$1$20:	
C$record_manager.c$36$1$21:	
G$engine_record_manager_decremen:	
_engine_record_manager_decrement:	
		ld bc, G$global_record_object$0$0	; G$global_record_object$0$0 = $C02A
		ld a, (bc)
		or a
		jr nz, A$record_manager$194
		ld a, $0B
		ld (bc), a
		ret
	
A$record_manager$194:	
C$record_manager.c$43$2$23:	
		add a, $FF
		ld (bc), a
		ret
	
A$record_manager$213:	
C$record_manager.c$46$1$21:	
C$record_manager.c$48$1$24:	
G$engine_record_manager_incremen:	
_engine_record_manager_increment:	
		ld bc, G$global_record_object$0$0	; G$global_record_object$0$0 = $C02A
		ld a, (bc)
		cp $0B
		jr nz, A$record_manager$230
		xor a
		ld (bc), a
		ret
	
A$record_manager$230:	
C$record_manager.c$55$2$26:	
		inc a
		ld (bc), a
		ret