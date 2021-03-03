_UNSAFE_SMS_copySpritestoSAT:	
		ld hl, $7F00
		rst $08	; _LABEL_8_
		ld c, Port_VDPData
		ld hl, SpriteTableY	; SpriteTableY = $C063
		call _OUTI64
		ld hl, $7F80
		rst $08	; _LABEL_8_
		ld c, Port_VDPData
		ld hl, SpriteTableXN	; SpriteTableXN = $C0A3
		jp _OUTI128
	
; Data from 1AF8 to 1B14 (29 bytes)	
_UNSAFE_SMS_VRAMmemcpy32:	
	.db $FD $21 $02 $00 $FD $39 $FD $6E $00 $FD $7E $01 $CB $F7 $67 $CF
	.db $0E $BE $21 $04 $00 $39 $7E $23 $66 $6F $C3 $59 $01
	
; Data from 1B15 to 1B31 (29 bytes)	
_UNSAFE_SMS_VRAMmemcpy64:	
	.db $FD $21 $02 $00 $FD $39 $FD $6E $00 $FD $7E $01 $CB $F7 $67 $CF
	.db $0E $BE $21 $04 $00 $39 $7E $23 $66 $6F $C3 $19 $01
	
; Data from 1B32 to 1B4E (29 bytes)	
_UNSAFE_SMS_VRAMmemcpy128:	
	.db $FD $21 $02 $00 $FD $39 $FD $6E $00 $FD $7E $01 $CB $F7 $67 $CF
	.db $0E $BE $21 $04 $00 $39 $7E $23 $66 $6F $C3 $99 $00
	
_SMS_init:	
		ld hl, $0000
		push hl
		call _SMS_setSpritePaletteColor
		pop af
		ld c, $00
-:	
		ld hl, _VDPReg_init	; _VDPReg_init = $1BA3
		ld b, $00
		add hl, bc
		ld b, (hl)
		di
		ld a, b
		out (Port_VDPAddress), a
		ld a, c
		set 7, a
		out (Port_VDPAddress), a
		ei
		inc c
		ld a, c
		sub $0B
		jr c, -
		call _SMS_initSprites
		call _SMS_finalizeSprites
		call _SMS_copySpritestoSAT
		call _SMS_resetPauseRequest
-:	
		in a, (Port_VCounter)
		ld b, a
		ld a, $80
		sub b
		jr c, -
-:	
		in a, (Port_VCounter)
		sub $80
		jr c, -
-:	
		in a, (Port_VCounter)
		ld c, a
		in a, (Port_VCounter)
		sub c
		jr nc, -
		ld a, c
		sub $E7
		jr c, +
		ld hl, VDPType	; VDPType = $C05E
		ld (hl), $80
		ret
	
+:	
		ld hl, VDPType	; VDPType = $C05E
		ld (hl), $40
		ret
	
; Data from 1BA3 to 1BAD (11 bytes)	
_VDPReg_init:	
	.db $04 $20 $FF $FF $FF $FF $FF $00 $00 $00 $FF
	
; Data from 1BAE to 1BB5 (8 bytes)	
_SMS_VDPType:	
	.db $FD $21 $5E $C0 $FD $6E $00 $C9
	
_SMS_VDPturnOnFeature:	
		ld c, l
		ld e, h
		ld d, $00
		ld hl, VDPReg	; VDPReg = $C1AA
		add hl, de
		ld a, (hl)
		or c
		ld c, a
		ld (hl), c
		di
		ld a, c
		out (Port_VDPAddress), a
		ld a, e
		set 7, a
		out (Port_VDPAddress), a
		ei
		ret
	
_SMS_VDPturnOffFeature:	
		ld a, l
		ld e, h
		cpl
		ld b, a
		ld d, $00
		ld hl, VDPReg	; VDPReg = $C1AA
		add hl, de
		ld a, (hl)
		and b
		ld c, a
		ld (hl), c
		di
		ld a, c
		out (Port_VDPAddress), a
		ld a, e
		set 7, a
		out (Port_VDPAddress), a
		ei
		ret
	
_SMS_setBGScrollX:	
		di
		ld a, l
		out (Port_VDPAddress), a
		ld a, $88
		out (Port_VDPAddress), a
		ei
		ret
	
_SMS_setBGScrollY:	
		di
		ld a, l
		out (Port_VDPAddress), a
		ld a, $89
		out (Port_VDPAddress), a
		ei
		ret
	
; Data from 1BFA to 1C03 (10 bytes)	
_SMS_setBackdropColor:	
	.db $F3 $7D $D3 $BF $3E $87 $D3 $BF $FB $C9
	
_SMS_useFirstHalfTilesforSprites:	
		bit 0, l
		jr z, +
		ld c, $FB
		jr ++
	
+:	
		ld c, $FF
++:	
		di
		ld a, c
		out (Port_VDPAddress), a
		ld a, $86
		out (Port_VDPAddress), a
		ei
		ret
	
_SMS_setSpriteMode:	
		ld c, l
		bit 0, c
		jr z, +
		push bc
		ld hl, $0102
		call _SMS_VDPturnOnFeature
		pop bc
		ld hl, spritesHeight	; spritesHeight = $C1AC
		ld (hl), $10
		jr ++
	
+:	
		push bc
		ld hl, $0102
		call _SMS_VDPturnOffFeature
		pop bc
		ld hl, spritesHeight	; spritesHeight = $C1AC
		ld (hl), $08
++:	
		bit 1, c
		jr z, +
		ld hl, $0101
		call _SMS_VDPturnOnFeature
		ld hl, spritesWidth	; spritesWidth = $C1AD
		ld (hl), $10
		ld iy, spritesHeight	; spritesHeight = $C1AC
		sla (iy+0)
		ret
	
+:	
		ld hl, $0101
		call _SMS_VDPturnOffFeature
		ld hl, spritesWidth	; spritesWidth = $C1AD
		ld (hl), $08
		ret
	
_SMS_setBGPaletteColor:	
		ld hl, $0002
		add hl, sp
		ld c, (hl)
		ld b, $00
		ld hl, Lmain.main$global_pause$1$55	; Lmain.main$global_pause$1$55 = $C000
		add hl, bc
		rst $08	; _LABEL_8_
		ld hl, $0003
		add hl, sp
		ld a, (hl)
		out (Port_VDPData), a
		ret
	
_SMS_setSpritePaletteColor:	
		ld hl, $0002
		add hl, sp
		ld c, (hl)
		ld b, $00
		ld hl, PSGChan1Volume	; PSGChan1Volume = $C010
		add hl, bc
		rst $08	; _LABEL_8_
		ld hl, $0003
		add hl, sp
		ld a, (hl)
		out (Port_VDPData), a
		ret
	
_SMS_loadBGPalette:	
		ld de, Lmain.main$global_pause$1$55	; Lmain.main$global_pause$1$55 = $C000
		ld c, Port_VDPAddress
		di
		out (c), e
		out (c), d
		ei
		ld b, $10
		ld c, Port_VDPData
-:	
		outi
		jr nz, -
		ret
	
_SMS_loadSpritePalette:	
		ld de, PSGChan1Volume	; PSGChan1Volume = $C010
		ld c, Port_VDPAddress
		di
		out (c), e
		out (c), d
		ei
		ld b, $10
		ld c, Port_VDPData
-:	
		outi
		jr nz, -
		ret
	
; Data from 1CAD to 1CB0 (4 bytes)	
_SMS_setColor:	
	.db $7D $D3 $BE $C9
	
_SMS_initSprites:	
		ld hl, SpriteNextFree	; SpriteNextFree = $C123
		ld (hl), $00
		ret
	
_SMS_addSprite:	
		ld a, (SpriteNextFree)	; SpriteNextFree = $C123
		sub $40
		jr nc, _LABEL_1D09_
		ld iy, $0003
		add iy, sp
		ld a, (iy+0)
		sub $D1
		jr z, _LABEL_1D09_
		ld a, $63
		ld hl, SpriteNextFree	; SpriteNextFree = $C123
		add a, (hl)
		ld c, a
		ld a, $C0
		adc a, $00
		ld b, a
		ld e, (iy+0)
		dec e
		ld a, e
		ld (bc), a
		ld a, (SpriteNextFree)	; SpriteNextFree = $C123
		add a, a
		ld c, a
		ld hl, SpriteTableXN	; SpriteTableXN = $C0A3
		ld b, $00
		add hl, bc
		ld iy, $0002
		add iy, sp
		ld a, (iy+0)
		ld (hl), a
		inc hl
		ld iy, $0004
		add iy, sp
		ld a, (iy+0)
		ld (hl), a
		ld iy, SpriteNextFree	; SpriteNextFree = $C123
		ld c, (iy+0)
		inc (iy+0)
		ld l, c
		ret
	
_LABEL_1D09_:	
		ld l, $FF
		ret
	
_SMS_finalizeSprites:	
		ld a, (SpriteNextFree)	; SpriteNextFree = $C123
		sub $40
		ret nc
		ld bc, SpriteTableY	; SpriteTableY = $C063
		ld hl, (SpriteNextFree)	; SpriteNextFree = $C123
		ld h, $00
		add hl, bc
		ld (hl), $D0
		ret
	
_SMS_copySpritestoSAT:	
		ld hl, $7F00
		rst $08	; _LABEL_8_
		ld bc, SpriteTableY	; SpriteTableY = $C063
		ld e, $40
-:	
		ld a, (bc)
		out (Port_VDPData), a
		inc bc
		ld d, e
		dec d
		ld a, d
		ld e, a
		or a
		jr nz, -
		ld hl, $7F80
		rst $08	; _LABEL_8_
		ld bc, SpriteTableXN	; SpriteTableXN = $C0A3
		ld e, $80
-:	
		ld a, (bc)
		out (Port_VDPData), a
		inc bc
		ld d, e
		dec d
		ld a, d
		ld e, a
		or a
		jr nz, -
		ret
	
_SMS_waitForVBlank:	
		ld hl, VDPBlank	; VDPBlank = $C05B
		ld (hl), $00
-:	
		ld hl, VDPBlank	; VDPBlank = $C05B
		bit 0, (hl)
		jr z, -
		ret
	
_SMS_getKeysStatus:	
		ld hl, (KeysStatus)	; KeysStatus = $C05F
		ret
	
; Data from 1D58 to 1D74 (29 bytes)	
_SMS_getKeysPressed:	
	.db $FD $21 $61 $C0 $FD $7E $00 $2F $4F $FD $7E $01 $2F $47 $FD $21
	.db $5F $C0 $FD $7E $00 $A1 $6F $FD $7E $01 $A0 $67 $C9
	
; Data from 1D75 to 1D8B (23 bytes)	
_SMS_getKeysHeld:	
	.db $3A $5F $C0 $FD $21 $61 $C0 $FD $A6 $00 $6F $3A $60 $C0 $FD $21
	.db $61 $C0 $FD $A6 $01 $67 $C9
	
; Data from 1D8C to 1DA8 (29 bytes)	
_SMS_getKeysReleased:	
	.db $FD $21 $5F $C0 $FD $7E $00 $2F $4F $FD $7E $01 $2F $47 $79 $FD
	.db $21 $61 $C0 $FD $A6 $00 $6F $78 $FD $A6 $01 $67 $C9
	
_SMS_queryPauseRequested:	
		ld iy, PauseRequested	; PauseRequested = $C05D
		ld l, (iy+0)
		ret
	
_SMS_resetPauseRequest:	
		ld hl, PauseRequested	; PauseRequested = $C05D
		ld (hl), $00
		ret
	
; Data from 1DB7 to 1DC7 (17 bytes)	
_SMS_setLineInterruptHandler:	
	.db $21 $02 $00 $39 $7E $32 $24 $C1 $21 $03 $00 $39 $7E $32 $25 $C1
	.db $C9
	
; Data from 1DC8 to 1DD6 (15 bytes)	
_SMS_setLineCounter:	
	.db $21 $02 $00 $39 $4E $F3 $79 $D3 $BF $3E $8A $D3 $BF $FB $C9
	
; Data from 1DD7 to 1DDA (4 bytes)	
_SMS_getVCount:	
	.db $DB $7E $6F $C9
	
; Data from 1DDB to 1DDE (4 bytes)	
_SMS_getHCount:	
	.db $DB $7F $6F $C9
	
_SMS_isr:	
		push af
		push hl
		in a, (Port_VDPStatus)
		ld (SMS_VDPFlags), a	; SMS_VDPFlags = $C05C
		rlca
		jr nc, +
		ld hl, VDPBlank	; VDPBlank = $C05B
		ld (hl), $01
		ld hl, (KeysStatus)	; KeysStatus = $C05F
		ld (PreviousKeysStatus), hl	; PreviousKeysStatus = $C061
		in a, (Port_IOPort1)
		cpl
		ld hl, KeysStatus	; KeysStatus = $C05F
		ld (hl), a
		in a, (Port_IOPort2)
		cpl
		inc hl
		ld (hl), a
		jr ++
	
+:	
		push bc
		push de
		push iy
		ld hl, (SMS_theLineInterruptHandler)	; SMS_theLineInterruptHandler = $C124
		call ___sdcc_call_hl
		pop iy
		pop de
		pop bc
++:	
		pop hl
		pop af
		ei
		reti
	
_SMS_nmi_isr:	
		push af
		push bc
		push de
		push hl
		push iy
		ld hl, PauseRequested	; PauseRequested = $C05D
		ld (hl), $01
		pop iy
		pop hl
		pop de
		pop bc
		pop af
		retn
	
__moduchar:	
		ld hl, $0003
		add hl, sp
		ld e, (hl)
		dec hl
		ld l, (hl)
		call __divu8
		ex de, hl
		ret
	
__moduint:	
		pop af
		pop hl
		pop de
		push de
		push hl
		push af
		call __divu16
		ex de, hl
		ret
	
_SMS_loadSTMcompressedTileMapAre:	
		push ix
		ld ix, $0000
		add ix, sp
		ld hl, $FFF0
		add hl, sp
		ld sp, hl
		ld (ix-2), $00
		ld (ix-1), $00
		ld (ix-13), $00
		ld (ix-12), $00
		ld l, (ix+5)
		ld h, $00
		add hl, hl
		add hl, hl
		add hl, hl
		add hl, hl
		add hl, hl
		add hl, hl
		ld (ix-4), l
		ld a, h
		or $78
		ld (ix-3), a
		ld a, (ix+4)
		ld (ix-6), a
		ld (ix-5), $00
		sla (ix-6)
		rl (ix-5)
		ld a, (ix-4)
		or (ix-6)
		ld e, a
		ld a, (ix-3)
		or (ix-5)
		ld d, a
		ld a, (ix+8)
		ld (ix-6), a
		ld (ix-15), a
		ld (ix-16), $00
		ld l, e
		ld h, d
		rst $08	; _LABEL_8_
_LABEL_1EA0_:	
		ld l, (ix+6)
		ld h, (ix+7)
		ld a, (hl)
		ld (ix-14), a
		inc hl
		ld (ix+6), l
		ld (ix+7), h
		ld a, (ix+6)
		ld (ix-4), a
		ld a, (ix+7)
		ld (ix-3), a
		ld a, (ix-14)
		and $02
		ld (ix-7), a
		ld a, (ix-14)
		rrca
		rrca
		and $3F
		ld (ix-8), a
		bit 0, (ix-14)
		jp z, _LABEL_1F78_
		ld (ix-10), $00
		ld a, (ix-1)
		ld (ix-9), a
		ld c, (ix-4)
		ld b, (ix-3)
		inc bc
		ld l, (ix-4)
		ld h, (ix-3)
		ld l, (hl)
		ld a, (ix-8)
		add a, $02
		ld (ix-11), a
		ld h, $00
		ld a, l
		or (ix-10)
		ld l, a
		ld a, h
		or (ix-9)
		ld h, a
		ld a, (ix-7)
		or a
		jr z, ++
		ld (ix+6), c
		ld (ix+7), b
		ld c, l
		ld b, h
		ld l, (ix-11)
-:	
		ld a, l
		or a
		jp z, _LABEL_1FF1_
		push hl
		ld l, c
		ld h, b
		rst $18	; _LABEL_18_
		pop hl
		dec (ix-15)
		ld a, (ix-15)
		or a
		jr nz, +
		ld a, e
		add a, $40
		ld e, a
		ld a, d
		adc a, $00
		ld d, a
		push hl
		push bc
		ld l, e
		ld h, d
		rst $08	; _LABEL_8_
		pop bc
		pop hl
		ld a, (ix-6)
		ld (ix-15), a
+:	
		ld a, $01
		sub l
		jr nc, +
		inc bc
+:	
		dec l
		jr -
	
++:	
		ld (ix+6), c
		ld (ix+7), b
		ld (ix-2), l
		ld (ix-1), h
		ld b, (ix-11)
-:	
		ld a, b
		or a
		jp z, _LABEL_2001_
		ld l, (ix-2)
		ld h, (ix-1)
		rst $18	; _LABEL_18_
		dec (ix-15)
		ld a, (ix-15)
		or a
		jr nz, +
		ld hl, $0040
		add hl, de
		ld e, l
		ld d, h
		rst $08	; _LABEL_8_
		ld a, (ix-6)
		ld (ix-15), a
+:	
		dec b
		jr -
	
_LABEL_1F78_:	
		ld a, (ix-7)
		or a
		jr z, ++
		bit 2, (ix-14)
		jr z, +
		ld a, (ix-2)
		ld (ix-13), a
		ld a, (ix-1)
		ld (ix-12), a
		ld (ix-16), $01
+:	
		ld c, (ix-14)
		srl c
		srl c
		srl c
		ld (ix-1), c
		ld (ix-2), $00
		jp _LABEL_1EA0_
	
++:	
		ld l, (ix-8)
		ld a, l
		or a
		jr z, _LABEL_201B_
		ld a, (ix-1)
		ld (ix-10), a
		ld (ix-9), $00
		ld c, (ix-4)
		ld b, (ix-3)
		ld (ix-11), l
-:	
		ld a, (ix-11)
		or a
		jr z, ++
		ld a, (bc)
		out (Port_VDPData), a
		inc bc
		nop
		nop
		nop
		ld a, (ix-10)
		out (Port_VDPData), a
		dec (ix-15)
		ld a, (ix-15)
		or a
		jr nz, +
		ld hl, $0040
		add hl, de
		ex de, hl
		push bc
		ld l, e
		ld h, d
		rst $08	; _LABEL_8_
		pop bc
		ld a, (ix-6)
		ld (ix-15), a
+:	
		dec (ix-11)
		jr -
	
_LABEL_1FF1_:	
		ld (ix-2), c
		ld (ix-1), b
		jr _LABEL_2001_
	
	; Data from 1FF9 to 1FFA (2 bytes)
	.db $18 $06
	
++:	
		ld (ix+6), c
		ld (ix+7), b
_LABEL_2001_:	
		bit 0, (ix-16)
		jp z, _LABEL_1EA0_
		ld a, (ix-13)
		ld (ix-2), a
		ld a, (ix-12)
		ld (ix-1), a
		ld (ix-16), $00
		jp _LABEL_1EA0_
	
_LABEL_201B_:	
		ld sp, ix
		pop ix
		ret
	
___sdcc_call_hl:	
		jp (hl)
	
_SMS_loadPSGaidencompressedTiles:	
		ld iy, $0004
		add iy, sp
		ld l, (iy+0)
		ld h, (iy+1)
		add hl, hl
		add hl, hl
		add hl, hl
		add hl, hl
		add hl, hl
		set 6, h
		rst $08	; _LABEL_8_
		pop bc
		pop ix
		push ix
		push bc
		ld c, (ix+0)
		inc ix
		ld b, (ix+0)
		inc ix
_LABEL_2045_:	
		push bc
		ld b, $04
		ld de, decompBuffer	; decompBuffer = $C126
		ld c, (ix+0)
		inc ix
_LABEL_2050_:	
		rlc c
		jr nc, _LABEL_2097_
		rlc c
		jr c, ++
		ld a, (ix+0)
		inc ix
		ex de, hl
		ld d, a
		and $03
		add a, a
		add a, a
		add a, a
		ld e, a
		ld a, d
		ld d, $00
		ld iy, decompBuffer	; decompBuffer = $C126
		add iy, de
		ex de, hl
		cp $03
		jr c, _LABEL_20B1_
		cp $10
		jr c, +
		cp $13
		jr c, ++++
		cp $20
		jr c, +
		cp $23
		jr c, +++++
		cp $40
		jr c, +
		cp $43
		jr c, ++++++
+:	
		ld h, a
		ld l, (ix+0)
		inc ix
		jr +++
	
++:	
		ld h, $00
		jr +++
	
_LABEL_2097_:	
		rlc c
		sbc a, a
		ld l, a
		ld h, $FF
+++:	
		push bc
		ld b, $08
-:	
		ld a, l
		rlc h
		jr c, +
		ld a, (ix+0)
		inc ix
+:	
		ld (de), a
		inc de
		djnz -
		pop bc
		jr ++++++++
	
_LABEL_20B1_:	
		ld hl, $FF00
		jr +++++++
	
++++:	
		ld hl, $FFFF
		jr +++++++
	
+++++:	
		ld h, (ix+0)
		ld l, $00
		inc ix
		jr +++++++
	
++++++:	
		ld h, (ix+0)
		ld l, $FF
		inc ix
+++++++:	
		push bc
		ld b, $08
-:	
		ld a, (iy+0)
		inc iy
		xor l
		rlc h
		jr c, +
		ld a, (ix+0)
		inc ix
+:	
		ld (de), a
		inc de
		djnz -
		pop bc
++++++++:	
		dec b
		jp nz, _LABEL_2050_
		ld de, $0008
		ld c, e
		ld hl, decompBuffer	; decompBuffer = $C126
--:	
		ld b, $04
		push hl
-:	
		ld a, (hl)
		out (Port_VDPData), a
		add hl, de
		djnz -
		pop hl
		inc hl
		dec c
		jr nz, --
		pop bc
		dec bc
		ld a, b
		or c
		jp nz, _LABEL_2045_
		ret
