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
_engine_content_manager_load_tit:
		ld a, $03						; VanHalenTitleGap__tiles__psgcompr_bank 3
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


; void engine_content_manager_load_titleTop()
_fngine_content_manager_load_tit:
	;.db $3E $03
		ld a, $03						; VanHalenTitleTop__tiles__psgcompr_bank 3
		push af
		inc sp
		call _devkit_SMS_mapROMBank
		inc sp
		ld hl, $0040					; #define OPTION_TILES	64
		push hl
		ld hl, _VanHalenTitleTop__tiles__psgcom
		push hl
		call _devkit_SMS_loadPSGaidencompress
		pop af
		pop af
		ld bc, _VanHalenTitleTop__tilemap__stmc
		push bc
		ld hl, $0000					; devkit_SMS_loadSTMcompressedTileMap( 0, 0, ... )
		push hl
		call _devkit_SMS_loadSTMcompressedTil
		pop af
		pop af
		ld bc, _VanHalenTitleTop__palette__bin
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