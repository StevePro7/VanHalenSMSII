.section "PSGStop" superfree
PSGStop:
		ld a, (PSGMusicStatus)	; PSGMusicStatus = $C001
		or a
		ret z
		ld a, $9F
		out (Port_PSG), a
		ld a, $BF
		out (Port_PSG), a
		ld a, (PSGChannel2SFX)	; PSGChannel2SFX = $C016
		or a
		jr nz, +
		ld a, $DF
		out (Port_PSG), a
+:
		ld a, (PSGChannel3SFX)	; PSGChannel3SFX = $C017
		or a
		jr nz, +
		ld a, $FF
		out (Port_PSG), a
+:
		ld hl, PSGMusicStatus	; PSGMusicStatus = $C001
		ld (hl), $00
		ret


.ends

.section "PSGResume" superfree
PSGResume:
	; .db $3A $01 $C0 $B7 $C0 $3A $0F $C0 $F6 $90 $D3 $7F $3A $10 $C0 $F6
	; .db $B0 $D3 $7F $3A $16 $C0 $B7 $20 $17 $3A $13 $C0 $E6 $0F $F6 $C0
	; .db $D3 $7F $3A $14 $C0 $E6 $3F $D3 $7F $3A $11 $C0 $F6 $D0 $D3 $7F
	; .db $3A $17 $C0 $B7 $20 $10 $3A $15 $C0 $E6 $0F $F6 $E0 $D3 $7F $3A
	; .db $12 $C0 $F6 $F0 $D3 $7F $21 $01 $C0 $36 $01 $C9
		ld a, (PSGMusicStatus)	; PSGMusicStatus = $C001
		or a
		ret nz
		ld a, (PSGChan0Volume)	; PSGChan0Volume = $C00F
		or $90
		out (Port_PSG), a
		ld a, (PSGChan1Volume)	; PSGChan1Volume = $C010
		or $B0
		out (Port_PSG), a
		ld a, (PSGChannel2SFX)	; PSGChannel2SFX = $C016
		or a
		jr nz, +
		ld a, (PSGChan2LowTone)	; PSGChan2LowTone = $C013
		and $0F
		or $C0
		out (Port_PSG), a
		ld a, (PSGChan2HighTone)	; PSGChan2HighTone = $C014
		and $3F
		out (Port_PSG), a
		ld a, (PSGChan2Volume)	; PSGChan2Volume = $C011
		or $D0
		out (Port_PSG), a
+:
		ld a, (PSGChannel3SFX)	; PSGChannel3SFX = $C017
		or a
		jr nz, +
		ld a, (PSGChan3LowTone)	; PSGChan3LowTone = $C015
		and $0F
		or $E0
		out (Port_PSG), a
		ld a, (PSGChan3Volume)	; PSGChan3Volume = $C012
		or $F0
		out (Port_PSG), a
+:
		ld hl, PSGMusicStatus	; PSGMusicStatus = $C001
		ld (hl), $01
		ret

.ends

.section "PSGPlay" superfree
PSGPlay:
	;.db $CD $81 $02 $21 $09 $C0 $36 $01 $D1 $C1 $C5 $D5 $ED $43 $02 $C0
	;.db $ED $43 $04 $C0 $ED $43 $06 $C0 $21 $08 $C0 $36 $00 $21 $0C $C0
	;.db $36 $00 $21 $0A $C0 $36 $9F $21 $01 $C0 $36 $01 $C9
		call $0281
		ld hl, $C009				; PSGLoopFlag
		ld (hl), $01
		pop de
		pop bc
		push bc
		push de
		ld (PSGMusicStart), bc		; PSGMusicStart = $C002

		ld (PSGMusicPointer), bc	; PSGMusicPointer = $C004
		ld (PSGMusicLoopPoint), bc	; PSGMusicLoopPoint = $C006
		ld hl, PSGMusicSkipFrames	; PSGMusicSkipFrames = $C008
		ld (hl), $00
		ld hl, PSGMusicSubstringLen	; PSGMusicSubstringLen = $C00C

		ld (hl), $00
		ld hl, PSGMusicLastLatch	; PSGMusicLastLatch = $C00A
		ld (hl), $9F
		ld hl, PSGMusicStatus		; PSGMusicStatus = $C001
		ld (hl), $01
		ret


.ends

.section "PSGCancelLoop" superfree
PSGCancelLoop:
	;.db $21 $09 $C0 $36 $00 $C9
		ld hl, PSGLoopFlag			; PSGLoopFlag = $C009
		ld (hl), $00
		ret

.ends

.section "PSGPlayNoRepeat" superfree
PSGPlayNoRepeat:
	;.db $C1 $E1 $E5 $C5 $E5 $CD $F4 $02 $F1 $21 $09 $C0 $36 $00 $C9
		pop bc
		pop hl
		push hl
		push bc
		push hl
		call PSGPlay				; _PSGPlay = $02F4
		pop af
		ld hl, PSGLoopFlag			; PSGLoopFlag = $C009
		ld (hl), $00
		ret

.ends

.section "PSGGetStatus" superfree
PSGGetStatus:
	;.db $FD $21 $01 $C0 $FD $6E $00 $C9
		ld iy, PSGMusicStatus		; PSGMusicStatus = $C001
		ld l, (iy + $00)
		ret

.ends

.section "PSGSilenceChannels" superfree
PSGSilenceChannels:
		ld a, $9F
		out (Port_PSG), a
		ld a, $BF
		out (Port_PSG), a
		ld a, $DF
		out (Port_PSG), a
		ld a, $FF
		out (Port_PSG), a
		ret

.ends

.section "PSGRestoreVolumes" superfree
PSGRestoreVolumes:
		push ix
		ld ix, $0000
		add ix, sp
		push af
		ld iy, PSGMusicVolumeAttenuation	; PSGMusicVolumeAttenuation = $C00B
		ld a, (iy+0)
		ld (ix-2), a
		xor a
		ld (ix-1), a
		ld c, (iy+0)
		ld a, (PSGMusicStatus)	; PSGMusicStatus = $C001
		or a
		jr z, LABEL_3C7_		; stevepro
		ld a, (PSGChan0Volume)	; PSGChan0Volume = $C00F
		and $0F
		ld e, a
		ld d, $00
		pop hl
		push hl
		add hl, de
		ld a, $0F
		cp l
		ld a, $00
		sbc a, h
		jp po, +
		xor $80
+:
		jp p, +
		ld de, SMS_crt0_RST18 - 2	; SMS_crt0_RST18 - 2 = $000F
		jr ++

+:
		ld a, (PSGChan0Volume)	; PSGChan0Volume = $C00F
		and $0F
		add a, c
		ld e, a
		rla
		sbc a, a
++:
		ld a, e
		or $90
		out (Port_PSG), a
		ld a, (PSGChan1Volume)	; PSGChan1Volume = $C010
		and $0F
		ld e, a
		ld d, $00
		pop hl
		push hl
		add hl, de
		ld a, $0F
		cp l
		ld a, $00
		sbc a, h
		jp po, +
		xor $80
+:
		jp p, +
		ld de, SMS_crt0_RST18 - 2	; SMS_crt0_RST18 - 2 = $000F
		jr ++

+:
		ld a, (PSGChan1Volume)	; PSGChan1Volume = $C010
		and $0F
		add a, c
		ld e, a
		rla
		sbc a, a
++:
		ld a, e
		or $B0
		out (Port_PSG), a
;.ends
;.section "LABEL_3C7_" superfree
LABEL_3C7_:
		ld a, (PSGChannel2SFX)	; PSGChannel2SFX = $C016
		or a
		jr z, +
		ld a, (PSGSFXChan2Volume)	; PSGSFXChan2Volume = $C018
		or $D0
		out (Port_PSG), a
		jr +++

+:
		ld a, (PSGMusicStatus)	; PSGMusicStatus = $C001
		or a
		jr z, +++
		ld a, (PSGChan2Volume)	; PSGChan2Volume = $C011
		and $0F
		ld e, a
		ld d, $00
		pop hl
		push hl
		add hl, de
		ld a, $0F
		cp l
		ld a, $00
		sbc a, h
		jp po, +
		xor $80
+:
		jp p, +
		ld de, SMS_crt0_RST18 - 2	; SMS_crt0_RST18 - 2 = $000F
		jr ++

+:
		ld a, (PSGChan2Volume)	; PSGChan2Volume = $C011
		and $0F
		add a, c
		ld e, a
		rla
		sbc a, a
++:
		ld a, e
		or $D0
		out (Port_PSG), a
+++:
		ld a, (PSGChannel3SFX)	; PSGChannel3SFX = $C017
		or a
		jr z, +
		ld a, (PSGSFXChan3Volume)	; PSGSFXChan3Volume = $C019
		or $F0
		out (Port_PSG), a
		jr +++

+:
		ld a, (PSGMusicStatus)	; PSGMusicStatus = $C001
		or a
		jr z, +++
		ld a, (PSGChan3Volume)	; PSGChan3Volume = $C012
		and $0F
		ld l, a
		ld h, $00
		pop de
		push de
		add hl, de
		ld a, $0F
		cp l
		ld a, $00
		sbc a, h
		jp po, +
		xor $80
+:
		jp p, +
		ld bc, SMS_crt0_RST18 - 2	; SMS_crt0_RST18 - 2 = $000F
		jr ++

+:
		ld a, (PSGChan3Volume)	; PSGChan3Volume = $C012
		and $0F
		add a, c
		ld c, a
		rla
		sbc a, a
++:
		ld a, c
		or $F0
		out (Port_PSG), a
+++:
		ld sp, ix
		pop ix
		ret

.ends

.section "PSGSetMusicVolumeAttenuation" superfree
PSGSetMusicVolumeAttenuation:
	; .db $DD $E5 $DD $21 $00 $00 $DD $39 $F5 $DD $7E $04 $32 $0B $C0 $3A
	; .db $01 $C0 $B7 $CA $38 $05 $3A $0F $C0 $E6 $0F $4F $1E $00 $FD $21
	; .db $0B $C0 $FD $7E $00 $DD $77 $FE $AF $DD $77 $FF $79 $DD $86 $FE
	; .db $47 $7B $DD $8E $FF $5F $FD $4E $00 $3E $0F $B8 $3E $00 $9B $E2
	; .db $92 $04 $EE $80 $F2 $9A $04 $11 $0F $00 $18 $09 $3A $0F $C0 $E6
	; .db $0F $81 $5F $17 $9F $7B $F6 $90 $D3 $7F $3A $10 $C0 $E6 $0F $5F
	; .db $16 $00 $E1 $E5 $19 $3E $0F $BD $3E $00 $9C $E2 $BE $04 $EE $80
	; .db $F2 $C6 $04 $11 $0F $00 $18 $09 $3A $10 $C0 $E6 $0F $81 $5F $17
	; .db $9F $7B $F6 $B0 $D3 $7F $3A $16 $C0 $B7 $20 $2C $3A $11 $C0 $E6
	; .db $0F $6F $26 $00 $D1 $D5 $19 $3E $0F $BD $3E $00 $9C $E2 $F0 $04
	; .db $EE $80 $F2 $F8 $04 $11 $0F $00 $18 $09 $3A $11 $C0 $E6 $0F $81
	; .db $5F $17 $9F $7B $F6 $D0 $D3 $7F $3A $17 $C0 $B7 $20 $2C $3A $12
	; .db $C0 $E6 $0F $6F $26 $00 $D1 $D5 $19 $3E $0F $BD $3E $00 $9C $E2
	; .db $22 $05 $EE $80 $F2 $2A $05 $01 $0F $00 $18 $09 $3A $12 $C0 $E6
	; .db $0F $81 $4F $17 $9F $79 $F6 $F0 $D3 $7F $DD $F9 $DD $E1 $C9
		push ix
		ld ix, $0000
		add ix, sp
		push af
		ld a, (ix+4)
		ld (PSGMusicVolumeAttenuation), a	; PSGMusicVolumeAttenuation = $C00B
		ld a, (PSGMusicStatus)	; PSGMusicStatus = $C001
		or a
		jp z, LABEL_538_
		ld a, (PSGChan0Volume)	; PSGChan0Volume = $C00F
		and $0F
		ld c, a
		ld e, $00
		ld iy, PSGMusicVolumeAttenuation	; PSGMusicVolumeAttenuation = $C00B
		ld a, (iy+0)
		ld (ix-2), a
		xor a
		ld (ix-1), a
		ld a, c
		add a, (ix-2)
		ld b, a
		ld a, e
		adc a, (ix-1)
		ld e, a
		ld c, (iy+0)
		ld a, $0F
		cp b
		ld a, $00
		sbc a, e
		jp po, +
		xor $80
+:
		jp p, +
		ld de, $000F
		jr ++

+:
		ld a, (PSGChan0Volume)	; PSGChan0Volume = $C00F
		and $0F
		add a, c
		ld e, a
		rla
		sbc a, a
++:
		ld a, e
		or $90
		out (Port_PSG), a
		ld a, (PSGChan1Volume)	; PSGChan1Volume = $C010
		and $0F
		ld e, a
		ld d, $00
		pop hl
		push hl
		add hl, de
		ld a, $0F
		cp l
		ld a, $00
		sbc a, h
		jp po, +
		xor $80
+:
		jp p, +
		ld de, $000F
		jr ++

+:
		ld a, (PSGChan1Volume)	; PSGChan1Volume = $C010
		and $0F
		add a, c
		ld e, a
		rla
		sbc a, a
++:
		ld a, e
		or $B0
		out (Port_PSG), a
		ld a, (PSGChannel2SFX)	; PSGChannel2SFX = $C016
		or a
		jr nz, +++
		ld a, (PSGChan2Volume)	; PSGChan2Volume = $C011
		and $0F
		ld l, a
		ld h, $00
		pop de
		push de
		add hl, de
		ld a, $0F
		cp l
		ld a, $00
		sbc a, h
		jp po, +
		xor $80
+:
		jp p, +
		ld de, $000F
		jr ++

+:
		ld a, (PSGChan2Volume)	; PSGChan2Volume = $C011
		and $0F
		add a, c
		ld e, a
		rla
		sbc a, a
++:
		ld a, e
		or $D0
		out (Port_PSG), a
+++:
		ld a, (PSGChannel3SFX)	; PSGChannel3SFX = $C017
		or a
		jr nz, LABEL_538_
		ld a, (PSGChan3Volume)	; PSGChan3Volume = $C012
		and $0F
		ld l, a
		ld h, $00
		pop de
		push de
		add hl, de
		ld a, $0F
		cp l
		ld a, $00
		sbc a, h
		jp po, +
		xor $80
+:
		jp p, +
		ld bc, $000F
		jr ++

+:
		ld a, (PSGChan3Volume)	; PSGChan3Volume = $C012
		and $0F
		add a, c
		ld c, a
		rla
		sbc a, a
++:
		ld a, c
		or $F0
		out (Port_PSG), a
;.ends
;.section "LABEL_538_" superfree
LABEL_538_:
		ld sp, ix
		pop ix
		ret


.ends

.section "PSGSFXStop" superfree
PSGSFXStop:
		push ix
		ld ix, $0000
		add ix, sp
		push af
		ld a, (PSGSFXStatus)	; PSGSFXStatus = $C01A
		or a
		jp z, LABEL_602_
		ld iy, PSGMusicVolumeAttenuation	; PSGMusicVolumeAttenuation = $C00B
		ld a, (iy+0)
		ld (ix-2), a
		xor a
		ld (ix-1), a
		ld c, (iy+0)
		ld a, (PSGChannel2SFX)	; PSGChannel2SFX = $C016
		or a
		jr z, LABEL_5B1_		; stevepro
		ld a, (PSGMusicStatus)	; PSGMusicStatus = $C001
		or a
		jr z, LABEL_5A8_		; stevepro
		ld a, (PSGChan2LowTone)	; PSGChan2LowTone = $C013
		and $0F
		or $C0
		out (Port_PSG), a
		ld a, (PSGChan2HighTone)	; PSGChan2HighTone = $C014
		and $3F
		out (Port_PSG), a
		ld a, (PSGChan2Volume)	; PSGChan2Volume = $C011
		and $0F
		ld e, a
		ld d, $00
		pop hl
		push hl
		add hl, de
		ld a, $0F
		cp l
		ld a, $00
		sbc a, h
		jp po, +
		xor $80
+:
		jp p, +
		ld de, SMS_crt0_RST18 - 2	; SMS_crt0_RST18 - 2 = $000F
		jr ++

+:
		ld a, (PSGChan2Volume)	; PSGChan2Volume = $C011
		and $0F
		add a, c
		ld e, a
		rla
		sbc a, a
++:
		ld a, e
		or $D0
		out (Port_PSG), a
		jr +

;.ends
;.section "LABEL_5A8_" superfree
LABEL_5A8_:
		ld a, $DF
		out (Port_PSG), a
+:
		ld hl, PSGChannel2SFX	; PSGChannel2SFX = $C016
		ld (hl), $00
;.ends
;.section "LABEL_5B1_" superfree
LABEL_5B1_:
		ld a, (PSGChannel3SFX)	; PSGChannel3SFX = $C017
		or a
		jr z, LABEL_5FD_
		ld a, (PSGMusicStatus)	; PSGMusicStatus = $C001
		or a
		jr z, +++
		ld a, (PSGChan3LowTone)	; PSGChan3LowTone = $C015
		and $0F
		or $E0
		out (Port_PSG), a
		ld a, (PSGChan3Volume)	; PSGChan3Volume = $C012
		and $0F
		ld l, a
		ld h, $00
		pop de
		push de
		add hl, de
		ld a, $0F
		cp l
		ld a, $00
		sbc a, h
		jp po, +
		xor $80
+:
		jp p, +
		ld bc, SMS_crt0_RST18 - 2	; SMS_crt0_RST18 - 2 = $000F
		jr ++

+:
		ld a, (PSGChan3Volume)	; PSGChan3Volume = $C012
		and $0F
		add a, c
		ld c, a
		rla
		sbc a, a
++:
		ld a, c
		or $F0
		out (Port_PSG), a
		jr ++++

+++:
		ld a, $FF
		out (Port_PSG), a
++++:
		ld hl, PSGChannel3SFX	; PSGChannel3SFX = $C017
		ld (hl), $00
;.ends
;.section "LABEL_5FD_" superfree
LABEL_5FD_:
		ld hl, PSGSFXStatus	; PSGSFXStatus = $C01A
		ld (hl), $00
;.ends
;.section "LABEL_602_" superfree
LABEL_602_:
		ld sp, ix
		pop ix
		ret

.ends

.section "PSGSFXPlay" superfree
PSGSFXPlay:
	;.db $CD $3D $05 $21 $22 $C0 $36 $00 $D1 $C1 $C5 $D5 $ED $43 $1B $C0
	;.db $ED $43 $1D $C0 $ED $43 $1F $C0 $21 $21 $C0 $36 $00 $21 $23 $C0
	;.db $36 $00 $21 $04 $00 $39 $4E $CB $41 $28 $05 $11 $01 $00 $18 $03
	;.db $11 $00 $00 $21 $16 $C0 $73 $CB $49 $28 $05 $01 $01 $00 $18 $03
	;.db $01 $00 $00 $21 $17 $C0 $71 $21 $1A $C0 $36 $01 $C9
		call PSGSFXStop			; PSGSFXStop = $053D
		ld hl, PSGSFXLoopFlag		; PSGSFXLoopFlag = $C022
		ld (hl), $00
		pop de
		pop bc
		push bc
		push de
		ld (PSGSFXStart), bc		; PSGSFXStart = $C01B

		ld (PSGSFXPointer), bc		; PSGSFXPointer = $C01D
		ld (PSGSFXLoopPoint), bc	; PSGSFXLoopPoint = $C01F
		ld hl, PSGSFXSkipFrames		; PSGSFXSkipFrames = $C021
		ld (hl), $00
		ld hl, PSGSFXSubstringLen	; PSGSFXSubstringLen = $C023

		ld (hl), $00
		ld hl, $0004
		add hl, sp
		ld c, (hl)
		bit 0, c
		jr z, $05
		ld de, $0001
		jr $03

		ld de, $0000
		ld hl, PSGChannel2SFX		; PSGChannel2SFX = $C016
		ld (hl), e
		bit 1, c
		jr z, $05
		ld bc, $0001
		jr $03

		ld bc, $0000
		ld hl, PSGChannel3SFX		; PSGChannel3SFX = $C017
		ld (hl), c
		ld hl, PSGSFXStatus			; PSGSFXStatus = $C01A
		ld (hl), $01
		ret

.ends

.section "PSGSFXCancelLoop" superfree
PSGSFXCancelLoop:
	;.db $21 $22 $C0 $36 $00 $C9
		ld hl, PSGSFXLoopFlag		; PSGSFXLoopFlag = $C022
		ld (hl), $00
		ret

.ends

.section "PSGSFXGetStatus" superfree
PSGSFXGetStatus:
	;.db $FD $21 $1A $C0 $FD $6E $00 $C9
		ld iy, PSGSFXStatus			; PSGSFXStatus = $C01A
		ld l, (iy + $00)
		ret

.ends

.section "PSGSFXPlayLoop" superfree
PSGSFXPlayLoop:
	;.db $FD $21 $04 $00 $FD $39 $FD $7E $00 $F5 $33 $FD $2B $FD $2B $FD
	;.db $6E $00 $FD $66 $01 $E5 $CD $07 $06 $F1 $33 $21 $22 $C0 $36 $01
	;.db $C9
		ld iy, $0004
		add iy, sp
		ld a, (iy + $00)
		push af
		inc sp
		dec iy
		dec iy
		ld l, (iy + $00)
		ld h, (iy + $01)
		push hl
		call PSGSFXPlay			; _PSGSFXPlay = $0607
		pop af
		inc sp
		ld hl, PSGSFXLoopFlag		; PSGSFXLoopFlag = $C022
		ld (hl), $01
		ret

.ends

.section "PSGFrame" superfree
PSGFrame:
		ld a, (PSGMusicStatus)	; PSGMusicStatus = $C001
		or a
		ret z
		ld a, (PSGMusicSkipFrames)	; PSGMusicSkipFrames = $C008
		or a
		jp nz, LABEL_717_			; stevepro
		ld hl, (PSGMusicPointer)	; PSGMusicPointer = $C004
;.ends
;.section "LABEL_692_" superfree
LABEL_692_:
		ld b, (hl)
		inc hl
		ld a, (PSGMusicSubstringLen)	; PSGMusicSubstringLen = $C00C
		or a
		jr z, +
		dec a
		ld (PSGMusicSubstringLen), a	; PSGMusicSubstringLen = $C00C
		jr nz, +
		ld hl, (PSGMusicSubstringRetAddr)	; PSGMusicSubstringRetAddr = $C00D
+:
		ld a, b
		cp $80
		jr c, LABEL_71C_
		ld (PSGMusicLastLatch), a	; PSGMusicLastLatch = $C00A
		bit 4, a
		jr nz, ++
		bit 6, a
		jp z, LABEL_743_
		bit 5, a
		jr z, +
		ld (PSGChan3LowTone), a	; PSGChan3LowTone = $C015
		ld a, (PSGChannel3SFX)	; PSGChannel3SFX = $C017
		or a
		jp nz, LABEL_692_
		ld a, (PSGChan3LowTone)	; PSGChan3LowTone = $C015
		and $03
		cp $03
		jr nz, LABEL_742_
		ld a, (PSGSFXStatus)	; PSGSFXStatus = $C01A
		or a
		jr z, LABEL_742_
		ld (PSGChannel3SFX), a	; PSGChannel3SFX = $C017
		ld a, $FF
		out (Port_PSG), a
		jp LABEL_692_

+:
		ld (PSGChan2LowTone), a	; PSGChan2LowTone = $C013
		ld a, (PSGChannel2SFX)	; PSGChannel2SFX = $C016
		or a
		jr z, LABEL_742_
		jp LABEL_692_

++:
		bit 6, a
		jr nz, ++
		bit 5, a
		jr z, +
		ld (PSGChan1Volume), a	; PSGChan1Volume = $C010
		jp LABEL_749_

+:
		ld (PSGChan0Volume), a	; PSGChan0Volume = $C00F
		jp LABEL_749_

++:
		bit 5, a
		jr z, +
		ld (PSGChan3Volume), a	; PSGChan3Volume = $C012
		ld a, (PSGChannel3SFX)	; PSGChannel3SFX = $C017
		or a
		jr z, LABEL_748_
		jp LABEL_692_

+:
		ld (PSGChan2Volume), a	; PSGChan2Volume = $C011
		ld a, (PSGChannel2SFX)	; PSGChannel2SFX = $C016
		or a
		jr z, LABEL_748_
		jp LABEL_692_

;.ends
;.section "LABEL_717_" superfree
LABEL_717_:
		dec a
		ld (PSGMusicSkipFrames), a	; PSGMusicSkipFrames = $C008
		ret

;.ends
;.section "LABEL_71C_" superfree
LABEL_71C_:
		cp $40
		jr c, +
		ld a, (PSGMusicLastLatch)	; PSGMusicLastLatch = $C00A
		jp +++

+:
		cp $38
		jr z, +
		jr c, ++
		and $07
		ld (PSGMusicSkipFrames), a	; PSGMusicSkipFrames = $C008
+:
		ld (PSGMusicPointer), hl	; PSGMusicPointer = $C004
		ret

++:
		cp $08
		jr nc, LABEL_77B_
		cp $00
		jr z, +++++
		cp $01
		jr z, ++++
		ret

;.ends
;.section "LABEL_742_" superfree
LABEL_742_:
		ld a, b
;.ends
;.section "LABEL_743_" superfree
LABEL_743_:
		out (Port_PSG), a
		jp LABEL_692_

;.ends
;.section "LABEL_748_" superfree
LABEL_748_:
		ld a, b
;.ends
;.section "LABEL_749_" superfree
LABEL_749_:
		ld c, a
		and $0F
		ld b, a
		ld a, (PSGMusicVolumeAttenuation)	; PSGMusicVolumeAttenuation = $C00B
		add a, b
		cp $0F
		jr c, +
		ld a, $0F
+:
		ld b, a
		ld a, c
		and $F0
		or b
		out (Port_PSG), a
		jp LABEL_692_

+++:
		bit 6, a
		jr nz, ++++++
		jp LABEL_742_

++++:
		ld (PSGMusicLoopPoint), hl	; PSGMusicLoopPoint = $C006
		jp LABEL_692_

+++++:
		ld a, (PSGLoopFlag)	; PSGLoopFlag = $C009
		or a
		jp z, PSGStop
		ld hl, (PSGMusicLoopPoint)	; PSGMusicLoopPoint = $C006
		jp LABEL_692_

;.ends
;.section "LABEL_77B_" superfree
LABEL_77B_:
		sub $04
		ld (PSGMusicSubstringLen), a	; PSGMusicSubstringLen = $C00C
		ld c, (hl)
		inc hl
		ld b, (hl)
		inc hl
		ld (PSGMusicSubstringRetAddr), hl	; PSGMusicSubstringRetAddr = $C00D
		ld hl, (PSGMusicStart)	; PSGMusicStart = $C002
		add hl, bc
		jp LABEL_692_

++++++:
		ld a, b
		ld (PSGChan2HighTone), a	; PSGChan2HighTone = $C014
		ld a, (PSGChannel2SFX)	; PSGChannel2SFX = $C016
		or a
		jr z, LABEL_742_
		jp LABEL_692_
		ret

.ends

.section "PSGSFXFrame" superfree
PSGSFXFrame:
		ld a, (PSGSFXStatus)	; PSGSFXStatus = $C01A
		or a
		ret z
		ld a, (PSGSFXSkipFrames)	; PSGSFXSkipFrames = $C021
		or a
		jp nz, +++
		ld hl, (PSGSFXPointer)	; PSGSFXPointer = $C01D
;.ends
;.section "LABEL_7AB_" superfree
LABEL_7AB_:
		ld b, (hl)
		inc hl
		ld a, (PSGSFXSubstringLen)	; PSGSFXSubstringLen = $C023
		or a
		jr z, +
		dec a
		ld (PSGSFXSubstringLen), a	; PSGSFXSubstringLen = $C023
		jr nz, +
		ld hl, (PSGSFXSubstringRetAddr)	; PSGSFXSubstringRetAddr = $C024
+:
		ld a, b
		cp $40
		jp c, ++++
		bit 4, a
		jr z, ++
		bit 5, a
		jr nz, +
		ld (PSGSFXChan2Volume), a	; PSGSFXChan2Volume = $C018
		jr ++

+:
		ld (PSGSFXChan3Volume), a	; PSGSFXChan3Volume = $C019
++:
		out (Port_PSG), a
		jp LABEL_7AB_

+++:
		dec a
		ld (PSGSFXSkipFrames), a	; PSGSFXSkipFrames = $C021
		ret

++++:
		cp $38
		jr z, +
		jr c, ++
		and $07
		ld (PSGSFXSkipFrames), a	; PSGSFXSkipFrames = $C021
+:
		ld (PSGSFXPointer), hl	; PSGSFXPointer = $C01D
		ret

++:
		cp $08
		jr nc, +++
		cp $00
		jr z, ++
		cp $01
		jr z, +
		ret

+:
		ld (PSGSFXLoopPoint), hl	; PSGSFXLoopPoint = $C01F
		jp LABEL_7AB_

++:
		ld a, (PSGSFXLoopFlag)	; PSGSFXLoopFlag = $C022
		or a
		jp z, PSGSFXStop
		ld hl, (PSGSFXLoopPoint)	; PSGSFXLoopPoint = $C01F
		ld (PSGSFXPointer), hl	; PSGSFXPointer = $C01D
		jp LABEL_7AB_

+++:
		sub $04
		ld (PSGSFXSubstringLen), a	; PSGSFXSubstringLen = $C023
		ld c, (hl)
		inc hl
		ld b, (hl)
		inc hl
		ld (PSGSFXSubstringRetAddr), hl	; PSGSFXSubstringRetAddr = $C024
		ld hl, (PSGSFXStart)	; PSGSFXStart = $C01B
		add hl, bc
		jp LABEL_7AB_
		ret

.ends
