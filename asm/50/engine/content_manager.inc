; void engine_content_manager_load_tiles()
_engine_content_manager_load_til:
		ld hl, $0000					; #define FONT_TILES		0
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
		ld a, $02						; splash__tiles__psgcompr_bank 2
		push af
		inc sp
		call _devkit_SMS_mapROMBank
		inc sp
		ld hl, $0040					; #define OPTION_TILES	64
		push hl
		ld hl, _splash__tiles__psgcompr
		push hl
		call _devkit_SMS_loadPSGaidencompress
		pop af
		pop af
		ld bc, _splash__tilemap__stmcompr
		push bc
		ld hl, $0000					; devkit_SMS_loadSTMcompressedTileMap( 0, 0, ... )
		push hl
		call _devkit_SMS_loadSTMcompressedTil
		pop af
		pop af
		ld bc, _splash__palette__bin
		push bc
		call _devkit_SMS_loadBGPalette
		pop af
		ret

; void engine_content_manager_load_titleGap()
; Data from AE3 to AE4 (2 bytes)
_engine_content_manager_load_tit:
		ld a, $03						; VanHalenTitleTop__tiles__psgcompr_bank 3
		push af
		inc sp
		call _devkit_SMS_mapROMBank
		inc sp
		ld hl, $0040					; #define OPTION_TILES	64
		push hl
		ld hl, _VanHalenTitleGap__tiles__psgcom
		push hl
		call _devkit_SMS_loadPSGaidencompress
		pop af
		pop af
		ld bc, _VanHalenTitleGap__tilemap__stmc
		push bc
		ld hl, $0000					; devkit_SMS_loadSTMcompressedTileMap( 0, 0, ... )
		push hl
		call _devkit_SMS_loadSTMcompressedTil
		pop af
		pop af
		ld bc, _VanHalenTitleGap__palette__bin
		push bc
		call _devkit_SMS_loadBGPalette
		pop af
		ld hl, $0303					; devkit_SMS_setBGPaletteColor( ..., 3, 3, 3 );
		push hl
		ld l, $0F						; devkit_SMS_setBGPaletteColor( 15, ...
		push hl
		call _devkit_SMS_setBGPaletteColor
		pop af
		pop af
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

; void engine_content_manager_load_sprites()	
_engine_content_manager_load_spr:
		ld hl, $0120					; #define CURSOR_TILES			256 + 32
		push hl
		ld hl, _cursor__tiles__psgcompr	; _cursor__tiles__psgcompr = $1657
		push hl
		call _devkit_SMS_loadPSGaidencompress
		pop af
		pop af
		ld bc, _cursor__palette__bin	; _cursor__palette__bin = $1647
		push bc
		call _devkit_SMS_loadSpritePalette
		pop af
		ret
