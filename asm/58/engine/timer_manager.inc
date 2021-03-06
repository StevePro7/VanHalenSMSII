_engine_delay_manager_load:
		ld hl, delay_object_value		; delay_object_value = $C04C
		ld iy, $0002
		add iy, sp
		ld a, (iy + $00)
		ld (hl), a
		inc hl
		ld a, (iy + $01)
		ld (hl), a
		ld hl, $0000					; dObj->delay_timer = 0;
		ld (delay_object_timer), hl		; delay_object_timer = $C04E
		ret

_engine_delay_manager_update:
		ld bc, (delay_object_timer)		; delay_object_timer = $C04E
		inc bc
		ld (delay_object_timer), bc		; delay_object_timer = $C04E
		ld hl, (delay_object_value)		; delay_object_value = $C04C
		ld a, c
		sub a, l
		ld a, b
		sbc a, h
		ld a, $00
		rla
		xor $01
		ld c, a
		ld b, a
		or a
		jr z, A$timer_manager$133
		ld hl, $0000					; dObj->delay_timer = 0;
		ld (delay_object_timer), hl		; delay_object_timer = $C04E
A$timer_manager$133:
		ld l, b
		ret

_engine_reset_manager_load:
		ld hl, reset_object_value		; reset_object_value = $C050
		ld iy, $0002
		add iy, sp
		ld a, (iy + $00)
		ld (hl), a
		inc hl
		ld a, (iy + $01)
		ld (hl), a
		jp _engine_reset_manager_reset

_engine_reset_manager_update:
		ld bc, (reset_object_timer)		; reset_object_timer = $C052
		inc bc
		ld (reset_object_timer), bc		; reset_object_timer = $C052
		ld hl, (reset_object_value)		; reset_object_value = $C050
		ld a, c
		sub a, l
		ld a, b
		sbc a, h
		ld a, $00
		rla
		xor $01
		ld c, a
		ld b, a
		or a
		jr z, A$timer_manager$215
		ld hl, $0000				; ro->reset_timer = 0;
		ld (reset_object_timer), hl	; reset_object_timer = $C052
A$timer_manager$215:
		ld l, b
		ret

_engine_reset_manager_reset:
		ld hl, $0000					; ro->reset_timer = 0;
		ld (reset_object_timer), hl		; reset_object_timer = $C052
		ret
