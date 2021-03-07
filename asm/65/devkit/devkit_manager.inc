.section "devkit_SMS_init" free
devkit_SMS_init:
		jp SMS_init

.ends

.section "devkit_SMS_displayOn" free
devkit_SMS_displayOn:
		ld hl, $0140
		jp SMS_VDPturnOnFeature

.ends

.section "devkit_SMS_displayOff" free
devkit_SMS_displayOff:
		ld hl, $0140
		jp SMS_VDPturnOffFeature

.ends

.section "devkit_SMS_mapROMBank" free
devkit_SMS_mapROMBank:
		ld hl, $0002
		add hl, sp
		ld a, (hl)
		ld ($FFFF), a
		ret

.ends

.section "devkit_SMS_setBGScrollX" free
devkit_SMS_setBGScrollX:
		ld iy, $0002
		add iy, sp
		ld l, (iy + $00)
		jp SMS_setBGScrollX

.ends

.section "devkit_SMS_setBGScrollY" free
devkit_SMS_setBGScrollY:
		ld iy, $0002
		add iy, sp
		ld l, (iy+0)
		jp SMS_setBGScrollY

.ends

.section "devkit_SMS_enableSRAM" free
devkit_SMS_enableSRAM:
		ld hl, $FFFC
		ld (hl), $08
		ret

.ends

.section "devkit_SMS_enableSRAMBank" free
devkit_SMS_enableSRAMBank:
		ld hl, $0002
		add hl, sp
		ld a, (hl)
		add a, a
		add a, a
		set 3, a
		and $0C
		ld ($FFFC), a
		ret

.ends

.section "devkit_SMS_disableSRAM" free
devkit_SMS_disableSRAM:
		ld hl, $FFFC
		ld (hl), $00
		ret

.ends

.section "devkit_SMS_SRAM" free
devkit_SMS_SRAM:
		ld hl, $8000
		ret

.ends

.section "devkit_SMS_setSpriteMode" free
devkit_SMS_setSpriteMode:
		ld iy, $0002
		add iy, sp
		ld l, (iy+0)
		jp SMS_setSpriteMode

.ends

.section "devkit_SMS_useFirstHalfTilesfor" free
devkit_SMS_useFirstHalfTilesfor:
		ld l, $00
		jp SMS_useFirstHalfTilesforSprites

.ends

.section "dewkit_SMS_useFirstHalfTilesfor" free
dewkit_SMS_useFirstHalfTilesfor:
		ld l, $01
		jp SMS_useFirstHalfTilesforSprites

.ends

.section "devkit_SMS_VDPturnOnFeature" free
devkit_SMS_VDPturnOnFeature:
		pop bc
		pop hl
		push hl
		push bc
		jp SMS_VDPturnOnFeature

.ends

.section "devkit_SMS_loadPSGaidencompress" free
devkit_SMS_loadPSGaidencompress:
		ld hl, SMS_crt0_RST08 - 2	; SMS_crt0_RST08 - 2 = $0004
		add hl, sp
		ld c, (hl)
		inc hl
		ld b, (hl)
		push bc
		ld hl, SMS_crt0_RST08 - 2	; SMS_crt0_RST08 - 2 = $0004
		add hl, sp
		ld c, (hl)
		inc hl
		ld b, (hl)
		push bc
		call SMS_loadPSGaidencompressedTiles
		pop af
		pop af
		ret

.ends

.section "devkit_SMS_loadSTMcompressedTil" free
devkit_SMS_loadSTMcompressedTil:
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
		call SMS_loadSTMcompressedTileMapAre
		pop af
		pop af
		inc sp
		ret

.ends

.section "devkit_SMS_loadBGPalette" free
devkit_SMS_loadBGPalette:
		pop bc
		pop hl
		push hl
		push bc
		jp SMS_loadBGPalette

.ends

.section "devkit_SMS_loadSpritePalette" free
devkit_SMS_loadSpritePalette:
		pop bc
		pop hl
		push hl
		push bc
		jp SMS_loadSpritePalette

.ends

.section "devkit_SMS_setBGPaletteColor" free
devkit_SMS_setBGPaletteColor:
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
		call SMS_setBGPaletteColor
		pop af
		ret

.ends

.section "devkit_SMS_setSpritePaletteColo" free
devkit_SMS_setSpritePaletteColo:
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
		call SMS_setSpritePaletteColor
		pop af
		ret

.ends

.section "devkit_SMS_setNextTileatXY" free
devkit_SMS_setNextTileatXY:
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
		jp SMS_crt0_RST08	; $0006

.ends

.section "devkit_SMS_setTile" free
devkit_SMS_setTile:
		pop bc
		pop hl
		push hl
		push bc
		jp SMS_crt0_RST18	; $0011

.ends

.section "devkit_SMS_setTilePriority" free
devkit_SMS_setTilePriority:
		ld iy, $0002
		add iy, sp
		ld l, (iy + $00)
		ld a, $00
		or $18
		ld h, a
		jp SMS_crt0_RST18	; $0011

.ends

.section "devkit_SMS_addSprite" free
devkit_SMS_addSprite:
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
		call SMS_addSprite
		pop af
		inc sp
		ret

.ends

.section "devkit_SMS_initSprites" free
devkit_SMS_initSprites:
		jp SMS_initSprites

.ends

.section "devkit_SMS_finalizeSprites" free
devkit_SMS_finalizeSprites:
		jp SMS_finalizeSprites

.ends

.section "devkit_SMS_waitForVBlank" free
devkit_SMS_waitForVBlank:
		jp SMS_waitForVBlank

.ends

.section "devkit_SMS_copySpritestoSAT" free
devkit_SMS_copySpritestoSAT:
		jp UNSAFE_SMS_copySpritestoSAT

.ends

.section "devkit_UNSAFE_SMS_copySpritesto" free
devkit_UNSAFE_SMS_copySpritesto:
		jp UNSAFE_SMS_copySpritestoSAT

.ends

.section "devkit_SMS_queryPauseRequested" free
devkit_SMS_queryPauseRequested:
		jp SMS_queryPauseRequested

.ends

.section "devkit_SMS_resetPauseRequest" free
devkit_SMS_resetPauseRequest:
		jp SMS_resetPauseRequest

.ends

.section "devkit_isCollisionDetected" free
devkit_isCollisionDetected:
		ld a, (SMS_VDPFlags)
		and $20
		ld l, a
		ret

.ends

.section "devkit_SMS_getKeysStatus" free
devkit_SMS_getKeysStatus:
		jp SMS_getKeysStatus

.ends

.section "devkit_SPRITEMODE_NORMAL" free
devkit_SPRITEMODE_NORMAL:
		ld l, $00
		ret

.ends

.section "devkit_VDPFEATURE_HIDEFIRSTCOL" free
devkit_VDPFEATURE_HIDEFIRSTCOL:
		ld hl, $0020
		ret

.ends

.section "devkit_TILE_PRIORITY" free
devkit_TILE_PRIORITY:
		ld hl, $1000
		ret

.ends

.section "devkit_TILE_USE_SPRITE_PALETTE" free
devkit_TILE_USE_SPRITE_PALETTE:
		ld hl, $0800
		ret

.ends

.section "sms_manager_author" free
sms_manager_author:
; "Steven Boland"
	.db $53 $74 $65 $76 $65 $6E $20 $42 $6F $6C $61 $6E $64 $00

.ends

.section "sms_manager_title" free
sms_manager_title:
; "Van Halen"
	.db $56 $61 $6E $20 $48 $61 $6C $65 $6E $00

; Data from 9C5 to A00 (60 bytes)
.ends

.section "sms_manager_description" free
sms_manager_description:
; "Van Halen Record Covers for the SMS Power! 2021 Competition"
	.db $56 $61 $6E $20 $48 $61 $6C $65 $6E $20 $52 $65 $63 $6F $72 $64
	.db $20 $43 $6F $76 $65 $72 $73 $20 $66 $6F $72 $20 $74 $68 $65 $20
	.db $53 $4D $53 $20 $50 $6F $77 $65 $72 $21 $20 $32 $30 $32 $31 $20
	.db $43 $6F $6D $70 $65 $74 $69 $74 $69 $6F $6E $00

.ends

.section "devkit_PSGPlay" free
devkit_PSGPlay:
		pop bc
		pop hl
		push hl
		push bc
		push hl
		call PSGPlay
		pop af
		ret

.ends

.section "devkit_PSGPlayNoRepeat" free
devkit_PSGPlayNoRepeat:
		pop bc
		pop hl
		push hl
		push bc
		push hl
		call PSGPlayNoRepeat
		pop af
		ret

.ends

.section "devkitPSGStop" free
devkitPSGStop:
		jp PSGStop

.ends

.section "devkit_PSGResume" free
devkit_PSGResume:
		jp PSGResume

.ends

.section "devkit_PSGGetStatus" free
devkit_PSGGetStatus:
		jp PSGGetStatus

.ends

.section "devkit_PSGSetMusicVolumeAttenua" free
devkit_PSGSetMusicVolumeAttenua:
		ld hl, $0002
		add hl, sp
		ld a, (hl)
		push af
		inc sp
		call PSGSetMusicVolumeAttenuation
		inc sp
		ret

.ends

.section "devkit_PSGSFXPlay" free
devkit_PSGSFXPlay:
		ld hl, $0004
		add hl, sp
		ld a, (hl)
		push af
		inc sp
		ld hl, $0003
		add hl, sp
		ld c, (hl)
		inc hl
		ld b, (hl)
		push bc
		call PSGSFXPlay
		pop af
		inc sp
		ret

.ends

.section "devkitPSGSFXStop" free
devkitPSGSFXStop:
		jp PSGSFXStop

.ends

.section "devkit_PSGSFXGetStatus" free
devkit_PSGSFXGetStatus:
		jp PSGSFXGetStatus

.ends

.section "devkit_PSGSilenceChannels" free
devkit_PSGSilenceChannels:
		jp PSGSilenceChannels

.ends

.section "devkit_PSGRestoreVolumes" free
devkit_PSGRestoreVolumes:
		jp PSGRestoreVolumes

.ends

.section "devkit_PSGFrame" free
devkit_PSGFrame:
		jp PSGFrame

.ends

.section "devkit_PSGSFXFrame" free
devkit_PSGSFXFrame:
		jp PSGSFXFrame

.ends

.section "devkit_SFX_CHANNEL2" free
devkit_SFX_CHANNEL2:
		ld l, $01
		ret

.ends

.section "devkit_SFX_CHANNEL3" free
devkit_SFX_CHANNEL3:
		ld l, $02
		ret

.ends

.section "devkit_SFX_CHANNELS2AND3" free
devkit_SFX_CHANNELS2AND3:
		ld l, $03
		ret

.ends
