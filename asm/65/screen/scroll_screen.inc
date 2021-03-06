.section "Scroll screen" free
; Data from 1389 to 138B (3 bytes)
screen_scroll_screen_load:
		ld hl, scroll_screen_offset		; scroll_screen_offset = $C056
		ld (hl), $00					; offset = 0;
		ret

screen_scroll_screen_update:
		dec sp
		ld a, (scroll_screen_offset)	; scroll_screen_offset = $C056
		sub a, $20						; TOP_SCROLL	32
		jr nz, A$scroll_screen$88
		ld a, $01						; offset++
		jr A$scroll_screen$90
A$scroll_screen$88:
		xor a

A$scroll_screen$90:
		inc sp
		push af
		inc sp
		ld iy, scroll_screen_offset		; scroll_screen_offset = $C056
		ld b, (iy + $00)
		inc (iy + $00)
		push bc
		inc sp
		call devkit_SMS_setBGScrollY
		inc sp
		ld a, $10						; input_type_fire1	16
		push af
		inc sp
		call engine_input_manager_hold
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
		ld a, (iy + $00)
		or a
		jr z, A$scroll_screen$160
A$scroll_screen$136:
		push hl
		ld a, $04						; TOP_OFFSET	4
		push af
		inc sp
		call engine_scroll_manager_load
		inc sp
		ld a, $20						; TOP_SCROLL	32
		push af
		inc sp
		call devkit_SMS_setBGScrollY
		inc sp
		pop hl
		ld (hl), $04					; screen_type_select = 4
		jr A$scroll_screen$162
A$scroll_screen$160:
		ld (hl), $03					; screen_type_scroll = 3
A$scroll_screen$162:
		inc sp
		ret

.ends
