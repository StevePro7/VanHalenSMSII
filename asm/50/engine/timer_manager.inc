; Data from 1163 to 1165 (3 bytes)
_engine_delay_manager_load:
	;.db $21 $4C $C0
	ld hl, $C04C

; Data from 1166 to 1169 (4 bytes)
	;.db $FD $21 $02 $00
	ld iy, $0002

; Data from 116A to 116B (2 bytes)
	;add iy, sp
	add iy, sp

; Data from 116C to 116E (3 bytes)
	;.db $FD $7E $00
	ld a, (iy + $00)

; Data from 116F to 116F (1 bytes)
	ld (hl), a

; Data from 1170 to 1170 (1 bytes)
	inc hl

; Data from 1171 to 1173 (3 bytes)
	;.db $FD $7E $01
	ld a, (iy + $01)

; Data from 1174 to 1174 (1 bytes)
	ld (hl), a

; Data from 1175 to 1177 (3 bytes)
	;.db $21 $00 $00
	ld hl, $0000

; Data from 1178 to 117A (3 bytes)
	;.db $22 $4E $C0
	ld ($C04E), hl

; Data from 117B to 117B (1 bytes)
	ret

; Data from 117C to 117F (4 bytes)
_engine_delay_manager_update:
	;.db $ED $4B $5A $C0
	;.db $ED $4B $4E $C0
	ld bc, ($C04E)

; Data from 1180 to 1180 (1 bytes)
	inc bc

; Data from 1181 to 1184 (4 bytes)
	;.db $ED $43 $5A $C0
	;.db $ED $43 $4E $C0
	ld ($C04E), bc

; Data from 1185 to 1187 (3 bytes)
	;.db $2A $58 $C0
	;.db $2A $4C $C0
	ld hl, ($C04C)

; Data from 1188 to 1188 (1 bytes)
	ld a, c

; Data from 1189 to 1189 (1 bytes)
	sub a, l

; Data from 118A to 118A (1 bytes)
	ld a, b

; Data from 118B to 118B (1 bytes)
	sbc a, h

; Data from 118C to 118D (2 bytes)
	ld a, $00

; Data from 118E to 118E (1 bytes)
	rla

; Data from 118F to 1190 (2 bytes)
	xor $01

; Data from 1191 to 1191 (1 bytes)
	ld c, a

; Data from 1192 to 1192 (1 bytes)
	ld b, a

; Data from 1193 to 1193 (1 bytes)
	or a

; Data from 1194 to 1195 (2 bytes)
	jr z, $06

; Data from 1196 to 1198 (3 bytes)
	;.db $21 $00 $00
	ld hl, $0000

; Data from 1199 to 119B (3 bytes)
	;.db $22 $5A $C0
	;.db $22 $4E $C0
	ld ($C04E), hl
	

; Data from 119C to 119C (1 bytes)
	ld l, b

; Data from 119D to 119D (1 bytes)
	ret

; Data from 119E to 11A0 (3 bytes)
_engine_reset_manager_load:
	;.db $21 $5C $C0
	;.db $21 $50 $C0
	ld hl, $C050

; Data from 11A1 to 11A4 (4 bytes)
	;.db $FD $21 $02 $00
	ld iy, $0002

; Data from 11A5 to 11A6 (2 bytes)
	add iy, sp

; Data from 11A7 to 11A9 (3 bytes)
	;.db $FD $7E $00
	ld a, (iy + $00)

; Data from 11AA to 11AA (1 bytes)
	ld (hl), a

; Data from 11AB to 11AB (1 bytes)
	inc hl

; Data from 11AC to 11AE (3 bytes)
	;.db $FD $7E $01
	ld a, (iy + $01)

; Data from 11AF to 11AF (1 bytes)
	ld (hl), a

; Data from 11B0 to 11B2 (3 bytes)
	;.db $C3 $D5 $11
	jp _engine_reset_manager_reset

; Data from 11B3 to 11B6 (4 bytes)
_engine_reset_manager_update:
	;.db $ED $4B $5E $C0
	;.db $ED $4B $52 $C0
	ld bc, ($C052)

; Data from 11B7 to 11B7 (1 bytes)
	inc bc

; Data from 11B8 to 11BB (4 bytes)
	;.db $ED $43 $5E $C0
	;.db $ED $43 $52 $C0
	ld ($C052), bc

; Data from 11BC to 11BE (3 bytes)
	;.db $2A $5C $C0
	;.db $2A $50 $C0
	ld hl, ($C050)

; Data from 11BF to 11BF (1 bytes)
	ld a, c

; Data from 11C0 to 11C0 (1 bytes)
	sub a, l

; Data from 11C1 to 11C1 (1 bytes)
	ld a, b

; Data from 11C2 to 11C2 (1 bytes)
	sbc a, h

; Data from 11C3 to 11C4 (2 bytes)
	ld a, $00

; Data from 11C5 to 11C5 (1 bytes)
	rla

; Data from 11C6 to 11C7 (2 bytes)
	xor $01

; Data from 11C8 to 11C8 (1 bytes)
	ld c, a

; Data from 11C9 to 11C9 (1 bytes)
	ld b, a

; Data from 11CA to 11CA (1 bytes)
	or a

; Data from 11CB to 11CC (2 bytes)
	jr z, $06

; Data from 11CD to 11CF (3 bytes)
	;.db $21 $00 $00
	ld hl, $0000

; Data from 11D0 to 11D2 (3 bytes)
	;.db $22 $5E $C0
	;.db $22 $52 $C0
	ld ($C052), hl

; Data from 11D3 to 11D3 (1 bytes)
	ld l, b

; Data from 11D4 to 11D4 (1 bytes)
	ret

; Data from 11D5 to 11D7 (3 bytes)
_engine_reset_manager_reset:
	;.db $21 $00 $00
	ld hl, $0000

; Data from 11D8 to 11DA (3 bytes)
	;.db $22 $5E $C0
	;.db $22 $52 $C0
	ld ($C052), hl

; Data from 11DB to 11DB (1 bytes)
	ret
