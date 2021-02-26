; Data from 119D to 119F (3 bytes)
_screen_splash_screen_load:
		call $082B
		call $0AA2
		call $0AB8
		call $0825
		ld hl, $0096
		push hl
		call $10CD
		ld hl, $004B
		ex (sp), hl
		call $1108
		pop af
		ret

; Data from 11B9 to 11BA (2 bytes)
_screen_splash_screen_update:
		push ix
		ld ix, $0000
		add ix, sp
		push af
		call $10E6
		ld (ix - 2), l
		ld a, $10
		push af
		inc sp
		call _engine_input_manager_hold
		inc sp
		ld (ix - 1), l
		ld a, $20
		push af
		inc sp
		call $0F00
		inc sp
		ld a, l
		or a
		jr z, $1C
		call $111D
		ld a, l
		or a
		jr z, $18
		call $10AB
		call $113F
		ld hl, $171C
		push hl
		ld hl, $121B
		push hl
		call $0DE9
		pop af
		pop af
		jr +
		call $113F
	+:
		ld l, (ix + $04)
		ld h, (ix + $05)
		ld a, (ix - 2)
		or a
		jr nz, ++
		ld a, (ix - 1)
		or a
		jr z, $04
		
	++:
		ld (hl), $02
		jr +++
		ld (hl), $01
		
	+++:
		ld sp, ix
		pop ix
		ret

; Data from 121B to 121F (5 bytes)
; "5150"
	.db $35 $31 $35 $30 $00
