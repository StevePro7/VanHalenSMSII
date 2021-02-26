; Data from B67 to B69 (3 bytes)
_engine_cursor_manager_init:
	;.db $01 $26 $C0
	ld bc, cursor_index_x		; cursor_index_x = $C026

; Data from B6A to B6A (1 bytes)
	xor a

; Data from B6B to B6B (1 bytes)
	;ld (bc), a
	ld (bc),a

; Data from B6C to B6E (3 bytes)
	;.db $21 $27 $C0
	ld hl, cursor_index_y		; cursor_index_y = $C027

; Data from B6F to B70 (2 bytes)
	;.db $36 $00
	ld (hl),$00

; Data from B71 to B71 (1 bytes)
	push bc

; Data from B72 to B73 (2 bytes)
	;.db $3E $03
	ld a, $03					; MAX_GRID_Y	3

; Data from B74 to B74 (1 bytes)
	push af

; Data from B75 to B75 (1 bytes)
	inc sp

; Data from B76 to B78 (3 bytes)
	;.db $21 $05 $00
	ld hl, $0005

; Data from B79 to B79 (1 bytes)
	;add hl, sp
	add hl, sp

; Data from B7A to B7A (1 bytes)
	ld a, (hl)

; Data from B7B to B7B (1 bytes)
	push af

; Data from B7C to B7C (1 bytes)
	inc sp

; Data from B7D to B7F (3 bytes)
	call __divuchar

; Data from B80 to B80 (1 bytes)
	pop af

; Data from B81 to B81 (1 bytes)
	ld a, l

; Data from B82 to B82 (1 bytes)
	pop bc

; Data from B83 to B83 (1 bytes)
	ld (bc), a

; Data from B84 to B85 (2 bytes)
	;.db $3E $03
	ld a, 03

; Data from B86 to B86 (1 bytes)
	push af

; Data from B87 to B87 (1 bytes)
	inc sp

; Data from B88 to B8A (3 bytes)
	;.db $21 $03 $00
	ld hl, $0003

; Data from B8B to B8B (1 bytes)
	add hl, sp

; Data from B8C to B8C (1 bytes)
	ld a, (hl)

; Data from B8D to B8D (1 bytes)
	push af

; Data from B8E to B8E (1 bytes)
	inc sp

; Data from B8F to B91 (3 bytes)
	call __moduchar

; Data from B92 to B92 (1 bytes)
	pop af

; Data from B93 to B93 (1 bytes)
	ld c, l

; Data from B94 to B96 (3 bytes)
	;.db $21 $27 $C0
	ld hl, cursor_index_y			; cursor_index_y = $C027

; Data from B97 to B97 (1 bytes)
	;.db $71
	ld (hl), c

; Data from B98 to B9A (3 bytes)
	;jp $0D88
	jp $0D88

; Data from B9B to B9C (2 bytes)
_engine_cursor_manager_load:
	.db $DD $E5

; Data from B9D to BA0 (4 bytes)
	.db $DD $21 $00 $00

; Data from BA1 to BA2 (2 bytes)
	.db $DD $39

; Data from BA3 to BA3 (1 bytes)
	push af

; Data from BA4 to BA4 (1 bytes)
	push af

; Data from BA5 to BA8 (4 bytes)
	.db $DD $36 $FD $00

; Data from BA9 to BAA (2 bytes)
	.db $3E $4A

; Data from BAB to BAD (3 bytes)
	.db $DD $86 $FD

; Data from BAE to BB0 (3 bytes)
	.db $DD $77 $FE

; Data from BB1 to BB2 (2 bytes)
	.db $3E $11

; Data from BB3 to BB4 (2 bytes)
	.db $CE $00

; Data from BB5 to BB7 (3 bytes)
	.db $DD $77 $FF

; Data from BB8 to BB9 (2 bytes)
	.db $0E $00

; Data from BBA to BBA (1 bytes)
	ld l, c

; Data from BBB to BBB (1 bytes)
	add hl, hl

; Data from BBC to BBC (1 bytes)
	add hl, bc

; Data from BBD to BBD (1 bytes)
	ld a, l

; Data from BBE to BC0 (3 bytes)
	.db $DD $86 $FD

; Data from BC1 to BC1 (1 bytes)
	.db $5F

; Data from BC2 to BC4 (3 bytes)
	.db $21 $46 $11

; Data from BC5 to BC6 (2 bytes)
	.db $06 $00

; Data from BC7 to BC7 (1 bytes)
	add hl, bc

; Data from BC8 to BC8 (1 bytes)
	.db $46

; Data from BC9 to BCB (3 bytes)
	.db $DD $6E $FE

; Data from BCC to BCE (3 bytes)
	.db $DD $66 $FF

; Data from BCF to BCF (1 bytes)
	ld a, (hl)

; Data from BD0 to BD2 (3 bytes)
	.db $DD $77 $FC

; Data from BD3 to BD4 (2 bytes)
	.db $26 $00

; Data from BD5 to BD5 (1 bytes)
	.db $6B

; Data from BD6 to BD6 (1 bytes)
	add hl, hl

; Data from BD7 to BD9 (3 bytes)
	.db $11 $4A $C1

; Data from BDA to BDA (1 bytes)
	.db $19

; Data from BDB to BDB (1 bytes)
	.db $5E

; Data from BDC to BDC (1 bytes)
	.db $23

; Data from BDD to BDD (1 bytes)
	.db $56

; Data from BDE to BE0 (3 bytes)
	.db $DD $7E $FC

; Data from BE1 to BE3 (3 bytes)
	.db $DD $86 $04

; Data from BE4 to BE4 (1 bytes)
	.db $C5

; Data from BE5 to BE5 (1 bytes)
	push af

; Data from BE6 to BE6 (1 bytes)
	inc sp

; Data from BE7 to BE7 (1 bytes)
	.db $C5

; Data from BE8 to BE8 (1 bytes)
	inc sp

; Data from BE9 to BE9 (1 bytes)
	.db $D5

; Data from BEA to BEC (3 bytes)
	call _engine_font_manager_draw_text

; Data from BED to BED (1 bytes)
	pop af

; Data from BEE to BEE (1 bytes)
	pop af

; Data from BEF to BEF (1 bytes)
	pop bc

; Data from BF0 to BF0 (1 bytes)
	.db $0C

; Data from BF1 to BF1 (1 bytes)
	.db $79

; Data from BF2 to BF3 (2 bytes)
	.db $D6 $04

; Data from BF4 to BF5 (2 bytes)
	.db $38 $C4

; Data from BF6 to BF8 (3 bytes)
	.db $DD $34 $FD

; Data from BF9 to BFB (3 bytes)
	.db $DD $7E $FD

; Data from BFC to BFD (2 bytes)
	.db $D6 $03

; Data from BFE to BFF (2 bytes)
	.db $38 $A9

; Data from C00 to C01 (2 bytes)
	.db $DD $F9

; Data from C02 to C03 (2 bytes)
	.db $DD $E1

; Data from C04 to C04 (1 bytes)
	.db $C9

; Data from C05 to C07 (3 bytes)
_engine_cursor_manager_save:
	.db $3A $26 $C0

; Data from C08 to C08 (1 bytes)
	.db $4F

; Data from C09 to C09 (1 bytes)
	.db $87

; Data from C0A to C0A (1 bytes)
	.db $81

; Data from C0B to C0B (1 bytes)
	.db $4F

; Data from C0C to C0E (3 bytes)
	.db $21 $26 $C0

; Data from C0F to C0F (1 bytes)
	.db $23

; Data from C10 to C10 (1 bytes)
	.db $6E

; Data from C11 to C11 (1 bytes)
	add hl, bc

; Data from C12 to C12 (1 bytes)
	.db $C9

; Data from C13 to C14 (2 bytes)
_engine_cursor_manager_draw:
	.db $DD $E5

; Data from C15 to C18 (4 bytes)
	.db $DD $21 $00 $00

; Data from C19 to C1A (2 bytes)
	.db $DD $39

; Data from C1B to C1B (1 bytes)
	push af

; Data from C1C to C1C (1 bytes)
	push af

; Data from C1D to C1F (3 bytes)
	.db $21 $26 $C0

; Data from C20 to C20 (1 bytes)
	.db $23

; Data from C21 to C21 (1 bytes)
	.db $23

; Data from C22 to C22 (1 bytes)
	.db $4E

; Data from C23 to C25 (3 bytes)
	.db $21 $26 $C0

; Data from C26 to C26 (1 bytes)
	.db $23

; Data from C27 to C27 (1 bytes)
	.db $23

; Data from C28 to C28 (1 bytes)
	.db $23

; Data from C29 to C29 (1 bytes)
	.db $46

; Data from C2A to C2A (1 bytes)
	.db $C5

; Data from C2B to C2D (3 bytes)
	.db $21 $20 $01

; Data from C2E to C2E (1 bytes)
	.db $E5

; Data from C2F to C2F (1 bytes)
	.db $C5

; Data from C30 to C32 (3 bytes)
	;call _devkit_SMS_addSprite
	call _devkit_SMS_addSprite

; Data from C33 to C33 (1 bytes)
	pop af

; Data from C34 to C34 (1 bytes)
	pop af

; Data from C35 to C35 (1 bytes)
	pop bc

; Data from C36 to C36 (1 bytes)
	.db $79

; Data from C37 to C38 (2 bytes)
	.db $C6 $28

; Data from C39 to C39 (1 bytes)
	.db $5F

; Data from C3A to C3A (1 bytes)
	.db $C5

; Data from C3B to C3B (1 bytes)
	.db $D5

; Data from C3C to C3E (3 bytes)
	.db $21 $25 $01

; Data from C3F to C3F (1 bytes)
	.db $E5

; Data from C40 to C40 (1 bytes)
	.db $C5

; Data from C41 to C41 (1 bytes)
	inc sp

; Data from C42 to C42 (1 bytes)
	.db $7B

; Data from C43 to C43 (1 bytes)
	push af

; Data from C44 to C44 (1 bytes)
	inc sp

; Data from C45 to C47 (3 bytes)
	;call _devkit_SMS_addSprite
	call _devkit_SMS_addSprite

; Data from C48 to C48 (1 bytes)
	pop af

; Data from C49 to C49 (1 bytes)
	pop af

; Data from C4A to C4A (1 bytes)
	.db $D1

; Data from C4B to C4B (1 bytes)
	pop bc

; Data from C4C to C4C (1 bytes)
	.db $78

; Data from C4D to C4E (2 bytes)
	.db $C6 $10

; Data from C4F to C4F (1 bytes)
	.db $57

; Data from C50 to C50 (1 bytes)
	.db $C5

; Data from C51 to C51 (1 bytes)
	.db $D5

; Data from C52 to C54 (3 bytes)
	.db $21 $2C $01

; Data from C55 to C55 (1 bytes)
	.db $E5

; Data from C56 to C56 (1 bytes)
	.db $59

; Data from C57 to C57 (1 bytes)
	.db $D5

; Data from C58 to C5A (3 bytes)
	;call _devkit_SMS_addSprite
	call _devkit_SMS_addSprite

; Data from C5B to C5B (1 bytes)
	pop af

; Data from C5C to C5C (1 bytes)
	pop af

; Data from C5D to C5D (1 bytes)
	.db $D1

; Data from C5E to C5E (1 bytes)
	.db $D5

; Data from C5F to C61 (3 bytes)
	.db $21 $31 $01

; Data from C62 to C62 (1 bytes)
	.db $E5

; Data from C63 to C63 (1 bytes)
	.db $D5

; Data from C64 to C66 (3 bytes)
	;call _devkit_SMS_addSprite
	call _devkit_SMS_addSprite

; Data from C67 to C67 (1 bytes)
	pop af

; Data from C68 to C68 (1 bytes)
	pop af

; Data from C69 to C69 (1 bytes)
	.db $D1

; Data from C6A to C6A (1 bytes)
	pop bc

; Data from C6B to C6B (1 bytes)
	.db $79

; Data from C6C to C6D (2 bytes)
	.db $C6 $08

; Data from C6E to C70 (3 bytes)
	.db $DD $77 $FC

; Data from C71 to C71 (1 bytes)
	.db $C5

; Data from C72 to C72 (1 bytes)
	.db $D5

; Data from C73 to C75 (3 bytes)
	.db $21 $21 $01

; Data from C76 to C76 (1 bytes)
	.db $E5

; Data from C77 to C77 (1 bytes)
	.db $C5

; Data from C78 to C78 (1 bytes)
	inc sp

; Data from C79 to C7B (3 bytes)
	.db $DD $7E $FC

; Data from C7C to C7C (1 bytes)
	push af

; Data from C7D to C7D (1 bytes)
	inc sp

; Data from C7E to C80 (3 bytes)
	;call _devkit_SMS_addSprite
	call _devkit_SMS_addSprite

; Data from C81 to C81 (1 bytes)
	pop af

; Data from C82 to C82 (1 bytes)
	pop af

; Data from C83 to C83 (1 bytes)
	.db $D1

; Data from C84 to C84 (1 bytes)
	pop bc

; Data from C85 to C85 (1 bytes)
	.db $79

; Data from C86 to C87 (2 bytes)
	.db $C6 $10

; Data from C88 to C8A (3 bytes)
	.db $DD $77 $FF

; Data from C8B to C8B (1 bytes)
	.db $C5

; Data from C8C to C8C (1 bytes)
	.db $D5

; Data from C8D to C8F (3 bytes)
	.db $21 $22 $01

; Data from C90 to C90 (1 bytes)
	.db $E5

; Data from C91 to C91 (1 bytes)
	.db $C5

; Data from C92 to C92 (1 bytes)
	inc sp

; Data from C93 to C95 (3 bytes)
	.db $DD $7E $FF

; Data from C96 to C96 (1 bytes)
	push af

; Data from C97 to C97 (1 bytes)
	inc sp

; Data from C98 to C9A (3 bytes)
	call _devkit_SMS_addSprite

; Data from C9B to C9B (1 bytes)
	pop af

; Data from C9C to C9C (1 bytes)
	pop af

; Data from C9D to C9D (1 bytes)
	.db $D1

; Data from C9E to C9E (1 bytes)
	pop bc

; Data from C9F to C9F (1 bytes)
	.db $79

; Data from CA0 to CA1 (2 bytes)
	.db $C6 $18

; Data from CA2 to CA4 (3 bytes)
	.db $DD $77 $FE

; Data from CA5 to CA5 (1 bytes)
	.db $C5

; Data from CA6 to CA6 (1 bytes)
	.db $D5

; Data from CA7 to CA9 (3 bytes)
	.db $21 $23 $01

; Data from CAA to CAA (1 bytes)
	.db $E5

; Data from CAB to CAB (1 bytes)
	.db $C5

; Data from CAC to CAC (1 bytes)
	inc sp

; Data from CAD to CAF (3 bytes)
	.db $DD $7E $FE

; Data from CB0 to CB0 (1 bytes)
	push af

; Data from CB1 to CB1 (1 bytes)
	inc sp

; Data from CB2 to CB4 (3 bytes)
	call _devkit_SMS_addSprite

; Data from CB5 to CB5 (1 bytes)
	pop af

; Data from CB6 to CB6 (1 bytes)
	pop af

; Data from CB7 to CB7 (1 bytes)
	.db $D1

; Data from CB8 to CB8 (1 bytes)
	pop bc

; Data from CB9 to CB9 (1 bytes)
	.db $79

; Data from CBA to CBB (2 bytes)
	.db $C6 $20

; Data from CBC to CBE (3 bytes)
	.db $DD $77 $FD

; Data from CBF to CBF (1 bytes)
	.db $C5

; Data from CC0 to CC0 (1 bytes)
	.db $D5

; Data from CC1 to CC3 (3 bytes)
	.db $21 $24 $01

; Data from CC4 to CC4 (1 bytes)
	.db $E5

; Data from CC5 to CC5 (1 bytes)
	.db $C5

; Data from CC6 to CC6 (1 bytes)
	inc sp

; Data from CC7 to CC9 (3 bytes)
	.db $DD $7E $FD

; Data from CCA to CCA (1 bytes)
	push af

; Data from CCB to CCB (1 bytes)
	inc sp

; Data from CCC to CCE (3 bytes)
	call _devkit_SMS_addSprite

; Data from CCF to CCF (1 bytes)
	pop af

; Data from CD0 to CD0 (1 bytes)
	pop af

; Data from CD1 to CD1 (1 bytes)
	.db $D1

; Data from CD2 to CD2 (1 bytes)
	pop bc

; Data from CD3 to CD3 (1 bytes)
	.db $78

; Data from CD4 to CD5 (2 bytes)
	.db $C6 $08

; Data from CD6 to CD6 (1 bytes)
	.db $47

; Data from CD7 to CD7 (1 bytes)
	.db $C5

; Data from CD8 to CD8 (1 bytes)
	.db $D5

; Data from CD9 to CDB (3 bytes)
	.db $21 $26 $01

; Data from CDC to CDC (1 bytes)
	.db $E5

; Data from CDD to CDD (1 bytes)
	.db $C5

; Data from CDE to CE0 (3 bytes)
	call _devkit_SMS_addSprite

; Data from CE1 to CE1 (1 bytes)
	pop af

; Data from CE2 to CE2 (1 bytes)
	pop af

; Data from CE3 to CE3 (1 bytes)
	.db $D1

; Data from CE4 to CE4 (1 bytes)
	pop bc

; Data from CE5 to CE5 (1 bytes)
	.db $D5

; Data from CE6 to CE8 (3 bytes)
	.db $21 $2B $01

; Data from CE9 to CE9 (1 bytes)
	.db $E5

; Data from CEA to CEA (1 bytes)
	.db $C5

; Data from CEB to CEB (1 bytes)
	inc sp

; Data from CEC to CEC (1 bytes)
	.db $7B

; Data from CED to CED (1 bytes)
	push af

; Data from CEE to CEE (1 bytes)
	inc sp

; Data from CEF to CF1 (3 bytes)
	call _devkit_SMS_addSprite

; Data from CF2 to CF2 (1 bytes)
	pop af

; Data from CF3 to CF3 (1 bytes)
	pop af

; Data from CF4 to CF4 (1 bytes)
	.db $D1

; Data from CF5 to CF5 (1 bytes)
	.db $D5

; Data from CF6 to CF8 (3 bytes)
	.db $21 $2D $01

; Data from CF9 to CF9 (1 bytes)
	.db $E5

; Data from CFA to CFA (1 bytes)
	.db $D5

; Data from CFB to CFB (1 bytes)
	inc sp

; Data from CFC to CFE (3 bytes)
	.db $DD $7E $FC

; Data from CFF to CFF (1 bytes)
	push af

; Data from D00 to D00 (1 bytes)
	inc sp

; Data from D01 to D03 (3 bytes)
	call _devkit_SMS_addSprite

; Data from D04 to D04 (1 bytes)
	pop af

; Data from D05 to D05 (1 bytes)
	pop af

; Data from D06 to D06 (1 bytes)
	.db $D1

; Data from D07 to D07 (1 bytes)
	.db $D5

; Data from D08 to D0A (3 bytes)
	.db $21 $2E $01

; Data from D0B to D0B (1 bytes)
	.db $E5

; Data from D0C to D0C (1 bytes)
	.db $D5

; Data from D0D to D0D (1 bytes)
	inc sp

; Data from D0E to D10 (3 bytes)
	.db $DD $7E $FF

; Data from D11 to D11 (1 bytes)
	push af

; Data from D12 to D12 (1 bytes)
	inc sp

; Data from D13 to D15 (3 bytes)
	call _devkit_SMS_addSprite

; Data from D16 to D16 (1 bytes)
	pop af

; Data from D17 to D17 (1 bytes)
	pop af

; Data from D18 to D18 (1 bytes)
	.db $D1

; Data from D19 to D19 (1 bytes)
	.db $D5

; Data from D1A to D1C (3 bytes)
	.db $21 $2F $01

; Data from D1D to D1D (1 bytes)
	.db $E5

; Data from D1E to D1E (1 bytes)
	.db $D5

; Data from D1F to D1F (1 bytes)
	inc sp

; Data from D20 to D22 (3 bytes)
	.db $DD $7E $FE

; Data from D23 to D23 (1 bytes)
	push af

; Data from D24 to D24 (1 bytes)
	inc sp

; Data from D25 to D27 (3 bytes)
	call _devkit_SMS_addSprite

; Data from D28 to D28 (1 bytes)
	pop af

; Data from D29 to D29 (1 bytes)
	pop af

; Data from D2A to D2A (1 bytes)
	.db $D1

; Data from D2B to D2D (3 bytes)
	.db $21 $30 $01

; Data from D2E to D2E (1 bytes)
	.db $E5

; Data from D2F to D2F (1 bytes)
	.db $D5

; Data from D30 to D30 (1 bytes)
	inc sp

; Data from D31 to D33 (3 bytes)
	.db $DD $7E $FD

; Data from D34 to D34 (1 bytes)
	push af

; Data from D35 to D35 (1 bytes)
	inc sp

; Data from D36 to D38 (3 bytes)
	call _devkit_SMS_addSprite

; Data from D39 to D3A (2 bytes)
	.db $DD $F9

; Data from D3B to D3C (2 bytes)
	.db $DD $E1

; Data from D3D to D3D (1 bytes)
	.db $C9

; Data from D3E to D40 (3 bytes)
_engine_cursor_manager_decX:
	.db $01 $26 $C0

; Data from D41 to D41 (1 bytes)
	.db $0A

; Data from D42 to D42 (1 bytes)
	.db $B7

; Data from D43 to D44 (2 bytes)
	.db $20 $06

; Data from D45 to D46 (2 bytes)
	.db $3E $03

; Data from D47 to D47 (1 bytes)
	ld (bc), a

; Data from D48 to D4A (3 bytes)
	jp $0D88

; Data from D4B to D4C (2 bytes)
	.db $C6 $FF

; Data from D4D to D4D (1 bytes)
	ld (bc), a

; Data from D4E to D50 (3 bytes)
	jp $0D88

; Data from D51 to D53 (3 bytes)
_engine_cursor_manager_incX:
	.db $01 $26 $C0

; Data from D54 to D54 (1 bytes)
	.db $0A

; Data from D55 to D56 (2 bytes)
	.db $FE $03

; Data from D57 to D58 (2 bytes)
	.db $20 $05

; Data from D59 to D59 (1 bytes)
	.db $AF

; Data from D5A to D5A (1 bytes)
	ld (bc), a

; Data from D5B to D5D (3 bytes)
	jp $0D88

; Data from D5E to D5E (1 bytes)
	.db $3C

; Data from D5F to D5F (1 bytes)
	ld (bc), a

; Data from D60 to D62 (3 bytes)
	jp $0D88

; Data from D63 to D65 (3 bytes)
_engine_cursor_manager_decY:
	.db $01 $27 $C0

; Data from D66 to D66 (1 bytes)
	.db $0A

; Data from D67 to D67 (1 bytes)
	.db $B7

; Data from D68 to D69 (2 bytes)
	.db $20 $06

; Data from D6A to D6B (2 bytes)
	.db $3E $02

; Data from D6C to D6C (1 bytes)
	ld (bc), a

; Data from D6D to D6F (3 bytes)
	jp $0D88

; Data from D70 to D71 (2 bytes)
	.db $C6 $FF

; Data from D72 to D72 (1 bytes)
	ld (bc), a

; Data from D73 to D75 (3 bytes)
	jp $0D88

; Data from D76 to D78 (3 bytes)
_engine_cursor_manager_incY:
	.db $01 $27 $C0

; Data from D79 to D79 (1 bytes)
	.db $0A

; Data from D7A to D7B (2 bytes)
	.db $FE $02

; Data from D7C to D7D (2 bytes)
	.db $20 $05

; Data from D7E to D7E (1 bytes)
	.db $AF

; Data from D7F to D7F (1 bytes)
	ld (bc), a

; Data from D80 to D82 (3 bytes)
	jp $0D88

; Data from D83 to D83 (1 bytes)
	.db $3C

; Data from D84 to D84 (1 bytes)
	ld (bc), a

; Data from D85 to D87 (3 bytes)
	jp $0D88

; Data from D88 to D8A (3 bytes)
	.db $01 $46 $11

; Data from D8B to D8D (3 bytes)
	.db $21 $26 $C0

; Data from D8E to D8E (1 bytes)
	.db $6E

; Data from D8F to D90 (2 bytes)
	.db $26 $00

; Data from D91 to D91 (1 bytes)
	add hl, bc

; Data from D92 to D92 (1 bytes)
	.db $4E

; Data from D93 to D95 (3 bytes)
	.db $11 $4A $11

; Data from D96 to D98 (3 bytes)
	.db $21 $26 $C0

; Data from D99 to D99 (1 bytes)
	.db $23

; Data from D9A to D9A (1 bytes)
	.db $6E

; Data from D9B to D9C (2 bytes)
	.db $26 $00

; Data from D9D to D9D (1 bytes)
	.db $19

; Data from D9E to D9E (1 bytes)
	.db $5E

; Data from D9F to D9F (1 bytes)
	.db $0D

; Data from DA0 to DA0 (1 bytes)
	.db $79

; Data from DA1 to DA1 (1 bytes)
	.db $07

; Data from DA2 to DA2 (1 bytes)
	.db $07

; Data from DA3 to DA3 (1 bytes)
	.db $07

; Data from DA4 to DA5 (2 bytes)
	.db $E6 $F8

; Data from DA6 to DA6 (1 bytes)
	.db $57

; Data from DA7 to DA9 (3 bytes)
	.db $21 $28 $C0

; Data from DAA to DAA (1 bytes)
	.db $72

; Data from DAB to DAD (3 bytes)
	.db $01 $29 $C0

; Data from DAE to DAE (1 bytes)
	.db $1D

; Data from DAF to DAF (1 bytes)
	.db $7B

; Data from DB0 to DB0 (1 bytes)
	.db $07

; Data from DB1 to DB1 (1 bytes)
	.db $07

; Data from DB2 to DB2 (1 bytes)
	.db $07

; Data from DB3 to DB4 (2 bytes)
	.db $E6 $F8

; Data from DB5 to DB5 (1 bytes)
	.db $5F

; Data from DB6 to DB6 (1 bytes)
	ld (bc), a

; Data from DB7 to DB7 (1 bytes)
	.db $14

; Data from DB8 to DB8 (1 bytes)
	.db $72

; Data from DB9 to DB9 (1 bytes)
	.db $1D

; Data from DBA to DBA (1 bytes)
	.db $7B

; Data from DBB to DBB (1 bytes)
	ld (bc), a

; Data from DBC to DBC (1 bytes)
	.db $C9
