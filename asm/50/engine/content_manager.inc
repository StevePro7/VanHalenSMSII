; void engine_content_manager_load_tiles()
_engine_content_manager_load_til:
		ld hl, $0000
		push hl
		ld hl, _font__tiles__psgcompr	; _font__tiles__psgcompr = $17A2
		push hl
		call _devkit_SMS_loadPSGaidencompress
		pop af
		pop af
		ld bc, _font__palette__bin		; _font__palette__bin = $1712
		push bc
		call _devkit_SMS_loadBGPalette
		pop af
		ret

; void engine_content_manager_load_splash()
; Data from AB8 to AB9 (2 bytes)
_engine_content_manager_load_spl:
	;.db $3E $02
	ld a, $02							; splash__tiles__psgcompr_bank 2

; Data from ABA to ABA (1 bytes)
	push af

; Data from ABB to ABB (1 bytes)
	inc sp

; Data from ABC to ABE (3 bytes)
	;.db $CD $31 $08
	;call $0831
	call _devkit_SMS_mapROMBank


; Data from ABF to ABF (1 bytes)
	inc sp

; Data from AC0 to AC2 (3 bytes)
	;.db $21 $40 $00
	ld hl, $0040						; #define OPTION_TILES	64

; Data from AC3 to AC3 (1 bytes)
	push hl

; Data from AC4 to AC6 (3 bytes)
	;.db $21 $57 $80
	;ld hl, $8057
	ld hl, _splash__tiles__psgcompr

; Data from AC7 to AC7 (1 bytes)
	push hl

; Data from AC8 to ACA (3 bytes)
	;.db $CD $8E $08
	;call $088E
	call _devkit_SMS_loadPSGaidencompress

; Data from ACB to ACB (1 bytes)
	pop af

; Data from ACC to ACC (1 bytes)
	pop af

; Data from ACD to ACF (3 bytes)
	;.db $01 $10 $80
	;ld bc, $8010
	ld bc, _splash__tilemap__stmcompr

; Data from AD0 to AD0 (1 bytes)
	push bc

; Data from AD1 to AD3 (3 bytes)
	;.db $21 $00 $00
	ld hl, $0000					; devkit_SMS_loadSTMcompressedTileMap( 0, 0, ... )

; Data from AD4 to AD4 (1 bytes)
	push hl

; Data from AD5 to AD7 (3 bytes)
	;.db $CD $A4 $08
	;call $08A4
	call _devkit_SMS_loadSTMcompressedTil

; Data from AD8 to AD8 (1 bytes)
	pop af

; Data from AD9 to AD9 (1 bytes)
	pop af

; Data from ADA to ADC (3 bytes)
	;.db $01 $00 $80
	;ld bc, $8000
	ld bc, _splash__palette__bin

; Data from ADD to ADD (1 bytes)
	push bc

; Data from ADE to AE0 (3 bytes)
	;.db $CD $C5 $08
	;call $08C5
	call _devkit_SMS_loadBGPalette

; Data from AE1 to AE1 (1 bytes)
	pop af

; Data from AE2 to AE2 (1 bytes)
	ret

; void engine_content_manager_load_titleGap()
; Data from AE3 to AE4 (2 bytes)
_engine_content_manager_load_tit:
	.db $3E $03

; Data from AE5 to AE5 (1 bytes)
	push af

; Data from AE6 to AE6 (1 bytes)
	inc sp

; Data from AE7 to AE9 (3 bytes)
	.db $CD $31 $08

; Data from AEA to AEA (1 bytes)
	inc sp

; Data from AEB to AED (3 bytes)
	.db $21 $40 $00

; Data from AEE to AEE (1 bytes)
	push hl

; Data from AEF to AF1 (3 bytes)
	.db $21 $77 $80

; Data from AF2 to AF2 (1 bytes)
	push hl

; Data from AF3 to AF5 (3 bytes)
	.db $CD $8E $08

; Data from AF6 to AF6 (1 bytes)
	pop af

; Data from AF7 to AF7 (1 bytes)
	pop af

; Data from AF8 to AFA (3 bytes)
	.db $01 $10 $80

; Data from AFB to AFB (1 bytes)
	push bc

; Data from AFC to AFE (3 bytes)
	.db $21 $00 $00

; Data from AFF to AFF (1 bytes)
	push hl

; Data from B00 to B02 (3 bytes)
	.db $CD $A4 $08

; Data from B03 to B03 (1 bytes)
	pop af

; Data from B04 to B04 (1 bytes)
	pop af

; Data from B05 to B07 (3 bytes)
	.db $01 $00 $80

; Data from B08 to B08 (1 bytes)
	push bc

; Data from B09 to B0B (3 bytes)
	.db $CD $C5 $08

; Data from B0C to B0C (1 bytes)
	pop af

; Data from B0D to B0F (3 bytes)
	.db $21 $03 $03

; Data from B10 to B10 (1 bytes)
	push hl

; Data from B11 to B12 (2 bytes)
	.db $2E $0F

; Data from B13 to B13 (1 bytes)
	push hl

; Data from B14 to B16 (3 bytes)
	.db $CD $D3 $08

; Data from B17 to B17 (1 bytes)
	pop af

; Data from B18 to B18 (1 bytes)
	pop af

; Data from B19 to B19 (1 bytes)
	ret

; Data from B1A to B1B (2 bytes)
_fngine_content_manager_load_tit:
	.db $3E $03

; Data from B1C to B1C (1 bytes)
	push af

; Data from B1D to B1D (1 bytes)
	inc sp

; Data from B1E to B20 (3 bytes)
	.db $CD $31 $08

; Data from B21 to B21 (1 bytes)
	inc sp

; Data from B22 to B24 (3 bytes)
	.db $21 $40 $00

; Data from B25 to B25 (1 bytes)
	push hl

; Data from B26 to B28 (3 bytes)
	.db $21 $45 $93

; Data from B29 to B29 (1 bytes)
	push hl

; Data from B2A to B2C (3 bytes)
	.db $CD $8E $08

; Data from B2D to B2D (1 bytes)
	pop af

; Data from B2E to B2E (1 bytes)
	pop af

; Data from B2F to B31 (3 bytes)
	.db $01 $E8 $92

; Data from B32 to B32 (1 bytes)
	push bc

; Data from B33 to B35 (3 bytes)
	.db $21 $00 $00

; Data from B36 to B36 (1 bytes)
	push hl

; Data from B37 to B39 (3 bytes)
	.db $CD $A4 $08

; Data from B3A to B3A (1 bytes)
	pop af

; Data from B3B to B3B (1 bytes)
	pop af

; Data from B3C to B3E (3 bytes)
	.db $01 $D8 $92

; Data from B3F to B3F (1 bytes)
	push bc

; Data from B40 to B42 (3 bytes)
	.db $CD $C5 $08

; Data from B43 to B43 (1 bytes)
	pop af

; Data from B44 to B46 (3 bytes)
	.db $21 $03 $03

; Data from B47 to B47 (1 bytes)
	push hl

; Data from B48 to B49 (2 bytes)
	.db $2E $0F

; Data from B4A to B4A (1 bytes)
	push hl

; Data from B4B to B4D (3 bytes)
	.db $CD $D3 $08

; Data from B4E to B4E (1 bytes)
	pop af

; Data from B4F to B4F (1 bytes)
	pop af

; Data from B50 to B50 (1 bytes)
	ret
_engine_content_manager_load_spr:
		ld hl, $0120
		push hl
		ld hl, _cursor__tiles__psgcompr	; _cursor__tiles__psgcompr = $1657
		push hl
		call _devkit_SMS_loadPSGaidencompress
		pop af
		pop af
		ld bc, _cursor__palette__bin	; _cursor__palette__bin = $1647
		push bc
		call A$_sms_manager$493
		pop af
		ret
