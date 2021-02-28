_devkit_SMS_init:	
		jp _SMS_init

_devkit_SMS_displayOn:	
		ld hl, $0140
		jp _SMS_VDPturnOnFeature
_devkit_SMS_displayOff:	
		ld hl, $0140
		jp _SMS_VDPturnOffFeature
	
; Data from 831 to 833 (3 bytes)	
_devkit_SMS_mapROMBank:	
		ld hl, $0002
		add hl, sp
		ld a, (hl)
		ld ($FFFF), a
		ret
	
; Data from 83A to 83D (4 bytes)		
_devkit_SMS_setBGScrollX:	
		ld iy, $0002
		add iy, sp
		ld l, (iy + $00)
		jp _SMS_setBGScrollX
	
_devkit_SMS_setBGScrollY:	
		ld iy, $0002
		add iy, sp
		ld l, (iy+0)
		jp _SMS_setBGScrollY
	
_devkit_SMS_enableSRAM:	
		ld hl, $FFFC
		ld (hl), $08
		ret
	
_devkit_SMS_enableSRAMBank:	
		ld hl, $0002
		add hl, sp
		ld a, (hl)
		add a, a
		add a, a
		set 3, a
		and $0C
		ld ($FFFC), a
		ret
	
_devkit_SMS_disableSRAM:	
		ld hl, $FFFC
		ld (hl), $00
		ret
	
_devkit_SMS_SRAM:	
		ld hl, $8000
		ret

_devkit_SMS_setSpriteMode:	
		ld iy, $0002
		add iy, sp
		ld l, (iy+0)
		jp _SMS_setSpriteMode

_devkit_SMS_useFirstHalfTilesfor:	
		ld l, $00
		jp _SMS_useFirstHalfTilesforSprites
	
_dewkit_SMS_useFirstHalfTilesfor:	
		ld l, $01
		jp _SMS_useFirstHalfTilesforSprites

_devkit_SMS_VDPturnOnFeature:	
		pop bc
		pop hl
		push hl
		push bc
		jp _SMS_VDPturnOnFeature

_devkit_SMS_loadPSGaidencompress:
		ld hl, _SMS_crt0_RST08 - 2	; _SMS_crt0_RST08 - 2 = $0004
		add hl, sp
		ld c, (hl)
		inc hl
		ld b, (hl)
		push bc
		ld hl, _SMS_crt0_RST08 - 2	; _SMS_crt0_RST08 - 2 = $0004
		add hl, sp
		ld c, (hl)
		inc hl
		ld b, (hl)
		push bc
		call _SMS_loadPSGaidencompressedTiles
		pop af
		pop af
		ret

_devkit_SMS_loadSTMcompressedTil:	
		ld a, $20
		push af
		inc sp
		ld hl, $0005
		add hl, sp
		ld c, (hl)
		inc hl
		ld b, (hl)
		push bc
		ld hl, $0006
		add hl, sp
		ld a, (hl)
		push af
		inc sp
		ld hl, $0006
		add hl, sp
		ld a, (hl)
		push af
		inc sp
		call $1E3F
		pop af
		pop af
		inc sp
		ret
	
_devkit_SMS_loadBGPalette:	
		pop bc
		pop hl
		push hl
		push bc
		jp _SMS_loadBGPalette


_devkit_SMS_loadSpritePalette:	
		pop bc
		pop hl
		push hl
		push bc
		jp _SMS_loadSpritePalette
	

_devkit_SMS_setBGPaletteColor:	
		ld hl, $0004
		add hl, sp
		ld a, (hl)
		add a, a
		add a, a
		ld hl, $0003
		add hl, sp
		or (hl)
		ld c, a
		ld hl, $0005
		add hl, sp
		ld a, (hl)
		rlca
		rlca
		rlca
		rlca
		and $F0
		or c
		ld b, a
		push bc
		inc sp
		ld hl, $0003
		add hl, sp
		ld a, (hl)
		push af
		inc sp
		call _SMS_setBGPaletteColor
		pop af
		ret
		
_devkit_SMS_setSpritePaletteColo:
		ld hl, $0004
		add hl, sp
		ld a, (hl)
		add a, a
		add a, a
		ld hl, $0003
		add hl, sp
		or (hl)
		ld c, a
		ld hl, $0005
		add hl, sp
		ld a, (hl)
		rlca
		rlca
		rlca
		rlca
		and $F0
		or c
		ld b, a
		push bc
		inc sp
		ld hl, $0003
		add hl, sp
		ld a, (hl)
		push af
		inc sp
		call _SMS_setSpritePaletteColor
		pop af
		ret
	
_devkit_SMS_setNextTileatXY:	
		push ix
		ld ix, $0000
		add ix, sp
		ld l, (ix + $05)
		ld h, $00
		add hl, hl
		add hl, hl
		add hl, hl
		add hl, hl
		add hl, hl
		add hl, hl
		ld c, l
		ld a, h
		or $78
		ld b, a
		ld l, (ix + $04)
		ld h, $00
		add hl, hl
		ld a, l
		or c
		ld l, a
		ld a, h
		or b
		ld h, a
		pop ix
		jp $0006

_devkit_SMS_setTile:	
		pop bc
		pop hl
		push hl
		push bc
		jp $0011

_devkit_SMS_setTilePriority:	
		ld iy, $0002
		add iy, sp
		ld l, (iy + $00)
		ld a, $00
		or $18
		ld h, a
		jp $0011
	
_devkit_SMS_addSprite:	
	ld hl, $0004
	add hl, sp
	ld b, (hl)
	push bc
	inc sp
	ld hl, $0004
	add hl, sp
	ld a, (hl)
	push af
	inc sp
	ld hl, $0004
	add hl, sp
	ld a, (hl)
	push af
	inc sp
	call _SMS_addSprite
	pop af
	inc sp
	ret


_devkit_SMS_initSprites:
		jp _SMS_initSprites


_devkit_SMS_finalizeSprites:	
		jp _SMS_finalizeSprites
	

_devkit_SMS_waitForVBlank:	
		jp _SMS_waitForVBlank

_devkit_SMS_copySpritestoSAT:
		jp _UNSAFE_SMS_copySpritestoSAT


_devkit_UNSAFE_SMS_copySpritesto:	
	jp $1AE0


_devkit_SMS_queryPauseRequested:
		jp _SMS_queryPauseRequested
	

_devkit_SMS_resetPauseRequest:
		jp _SMS_resetPauseRequest
	
	
_devkit_isCollisionDetected:	
		ld a, ($C05C)
		and $20
		ld l, a
		ret


_devkit_SMS_getKeysStatus:
		jp _SMS_getKeysStatus

_devkit_SPRITEMODE_NORMAL:	
		ld l, $00
		ret

_devkit_VDPFEATURE_HIDEFIRSTCOL:	
		ld hl, $0020
		ret


_devkit_TILE_PRIORITY:	
		ld hl, $1000
		ret
	

_devkit_TILE_USE_SPRITE_PALETTE:	
		ld hl, $0800
		ret
	
; Data from 9AD to 9BA (14 bytes)	
F_sms_manager$__str_0$0$0:
; "Steven Boland"
	.db $53 $74 $65 $76 $65 $6E $20 $42 $6F $6C $61 $6E $64 $00
	
; Data from 9BB to 9C4 (10 bytes)	
F_sms_manager$__str_1$0$0:	
; "Van Halen"
	.db $56 $61 $6E $20 $48 $61 $6C $65 $6E $00
	
; Data from 9C5 to A00 (60 bytes)	
F_sms_manager$__str_2$0$0:	
; "Van Halen Record Covers for the SMS Power! 2021 Competition"
	.db $56 $61 $6E $20 $48 $61 $6C $65 $6E $20 $52 $65 $63 $6F $72 $64
	.db $20 $43 $6F $76 $65 $72 $73 $20 $66 $6F $72 $20 $74 $68 $65 $20
	.db $53 $4D $53 $20 $50 $6F $77 $65 $72 $21 $20 $32 $30 $32 $31 $20
	.db $43 $6F $6D $70 $65 $74 $69 $74 $69 $6F $6E $00
	
	
_devkit_PSGPlay:	
		pop bc
		pop hl
		push hl
		push bc
		push hl
		call _PSGPlay
		pop af
		ret
	

_devkit_PSGPlayNoRepeat:	
		pop bc
	pop hl
	push hl
	push bc
	push hl
	;.db $CD $27 $03
	;call $0327
	call _PSGPlayNoRepeat
	pop af
	ret
	
; Data from A15 to A17 (3 bytes)	
A$_snd_manager$135:	
C$_snd_manager.c$17$1$33:	
C$_snd_manager.c$19$1$35:	
C$_snd_manager.c$20$1$35:	
G$devkit_PSGStop$0$0:	
XG$devkit_PSGStop$0$0:	
_devkit_PSGStop:	
	;.db $C3 $81 $02
	jp $0281
	
; Data from A18 to A1A (3 bytes)	
A$_snd_manager$152:	
C$_snd_manager.c$21$1$35:	
C$_snd_manager.c$23$1$37:	
C$_snd_manager.c$24$1$37:	
G$devkit_PSGResume$0$0:	
XG$devkit_PSGResume$0$0:	
_devkit_PSGResume:	
	;.db $C3 $A8 $02
	jp $02A8
	
; Data from A1B to A1D (3 bytes)	
A$_snd_manager$169:	
C$_snd_manager.c$25$1$37:	
C$_snd_manager.c$27$1$39:	
C$_snd_manager.c$28$1$39:	
G$devkit_PSGGetStatus$0$0:	
XG$devkit_PSGGetStatus$0$0:	
_devkit_PSGGetStatus:	
	;.db $C3 $36 $03
	jp $0336
	
; Data from A1E to A20 (3 bytes)	
A$_snd_manager$182:	
C$_snd_manager.c$29$1$39:	
C$_snd_manager.c$31$1$41:	
G$devkit_PSGSetMusicVolumeAttenu:	
_devkit_PSGSetMusicVolumeAttenua:	
	;.db $21 $02 $00
	ld hl, $0002
	
; Data from A21 to A21 (1 bytes)	
A$_snd_manager$183:	
	add hl, sp
	
; Data from A22 to A22 (1 bytes)	
A$_snd_manager$184:	
	ld a, (hl)
	
; Data from A23 to A23 (1 bytes)	
A$_snd_manager$185:	
	push af
	
; Data from A24 to A24 (1 bytes)	
A$_snd_manager$186:	
	inc sp
	
; Data from A25 to A27 (3 bytes)	
A$_snd_manager$187:	
	.db $CD $4E $04
	
; Data from A28 to A28 (1 bytes)	
A$_snd_manager$188:	
	inc sp
	
; Data from A29 to A29 (1 bytes)	
A$_snd_manager$193:	
C$_snd_manager.c$32$1$41:	
XG$devkit_PSGSetMusicVolumeAtten:	
	ret
	
; Data from A2A to A2C (3 bytes)	
_devkit_PSGSFXPlay:	
	.db $21 $04 $00
	
; Data from A2D to A2D (1 bytes)	
A$_snd_manager$207:	
	add hl, sp
	
; Data from A2E to A2E (1 bytes)	
A$_snd_manager$208:	
	ld a, (hl)
	
; Data from A2F to A2F (1 bytes)	
A$_snd_manager$209:	
	push af
	
; Data from A30 to A30 (1 bytes)	
A$_snd_manager$210:	
	inc sp
	
; Data from A31 to A33 (3 bytes)	
A$_snd_manager$211:	
	.db $21 $03 $00
	
; Data from A34 to A34 (1 bytes)	
A$_snd_manager$212:	
	add hl, sp
	
; Data from A35 to A35 (1 bytes)	
A$_snd_manager$213:	
	ld c, (hl)
	
; Data from A36 to A36 (1 bytes)	
A$_snd_manager$214:	
	inc hl
	
; Data from A37 to A37 (1 bytes)	
A$_snd_manager$215:	
	ld b, (hl)
	
; Data from A38 to A38 (1 bytes)	
A$_snd_manager$216:	
	push bc
	
; Data from A39 to A3B (3 bytes)	
A$_snd_manager$217:	
	.db $CD $07 $06
	
; Data from A3C to A3C (1 bytes)	
A$_snd_manager$218:	
	pop af
	
; Data from A3D to A3D (1 bytes)	
A$_snd_manager$219:	
	inc sp
	
; Data from A3E to A3E (1 bytes)	
	ret
	
; Data from A3F to A41 (3 bytes)	
_devkit_PSGSFXStop:	
	;.db $C3 $3D $05
	jp $053D
	
; Data from A42 to A44 (3 bytes)	
_devkit_PSGSFXGetStatus:	
	;.db $C3 $5A $06
	jp $065A

_devkit_PSGSilenceChannels:	
		jp _PSGSilenceChannels
	
_devkit_PSGRestoreVolumes:
		jp _PSGRestoreVolumes

_devkit_PSGFrame:	
		jp _PSGFrame

_devkit_PSGSFXFrame:	
		jp _PSGSFXFrame

_devkit_SFX_CHANNEL2:	
		ld l, $01
		ret
	
_devkit_SFX_CHANNEL3:	
		ld l, $02
		ret
	
; Data from A57 to A58 (2 bytes)	
_devkit_SFX_CHANNELS2AND3:	
		ld l, $03
		ret