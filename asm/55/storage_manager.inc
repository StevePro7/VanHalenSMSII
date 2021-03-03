A$storage_manager$65:	
C$storage_manager.c$16$0$0:	
C$storage_manager.c$18$1$18:	
G$engine_storage_manager_availab:	
_engine_storage_manager_availabl:	
		call A$_sms_manager$305
		push hl
		call A$_sms_manager$242
		pop hl
		ld c, (hl)
		inc hl
		ld b, (hl)
		inc hl
		ld e, (hl)
		inc hl
		ld d, (hl)
		ld a, c
		sub $04
		jr nz, A$storage_manager$97
		ld a, b
		sub $B0
		jr nz, A$storage_manager$97
		ld a, e
		sub $E0
		jr nz, A$storage_manager$97
		ld a, d
		sub $AC
		jr nz, A$storage_manager$97
		ld a, $01
		jr A$storage_manager$99
	
A$storage_manager$97:	
		xor a
A$storage_manager$99:	
		ld l, a
		push hl
		call A$_sms_manager$286
		pop hl
		ret
	
A$storage_manager$126:	
C$storage_manager.c$27$1$18:	
C$storage_manager.c$29$1$19:	
G$engine_storage_manager_read$0$:	
_engine_storage_manager_read:	
		call A$_sms_manager$305
		push hl
		call A$_sms_manager$242
		pop iy
		ld c, (iy+4)
		ld hl, G$global_record_object$0$0	; G$global_record_object$0$0 = $C02A
		ld (hl), c
		jp A$_sms_manager$286
	
A$storage_manager$159:	
C$storage_manager.c$37$1$19:	
C$storage_manager.c$39$1$20:	
G$engine_storage_manager_write$0:	
_engine_storage_manager_write:	
		call A$_sms_manager$305
		push hl
		call A$_sms_manager$242
		pop bc
		ld l, c
		ld h, b
		ld (hl), $04
		inc hl
		ld (hl), $B0
		inc hl
		ld (hl), $E0
		inc hl
		ld (hl), $AC
		ld hl, $0004
		add hl, bc
		ex de, hl
		ld a, (G$global_record_object$0$0)	; G$global_record_object$0$0 = $C02A
		ld (de), a
		ld hl, $0005
		add hl, bc
		ld (hl), $FE
		jp A$_sms_manager$286
	
A$storage_manager$215:	
C$storage_manager.c$49$1$20:	
C$storage_manager.c$51$1$21:	
G$engine_storage_manager_erase$0:	
_engine_storage_manager_erase:	
		call A$_sms_manager$305
		push hl
		call A$_sms_manager$242
		pop bc
		ld l, c
		ld h, b
		xor a
		ld (hl), a
		inc hl
		ld (hl), a
		inc hl
		xor a
		ld (hl), a
		inc hl
		ld (hl), a
		ld hl, $0004
		add hl, bc
		ld (hl), $00
		ld hl, $0005
		add hl, bc
		ld (hl), $FE
		jp A$_sms_manager$286