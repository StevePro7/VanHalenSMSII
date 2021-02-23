; .sdsctag 1.0,"Van Halen","Van Halen Record Covers for the SMS Power! 2021 Competition","StevePro Studios"
; This disassembly was created using Emulicious (http://www.emulicious.net)	

.include "devkit/memory_manager.inc"
.include "devkit/enum_manager.inc"
.include "devkit/define_manager.inc"

.BANK 0 SLOT 0	
.ORG $0000	
	
_LABEL_0_:	
		di
		im 1
		jp _LABEL_70_
	
; Data from 6 to 7 (2 bytes)	
_SMS_crt0_RST08:
	.db $00 $00
	
_LABEL_8_:	
		ld c, Port_VDPAddress
		di
		out (c), l
		out (c), h
		ei
		ret
	
; Data from 11 to 37 (39 bytes)
_SMS_crt0_RST18:	
	.db $00 $00 $00 $00 $00 $00 $00 $7D $D3 $BE $7C $D6 $00 $00 $D3 $BE
	.db $C9
	.dsb 22, $00
	
_LABEL_38_:	
		jp _SMS_isr
	
	; Data from 3B to 65 (43 bytes)
	.dsb 43, $00
	
_LABEL_66_:	
		jp _SMS_nmi_isr
	
	; Data from 69 to 6F (7 bytes)
	.db $00 $00 $00 $00 $00 $00 $00
	
_LABEL_70_:	
		ld sp, $DFF0
		ld de, _RAM_FFFC_
		xor a
		ld (de), a
		ld b, $03
-:	
		inc de
		ld (de), a
		inc a
		djnz -
		xor a
		ld hl, Lmain.main$global_pause$1$55	; Lmain.main$global_pause$1$55 = $C000
		ld (hl), a
		ld de, PSGMusicStatus	; PSGMusicStatus = $C001
		ld bc, $1FF0
		ldir
		call gsinit
		call _SMS_init
		ei
		call A$main$83
		jp _exit
	
_OUTI128:	
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
_OUTI64:	
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		ret
	
	; Data from 19A to 1FF (102 bytes)
	.dsb 102, $00

; Data from 200 to 203 (4 bytes)	
__clock:	
	.db $3E $02 $CF $C9

_exit:	
		ld a, $00
		rst $08	; _LABEL_8_
-:	
		halt
		jr -
	
A$main$83:	
C$main.c$3$0$0:	
C$main.c$9$1$55:	
G$main$0$0:	
_main:	
		call A$asm_manager$59
		call A$_sms_manager$132
		call A$_sms_manager$163
		call A$_sms_manager$887
		ld b, l
		push bc
		inc sp
		call A$_sms_manager$323
		inc sp
		call A$_sms_manager$343
		call A$_sms_manager$905
		push hl
		call A$_sms_manager$379
		pop af
		call A$content_manager$65
		call A$content_manager$263
		call A$scroll_manager$61
		ld a, $01
		push af
		inc sp
		call A$screen_manager$80
		inc sp
		call A$_sms_manager$145
A$main$140:	
C$main.c$27$3$57:
		call A$_sms_manager$820
		ld a, l
		or a
		jr z, A$main$174
		call A$_sms_manager$837
		ld iy, Lmain.main$global_pause$1$55	; Lmain.main$global_pause$1$55 = $C000
		ld a, (iy+0)
		xor $01
		ld (iy+0), a
		bit 0, (iy+0)
		jr z, A$main$169
		call A$_snd_manager$275
		jr A$main$174

A$main$169:	
C$main.c$37$5$60:	
		call A$_snd_manager$292
A$main$174:	
C$main.c$41$3$57:	
		ld hl, Lmain.main$global_pause$1$55	; Lmain.main$global_pause$1$55 = $C000
		bit 0, (hl)
		jr nz, A$main$140
		call A$_sms_manager$735
		call A$input_manager$64
		call A$screen_manager$166
		call A$_sms_manager$752
		call A$_sms_manager$769
		call A$_sms_manager$786
		call A$_snd_manager$309
		call A$_snd_manager$326
		jr A$main$140
	
_PSGStop:	
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
	
; Data from 2A8 to 2F3 (76 bytes)	
_PSGResume:	
	.db $3A $01 $C0 $B7 $C0 $3A $0F $C0 $F6 $90 $D3 $7F $3A $10 $C0 $F6
	.db $B0 $D3 $7F $3A $16 $C0 $B7 $20 $17 $3A $13 $C0 $E6 $0F $F6 $C0
	.db $D3 $7F $3A $14 $C0 $E6 $3F $D3 $7F $3A $11 $C0 $F6 $D0 $D3 $7F
	.db $3A $17 $C0 $B7 $20 $10 $3A $15 $C0 $E6 $0F $F6 $E0 $D3 $7F $3A
	.db $12 $C0 $F6 $F0 $D3 $7F $21 $01 $C0 $36 $01 $C9
	
; Data from 2F4 to 320 (45 bytes)	
_PSGPlay:	
	.db $CD $81 $02 $21 $09 $C0 $36 $01 $D1 $C1 $C5 $D5 $ED $43 $02 $C0
	.db $ED $43 $04 $C0 $ED $43 $06 $C0 $21 $08 $C0 $36 $00 $21 $0C $C0
	.db $36 $00 $21 $0A $C0 $36 $9F $21 $01 $C0 $36 $01 $C9
	
; Data from 321 to 326 (6 bytes)	
_PSGCancelLoop:	
	.db $21 $09 $C0 $36 $00 $C9
	
; Data from 327 to 335 (15 bytes)	
_PSGPlayNoRepeat:	
	.db $C1 $E1 $E5 $C5 $E5 $CD $F4 $02 $F1 $21 $09 $C0 $36 $00 $C9
	
; Data from 336 to 33D (8 bytes)	
_PSGGetStatus:	
	.db $FD $21 $01 $C0 $FD $6E $00 $C9
	
_PSGSilenceChannels:	
		ld a, $9F
		out (Port_PSG), a
		ld a, $BF
		out (Port_PSG), a
		ld a, $DF
		out (Port_PSG), a
		ld a, $FF
		out (Port_PSG), a
		ret
	
_PSGRestoreVolumes:	
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
		jr z, _LABEL_3C7_		; stevepro
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
		ld de, _SMS_crt0_RST18 - 2	; _SMS_crt0_RST18 - 2 = $000F
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
		ld de, _SMS_crt0_RST18 - 2	; _SMS_crt0_RST18 - 2 = $000F
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
_LABEL_3C7_:	
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
		ld de, _SMS_crt0_RST18 - 2	; _SMS_crt0_RST18 - 2 = $000F
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
		ld bc, _SMS_crt0_RST18 - 2	; _SMS_crt0_RST18 - 2 = $000F
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
	
; Data from 44E to 53C (239 bytes)	
_PSGSetMusicVolumeAttenuation:	
	.db $DD $E5 $DD $21 $00 $00 $DD $39 $F5 $DD $7E $04 $32 $0B $C0 $3A
	.db $01 $C0 $B7 $CA $38 $05 $3A $0F $C0 $E6 $0F $4F $1E $00 $FD $21
	.db $0B $C0 $FD $7E $00 $DD $77 $FE $AF $DD $77 $FF $79 $DD $86 $FE
	.db $47 $7B $DD $8E $FF $5F $FD $4E $00 $3E $0F $B8 $3E $00 $9B $E2
	.db $92 $04 $EE $80 $F2 $9A $04 $11 $0F $00 $18 $09 $3A $0F $C0 $E6
	.db $0F $81 $5F $17 $9F $7B $F6 $90 $D3 $7F $3A $10 $C0 $E6 $0F $5F
	.db $16 $00 $E1 $E5 $19 $3E $0F $BD $3E $00 $9C $E2 $BE $04 $EE $80
	.db $F2 $C6 $04 $11 $0F $00 $18 $09 $3A $10 $C0 $E6 $0F $81 $5F $17
	.db $9F $7B $F6 $B0 $D3 $7F $3A $16 $C0 $B7 $20 $2C $3A $11 $C0 $E6
	.db $0F $6F $26 $00 $D1 $D5 $19 $3E $0F $BD $3E $00 $9C $E2 $F0 $04
	.db $EE $80 $F2 $F8 $04 $11 $0F $00 $18 $09 $3A $11 $C0 $E6 $0F $81
	.db $5F $17 $9F $7B $F6 $D0 $D3 $7F $3A $17 $C0 $B7 $20 $2C $3A $12
	.db $C0 $E6 $0F $6F $26 $00 $D1 $D5 $19 $3E $0F $BD $3E $00 $9C $E2
	.db $22 $05 $EE $80 $F2 $2A $05 $01 $0F $00 $18 $09 $3A $12 $C0 $E6
	.db $0F $81 $4F $17 $9F $79 $F6 $F0 $D3 $7F $DD $F9 $DD $E1 $C9
	
_PSGSFXStop:	
		push ix
		ld ix, $0000
		add ix, sp
		push af
		ld a, (PSGSFXStatus)	; PSGSFXStatus = $C01A
		or a
		jp z, _LABEL_602_
		ld iy, PSGMusicVolumeAttenuation	; PSGMusicVolumeAttenuation = $C00B
		ld a, (iy+0)
		ld (ix-2), a
		xor a
		ld (ix-1), a
		ld c, (iy+0)
		ld a, (PSGChannel2SFX)	; PSGChannel2SFX = $C016
		or a
		jr z, _LABEL_5B1_		; stevepro
		ld a, (PSGMusicStatus)	; PSGMusicStatus = $C001
		or a
		jr z, _LABEL_5A8_		; stevepro
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
		ld de, _SMS_crt0_RST18 - 2	; _SMS_crt0_RST18 - 2 = $000F
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
	
_LABEL_5A8_:	
		ld a, $DF
		out (Port_PSG), a
+:	
		ld hl, PSGChannel2SFX	; PSGChannel2SFX = $C016
		ld (hl), $00
_LABEL_5B1_:	
		ld a, (PSGChannel3SFX)	; PSGChannel3SFX = $C017
		or a
		jr z, _LABEL_5FD_
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
		ld bc, _SMS_crt0_RST18 - 2	; _SMS_crt0_RST18 - 2 = $000F
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
_LABEL_5FD_:	
		ld hl, PSGSFXStatus	; PSGSFXStatus = $C01A
		ld (hl), $00
_LABEL_602_:	
		ld sp, ix
		pop ix
		ret
	
; Data from 607 to 653 (77 bytes)	
_PSGSFXPlay:	
	.db $CD $3D $05 $21 $22 $C0 $36 $00 $D1 $C1 $C5 $D5 $ED $43 $1B $C0
	.db $ED $43 $1D $C0 $ED $43 $1F $C0 $21 $21 $C0 $36 $00 $21 $23 $C0
	.db $36 $00 $21 $04 $00 $39 $4E $CB $41 $28 $05 $11 $01 $00 $18 $03
	.db $11 $00 $00 $21 $16 $C0 $73 $CB $49 $28 $05 $01 $01 $00 $18 $03
	.db $01 $00 $00 $21 $17 $C0 $71 $21 $1A $C0 $36 $01 $C9
	
; Data from 654 to 659 (6 bytes)	
_PSGSFXCancelLoop:	
	.db $21 $22 $C0 $36 $00 $C9
	
; Data from 65A to 661 (8 bytes)	
_PSGSFXGetStatus:	
	.db $FD $21 $1A $C0 $FD $6E $00 $C9
	
; Data from 662 to 682 (33 bytes)	
_PSGSFXPlayLoop:	
	.db $FD $21 $04 $00 $FD $39 $FD $7E $00 $F5 $33 $FD $2B $FD $2B $FD
	.db $6E $00 $FD $66 $01 $E5 $CD $07 $06 $F1 $33 $21 $22 $C0 $36 $01
	.db $C9
	
_PSGFrame:	
		ld a, (PSGMusicStatus)	; PSGMusicStatus = $C001
		or a
		ret z
		ld a, (PSGMusicSkipFrames)	; PSGMusicSkipFrames = $C008
		or a
		jp nz, _LABEL_717_			; stevepro
		ld hl, (PSGMusicPointer)	; PSGMusicPointer = $C004
_LABEL_692_:	
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
		jr c, _LABEL_71C_
		ld (PSGMusicLastLatch), a	; PSGMusicLastLatch = $C00A
		bit 4, a
		jr nz, ++
		bit 6, a
		jp z, _LABEL_743_
		bit 5, a
		jr z, +
		ld (PSGChan3LowTone), a	; PSGChan3LowTone = $C015
		ld a, (PSGChannel3SFX)	; PSGChannel3SFX = $C017
		or a
		jp nz, _LABEL_692_
		ld a, (PSGChan3LowTone)	; PSGChan3LowTone = $C015
		and $03
		cp $03
		jr nz, _LABEL_742_
		ld a, (PSGSFXStatus)	; PSGSFXStatus = $C01A
		or a
		jr z, _LABEL_742_
		ld (PSGChannel3SFX), a	; PSGChannel3SFX = $C017
		ld a, $FF
		out (Port_PSG), a
		jp _LABEL_692_
	
+:	
		ld (PSGChan2LowTone), a	; PSGChan2LowTone = $C013
		ld a, (PSGChannel2SFX)	; PSGChannel2SFX = $C016
		or a
		jr z, _LABEL_742_
		jp _LABEL_692_
	
++:	
		bit 6, a
		jr nz, ++
		bit 5, a
		jr z, +
		ld (PSGChan1Volume), a	; PSGChan1Volume = $C010
		jp _LABEL_749_
	
+:	
		ld (PSGChan0Volume), a	; PSGChan0Volume = $C00F
		jp _LABEL_749_
	
++:	
		bit 5, a
		jr z, +
		ld (PSGChan3Volume), a	; PSGChan3Volume = $C012
		ld a, (PSGChannel3SFX)	; PSGChannel3SFX = $C017
		or a
		jr z, _LABEL_748_
		jp _LABEL_692_
	
+:	
		ld (PSGChan2Volume), a	; PSGChan2Volume = $C011
		ld a, (PSGChannel2SFX)	; PSGChannel2SFX = $C016
		or a
		jr z, _LABEL_748_
		jp _LABEL_692_
	
_LABEL_717_:	
		dec a
		ld (PSGMusicSkipFrames), a	; PSGMusicSkipFrames = $C008
		ret
	
_LABEL_71C_:	
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
		jr nc, _LABEL_77B_
		cp $00
		jr z, +++++
		cp $01
		jr z, ++++
		ret
	
_LABEL_742_:	
		ld a, b
_LABEL_743_:	
		out (Port_PSG), a
		jp _LABEL_692_
	
_LABEL_748_:	
		ld a, b
_LABEL_749_:	
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
		jp _LABEL_692_
	
+++:	
		bit 6, a
		jr nz, ++++++
		jp _LABEL_742_
	
++++:	
		ld (PSGMusicLoopPoint), hl	; PSGMusicLoopPoint = $C006
		jp _LABEL_692_
	
+++++:	
		ld a, (PSGLoopFlag)	; PSGLoopFlag = $C009
		or a
		jp z, _PSGStop
		ld hl, (PSGMusicLoopPoint)	; PSGMusicLoopPoint = $C006
		jp _LABEL_692_
	
_LABEL_77B_:	
		sub $04
		ld (PSGMusicSubstringLen), a	; PSGMusicSubstringLen = $C00C
		ld c, (hl)
		inc hl
		ld b, (hl)
		inc hl
		ld (PSGMusicSubstringRetAddr), hl	; PSGMusicSubstringRetAddr = $C00D
		ld hl, (PSGMusicStart)	; PSGMusicStart = $C002
		add hl, bc
		jp _LABEL_692_
	
++++++:	
		ld a, b
		ld (PSGChan2HighTone), a	; PSGChan2HighTone = $C014
		ld a, (PSGChannel2SFX)	; PSGChannel2SFX = $C016
		or a
		jr z, _LABEL_742_
		jp _LABEL_692_
	
	; Data from 79B to 79B (1 bytes)
	.db $C9
	
_PSGSFXFrame:	
		ld a, (PSGSFXStatus)	; PSGSFXStatus = $C01A
		or a
		ret z
		ld a, (PSGSFXSkipFrames)	; PSGSFXSkipFrames = $C021
		or a
		jp nz, +++
		ld hl, (PSGSFXPointer)	; PSGSFXPointer = $C01D
_LABEL_7AB_:	
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
		jp _LABEL_7AB_
	
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
		jp _LABEL_7AB_
	
++:	
		ld a, (PSGSFXLoopFlag)	; PSGSFXLoopFlag = $C022
		or a
		jp z, _PSGSFXStop
		ld hl, (PSGSFXLoopPoint)	; PSGSFXLoopPoint = $C01F
		ld (PSGSFXPointer), hl	; PSGSFXPointer = $C01D
		jp _LABEL_7AB_
	
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
		jp _LABEL_7AB_
	
	; Data from 821 to 821 (1 bytes)
	.db $C9
	
A$_sms_manager$132:	
C$_sms_manager.c$11$0$0:	
C$_sms_manager.c$13$1$74:	
C$_sms_manager.c$14$1$74:	
G$devkit_SMS_init$0$0:	
XG$devkit_SMS_init$0$0:	
_devkit_SMS_init:	
		jp _SMS_init
	
A$_sms_manager$145:	
C$_sms_manager.c$15$1$74:	
C$_sms_manager.c$17$1$75:	
G$devkit_SMS_displayOn$0$0:	
_devkit_SMS_displayOn:	
		ld hl, $0140
		jp _SMS_VDPturnOnFeature
	
A$_sms_manager$163:	
C$_sms_manager.c$19$1$75:	
C$_sms_manager.c$21$1$76:	
G$devkit_SMS_displayOff$0$0:	
_devkit_SMS_displayOff:	
		ld hl, $0140
		jp _SMS_VDPturnOffFeature
	
; Data from 831 to 833 (3 bytes)	
A$_sms_manager$181:	
C$_sms_manager.c$23$1$76:	
C$_sms_manager.c$25$1$78:	
G$devkit_SMS_mapROMBank$0$0:	
_devkit_SMS_mapROMBank:	
	.db $21 $02 $00
	
; Data from 834 to 834 (1 bytes)	
A$_sms_manager$182:	
	.db $39
	
; Data from 835 to 835 (1 bytes)	
A$_sms_manager$183:	
	.db $7E
	
; Data from 836 to 838 (3 bytes)	
A$_sms_manager$184:	
	.db $32 $FF $FF
	
; Data from 839 to 839 (1 bytes)	
A$_sms_manager$189:	
C$_sms_manager.c$26$1$78:	
XG$devkit_SMS_mapROMBank$0$0:	
	.db $C9
	
; Data from 83A to 83D (4 bytes)	
A$_sms_manager$202:	
C$_sms_manager.c$28$1$78:	
C$_sms_manager.c$30$1$80:	
G$devkit_SMS_setBGScrollX$0$0:	
_devkit_SMS_setBGScrollX:	
	.db $FD $21 $02 $00
	
; Data from 83E to 83F (2 bytes)	
A$_sms_manager$203:	
	.db $FD $39
	
; Data from 840 to 842 (3 bytes)	
A$_sms_manager$204:	
	.db $FD $6E $00
	
; Data from 843 to 845 (3 bytes)	
A$_sms_manager$209:	
C$_sms_manager.c$31$1$80:	
XG$devkit_SMS_setBGScrollX$0$0:	
	.db $C3 $E6 $1B
	
A$_sms_manager$222:	
C$_sms_manager.c$32$1$80:	
C$_sms_manager.c$34$1$82:	
G$devkit_SMS_setBGScrollY$0$0:	
_devkit_SMS_setBGScrollY:	
		ld iy, $0002
		add iy, sp
		ld l, (iy+0)
		jp _SMS_setBGScrollY
	
; Data from 852 to 854 (3 bytes)	
A$_sms_manager$242:	
C$_sms_manager.c$37$1$82:	
C$_sms_manager.c$39$1$83:	
G$devkit_SMS_enableSRAM$0$0:	
_devkit_SMS_enableSRAM:	
	.db $21 $FC $FF
	
; Data from 855 to 856 (2 bytes)	
A$_sms_manager$243:	
	.db $36 $08
	
; Data from 857 to 857 (1 bytes)	
A$_sms_manager$248:	
C$_sms_manager.c$40$1$83:	
XG$devkit_SMS_enableSRAM$0$0:	
	.db $C9
	
; Data from 858 to 85A (3 bytes)	
A$_sms_manager$261:	
C$_sms_manager.c$41$1$83:	
C$_sms_manager.c$43$1$85:	
G$devkit_SMS_enableSRAMBank$0$0:	
_devkit_SMS_enableSRAMBank:	
	.db $21 $02 $00
	
; Data from 85B to 85B (1 bytes)	
A$_sms_manager$262:	
	.db $39
	
; Data from 85C to 85C (1 bytes)	
A$_sms_manager$263:	
	.db $7E
	
; Data from 85D to 85D (1 bytes)	
A$_sms_manager$264:	
	.db $87
	
; Data from 85E to 85E (1 bytes)	
A$_sms_manager$265:	
	.db $87
	
; Data from 85F to 860 (2 bytes)	
A$_sms_manager$266:	
	.db $CB $DF
	
; Data from 861 to 862 (2 bytes)	
A$_sms_manager$267:	
	.db $E6 $0C
	
; Data from 863 to 865 (3 bytes)	
A$_sms_manager$268:	
	.db $32 $FC $FF
	
; Data from 866 to 866 (1 bytes)	
A$_sms_manager$273:	
C$_sms_manager.c$44$1$85:	
XG$devkit_SMS_enableSRAMBank$0$0:	
	.db $C9
	
; Data from 867 to 869 (3 bytes)	
A$_sms_manager$286:	
C$_sms_manager.c$45$1$85:	
C$_sms_manager.c$47$1$86:	
G$devkit_SMS_disableSRAM$0$0:	
_devkit_SMS_disableSRAM:	
	.db $21 $FC $FF
	
; Data from 86A to 86B (2 bytes)	
A$_sms_manager$287:	
	.db $36 $00
	
; Data from 86C to 86C (1 bytes)	
A$_sms_manager$292:	
C$_sms_manager.c$48$1$86:	
XG$devkit_SMS_disableSRAM$0$0:	
	.db $C9
	
; Data from 86D to 86F (3 bytes)	
A$_sms_manager$305:	
C$_sms_manager.c$49$1$86:	
C$_sms_manager.c$51$1$87:	
G$devkit_SMS_SRAM$0$0:	
_devkit_SMS_SRAM:	
	.db $21 $00 $80
	
; Data from 870 to 870 (1 bytes)	
A$_sms_manager$310:	
C$_sms_manager.c$52$1$87:	
XG$devkit_SMS_SRAM$0$0:	
	.db $C9
	
A$_sms_manager$323:	
C$_sms_manager.c$55$1$87:	
C$_sms_manager.c$57$1$89:	
G$devkit_SMS_setSpriteMode$0$0:	
_devkit_SMS_setSpriteMode:	
		ld iy, $0002
		add iy, sp
		ld l, (iy+0)
		jp _SMS_setSpriteMode
	
A$_sms_manager$343:	
C$_sms_manager.c$59$1$89:	
C$_sms_manager.c$61$1$90:	
G$devkit_SMS_useFirstHalfTilesfo:	
_devkit_SMS_useFirstHalfTilesfor:	
		ld l, $00
		jp _SMS_useFirstHalfTilesforSprites
	
; Data from 882 to 883 (2 bytes)	
A$_sms_manager$361:	
C$_sms_manager.c$63$1$90:	
C$_sms_manager.c$65$1$91:	
H$devkit_SMS_useFirstHalfTilesfo:	
_dewkit_SMS_useFirstHalfTilesfor:	
	.db $2E $01
	
; Data from 884 to 886 (3 bytes)	
A$_sms_manager$366:	
C$_sms_manager.c$66$1$91:	
XG$devkit_SMS_useFirstHalfTilesf:	
	.db $C3 $04 $1C
	
A$_sms_manager$379:	
C$_sms_manager.c$67$1$91:	
C$_sms_manager.c$69$1$93:	
G$devkit_SMS_VDPturnOnFeature$0$:	
_devkit_SMS_VDPturnOnFeature:	
		pop bc
		pop hl
		push hl
		push bc
		jp _SMS_VDPturnOnFeature
	
A$_sms_manager$400:	
C$_sms_manager.c$72$1$93:	
C$_sms_manager.c$74$1$95:	
G$devkit_SMS_loadPSGaidencompres:	
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
	
; Data from 8A4 to 8A5 (2 bytes)	
A$_sms_manager$432:	
C$_sms_manager.c$76$1$95:	
C$_sms_manager.c$78$1$97:	
G$devkit_SMS_loadSTMcompressedTi:	
_devkit_SMS_loadSTMcompressedTil:	
	.db $3E $20
	
; Data from 8A6 to 8A6 (1 bytes)	
A$_sms_manager$433:	
	.db $F5
	
; Data from 8A7 to 8A7 (1 bytes)	
A$_sms_manager$434:	
	.db $33
	
; Data from 8A8 to 8AA (3 bytes)	
A$_sms_manager$435:	
	.db $21 $05 $00
	
; Data from 8AB to 8AB (1 bytes)	
A$_sms_manager$436:	
	.db $39
	
; Data from 8AC to 8AC (1 bytes)	
A$_sms_manager$437:	
	.db $4E
	
; Data from 8AD to 8AD (1 bytes)	
A$_sms_manager$438:	
	.db $23
	
; Data from 8AE to 8AE (1 bytes)	
A$_sms_manager$439:	
	.db $46
	
; Data from 8AF to 8AF (1 bytes)	
A$_sms_manager$440:	
	.db $C5
	
; Data from 8B0 to 8B2 (3 bytes)	
A$_sms_manager$441:	
	.db $21 $06 $00
	
; Data from 8B3 to 8B3 (1 bytes)	
A$_sms_manager$442:	
	.db $39
	
; Data from 8B4 to 8B4 (1 bytes)	
A$_sms_manager$443:	
	.db $7E
	
; Data from 8B5 to 8B5 (1 bytes)	
A$_sms_manager$444:	
	.db $F5
	
; Data from 8B6 to 8B6 (1 bytes)	
A$_sms_manager$445:	
	.db $33
	
; Data from 8B7 to 8B9 (3 bytes)	
A$_sms_manager$446:	
	.db $21 $06 $00
	
; Data from 8BA to 8BA (1 bytes)	
A$_sms_manager$447:	
	.db $39
	
; Data from 8BB to 8BB (1 bytes)	
A$_sms_manager$448:	
	.db $7E
	
; Data from 8BC to 8BC (1 bytes)	
A$_sms_manager$449:	
	.db $F5
	
; Data from 8BD to 8BD (1 bytes)	
A$_sms_manager$450:	
	.db $33
	
; Data from 8BE to 8C0 (3 bytes)	
A$_sms_manager$451:	
	.db $CD $3F $1E
	
; Data from 8C1 to 8C1 (1 bytes)	
A$_sms_manager$452:	
	.db $F1
	
; Data from 8C2 to 8C2 (1 bytes)	
A$_sms_manager$453:	
	.db $F1
	
; Data from 8C3 to 8C3 (1 bytes)	
A$_sms_manager$454:	
	.db $33
	
; Data from 8C4 to 8C4 (1 bytes)	
A$_sms_manager$459:	
C$_sms_manager.c$79$1$97:	
XG$devkit_SMS_loadSTMcompressedT:	
	.db $C9
	
A$_sms_manager$472:	
C$_sms_manager.c$81$1$97:	
C$_sms_manager.c$83$1$99:	
G$devkit_SMS_loadBGPalette$0$0:	
_devkit_SMS_loadBGPalette:	
		pop bc
		pop hl
		push hl
		push bc
		jp _SMS_loadBGPalette
	
A$_sms_manager$493:	
C$_sms_manager.c$85$1$99:	
C$_sms_manager.c$87$1$101:	
G$devkit_SMS_loadSpritePalette$0:	
_devkit_SMS_loadSpritePalette:	
		pop bc
		pop hl
		push hl
		push bc
		jp _SMS_loadSpritePalette
	
; Data from 8D3 to 8D5 (3 bytes)	
A$_sms_manager$514:	
C$_sms_manager.c$89$1$101:	
C$_sms_manager.c$91$1$103:	
G$devkit_SMS_setBGPaletteColor$0:	
_devkit_SMS_setBGPaletteColor:	
	.db $21 $04 $00
	
; Data from 8D6 to 8D6 (1 bytes)	
A$_sms_manager$515:	
	.db $39
	
; Data from 8D7 to 8D7 (1 bytes)	
A$_sms_manager$516:	
	.db $7E
	
; Data from 8D8 to 8D8 (1 bytes)	
A$_sms_manager$517:	
	.db $87
	
; Data from 8D9 to 8D9 (1 bytes)	
A$_sms_manager$518:	
	.db $87
	
; Data from 8DA to 8DC (3 bytes)	
A$_sms_manager$519:	
	.db $21 $03 $00
	
; Data from 8DD to 8DD (1 bytes)	
A$_sms_manager$520:	
	.db $39
	
; Data from 8DE to 8DE (1 bytes)	
A$_sms_manager$521:	
	.db $B6
	
; Data from 8DF to 8DF (1 bytes)	
A$_sms_manager$522:	
	.db $4F
	
; Data from 8E0 to 8E2 (3 bytes)	
A$_sms_manager$523:	
	.db $21 $05 $00
	
; Data from 8E3 to 8E3 (1 bytes)	
A$_sms_manager$524:	
	.db $39
	
; Data from 8E4 to 8E4 (1 bytes)	
A$_sms_manager$525:	
	.db $7E
	
; Data from 8E5 to 8E5 (1 bytes)	
A$_sms_manager$526:	
	.db $07
	
; Data from 8E6 to 8E6 (1 bytes)	
A$_sms_manager$527:	
	.db $07
	
; Data from 8E7 to 8E7 (1 bytes)	
A$_sms_manager$528:	
	.db $07
	
; Data from 8E8 to 8E8 (1 bytes)	
A$_sms_manager$529:	
	.db $07
	
; Data from 8E9 to 8EA (2 bytes)	
A$_sms_manager$530:	
	.db $E6 $F0
	
; Data from 8EB to 8EB (1 bytes)	
A$_sms_manager$531:	
	.db $B1
	
; Data from 8EC to 8EC (1 bytes)	
A$_sms_manager$532:	
	.db $47
	
; Data from 8ED to 8ED (1 bytes)	
A$_sms_manager$536:	
C$_sms_manager.c$92$1$103:	
	.db $C5
	
; Data from 8EE to 8EE (1 bytes)	
A$_sms_manager$537:	
	.db $33
	
; Data from 8EF to 8F1 (3 bytes)	
A$_sms_manager$538:	
	.db $21 $03 $00
	
; Data from 8F2 to 8F2 (1 bytes)	
A$_sms_manager$539:	
	.db $39
	
; Data from 8F3 to 8F3 (1 bytes)	
A$_sms_manager$540:	
	.db $7E
	
; Data from 8F4 to 8F4 (1 bytes)	
A$_sms_manager$541:	
	.db $F5
	
; Data from 8F5 to 8F5 (1 bytes)	
A$_sms_manager$542:	
	.db $33
	
; Data from 8F6 to 8F8 (3 bytes)	
A$_sms_manager$543:	
	.db $CD $5D $1C
	
; Data from 8F9 to 8F9 (1 bytes)	
A$_sms_manager$544:	
	.db $F1
	
; Data from 8FA to 8FA (1 bytes)	
A$_sms_manager$549:	
C$_sms_manager.c$93$1$103:	
XG$devkit_SMS_setBGPaletteColor$:	
	.db $C9
	
; Data from 8FB to 8FD (3 bytes)	
A$_sms_manager$562:	
C$_sms_manager.c$94$1$103:	
C$_sms_manager.c$96$1$105:	
G$devkit_SMS_setSpritePaletteCol:	
_devkit_SMS_setSpritePaletteColo:	
	.db $21 $04 $00
	
; Data from 8FE to 8FE (1 bytes)	
A$_sms_manager$563:	
	.db $39
	
; Data from 8FF to 8FF (1 bytes)	
A$_sms_manager$564:	
	.db $7E
	
; Data from 900 to 900 (1 bytes)	
A$_sms_manager$565:	
	.db $87
	
; Data from 901 to 901 (1 bytes)	
A$_sms_manager$566:	
	.db $87
	
; Data from 902 to 904 (3 bytes)	
A$_sms_manager$567:	
	.db $21 $03 $00
	
; Data from 905 to 905 (1 bytes)	
A$_sms_manager$568:	
	.db $39
	
; Data from 906 to 906 (1 bytes)	
A$_sms_manager$569:	
	.db $B6
	
; Data from 907 to 907 (1 bytes)	
A$_sms_manager$570:	
	.db $4F
	
; Data from 908 to 90A (3 bytes)	
A$_sms_manager$571:	
	.db $21 $05 $00
	
; Data from 90B to 90B (1 bytes)	
A$_sms_manager$572:	
	.db $39
	
; Data from 90C to 90C (1 bytes)	
A$_sms_manager$573:	
	.db $7E
	
; Data from 90D to 90D (1 bytes)	
A$_sms_manager$574:	
	.db $07
	
; Data from 90E to 90E (1 bytes)	
A$_sms_manager$575:	
	.db $07
	
; Data from 90F to 90F (1 bytes)	
A$_sms_manager$576:	
	.db $07
	
; Data from 910 to 910 (1 bytes)	
A$_sms_manager$577:	
	.db $07
	
; Data from 911 to 912 (2 bytes)	
A$_sms_manager$578:	
	.db $E6 $F0
	
; Data from 913 to 913 (1 bytes)	
A$_sms_manager$579:	
	.db $B1
	
; Data from 914 to 914 (1 bytes)	
A$_sms_manager$580:	
	.db $47
	
; Data from 915 to 915 (1 bytes)	
A$_sms_manager$584:	
C$_sms_manager.c$97$1$105:	
	.db $C5
	
; Data from 916 to 916 (1 bytes)	
A$_sms_manager$585:	
	.db $33
	
; Data from 917 to 919 (3 bytes)	
A$_sms_manager$586:	
	.db $21 $03 $00
	
; Data from 91A to 91A (1 bytes)	
A$_sms_manager$587:	
	.db $39
	
; Data from 91B to 91B (1 bytes)	
A$_sms_manager$588:	
	.db $7E
	
; Data from 91C to 91C (1 bytes)	
A$_sms_manager$589:	
	.db $F5
	
; Data from 91D to 91D (1 bytes)	
A$_sms_manager$590:	
	.db $33
	
; Data from 91E to 920 (3 bytes)	
A$_sms_manager$591:	
	.db $CD $71 $1C
	
; Data from 921 to 921 (1 bytes)	
A$_sms_manager$592:	
	.db $F1
	
; Data from 922 to 922 (1 bytes)	
A$_sms_manager$597:	
C$_sms_manager.c$98$1$105:	
XG$devkit_SMS_setSpritePaletteCo:	
	.db $C9
	
; Data from 923 to 924 (2 bytes)	
A$_sms_manager$607:	
C$_sms_manager.c$100$1$105:	
G$devkit_SMS_setNextTileatXY$0$0:	
_devkit_SMS_setNextTileatXY:	
	.db $DD $E5
	
; Data from 925 to 928 (4 bytes)	
A$_sms_manager$608:	
	.db $DD $21 $00 $00
	
; Data from 929 to 92A (2 bytes)	
A$_sms_manager$609:	
	.db $DD $39
	
; Data from 92B to 92D (3 bytes)	
A$_sms_manager$613:	
C$_sms_manager.c$102$1$107:	
	.db $DD $6E $05
	
; Data from 92E to 92F (2 bytes)	
A$_sms_manager$614:	
	.db $26 $00
	
; Data from 930 to 930 (1 bytes)	
A$_sms_manager$615:	
	.db $29
	
; Data from 931 to 931 (1 bytes)	
A$_sms_manager$616:	
	.db $29
	
; Data from 932 to 932 (1 bytes)	
A$_sms_manager$617:	
	.db $29
	
; Data from 933 to 933 (1 bytes)	
A$_sms_manager$618:	
	.db $29
	
; Data from 934 to 934 (1 bytes)	
A$_sms_manager$619:	
	.db $29
	
; Data from 935 to 935 (1 bytes)	
A$_sms_manager$620:	
	.db $29
	
; Data from 936 to 936 (1 bytes)	
A$_sms_manager$621:	
	.db $4D
	
; Data from 937 to 937 (1 bytes)	
A$_sms_manager$622:	
	.db $7C
	
; Data from 938 to 939 (2 bytes)	
A$_sms_manager$623:	
	.db $F6 $78
	
; Data from 93A to 93A (1 bytes)	
A$_sms_manager$624:	
	.db $47
	
; Data from 93B to 93D (3 bytes)	
A$_sms_manager$625:	
	.db $DD $6E $04
	
; Data from 93E to 93F (2 bytes)	
A$_sms_manager$626:	
	.db $26 $00
	
; Data from 940 to 940 (1 bytes)	
A$_sms_manager$627:	
	.db $29
	
; Data from 941 to 941 (1 bytes)	
A$_sms_manager$628:	
	.db $7D
	
; Data from 942 to 942 (1 bytes)	
A$_sms_manager$629:	
	.db $B1
	
; Data from 943 to 943 (1 bytes)	
A$_sms_manager$630:	
	.db $6F
	
; Data from 944 to 944 (1 bytes)	
A$_sms_manager$631:	
	.db $7C
	
; Data from 945 to 945 (1 bytes)	
A$_sms_manager$632:	
	.db $B0
	
; Data from 946 to 946 (1 bytes)	
A$_sms_manager$633:	
	.db $67
	
; Data from 947 to 948 (2 bytes)	
A$_sms_manager$638:	
C$_sms_manager.c$103$1$107:	
XG$devkit_SMS_setNextTileatXY$0$:	
	.db $DD $E1
	
; Data from 949 to 94B (3 bytes)	
A$_sms_manager$639:	
	.db $C3 $06 $00
	
; Data from 94C to 94C (1 bytes)	
A$_sms_manager$652:	
C$_sms_manager.c$104$1$107:	
C$_sms_manager.c$106$1$109:	
G$devkit_SMS_setTile$0$0:	
_devkit_SMS_setTile:	
	.db $C1
	
; Data from 94D to 94D (1 bytes)	
A$_sms_manager$653:	
	.db $E1
	
; Data from 94E to 94E (1 bytes)	
A$_sms_manager$654:	
	.db $E5
	
; Data from 94F to 94F (1 bytes)	
A$_sms_manager$655:	
	.db $C5
	
; Data from 950 to 952 (3 bytes)	
A$_sms_manager$660:	
C$_sms_manager.c$107$1$109:	
XG$devkit_SMS_setTile$0$0:	
	.db $C3 $11 $00
	
; Data from 953 to 956 (4 bytes)	
A$_sms_manager$673:	
C$_sms_manager.c$108$1$109:	
C$_sms_manager.c$110$1$111:	
G$devkit_SMS_setTilePriority$0$0:	
_devkit_SMS_setTilePriority:	
	.db $FD $21 $02 $00
	
; Data from 957 to 958 (2 bytes)	
A$_sms_manager$674:	
	.db $FD $39
	
; Data from 959 to 95B (3 bytes)	
A$_sms_manager$675:	
	.db $FD $6E $00
	
; Data from 95C to 95D (2 bytes)	
A$_sms_manager$676:	
	.db $3E $00
	
; Data from 95E to 95F (2 bytes)	
A$_sms_manager$677:	
	.db $F6 $18
	
; Data from 960 to 960 (1 bytes)	
A$_sms_manager$678:	
	.db $67
	
; Data from 961 to 963 (3 bytes)	
A$_sms_manager$683:	
C$_sms_manager.c$111$1$111:	
XG$devkit_SMS_setTilePriority$0$:	
	.db $C3 $11 $00
	
; Data from 964 to 966 (3 bytes)	
A$_sms_manager$696:	
C$_sms_manager.c$113$1$111:	
C$_sms_manager.c$115$1$113:	
G$devkit_SMS_addSprite$0$0:	
_devkit_SMS_addSprite:	
	.db $21 $04 $00
	
; Data from 967 to 967 (1 bytes)	
A$_sms_manager$697:	
	.db $39
	
; Data from 968 to 968 (1 bytes)	
A$_sms_manager$698:	
	.db $46
	
; Data from 969 to 969 (1 bytes)	
A$_sms_manager$699:	
	.db $C5
	
; Data from 96A to 96A (1 bytes)	
A$_sms_manager$700:	
	.db $33
	
; Data from 96B to 96D (3 bytes)	
A$_sms_manager$701:	
	.db $21 $04 $00
	
; Data from 96E to 96E (1 bytes)	
A$_sms_manager$702:	
	.db $39
	
; Data from 96F to 96F (1 bytes)	
A$_sms_manager$703:	
	.db $7E
	
; Data from 970 to 970 (1 bytes)	
A$_sms_manager$704:	
	.db $F5
	
; Data from 971 to 971 (1 bytes)	
A$_sms_manager$705:	
	.db $33
	
; Data from 972 to 974 (3 bytes)	
A$_sms_manager$706:	
	.db $21 $04 $00
	
; Data from 975 to 975 (1 bytes)	
A$_sms_manager$707:	
	.db $39
	
; Data from 976 to 976 (1 bytes)	
A$_sms_manager$708:	
	.db $7E
	
; Data from 977 to 977 (1 bytes)	
A$_sms_manager$709:	
	.db $F5
	
; Data from 978 to 978 (1 bytes)	
A$_sms_manager$710:	
	.db $33
	
; Data from 979 to 97B (3 bytes)	
A$_sms_manager$711:	
	.db $CD $B7 $1C
	
; Data from 97C to 97C (1 bytes)	
A$_sms_manager$712:	
	.db $F1
	
; Data from 97D to 97D (1 bytes)	
A$_sms_manager$713:	
	.db $33
	
; Data from 97E to 97E (1 bytes)	
A$_sms_manager$718:	
C$_sms_manager.c$116$1$113:	
XG$devkit_SMS_addSprite$0$0:	
	.db $C9
	
A$_sms_manager$735:	
C$_sms_manager.c$117$1$113:	
C$_sms_manager.c$119$1$114:	
C$_sms_manager.c$120$1$114:	
G$devkit_SMS_initSprites$0$0:	
XG$devkit_SMS_initSprites$0$0:	
_devkit_SMS_initSprites:
		jp _SMS_initSprites
	
A$_sms_manager$752:	
C$_sms_manager.c$121$1$114:	
C$_sms_manager.c$123$1$115:	
C$_sms_manager.c$124$1$115:	
G$devkit_SMS_finalizeSprites$0$0:	
XG$devkit_SMS_finalizeSprites$0$:	
_devkit_SMS_finalizeSprites:	
		jp _SMS_finalizeSprites
	
A$_sms_manager$769:	
C$_sms_manager.c$125$1$115:	
C$_sms_manager.c$127$1$116:	
C$_sms_manager.c$128$1$116:	
G$devkit_SMS_waitForVBlank$0$0:	
XG$devkit_SMS_waitForVBlank$0$0:	
_devkit_SMS_waitForVBlank:	
		jp _SMS_waitForVBlank
	
A$_sms_manager$786:	
C$_sms_manager.c$129$1$116:	
C$_sms_manager.c$131$1$117:	
C$_sms_manager.c$132$1$117:	
G$devkit_SMS_copySpritestoSAT$0$:	
XG$devkit_SMS_copySpritestoSAT$0:	
_devkit_SMS_copySpritestoSAT:
		jp _UNSAFE_SMS_copySpritestoSAT
	
; Data from 98B to 98D (3 bytes)	
A$_sms_manager$803:	
C$_sms_manager.c$133$1$117:	
C$_sms_manager.c$135$1$118:	
C$_sms_manager.c$136$1$118:	
G$devkit_UNSAFE_SMS_copySpritest:	
XG$devkit_UNSAFE_SMS_copySprites:	
_devkit_UNSAFE_SMS_copySpritesto:	
	.db $C3 $E0 $1A
	
A$_sms_manager$820:	
C$_sms_manager.c$138$1$118:	
C$_sms_manager.c$140$1$119:	
C$_sms_manager.c$141$1$119:	
G$devkit_SMS_queryPauseRequested:	
XG$devkit_SMS_queryPauseRequeste:	
_devkit_SMS_queryPauseRequested:
		jp _SMS_queryPauseRequested
	
A$_sms_manager$837:	
C$_sms_manager.c$142$1$119:	
C$_sms_manager.c$144$1$120:	
C$_sms_manager.c$145$1$120:	
G$devkit_SMS_resetPauseRequest$0:	
XG$devkit_SMS_resetPauseRequest$:	
_devkit_SMS_resetPauseRequest:
		jp _SMS_resetPauseRequest
	
; Data from 994 to 996 (3 bytes)	
A$_sms_manager$850:	
C$_sms_manager.c$148$1$120:	
C$_sms_manager.c$150$1$121:	
G$devkit_isCollisionDetected$0$0:	
_devkit_isCollisionDetected:	
	.db $3A $5C $C0
	
; Data from 997 to 998 (2 bytes)	
A$_sms_manager$851:	
	.db $E6 $20
	
; Data from 999 to 999 (1 bytes)	
A$_sms_manager$852:	
	.db $6F
	
; Data from 99A to 99A (1 bytes)	
A$_sms_manager$857:	
C$_sms_manager.c$151$1$121:	
XG$devkit_isCollisionDetected$0$:	
	.db $C9
	
A$_sms_manager$874:	
C$_sms_manager.c$154$1$121:	
C$_sms_manager.c$156$1$122:	
C$_sms_manager.c$157$1$122:	
G$devkit_SMS_getKeysStatus$0$0:	
XG$devkit_SMS_getKeysStatus$0$0:	
_devkit_SMS_getKeysStatus:
		jp _SMS_getKeysStatus
	
A$_sms_manager$887:	
C$_sms_manager.c$160$1$122:	
C$_sms_manager.c$162$1$123:	
G$devkit_SPRITEMODE_NORMAL$0$0:	
_devkit_SPRITEMODE_NORMAL:	
		ld l, $00
		ret
	
A$_sms_manager$905:	
C$_sms_manager.c$164$1$123:	
C$_sms_manager.c$166$1$124:	
G$devkit_VDPFEATURE_HIDEFIRSTCOL:	
_devkit_VDPFEATURE_HIDEFIRSTCOL:	
		ld hl, $0020
		ret
	
; Data from 9A5 to 9A7 (3 bytes)	
A$_sms_manager$923:	
C$_sms_manager.c$168$1$124:	
C$_sms_manager.c$170$1$125:	
G$devkit_TILE_PRIORITY$0$0:	
_devkit_TILE_PRIORITY:	
	.db $21 $00 $10
	
; Data from 9A8 to 9A8 (1 bytes)	
A$_sms_manager$928:	
C$_sms_manager.c$171$1$125:	
XG$devkit_TILE_PRIORITY$0$0:	
	.db $C9
	
; Data from 9A9 to 9AB (3 bytes)	
A$_sms_manager$941:	
C$_sms_manager.c$172$1$125:	
C$_sms_manager.c$174$1$126:	
G$devkit_TILE_USE_SPRITE_PALETTE:	
_devkit_TILE_USE_SPRITE_PALETTE:	
	.db $21 $00 $08
	
; Data from 9AC to 9AC (1 bytes)	
A$_sms_manager$946:	
C$_sms_manager.c$175$1$126:	
XG$devkit_TILE_USE_SPRITE_PALETT:	
	.db $C9
	
; Data from 9AD to 9BA (14 bytes)	
F_sms_manager$__str_0$0$0:	
	.db $53 $74 $65 $76 $65 $6E $20 $42 $6F $6C $61 $6E $64 $00
	
; Data from 9BB to 9C4 (10 bytes)	
F_sms_manager$__str_1$0$0:	
	.db $56 $61 $6E $20 $48 $61 $6C $65 $6E $00
	
; Data from 9C5 to A00 (60 bytes)	
F_sms_manager$__str_2$0$0:	
	.db $56 $61 $6E $20 $48 $61 $6C $65 $6E $20 $52 $65 $63 $6F $72 $64
	.db $20 $43 $6F $76 $65 $72 $73 $20 $66 $6F $72 $20 $74 $68 $65 $20
	.db $53 $4D $53 $20 $50 $6F $77 $65 $72 $21 $20 $32 $30 $32 $31 $20
	.db $43 $6F $6D $70 $65 $74 $69 $74 $69 $6F $6E $00
	
; Data from A01 to A01 (1 bytes)	
A$_snd_manager$83:	
C$_snd_manager.c$11$1$31:	
C$_snd_manager.c$9$0$0:	
G$devkit_PSGPlay$0$0:	
_devkit_PSGPlay:	
	.db $C1
	
; Data from A02 to A02 (1 bytes)	
A$_snd_manager$84:	
	.db $E1
	
; Data from A03 to A03 (1 bytes)	
A$_snd_manager$85:	
	.db $E5
	
; Data from A04 to A04 (1 bytes)	
A$_snd_manager$86:	
	.db $C5
	
; Data from A05 to A05 (1 bytes)	
A$_snd_manager$87:	
	.db $E5
	
; Data from A06 to A08 (3 bytes)	
A$_snd_manager$88:	
	.db $CD $F4 $02
	
; Data from A09 to A09 (1 bytes)	
A$_snd_manager$89:	
	.db $F1
	
; Data from A0A to A0A (1 bytes)	
A$_snd_manager$94:	
C$_snd_manager.c$12$1$31:	
XG$devkit_PSGPlay$0$0:	
	.db $C9
	
; Data from A0B to A0B (1 bytes)	
A$_snd_manager$107:	
C$_snd_manager.c$13$1$31:	
C$_snd_manager.c$15$1$33:	
G$devkit_PSGPlayNoRepeat$0$0:	
_devkit_PSGPlayNoRepeat:	
	.db $C1
	
; Data from A0C to A0C (1 bytes)	
A$_snd_manager$108:	
	.db $E1
	
; Data from A0D to A0D (1 bytes)	
A$_snd_manager$109:	
	.db $E5
	
; Data from A0E to A0E (1 bytes)	
A$_snd_manager$110:	
	.db $C5
	
; Data from A0F to A0F (1 bytes)	
A$_snd_manager$111:	
	.db $E5
	
; Data from A10 to A12 (3 bytes)	
A$_snd_manager$112:	
	.db $CD $27 $03
	
; Data from A13 to A13 (1 bytes)	
A$_snd_manager$113:	
	.db $F1
	
; Data from A14 to A14 (1 bytes)	
A$_snd_manager$118:	
C$_snd_manager.c$16$1$33:	
XG$devkit_PSGPlayNoRepeat$0$0:	
	.db $C9
	
; Data from A15 to A17 (3 bytes)	
A$_snd_manager$135:	
C$_snd_manager.c$17$1$33:	
C$_snd_manager.c$19$1$35:	
C$_snd_manager.c$20$1$35:	
G$devkit_PSGStop$0$0:	
XG$devkit_PSGStop$0$0:	
_devkit_PSGStop:	
	.db $C3 $81 $02
	
; Data from A18 to A1A (3 bytes)	
A$_snd_manager$152:	
C$_snd_manager.c$21$1$35:	
C$_snd_manager.c$23$1$37:	
C$_snd_manager.c$24$1$37:	
G$devkit_PSGResume$0$0:	
XG$devkit_PSGResume$0$0:	
_devkit_PSGResume:	
	.db $C3 $A8 $02
	
; Data from A1B to A1D (3 bytes)	
A$_snd_manager$169:	
C$_snd_manager.c$25$1$37:	
C$_snd_manager.c$27$1$39:	
C$_snd_manager.c$28$1$39:	
G$devkit_PSGGetStatus$0$0:	
XG$devkit_PSGGetStatus$0$0:	
_devkit_PSGGetStatus:	
	.db $C3 $36 $03
	
; Data from A1E to A20 (3 bytes)	
A$_snd_manager$182:	
C$_snd_manager.c$29$1$39:	
C$_snd_manager.c$31$1$41:	
G$devkit_PSGSetMusicVolumeAttenu:	
_devkit_PSGSetMusicVolumeAttenua:	
	.db $21 $02 $00
	
; Data from A21 to A21 (1 bytes)	
A$_snd_manager$183:	
	.db $39
	
; Data from A22 to A22 (1 bytes)	
A$_snd_manager$184:	
	.db $7E
	
; Data from A23 to A23 (1 bytes)	
A$_snd_manager$185:	
	.db $F5
	
; Data from A24 to A24 (1 bytes)	
A$_snd_manager$186:	
	.db $33
	
; Data from A25 to A27 (3 bytes)	
A$_snd_manager$187:	
	.db $CD $4E $04
	
; Data from A28 to A28 (1 bytes)	
A$_snd_manager$188:	
	.db $33
	
; Data from A29 to A29 (1 bytes)	
A$_snd_manager$193:	
C$_snd_manager.c$32$1$41:	
XG$devkit_PSGSetMusicVolumeAtten:	
	.db $C9
	
; Data from A2A to A2C (3 bytes)	
A$_snd_manager$206:	
C$_snd_manager.c$34$1$41:	
C$_snd_manager.c$36$1$43:	
G$devkit_PSGSFXPlay$0$0:	
_devkit_PSGSFXPlay:	
	.db $21 $04 $00
	
; Data from A2D to A2D (1 bytes)	
A$_snd_manager$207:	
	.db $39
	
; Data from A2E to A2E (1 bytes)	
A$_snd_manager$208:	
	.db $7E
	
; Data from A2F to A2F (1 bytes)	
A$_snd_manager$209:	
	.db $F5
	
; Data from A30 to A30 (1 bytes)	
A$_snd_manager$210:	
	.db $33
	
; Data from A31 to A33 (3 bytes)	
A$_snd_manager$211:	
	.db $21 $03 $00
	
; Data from A34 to A34 (1 bytes)	
A$_snd_manager$212:	
	.db $39
	
; Data from A35 to A35 (1 bytes)	
A$_snd_manager$213:	
	.db $4E
	
; Data from A36 to A36 (1 bytes)	
A$_snd_manager$214:	
	.db $23
	
; Data from A37 to A37 (1 bytes)	
A$_snd_manager$215:	
	.db $46
	
; Data from A38 to A38 (1 bytes)	
A$_snd_manager$216:	
	.db $C5
	
; Data from A39 to A3B (3 bytes)	
A$_snd_manager$217:	
	.db $CD $07 $06
	
; Data from A3C to A3C (1 bytes)	
A$_snd_manager$218:	
	.db $F1
	
; Data from A3D to A3D (1 bytes)	
A$_snd_manager$219:	
	.db $33
	
; Data from A3E to A3E (1 bytes)	
A$_snd_manager$224:	
C$_snd_manager.c$37$1$43:	
XG$devkit_PSGSFXPlay$0$0:	
	.db $C9
	
; Data from A3F to A41 (3 bytes)	
A$_snd_manager$241:	
C$_snd_manager.c$38$1$43:	
C$_snd_manager.c$40$1$45:	
C$_snd_manager.c$41$1$45:	
G$devkit_PSGSFXStop$0$0:	
XG$devkit_PSGSFXStop$0$0:	
_devkit_PSGSFXStop:	
	.db $C3 $3D $05
	
; Data from A42 to A44 (3 bytes)	
A$_snd_manager$258:	
C$_snd_manager.c$42$1$45:	
C$_snd_manager.c$44$1$47:	
C$_snd_manager.c$45$1$47:	
G$devkit_PSGSFXGetStatus$0$0:	
XG$devkit_PSGSFXGetStatus$0$0:	
_devkit_PSGSFXGetStatus:	
	.db $C3 $5A $06
	
A$_snd_manager$275:	
C$_snd_manager.c$47$1$47:	
C$_snd_manager.c$49$1$49:	
C$_snd_manager.c$50$1$49:	
G$devkit_PSGSilenceChannels$0$0:	
XG$devkit_PSGSilenceChannels$0$0:	
_devkit_PSGSilenceChannels:	
		jp _PSGSilenceChannels
	
A$_snd_manager$292:	
C$_snd_manager.c$51$1$49:	
C$_snd_manager.c$53$1$51:	
C$_snd_manager.c$54$1$51:	
G$devkit_PSGRestoreVolumes$0$0:	
XG$devkit_PSGRestoreVolumes$0$0:	
_devkit_PSGRestoreVolumes:
		jp _PSGRestoreVolumes
	
A$_snd_manager$309:	
C$_snd_manager.c$56$1$51:	
C$_snd_manager.c$58$1$53:	
C$_snd_manager.c$59$1$53:	
G$devkit_PSGFrame$0$0:	
XG$devkit_PSGFrame$0$0:	
_devkit_PSGFrame:	
		jp _PSGFrame
	
A$_snd_manager$326:	
C$_snd_manager.c$60$1$53:	
C$_snd_manager.c$62$1$55:	
C$_snd_manager.c$63$1$55:	
G$devkit_PSGSFXFrame$0$0:	
XG$devkit_PSGSFXFrame$0$0:	
_devkit_PSGSFXFrame:	
		jp _PSGSFXFrame

; Data from A51 to A52 (2 bytes)	
A$_snd_manager$339:	
C$_snd_manager.c$66$1$55:	
C$_snd_manager.c$68$1$56:	
G$devkit_SFX_CHANNEL2$0$0:	
_devkit_SFX_CHANNEL2:	
	.db $2E $01
	
; Data from A53 to A53 (1 bytes)	
A$_snd_manager$344:	
C$_snd_manager.c$69$1$56:	
XG$devkit_SFX_CHANNEL2$0$0:	
	.db $C9
	
; Data from A54 to A55 (2 bytes)	
A$_snd_manager$357:	
C$_snd_manager.c$70$1$56:	
C$_snd_manager.c$72$1$57:	
G$devkit_SFX_CHANNEL3$0$0:	
_devkit_SFX_CHANNEL3:	
	.db $2E $02
	
; Data from A56 to A56 (1 bytes)	
A$_snd_manager$362:	
C$_snd_manager.c$73$1$57:	
XG$devkit_SFX_CHANNEL3$0$0:	
	.db $C9
	
; Data from A57 to A58 (2 bytes)	
A$_snd_manager$375:	
C$_snd_manager.c$74$1$57:	
C$_snd_manager.c$76$1$58:	
G$devkit_SFX_CHANNELS2AND3$0$0:	
_devkit_SFX_CHANNELS2AND3:	
	.db $2E $03
	
; Data from A59 to A59 (1 bytes)	
A$_snd_manager$380:	
C$_snd_manager.c$77$1$58:	
XG$devkit_SFX_CHANNELS2AND3$0$0:	
	.db $C9
	
A$asm_manager$59:	
C$asm_manager.c$11$0$0:	
C$asm_manager.c$30$1$1:	
G$engine_asm_manager_clear_VRAM$:	
_engine_asm_manager_clear_VRAM:	
		ld a, $00
		out (Port_VDPAddress), a
		ld a, $40
		out (Port_VDPAddress), a
		ld bc, $4000
-:	
		ld a, $00
		out (Port_VDPData), a
		dec bc
		ld a, b
		or c
		jp nz, -
		ret
	
; Data from A70 to A72 (3 bytes)	
A$audio_manager$60:	
C$audio_manager.c$18$0$0:	
C$audio_manager.c$20$1$15:	
G$engine_audio_manager_sfx_right:	
_engine_audio_manager_sfx_right:	
	.db $21 $5C $1A
	
; Data from A73 to A73 (1 bytes)	
A$audio_manager$61:	
	.db $E5
	
; Data from A74 to A76 (3 bytes)	
A$audio_manager$62:	
	.db $CD $8B $0A
	
; Data from A77 to A77 (1 bytes)	
A$audio_manager$63:	
	.db $F1
	
; Data from A78 to A78 (1 bytes)	
A$audio_manager$68:	
C$audio_manager.c$21$1$15:	
XG$engine_audio_manager_sfx_righ:	
	.db $C9
	
; Data from A79 to A7B (3 bytes)	
A$audio_manager$81:	
C$audio_manager.c$22$1$15:	
C$audio_manager.c$24$1$16:	
G$engine_audio_manager_sfx_wrong:	
_engine_audio_manager_sfx_wrong:	
	.db $21 $7C $1A
	
; Data from A7C to A7C (1 bytes)	
A$audio_manager$82:	
	.db $E5
	
; Data from A7D to A7F (3 bytes)	
A$audio_manager$83:	
	.db $CD $8B $0A
	
; Data from A80 to A80 (1 bytes)	
A$audio_manager$84:	
	.db $F1
	
; Data from A81 to A81 (1 bytes)	
A$audio_manager$89:	
C$audio_manager.c$25$1$16:	
XG$engine_audio_manager_sfx_wron:	
	.db $C9
	
; Data from A82 to A84 (3 bytes)	
A$audio_manager$102:	
C$audio_manager.c$26$1$16:	
C$audio_manager.c$28$1$17:	
G$engine_audio_manager_sfx_cheat:	
_engine_audio_manager_sfx_cheat:	
	.db $21 $39 $1A
	
; Data from A85 to A85 (1 bytes)	
A$audio_manager$103:	
	.db $E5
	
; Data from A86 to A88 (3 bytes)	
A$audio_manager$104:	
	.db $CD $8B $0A
	
; Data from A89 to A89 (1 bytes)	
A$audio_manager$105:	
	.db $F1
	
; Data from A8A to A8A (1 bytes)	
A$audio_manager$110:	
C$audio_manager.c$29$1$17:	
XG$engine_audio_manager_sfx_chea:	
	.db $C9
	
; Data from A8B to A8D (3 bytes)	
A$audio_manager$123:	
C$audio_manager.c$31$1$17:	
C$audio_manager.c$36$1$19:	
Faudio_manager$play_sfx$0$0:	
	.db $CD $42 $0A
	
; Data from A8E to A8E (1 bytes)	
A$audio_manager$127:	
C$audio_manager.c$37$1$19:	
	.db $7D
	
; Data from A8F to A8F (1 bytes)	
A$audio_manager$128:	
	.db $B7
	
; Data from A90 to A90 (1 bytes)	
A$audio_manager$132:	
C$audio_manager.c$39$2$20:	
	.db $C0
	
; Data from A91 to A93 (3 bytes)	
A$audio_manager$136:	
C$audio_manager.c$42$1$19:	
	.db $CD $51 $0A
	
; Data from A94 to A94 (1 bytes)	
A$audio_manager$137:	
	.db $65
	
; Data from A95 to A95 (1 bytes)	
A$audio_manager$138:	
	.db $D1
	
; Data from A96 to A96 (1 bytes)	
A$audio_manager$139:	
	.db $C1
	
; Data from A97 to A97 (1 bytes)	
A$audio_manager$140:	
	.db $C5
	
; Data from A98 to A98 (1 bytes)	
A$audio_manager$141:	
	.db $D5
	
; Data from A99 to A99 (1 bytes)	
A$audio_manager$142:	
	.db $E5
	
; Data from A9A to A9A (1 bytes)	
A$audio_manager$143:	
	.db $33
	
; Data from A9B to A9B (1 bytes)	
A$audio_manager$144:	
	.db $C5
	
; Data from A9C to A9E (3 bytes)	
A$audio_manager$145:	
	.db $CD $2A $0A
	
; Data from A9F to A9F (1 bytes)	
A$audio_manager$146:	
	.db $F1
	
; Data from AA0 to AA0 (1 bytes)	
A$audio_manager$147:	
	.db $33
	
; Data from AA1 to AA1 (1 bytes)	
A$audio_manager$152:	
C$audio_manager.c$43$1$19:	
XFaudio_manager$play_sfx$0$0:	
	.db $C9
	
A$content_manager$65:	
C$content_manager.c$12$0$0:	
C$content_manager.c$14$1$17:	
H$engine_content_manager_load_ti:	
_engine_content_manager_load_til:	
		ld hl, $0000
		push hl
		ld hl, $17A2
		push hl
		call A$_sms_manager$400
		pop af
		pop af
		ld bc, _DATA_1712_
		push bc
		call A$_sms_manager$472
		pop af
		ret
	
; Data from AB8 to AB9 (2 bytes)	
A$content_manager$96:	
C$content_manager.c$17$1$17:	
C$content_manager.c$19$1$18:	
G$engine_content_manager_load_sp:	
_engine_content_manager_load_spl:	
	.db $3E $02
	
; Data from ABA to ABA (1 bytes)	
A$content_manager$97:	
	.db $F5
	
; Data from ABB to ABB (1 bytes)	
A$content_manager$98:	
	.db $33
	
; Data from ABC to ABE (3 bytes)	
A$content_manager$99:	
	.db $CD $31 $08
	
; Data from ABF to ABF (1 bytes)	
A$content_manager$100:	
	.db $33
	
; Data from AC0 to AC2 (3 bytes)	
A$content_manager$104:	
C$content_manager.c$20$1$18:	
	.db $21 $40 $00
	
; Data from AC3 to AC3 (1 bytes)	
A$content_manager$105:	
	.db $E5
	
; Data from AC4 to AC6 (3 bytes)	
A$content_manager$106:	
	.db $21 $57 $80
	
; Data from AC7 to AC7 (1 bytes)	
A$content_manager$107:	
	.db $E5
	
; Data from AC8 to ACA (3 bytes)	
A$content_manager$108:	
	.db $CD $8E $08
	
; Data from ACB to ACB (1 bytes)	
A$content_manager$109:	
	.db $F1
	
; Data from ACC to ACC (1 bytes)	
A$content_manager$110:	
	.db $F1
	
; Data from ACD to ACF (3 bytes)	
A$content_manager$114:	
C$content_manager.c$21$1$18:	
	.db $01 $10 $80
	
; Data from AD0 to AD0 (1 bytes)	
A$content_manager$115:	
	.db $C5
	
; Data from AD1 to AD3 (3 bytes)	
A$content_manager$116:	
	.db $21 $00 $00
	
; Data from AD4 to AD4 (1 bytes)	
A$content_manager$117:	
	.db $E5
	
; Data from AD5 to AD7 (3 bytes)	
A$content_manager$118:	
	.db $CD $A4 $08
	
; Data from AD8 to AD8 (1 bytes)	
A$content_manager$119:	
	.db $F1
	
; Data from AD9 to AD9 (1 bytes)	
A$content_manager$120:	
	.db $F1
	
; Data from ADA to ADC (3 bytes)	
A$content_manager$124:	
C$content_manager.c$22$1$18:	
	.db $01 $00 $80
	
; Data from ADD to ADD (1 bytes)	
A$content_manager$125:	
	.db $C5
	
; Data from ADE to AE0 (3 bytes)	
A$content_manager$126:	
	.db $CD $C5 $08
	
; Data from AE1 to AE1 (1 bytes)	
A$content_manager$127:	
	.db $F1
	
; Data from AE2 to AE2 (1 bytes)	
A$content_manager$132:	
C$content_manager.c$23$1$18:	
XG$engine_content_manager_load_s:	
	.db $C9
	
; Data from AE3 to AE4 (2 bytes)	
A$content_manager$145:	
C$content_manager.c$25$1$18:	
C$content_manager.c$27$1$19:	
G$engine_content_manager_load_ti:	
_engine_content_manager_load_tit:	
	.db $3E $03
	
; Data from AE5 to AE5 (1 bytes)	
A$content_manager$146:	
	.db $F5
	
; Data from AE6 to AE6 (1 bytes)	
A$content_manager$147:	
	.db $33
	
; Data from AE7 to AE9 (3 bytes)	
A$content_manager$148:	
	.db $CD $31 $08
	
; Data from AEA to AEA (1 bytes)	
A$content_manager$149:	
	.db $33
	
; Data from AEB to AED (3 bytes)	
A$content_manager$153:	
C$content_manager.c$28$1$19:	
	.db $21 $40 $00
	
; Data from AEE to AEE (1 bytes)	
A$content_manager$154:	
	.db $E5
	
; Data from AEF to AF1 (3 bytes)	
A$content_manager$155:	
	.db $21 $77 $80
	
; Data from AF2 to AF2 (1 bytes)	
A$content_manager$156:	
	.db $E5
	
; Data from AF3 to AF5 (3 bytes)	
A$content_manager$157:	
	.db $CD $8E $08
	
; Data from AF6 to AF6 (1 bytes)	
A$content_manager$158:	
	.db $F1
	
; Data from AF7 to AF7 (1 bytes)	
A$content_manager$159:	
	.db $F1
	
; Data from AF8 to AFA (3 bytes)	
A$content_manager$163:	
C$content_manager.c$29$1$19:	
	.db $01 $10 $80
	
; Data from AFB to AFB (1 bytes)	
A$content_manager$164:	
	.db $C5
	
; Data from AFC to AFE (3 bytes)	
A$content_manager$165:	
	.db $21 $00 $00
	
; Data from AFF to AFF (1 bytes)	
A$content_manager$166:	
	.db $E5
	
; Data from B00 to B02 (3 bytes)	
A$content_manager$167:	
	.db $CD $A4 $08
	
; Data from B03 to B03 (1 bytes)	
A$content_manager$168:	
	.db $F1
	
; Data from B04 to B04 (1 bytes)	
A$content_manager$169:	
	.db $F1
	
; Data from B05 to B07 (3 bytes)	
A$content_manager$173:	
C$content_manager.c$30$1$19:	
	.db $01 $00 $80
	
; Data from B08 to B08 (1 bytes)	
A$content_manager$174:	
	.db $C5
	
; Data from B09 to B0B (3 bytes)	
A$content_manager$175:	
	.db $CD $C5 $08
	
; Data from B0C to B0C (1 bytes)	
A$content_manager$176:	
	.db $F1
	
; Data from B0D to B0F (3 bytes)	
A$content_manager$180:	
C$content_manager.c$33$1$19:	
	.db $21 $03 $03
	
; Data from B10 to B10 (1 bytes)	
A$content_manager$181:	
	.db $E5
	
; Data from B11 to B12 (2 bytes)	
A$content_manager$182:	
	.db $2E $0F
	
; Data from B13 to B13 (1 bytes)	
A$content_manager$183:	
	.db $E5
	
; Data from B14 to B16 (3 bytes)	
A$content_manager$184:	
	.db $CD $D3 $08
	
; Data from B17 to B17 (1 bytes)	
A$content_manager$185:	
	.db $F1
	
; Data from B18 to B18 (1 bytes)	
A$content_manager$186:	
	.db $F1
	
; Data from B19 to B19 (1 bytes)	
A$content_manager$191:	
C$content_manager.c$34$1$19:	
XG$engine_content_manager_load_t:	
	.db $C9
	
; Data from B1A to B1B (2 bytes)	
A$content_manager$204:	
C$content_manager.c$35$1$19:	
C$content_manager.c$37$1$20:	
I$engine_content_manager_load_ti:	
_fngine_content_manager_load_tit:	
	.db $3E $03
	
; Data from B1C to B1C (1 bytes)	
A$content_manager$205:	
	.db $F5
	
; Data from B1D to B1D (1 bytes)	
A$content_manager$206:	
	.db $33
	
; Data from B1E to B20 (3 bytes)	
A$content_manager$207:	
	.db $CD $31 $08
	
; Data from B21 to B21 (1 bytes)	
A$content_manager$208:	
	.db $33
	
; Data from B22 to B24 (3 bytes)	
A$content_manager$212:	
C$content_manager.c$38$1$20:	
	.db $21 $40 $00
	
; Data from B25 to B25 (1 bytes)	
A$content_manager$213:	
	.db $E5
	
; Data from B26 to B28 (3 bytes)	
A$content_manager$214:	
	.db $21 $45 $93
	
; Data from B29 to B29 (1 bytes)	
A$content_manager$215:	
	.db $E5
	
; Data from B2A to B2C (3 bytes)	
A$content_manager$216:	
	.db $CD $8E $08
	
; Data from B2D to B2D (1 bytes)	
A$content_manager$217:	
	.db $F1
	
; Data from B2E to B2E (1 bytes)	
A$content_manager$218:	
	.db $F1
	
; Data from B2F to B31 (3 bytes)	
A$content_manager$222:	
C$content_manager.c$39$1$20:	
	.db $01 $E8 $92
	
; Data from B32 to B32 (1 bytes)	
A$content_manager$223:	
	.db $C5
	
; Data from B33 to B35 (3 bytes)	
A$content_manager$224:	
	.db $21 $00 $00
	
; Data from B36 to B36 (1 bytes)	
A$content_manager$225:	
	.db $E5
	
; Data from B37 to B39 (3 bytes)	
A$content_manager$226:	
	.db $CD $A4 $08
	
; Data from B3A to B3A (1 bytes)	
A$content_manager$227:	
	.db $F1
	
; Data from B3B to B3B (1 bytes)	
A$content_manager$228:	
	.db $F1
	
; Data from B3C to B3E (3 bytes)	
A$content_manager$232:	
C$content_manager.c$40$1$20:	
	.db $01 $D8 $92
	
; Data from B3F to B3F (1 bytes)	
A$content_manager$233:	
	.db $C5
	
; Data from B40 to B42 (3 bytes)	
A$content_manager$234:	
	.db $CD $C5 $08
	
; Data from B43 to B43 (1 bytes)	
A$content_manager$235:	
	.db $F1
	
; Data from B44 to B46 (3 bytes)	
A$content_manager$239:	
C$content_manager.c$43$1$20:	
	.db $21 $03 $03
	
; Data from B47 to B47 (1 bytes)	
A$content_manager$240:	
	.db $E5
	
; Data from B48 to B49 (2 bytes)	
A$content_manager$241:	
	.db $2E $0F
	
; Data from B4A to B4A (1 bytes)	
A$content_manager$242:	
	.db $E5
	
; Data from B4B to B4D (3 bytes)	
A$content_manager$243:	
	.db $CD $D3 $08
	
; Data from B4E to B4E (1 bytes)	
A$content_manager$244:	
	.db $F1
	
; Data from B4F to B4F (1 bytes)	
A$content_manager$245:	
	.db $F1
	
; Data from B50 to B50 (1 bytes)	
A$content_manager$250:	
C$content_manager.c$44$1$20:	
XH$engine_content_manager_load_t:	
	.db $C9
	
A$content_manager$263:	
C$content_manager.c$47$1$20:	
C$content_manager.c$50$1$21:	
G$engine_content_manager_load_sp:	
_engine_content_manager_load_spr:
		ld hl, $0120
		push hl
		ld hl, _cursor__tiles__psgcompr	; _cursor__tiles__psgcompr = $1657
		push hl
		call A$_sms_manager$400
		pop af
		pop af
		ld bc, _cursor__palette__bin	; _cursor__palette__bin = $1647
		push bc
		call A$_sms_manager$493
		pop af
		ret
	
; Data from B67 to B69 (3 bytes)	
A$cursor_manager$68:	
C$cursor_manager.c$13$0$0:	
C$cursor_manager.c$15$1$23:	
G$engine_cursor_manager_init$0$0:	
_engine_cursor_manager_init:	
	.db $01 $26 $C0
	
; Data from B6A to B6A (1 bytes)	
A$cursor_manager$72:	
C$cursor_manager.c$16$1$23:	
	.db $AF
	
; Data from B6B to B6B (1 bytes)	
A$cursor_manager$73:	
	.db $02
	
; Data from B6C to B6E (3 bytes)	
A$cursor_manager$77:	
C$cursor_manager.c$17$1$23:	
	.db $21 $27 $C0
	
; Data from B6F to B70 (2 bytes)	
A$cursor_manager$78:	
	.db $36 $00
	
; Data from B71 to B71 (1 bytes)	
A$cursor_manager$82:	
C$cursor_manager.c$19$1$23:	
	.db $C5
	
; Data from B72 to B73 (2 bytes)	
A$cursor_manager$83:	
	.db $3E $03
	
; Data from B74 to B74 (1 bytes)	
A$cursor_manager$84:	
	.db $F5
	
; Data from B75 to B75 (1 bytes)	
A$cursor_manager$85:	
	.db $33
	
; Data from B76 to B78 (3 bytes)	
A$cursor_manager$86:	
	.db $21 $05 $00
	
; Data from B79 to B79 (1 bytes)	
A$cursor_manager$87:	
	.db $39
	
; Data from B7A to B7A (1 bytes)	
A$cursor_manager$88:	
	.db $7E
	
; Data from B7B to B7B (1 bytes)	
A$cursor_manager$89:	
	.db $F5
	
; Data from B7C to B7C (1 bytes)	
A$cursor_manager$90:	
	.db $33
	
; Data from B7D to B7F (3 bytes)	
A$cursor_manager$91:	
	.db $CD $A7 $1A
	
; Data from B80 to B80 (1 bytes)	
A$cursor_manager$92:	
	.db $F1
	
; Data from B81 to B81 (1 bytes)	
A$cursor_manager$93:	
	.db $7D
	
; Data from B82 to B82 (1 bytes)	
A$cursor_manager$94:	
	.db $C1
	
; Data from B83 to B83 (1 bytes)	
A$cursor_manager$95:	
	.db $02
	
; Data from B84 to B85 (2 bytes)	
A$cursor_manager$99:	
C$cursor_manager.c$20$1$23:	
	.db $3E $03
	
; Data from B86 to B86 (1 bytes)	
A$cursor_manager$100:	
	.db $F5
	
; Data from B87 to B87 (1 bytes)	
A$cursor_manager$101:	
	.db $33
	
; Data from B88 to B8A (3 bytes)	
A$cursor_manager$102:	
	.db $21 $03 $00
	
; Data from B8B to B8B (1 bytes)	
A$cursor_manager$103:	
	.db $39
	
; Data from B8C to B8C (1 bytes)	
A$cursor_manager$104:	
	.db $7E
	
; Data from B8D to B8D (1 bytes)	
A$cursor_manager$105:	
	.db $F5
	
; Data from B8E to B8E (1 bytes)	
A$cursor_manager$106:	
	.db $33
	
; Data from B8F to B91 (3 bytes)	
A$cursor_manager$107:	
	.db $CD $28 $1E
	
; Data from B92 to B92 (1 bytes)	
A$cursor_manager$108:	
	.db $F1
	
; Data from B93 to B93 (1 bytes)	
A$cursor_manager$109:	
	.db $4D
	
; Data from B94 to B96 (3 bytes)	
A$cursor_manager$110:	
	.db $21 $27 $C0
	
; Data from B97 to B97 (1 bytes)	
A$cursor_manager$111:	
	.db $71
	
; Data from B98 to B9A (3 bytes)	
A$cursor_manager$119:	
C$cursor_manager.c$21$1$23:	
C$cursor_manager.c$22$1$23:	
XG$engine_cursor_manager_init$0$:	
	.db $C3 $88 $0D
	
; Data from B9B to B9C (2 bytes)	
A$cursor_manager$129:	
C$cursor_manager.c$24$1$23:	
G$engine_cursor_manager_load$0$0:	
_engine_cursor_manager_load:	
	.db $DD $E5
	
; Data from B9D to BA0 (4 bytes)	
A$cursor_manager$130:	
	.db $DD $21 $00 $00
	
; Data from BA1 to BA2 (2 bytes)	
A$cursor_manager$131:	
	.db $DD $39
	
; Data from BA3 to BA3 (1 bytes)	
A$cursor_manager$132:	
	.db $F5
	
; Data from BA4 to BA4 (1 bytes)	
A$cursor_manager$133:	
	.db $F5
	
; Data from BA5 to BA8 (4 bytes)	
A$cursor_manager$137:	
C$cursor_manager.c$31$5$29:	
	.db $DD $36 $FD $00
	
; Data from BA9 to BAA (2 bytes)	
A$cursor_manager$142:	
C$cursor_manager.c$33$2$26:	
	.db $3E $4A
	
; Data from BAB to BAD (3 bytes)	
A$cursor_manager$143:	
	.db $DD $86 $FD
	
; Data from BAE to BB0 (3 bytes)	
A$cursor_manager$144:	
	.db $DD $77 $FE
	
; Data from BB1 to BB2 (2 bytes)	
A$cursor_manager$145:	
	.db $3E $11
	
; Data from BB3 to BB4 (2 bytes)	
A$cursor_manager$146:	
	.db $CE $00
	
; Data from BB5 to BB7 (3 bytes)	
A$cursor_manager$147:	
	.db $DD $77 $FF
	
; Data from BB8 to BB9 (2 bytes)	
A$cursor_manager$148:	
	.db $0E $00
	
; Data from BBA to BBA (1 bytes)	
A$cursor_manager$153:	
C$cursor_manager.c$35$5$29:	
	.db $69
	
; Data from BBB to BBB (1 bytes)	
A$cursor_manager$154:	
	.db $29
	
; Data from BBC to BBC (1 bytes)	
A$cursor_manager$155:	
	.db $09
	
; Data from BBD to BBD (1 bytes)	
A$cursor_manager$156:	
	.db $7D
	
; Data from BBE to BC0 (3 bytes)	
A$cursor_manager$157:	
	.db $DD $86 $FD
	
; Data from BC1 to BC1 (1 bytes)	
A$cursor_manager$158:	
	.db $5F
	
; Data from BC2 to BC4 (3 bytes)	
A$cursor_manager$162:	
C$cursor_manager.c$37$5$29:	
	.db $21 $46 $11
	
; Data from BC5 to BC6 (2 bytes)	
A$cursor_manager$163:	
	.db $06 $00
	
; Data from BC7 to BC7 (1 bytes)	
A$cursor_manager$164:	
	.db $09
	
; Data from BC8 to BC8 (1 bytes)	
A$cursor_manager$165:	
	.db $46
	
; Data from BC9 to BCB (3 bytes)	
A$cursor_manager$169:	
C$cursor_manager.c$38$5$29:	
	.db $DD $6E $FE
	
; Data from BCC to BCE (3 bytes)	
A$cursor_manager$170:	
	.db $DD $66 $FF
	
; Data from BCF to BCF (1 bytes)	
A$cursor_manager$171:	
	.db $7E
	
; Data from BD0 to BD2 (3 bytes)	
A$cursor_manager$172:	
	.db $DD $77 $FC
	
; Data from BD3 to BD4 (2 bytes)	
A$cursor_manager$176:	
C$cursor_manager.c$39$5$29:	
	.db $26 $00
	
; Data from BD5 to BD5 (1 bytes)	
A$cursor_manager$177:	
	.db $6B
	
; Data from BD6 to BD6 (1 bytes)	
A$cursor_manager$178:	
	.db $29
	
; Data from BD7 to BD9 (3 bytes)	
A$cursor_manager$179:	
	.db $11 $4A $C1
	
; Data from BDA to BDA (1 bytes)	
A$cursor_manager$180:	
	.db $19
	
; Data from BDB to BDB (1 bytes)	
A$cursor_manager$181:	
	.db $5E
	
; Data from BDC to BDC (1 bytes)	
A$cursor_manager$182:	
	.db $23
	
; Data from BDD to BDD (1 bytes)	
A$cursor_manager$183:	
	.db $56
	
; Data from BDE to BE0 (3 bytes)	
A$cursor_manager$187:	
C$cursor_manager.c$40$5$29:	
	.db $DD $7E $FC
	
; Data from BE1 to BE3 (3 bytes)	
A$cursor_manager$188:	
	.db $DD $86 $04
	
; Data from BE4 to BE4 (1 bytes)	
A$cursor_manager$189:	
	.db $C5
	
; Data from BE5 to BE5 (1 bytes)	
A$cursor_manager$190:	
	.db $F5
	
; Data from BE6 to BE6 (1 bytes)	
A$cursor_manager$191:	
	.db $33
	
; Data from BE7 to BE7 (1 bytes)	
A$cursor_manager$192:	
	.db $C5
	
; Data from BE8 to BE8 (1 bytes)	
A$cursor_manager$193:	
	.db $33
	
; Data from BE9 to BE9 (1 bytes)	
A$cursor_manager$194:	
	.db $D5
	
; Data from BEA to BEC (3 bytes)	
A$cursor_manager$195:	
	.db $CD $E9 $0D
	
; Data from BED to BED (1 bytes)	
A$cursor_manager$196:	
	.db $F1
	
; Data from BEE to BEE (1 bytes)	
A$cursor_manager$197:	
	.db $F1
	
; Data from BEF to BEF (1 bytes)	
A$cursor_manager$198:	
	.db $C1
	
; Data from BF0 to BF0 (1 bytes)	
A$cursor_manager$202:	
C$cursor_manager.c$33$4$28:	
	.db $0C
	
; Data from BF1 to BF1 (1 bytes)	
A$cursor_manager$203:	
	.db $79
	
; Data from BF2 to BF3 (2 bytes)	
A$cursor_manager$204:	
	.db $D6 $04
	
; Data from BF4 to BF5 (2 bytes)	
A$cursor_manager$205:	
	.db $38 $C4
	
; Data from BF6 to BF8 (3 bytes)	
A$cursor_manager$209:	
C$cursor_manager.c$31$2$26:	
	.db $DD $34 $FD
	
; Data from BF9 to BFB (3 bytes)	
A$cursor_manager$210:	
	.db $DD $7E $FD
	
; Data from BFC to BFD (2 bytes)	
A$cursor_manager$211:	
	.db $D6 $03
	
; Data from BFE to BFF (2 bytes)	
A$cursor_manager$212:	
	.db $38 $A9
	
; Data from C00 to C01 (2 bytes)	
A$cursor_manager$213:	
	.db $DD $F9
	
; Data from C02 to C03 (2 bytes)	
A$cursor_manager$214:	
	.db $DD $E1
	
; Data from C04 to C04 (1 bytes)	
A$cursor_manager$219:	
C$cursor_manager.c$43$2$26:	
XG$engine_cursor_manager_load$0$:	
	.db $C9
	
; Data from C05 to C07 (3 bytes)	
A$cursor_manager$235:	
C$cursor_manager.c$45$2$26:	
C$cursor_manager.c$47$1$30:	
C$cursor_manager.c$48$1$30:	
G$engine_cursor_manager_save$0$0:	
_engine_cursor_manager_save:	
	.db $3A $26 $C0
	
; Data from C08 to C08 (1 bytes)	
A$cursor_manager$236:	
	.db $4F
	
; Data from C09 to C09 (1 bytes)	
A$cursor_manager$237:	
	.db $87
	
; Data from C0A to C0A (1 bytes)	
A$cursor_manager$238:	
	.db $81
	
; Data from C0B to C0B (1 bytes)	
A$cursor_manager$239:	
	.db $4F
	
; Data from C0C to C0E (3 bytes)	
A$cursor_manager$240:	
	.db $21 $26 $C0
	
; Data from C0F to C0F (1 bytes)	
A$cursor_manager$241:	
	.db $23
	
; Data from C10 to C10 (1 bytes)	
A$cursor_manager$242:	
	.db $6E
	
; Data from C11 to C11 (1 bytes)	
A$cursor_manager$243:	
	.db $09
	
; Data from C12 to C12 (1 bytes)	
A$cursor_manager$248:	
C$cursor_manager.c$49$1$30:	
XG$engine_cursor_manager_save$0$:	
	.db $C9
	
; Data from C13 to C14 (2 bytes)	
A$cursor_manager$258:	
C$cursor_manager.c$51$1$30:	
G$engine_cursor_manager_draw$0$0:	
_engine_cursor_manager_draw:	
	.db $DD $E5
	
; Data from C15 to C18 (4 bytes)	
A$cursor_manager$259:	
	.db $DD $21 $00 $00
	
; Data from C19 to C1A (2 bytes)	
A$cursor_manager$260:	
	.db $DD $39
	
; Data from C1B to C1B (1 bytes)	
A$cursor_manager$261:	
	.db $F5
	
; Data from C1C to C1C (1 bytes)	
A$cursor_manager$262:	
	.db $F5
	
; Data from C1D to C1F (3 bytes)	
A$cursor_manager$269:	
C$cursor_manager.c$53$1$31:	
C$cursor_manager.c$54$1$31:	
	.db $21 $26 $C0
	
; Data from C20 to C20 (1 bytes)	
A$cursor_manager$270:	
	.db $23
	
; Data from C21 to C21 (1 bytes)	
A$cursor_manager$271:	
	.db $23
	
; Data from C22 to C22 (1 bytes)	
A$cursor_manager$272:	
	.db $4E
	
; Data from C23 to C25 (3 bytes)	
A$cursor_manager$276:	
C$cursor_manager.c$55$1$31:	
	.db $21 $26 $C0
	
; Data from C26 to C26 (1 bytes)	
A$cursor_manager$277:	
	.db $23
	
; Data from C27 to C27 (1 bytes)	
A$cursor_manager$278:	
	.db $23
	
; Data from C28 to C28 (1 bytes)	
A$cursor_manager$279:	
	.db $23
	
; Data from C29 to C29 (1 bytes)	
A$cursor_manager$280:	
	.db $46
	
; Data from C2A to C2A (1 bytes)	
A$cursor_manager$284:	
C$cursor_manager.c$59$1$31:	
	.db $C5
	
; Data from C2B to C2D (3 bytes)	
A$cursor_manager$285:	
	.db $21 $20 $01
	
; Data from C2E to C2E (1 bytes)	
A$cursor_manager$286:	
	.db $E5
	
; Data from C2F to C2F (1 bytes)	
A$cursor_manager$287:	
	.db $C5
	
; Data from C30 to C32 (3 bytes)	
A$cursor_manager$288:	
	.db $CD $64 $09
	
; Data from C33 to C33 (1 bytes)	
A$cursor_manager$289:	
	.db $F1
	
; Data from C34 to C34 (1 bytes)	
A$cursor_manager$290:	
	.db $F1
	
; Data from C35 to C35 (1 bytes)	
A$cursor_manager$291:	
	.db $C1
	
; Data from C36 to C36 (1 bytes)	
A$cursor_manager$295:	
C$cursor_manager.c$60$1$31:	
	.db $79
	
; Data from C37 to C38 (2 bytes)	
A$cursor_manager$296:	
	.db $C6 $28
	
; Data from C39 to C39 (1 bytes)	
A$cursor_manager$297:	
	.db $5F
	
; Data from C3A to C3A (1 bytes)	
A$cursor_manager$298:	
	.db $C5
	
; Data from C3B to C3B (1 bytes)	
A$cursor_manager$299:	
	.db $D5
	
; Data from C3C to C3E (3 bytes)	
A$cursor_manager$300:	
	.db $21 $25 $01
	
; Data from C3F to C3F (1 bytes)	
A$cursor_manager$301:	
	.db $E5
	
; Data from C40 to C40 (1 bytes)	
A$cursor_manager$302:	
	.db $C5
	
; Data from C41 to C41 (1 bytes)	
A$cursor_manager$303:	
	.db $33
	
; Data from C42 to C42 (1 bytes)	
A$cursor_manager$304:	
	.db $7B
	
; Data from C43 to C43 (1 bytes)	
A$cursor_manager$305:	
	.db $F5
	
; Data from C44 to C44 (1 bytes)	
A$cursor_manager$306:	
	.db $33
	
; Data from C45 to C47 (3 bytes)	
A$cursor_manager$307:	
	.db $CD $64 $09
	
; Data from C48 to C48 (1 bytes)	
A$cursor_manager$308:	
	.db $F1
	
; Data from C49 to C49 (1 bytes)	
A$cursor_manager$309:	
	.db $F1
	
; Data from C4A to C4A (1 bytes)	
A$cursor_manager$310:	
	.db $D1
	
; Data from C4B to C4B (1 bytes)	
A$cursor_manager$311:	
	.db $C1
	
; Data from C4C to C4C (1 bytes)	
A$cursor_manager$315:	
C$cursor_manager.c$61$1$31:	
	.db $78
	
; Data from C4D to C4E (2 bytes)	
A$cursor_manager$316:	
	.db $C6 $10
	
; Data from C4F to C4F (1 bytes)	
A$cursor_manager$317:	
	.db $57
	
; Data from C50 to C50 (1 bytes)	
A$cursor_manager$318:	
	.db $C5
	
; Data from C51 to C51 (1 bytes)	
A$cursor_manager$319:	
	.db $D5
	
; Data from C52 to C54 (3 bytes)	
A$cursor_manager$320:	
	.db $21 $2C $01
	
; Data from C55 to C55 (1 bytes)	
A$cursor_manager$321:	
	.db $E5
	
; Data from C56 to C56 (1 bytes)	
A$cursor_manager$322:	
	.db $59
	
; Data from C57 to C57 (1 bytes)	
A$cursor_manager$323:	
	.db $D5
	
; Data from C58 to C5A (3 bytes)	
A$cursor_manager$324:	
	.db $CD $64 $09
	
; Data from C5B to C5B (1 bytes)	
A$cursor_manager$325:	
	.db $F1
	
; Data from C5C to C5C (1 bytes)	
A$cursor_manager$326:	
	.db $F1
	
; Data from C5D to C5D (1 bytes)	
A$cursor_manager$327:	
	.db $D1
	
; Data from C5E to C5E (1 bytes)	
A$cursor_manager$328:	
	.db $D5
	
; Data from C5F to C61 (3 bytes)	
A$cursor_manager$329:	
	.db $21 $31 $01
	
; Data from C62 to C62 (1 bytes)	
A$cursor_manager$330:	
	.db $E5
	
; Data from C63 to C63 (1 bytes)	
A$cursor_manager$331:	
	.db $D5
	
; Data from C64 to C66 (3 bytes)	
A$cursor_manager$332:	
	.db $CD $64 $09
	
; Data from C67 to C67 (1 bytes)	
A$cursor_manager$333:	
	.db $F1
	
; Data from C68 to C68 (1 bytes)	
A$cursor_manager$334:	
	.db $F1
	
; Data from C69 to C69 (1 bytes)	
A$cursor_manager$335:	
	.db $D1
	
; Data from C6A to C6A (1 bytes)	
A$cursor_manager$336:	
	.db $C1
	
; Data from C6B to C6B (1 bytes)	
A$cursor_manager$340:	
C$cursor_manager.c$65$1$31:	
	.db $79
	
; Data from C6C to C6D (2 bytes)	
A$cursor_manager$341:	
	.db $C6 $08
	
; Data from C6E to C70 (3 bytes)	
A$cursor_manager$342:	
	.db $DD $77 $FC
	
; Data from C71 to C71 (1 bytes)	
A$cursor_manager$343:	
	.db $C5
	
; Data from C72 to C72 (1 bytes)	
A$cursor_manager$344:	
	.db $D5
	
; Data from C73 to C75 (3 bytes)	
A$cursor_manager$345:	
	.db $21 $21 $01
	
; Data from C76 to C76 (1 bytes)	
A$cursor_manager$346:	
	.db $E5
	
; Data from C77 to C77 (1 bytes)	
A$cursor_manager$347:	
	.db $C5
	
; Data from C78 to C78 (1 bytes)	
A$cursor_manager$348:	
	.db $33
	
; Data from C79 to C7B (3 bytes)	
A$cursor_manager$349:	
	.db $DD $7E $FC
	
; Data from C7C to C7C (1 bytes)	
A$cursor_manager$350:	
	.db $F5
	
; Data from C7D to C7D (1 bytes)	
A$cursor_manager$351:	
	.db $33
	
; Data from C7E to C80 (3 bytes)	
A$cursor_manager$352:	
	.db $CD $64 $09
	
; Data from C81 to C81 (1 bytes)	
A$cursor_manager$353:	
	.db $F1
	
; Data from C82 to C82 (1 bytes)	
A$cursor_manager$354:	
	.db $F1
	
; Data from C83 to C83 (1 bytes)	
A$cursor_manager$355:	
	.db $D1
	
; Data from C84 to C84 (1 bytes)	
A$cursor_manager$356:	
	.db $C1
	
; Data from C85 to C85 (1 bytes)	
A$cursor_manager$360:	
C$cursor_manager.c$66$1$31:	
	.db $79
	
; Data from C86 to C87 (2 bytes)	
A$cursor_manager$361:	
	.db $C6 $10
	
; Data from C88 to C8A (3 bytes)	
A$cursor_manager$362:	
	.db $DD $77 $FF
	
; Data from C8B to C8B (1 bytes)	
A$cursor_manager$363:	
	.db $C5
	
; Data from C8C to C8C (1 bytes)	
A$cursor_manager$364:	
	.db $D5
	
; Data from C8D to C8F (3 bytes)	
A$cursor_manager$365:	
	.db $21 $22 $01
	
; Data from C90 to C90 (1 bytes)	
A$cursor_manager$366:	
	.db $E5
	
; Data from C91 to C91 (1 bytes)	
A$cursor_manager$367:	
	.db $C5
	
; Data from C92 to C92 (1 bytes)	
A$cursor_manager$368:	
	.db $33
	
; Data from C93 to C95 (3 bytes)	
A$cursor_manager$369:	
	.db $DD $7E $FF
	
; Data from C96 to C96 (1 bytes)	
A$cursor_manager$370:	
	.db $F5
	
; Data from C97 to C97 (1 bytes)	
A$cursor_manager$371:	
	.db $33
	
; Data from C98 to C9A (3 bytes)	
A$cursor_manager$372:	
	.db $CD $64 $09
	
; Data from C9B to C9B (1 bytes)	
A$cursor_manager$373:	
	.db $F1
	
; Data from C9C to C9C (1 bytes)	
A$cursor_manager$374:	
	.db $F1
	
; Data from C9D to C9D (1 bytes)	
A$cursor_manager$375:	
	.db $D1
	
; Data from C9E to C9E (1 bytes)	
A$cursor_manager$376:	
	.db $C1
	
; Data from C9F to C9F (1 bytes)	
A$cursor_manager$380:	
C$cursor_manager.c$67$1$31:	
	.db $79
	
; Data from CA0 to CA1 (2 bytes)	
A$cursor_manager$381:	
	.db $C6 $18
	
; Data from CA2 to CA4 (3 bytes)	
A$cursor_manager$382:	
	.db $DD $77 $FE
	
; Data from CA5 to CA5 (1 bytes)	
A$cursor_manager$383:	
	.db $C5
	
; Data from CA6 to CA6 (1 bytes)	
A$cursor_manager$384:	
	.db $D5
	
; Data from CA7 to CA9 (3 bytes)	
A$cursor_manager$385:	
	.db $21 $23 $01
	
; Data from CAA to CAA (1 bytes)	
A$cursor_manager$386:	
	.db $E5
	
; Data from CAB to CAB (1 bytes)	
A$cursor_manager$387:	
	.db $C5
	
; Data from CAC to CAC (1 bytes)	
A$cursor_manager$388:	
	.db $33
	
; Data from CAD to CAF (3 bytes)	
A$cursor_manager$389:	
	.db $DD $7E $FE
	
; Data from CB0 to CB0 (1 bytes)	
A$cursor_manager$390:	
	.db $F5
	
; Data from CB1 to CB1 (1 bytes)	
A$cursor_manager$391:	
	.db $33
	
; Data from CB2 to CB4 (3 bytes)	
A$cursor_manager$392:	
	.db $CD $64 $09
	
; Data from CB5 to CB5 (1 bytes)	
A$cursor_manager$393:	
	.db $F1
	
; Data from CB6 to CB6 (1 bytes)	
A$cursor_manager$394:	
	.db $F1
	
; Data from CB7 to CB7 (1 bytes)	
A$cursor_manager$395:	
	.db $D1
	
; Data from CB8 to CB8 (1 bytes)	
A$cursor_manager$396:	
	.db $C1
	
; Data from CB9 to CB9 (1 bytes)	
A$cursor_manager$400:	
C$cursor_manager.c$68$1$31:	
	.db $79
	
; Data from CBA to CBB (2 bytes)	
A$cursor_manager$401:	
	.db $C6 $20
	
; Data from CBC to CBE (3 bytes)	
A$cursor_manager$402:	
	.db $DD $77 $FD
	
; Data from CBF to CBF (1 bytes)	
A$cursor_manager$403:	
	.db $C5
	
; Data from CC0 to CC0 (1 bytes)	
A$cursor_manager$404:	
	.db $D5
	
; Data from CC1 to CC3 (3 bytes)	
A$cursor_manager$405:	
	.db $21 $24 $01
	
; Data from CC4 to CC4 (1 bytes)	
A$cursor_manager$406:	
	.db $E5
	
; Data from CC5 to CC5 (1 bytes)	
A$cursor_manager$407:	
	.db $C5
	
; Data from CC6 to CC6 (1 bytes)	
A$cursor_manager$408:	
	.db $33
	
; Data from CC7 to CC9 (3 bytes)	
A$cursor_manager$409:	
	.db $DD $7E $FD
	
; Data from CCA to CCA (1 bytes)	
A$cursor_manager$410:	
	.db $F5
	
; Data from CCB to CCB (1 bytes)	
A$cursor_manager$411:	
	.db $33
	
; Data from CCC to CCE (3 bytes)	
A$cursor_manager$412:	
	.db $CD $64 $09
	
; Data from CCF to CCF (1 bytes)	
A$cursor_manager$413:	
	.db $F1
	
; Data from CD0 to CD0 (1 bytes)	
A$cursor_manager$414:	
	.db $F1
	
; Data from CD1 to CD1 (1 bytes)	
A$cursor_manager$415:	
	.db $D1
	
; Data from CD2 to CD2 (1 bytes)	
A$cursor_manager$416:	
	.db $C1
	
; Data from CD3 to CD3 (1 bytes)	
A$cursor_manager$420:	
C$cursor_manager.c$71$1$31:	
	.db $78
	
; Data from CD4 to CD5 (2 bytes)	
A$cursor_manager$421:	
	.db $C6 $08
	
; Data from CD6 to CD6 (1 bytes)	
A$cursor_manager$422:	
	.db $47
	
; Data from CD7 to CD7 (1 bytes)	
A$cursor_manager$423:	
	.db $C5
	
; Data from CD8 to CD8 (1 bytes)	
A$cursor_manager$424:	
	.db $D5
	
; Data from CD9 to CDB (3 bytes)	
A$cursor_manager$425:	
	.db $21 $26 $01
	
; Data from CDC to CDC (1 bytes)	
A$cursor_manager$426:	
	.db $E5
	
; Data from CDD to CDD (1 bytes)	
A$cursor_manager$427:	
	.db $C5
	
; Data from CDE to CE0 (3 bytes)	
A$cursor_manager$428:	
	.db $CD $64 $09
	
; Data from CE1 to CE1 (1 bytes)	
A$cursor_manager$429:	
	.db $F1
	
; Data from CE2 to CE2 (1 bytes)	
A$cursor_manager$430:	
	.db $F1
	
; Data from CE3 to CE3 (1 bytes)	
A$cursor_manager$431:	
	.db $D1
	
; Data from CE4 to CE4 (1 bytes)	
A$cursor_manager$432:	
	.db $C1
	
; Data from CE5 to CE5 (1 bytes)	
A$cursor_manager$436:	
C$cursor_manager.c$72$1$31:	
	.db $D5
	
; Data from CE6 to CE8 (3 bytes)	
A$cursor_manager$437:	
	.db $21 $2B $01
	
; Data from CE9 to CE9 (1 bytes)	
A$cursor_manager$438:	
	.db $E5
	
; Data from CEA to CEA (1 bytes)	
A$cursor_manager$439:	
	.db $C5
	
; Data from CEB to CEB (1 bytes)	
A$cursor_manager$440:	
	.db $33
	
; Data from CEC to CEC (1 bytes)	
A$cursor_manager$441:	
	.db $7B
	
; Data from CED to CED (1 bytes)	
A$cursor_manager$442:	
	.db $F5
	
; Data from CEE to CEE (1 bytes)	
A$cursor_manager$443:	
	.db $33
	
; Data from CEF to CF1 (3 bytes)	
A$cursor_manager$444:	
	.db $CD $64 $09
	
; Data from CF2 to CF2 (1 bytes)	
A$cursor_manager$445:	
	.db $F1
	
; Data from CF3 to CF3 (1 bytes)	
A$cursor_manager$446:	
	.db $F1
	
; Data from CF4 to CF4 (1 bytes)	
A$cursor_manager$447:	
	.db $D1
	
; Data from CF5 to CF5 (1 bytes)	
A$cursor_manager$451:	
C$cursor_manager.c$75$1$31:	
	.db $D5
	
; Data from CF6 to CF8 (3 bytes)	
A$cursor_manager$452:	
	.db $21 $2D $01
	
; Data from CF9 to CF9 (1 bytes)	
A$cursor_manager$453:	
	.db $E5
	
; Data from CFA to CFA (1 bytes)	
A$cursor_manager$454:	
	.db $D5
	
; Data from CFB to CFB (1 bytes)	
A$cursor_manager$455:	
	.db $33
	
; Data from CFC to CFE (3 bytes)	
A$cursor_manager$456:	
	.db $DD $7E $FC
	
; Data from CFF to CFF (1 bytes)	
A$cursor_manager$457:	
	.db $F5
	
; Data from D00 to D00 (1 bytes)	
A$cursor_manager$458:	
	.db $33
	
; Data from D01 to D03 (3 bytes)	
A$cursor_manager$459:	
	.db $CD $64 $09
	
; Data from D04 to D04 (1 bytes)	
A$cursor_manager$460:	
	.db $F1
	
; Data from D05 to D05 (1 bytes)	
A$cursor_manager$461:	
	.db $F1
	
; Data from D06 to D06 (1 bytes)	
A$cursor_manager$462:	
	.db $D1
	
; Data from D07 to D07 (1 bytes)	
A$cursor_manager$466:	
C$cursor_manager.c$76$1$31:	
	.db $D5
	
; Data from D08 to D0A (3 bytes)	
A$cursor_manager$467:	
	.db $21 $2E $01
	
; Data from D0B to D0B (1 bytes)	
A$cursor_manager$468:	
	.db $E5
	
; Data from D0C to D0C (1 bytes)	
A$cursor_manager$469:	
	.db $D5
	
; Data from D0D to D0D (1 bytes)	
A$cursor_manager$470:	
	.db $33
	
; Data from D0E to D10 (3 bytes)	
A$cursor_manager$471:	
	.db $DD $7E $FF
	
; Data from D11 to D11 (1 bytes)	
A$cursor_manager$472:	
	.db $F5
	
; Data from D12 to D12 (1 bytes)	
A$cursor_manager$473:	
	.db $33
	
; Data from D13 to D15 (3 bytes)	
A$cursor_manager$474:	
	.db $CD $64 $09
	
; Data from D16 to D16 (1 bytes)	
A$cursor_manager$475:	
	.db $F1
	
; Data from D17 to D17 (1 bytes)	
A$cursor_manager$476:	
	.db $F1
	
; Data from D18 to D18 (1 bytes)	
A$cursor_manager$477:	
	.db $D1
	
; Data from D19 to D19 (1 bytes)	
A$cursor_manager$481:	
C$cursor_manager.c$77$1$31:	
	.db $D5
	
; Data from D1A to D1C (3 bytes)	
A$cursor_manager$482:	
	.db $21 $2F $01
	
; Data from D1D to D1D (1 bytes)	
A$cursor_manager$483:	
	.db $E5
	
; Data from D1E to D1E (1 bytes)	
A$cursor_manager$484:	
	.db $D5
	
; Data from D1F to D1F (1 bytes)	
A$cursor_manager$485:	
	.db $33
	
; Data from D20 to D22 (3 bytes)	
A$cursor_manager$486:	
	.db $DD $7E $FE
	
; Data from D23 to D23 (1 bytes)	
A$cursor_manager$487:	
	.db $F5
	
; Data from D24 to D24 (1 bytes)	
A$cursor_manager$488:	
	.db $33
	
; Data from D25 to D27 (3 bytes)	
A$cursor_manager$489:	
	.db $CD $64 $09
	
; Data from D28 to D28 (1 bytes)	
A$cursor_manager$490:	
	.db $F1
	
; Data from D29 to D29 (1 bytes)	
A$cursor_manager$491:	
	.db $F1
	
; Data from D2A to D2A (1 bytes)	
A$cursor_manager$492:	
	.db $D1
	
; Data from D2B to D2D (3 bytes)	
A$cursor_manager$496:	
C$cursor_manager.c$78$1$31:	
	.db $21 $30 $01
	
; Data from D2E to D2E (1 bytes)	
A$cursor_manager$497:	
	.db $E5
	
; Data from D2F to D2F (1 bytes)	
A$cursor_manager$498:	
	.db $D5
	
; Data from D30 to D30 (1 bytes)	
A$cursor_manager$499:	
	.db $33
	
; Data from D31 to D33 (3 bytes)	
A$cursor_manager$500:	
	.db $DD $7E $FD
	
; Data from D34 to D34 (1 bytes)	
A$cursor_manager$501:	
	.db $F5
	
; Data from D35 to D35 (1 bytes)	
A$cursor_manager$502:	
	.db $33
	
; Data from D36 to D38 (3 bytes)	
A$cursor_manager$503:	
	.db $CD $64 $09
	
; Data from D39 to D3A (2 bytes)	
A$cursor_manager$504:	
	.db $DD $F9
	
; Data from D3B to D3C (2 bytes)	
A$cursor_manager$505:	
	.db $DD $E1
	
; Data from D3D to D3D (1 bytes)	
A$cursor_manager$510:	
C$cursor_manager.c$79$1$31:	
XG$engine_cursor_manager_draw$0$:	
	.db $C9
	
; Data from D3E to D40 (3 bytes)	
A$cursor_manager$523:	
C$cursor_manager.c$81$1$31:	
C$cursor_manager.c$83$1$32:	
G$engine_cursor_manager_decX$0$0:	
_engine_cursor_manager_decX:	
	.db $01 $26 $C0
	
; Data from D41 to D41 (1 bytes)	
A$cursor_manager$527:	
C$cursor_manager.c$84$1$32:	
	.db $0A
	
; Data from D42 to D42 (1 bytes)	
A$cursor_manager$528:	
	.db $B7
	
; Data from D43 to D44 (2 bytes)	
A$cursor_manager$529:	
	.db $20 $06
	
; Data from D45 to D46 (2 bytes)	
A$cursor_manager$533:	
C$cursor_manager.c$86$2$33:	
	.db $3E $03
	
; Data from D47 to D47 (1 bytes)	
A$cursor_manager$534:	
	.db $02
	
; Data from D48 to D4A (3 bytes)	
A$cursor_manager$535:	
	.db $C3 $88 $0D
	
; Data from D4B to D4C (2 bytes)	
A$cursor_manager$540:	
C$cursor_manager.c$90$2$34:	
	.db $C6 $FF
	
; Data from D4D to D4D (1 bytes)	
A$cursor_manager$541:	
	.db $02
	
; Data from D4E to D50 (3 bytes)	
A$cursor_manager$549:	
C$cursor_manager.c$93$1$32:	
C$cursor_manager.c$94$1$32:	
XG$engine_cursor_manager_decX$0$:	
	.db $C3 $88 $0D
	
; Data from D51 to D53 (3 bytes)	
A$cursor_manager$562:	
C$cursor_manager.c$95$1$32:	
C$cursor_manager.c$97$1$35:	
G$engine_cursor_manager_incX$0$0:	
_engine_cursor_manager_incX:	
	.db $01 $26 $C0
	
; Data from D54 to D54 (1 bytes)	
A$cursor_manager$566:	
C$cursor_manager.c$98$1$35:	
	.db $0A
	
; Data from D55 to D56 (2 bytes)	
A$cursor_manager$567:	
	.db $FE $03
	
; Data from D57 to D58 (2 bytes)	
A$cursor_manager$568:	
	.db $20 $05
	
; Data from D59 to D59 (1 bytes)	
A$cursor_manager$572:	
C$cursor_manager.c$100$2$36:	
	.db $AF
	
; Data from D5A to D5A (1 bytes)	
A$cursor_manager$573:	
	.db $02
	
; Data from D5B to D5D (3 bytes)	
A$cursor_manager$574:	
	.db $C3 $88 $0D
	
; Data from D5E to D5E (1 bytes)	
A$cursor_manager$579:	
C$cursor_manager.c$104$2$37:	
	.db $3C
	
; Data from D5F to D5F (1 bytes)	
A$cursor_manager$580:	
	.db $02
	
; Data from D60 to D62 (3 bytes)	
A$cursor_manager$588:	
C$cursor_manager.c$107$1$35:	
C$cursor_manager.c$108$1$35:	
XG$engine_cursor_manager_incX$0$:	
	.db $C3 $88 $0D
	
; Data from D63 to D65 (3 bytes)	
A$cursor_manager$604:	
C$cursor_manager.c$109$1$35:	
C$cursor_manager.c$111$1$38:	
C$cursor_manager.c$112$1$38:	
G$engine_cursor_manager_decY$0$0:	
_engine_cursor_manager_decY:	
	.db $01 $27 $C0
	
; Data from D66 to D66 (1 bytes)	
A$cursor_manager$605:	
	.db $0A
	
; Data from D67 to D67 (1 bytes)	
A$cursor_manager$606:	
	.db $B7
	
; Data from D68 to D69 (2 bytes)	
A$cursor_manager$607:	
	.db $20 $06
	
; Data from D6A to D6B (2 bytes)	
A$cursor_manager$611:	
C$cursor_manager.c$114$2$39:	
	.db $3E $02
	
; Data from D6C to D6C (1 bytes)	
A$cursor_manager$612:	
	.db $02
	
; Data from D6D to D6F (3 bytes)	
A$cursor_manager$613:	
	.db $C3 $88 $0D
	
; Data from D70 to D71 (2 bytes)	
A$cursor_manager$618:	
C$cursor_manager.c$118$2$40:	
	.db $C6 $FF
	
; Data from D72 to D72 (1 bytes)	
A$cursor_manager$619:	
	.db $02
	
; Data from D73 to D75 (3 bytes)	
A$cursor_manager$627:	
C$cursor_manager.c$121$1$38:	
C$cursor_manager.c$122$1$38:	
XG$engine_cursor_manager_decY$0$:	
	.db $C3 $88 $0D
	
; Data from D76 to D78 (3 bytes)	
A$cursor_manager$643:	
C$cursor_manager.c$123$1$38:	
C$cursor_manager.c$125$1$41:	
C$cursor_manager.c$126$1$41:	
G$engine_cursor_manager_incY$0$0:	
_engine_cursor_manager_incY:	
	.db $01 $27 $C0
	
; Data from D79 to D79 (1 bytes)	
A$cursor_manager$644:	
	.db $0A
	
; Data from D7A to D7B (2 bytes)	
A$cursor_manager$645:	
	.db $FE $02
	
; Data from D7C to D7D (2 bytes)	
A$cursor_manager$646:	
	.db $20 $05
	
; Data from D7E to D7E (1 bytes)	
A$cursor_manager$650:	
C$cursor_manager.c$128$2$42:	
	.db $AF
	
; Data from D7F to D7F (1 bytes)	
A$cursor_manager$651:	
	.db $02
	
; Data from D80 to D82 (3 bytes)	
A$cursor_manager$652:	
	.db $C3 $88 $0D
	
; Data from D83 to D83 (1 bytes)	
A$cursor_manager$657:	
C$cursor_manager.c$132$2$43:	
	.db $3C
	
; Data from D84 to D84 (1 bytes)	
A$cursor_manager$658:	
	.db $02
	
; Data from D85 to D87 (3 bytes)	
A$cursor_manager$666:	
C$cursor_manager.c$135$1$41:	
C$cursor_manager.c$136$1$41:	
XG$engine_cursor_manager_incY$0$:	
	.db $C3 $88 $0D
	
; Data from D88 to D8A (3 bytes)	
A$cursor_manager$682:	
C$cursor_manager.c$138$1$41:	
C$cursor_manager.c$140$1$44:	
C$cursor_manager.c$141$1$44:	
Fcursor_manager$update_values$0$:	
	.db $01 $46 $11
	
; Data from D8B to D8D (3 bytes)	
A$cursor_manager$683:	
	.db $21 $26 $C0
	
; Data from D8E to D8E (1 bytes)	
A$cursor_manager$684:	
	.db $6E
	
; Data from D8F to D90 (2 bytes)	
A$cursor_manager$685:	
	.db $26 $00
	
; Data from D91 to D91 (1 bytes)	
A$cursor_manager$686:	
	.db $09
	
; Data from D92 to D92 (1 bytes)	
A$cursor_manager$687:	
	.db $4E
	
; Data from D93 to D95 (3 bytes)	
A$cursor_manager$691:	
C$cursor_manager.c$142$1$44:	
	.db $11 $4A $11
	
; Data from D96 to D98 (3 bytes)	
A$cursor_manager$692:	
	.db $21 $26 $C0
	
; Data from D99 to D99 (1 bytes)	
A$cursor_manager$693:	
	.db $23
	
; Data from D9A to D9A (1 bytes)	
A$cursor_manager$694:	
	.db $6E
	
; Data from D9B to D9C (2 bytes)	
A$cursor_manager$695:	
	.db $26 $00
	
; Data from D9D to D9D (1 bytes)	
A$cursor_manager$696:	
	.db $19
	
; Data from D9E to D9E (1 bytes)	
A$cursor_manager$697:	
	.db $5E
	
; Data from D9F to D9F (1 bytes)	
A$cursor_manager$701:	
C$cursor_manager.c$144$1$44:	
	.db $0D
	
; Data from DA0 to DA0 (1 bytes)	
A$cursor_manager$702:	
	.db $79
	
; Data from DA1 to DA1 (1 bytes)	
A$cursor_manager$703:	
	.db $07
	
; Data from DA2 to DA2 (1 bytes)	
A$cursor_manager$704:	
	.db $07
	
; Data from DA3 to DA3 (1 bytes)	
A$cursor_manager$705:	
	.db $07
	
; Data from DA4 to DA5 (2 bytes)	
A$cursor_manager$706:	
	.db $E6 $F8
	
; Data from DA6 to DA6 (1 bytes)	
A$cursor_manager$707:	
	.db $57
	
; Data from DA7 to DA9 (3 bytes)	
A$cursor_manager$708:	
	.db $21 $28 $C0
	
; Data from DAA to DAA (1 bytes)	
A$cursor_manager$709:	
	.db $72
	
; Data from DAB to DAD (3 bytes)	
A$cursor_manager$713:	
C$cursor_manager.c$145$1$44:	
	.db $01 $29 $C0
	
; Data from DAE to DAE (1 bytes)	
A$cursor_manager$714:	
	.db $1D
	
; Data from DAF to DAF (1 bytes)	
A$cursor_manager$715:	
	.db $7B
	
; Data from DB0 to DB0 (1 bytes)	
A$cursor_manager$716:	
	.db $07
	
; Data from DB1 to DB1 (1 bytes)	
A$cursor_manager$717:	
	.db $07
	
; Data from DB2 to DB2 (1 bytes)	
A$cursor_manager$718:	
	.db $07
	
; Data from DB3 to DB4 (2 bytes)	
A$cursor_manager$719:	
	.db $E6 $F8
	
; Data from DB5 to DB5 (1 bytes)	
A$cursor_manager$720:	
	.db $5F
	
; Data from DB6 to DB6 (1 bytes)	
A$cursor_manager$721:	
	.db $02
	
; Data from DB7 to DB7 (1 bytes)	
A$cursor_manager$725:	
C$cursor_manager.c$148$1$44:	
	.db $14
	
; Data from DB8 to DB8 (1 bytes)	
A$cursor_manager$726:	
	.db $72
	
; Data from DB9 to DB9 (1 bytes)	
A$cursor_manager$730:	
C$cursor_manager.c$149$1$44:	
	.db $1D
	
; Data from DBA to DBA (1 bytes)	
A$cursor_manager$731:	
	.db $7B
	
; Data from DBB to DBB (1 bytes)	
A$cursor_manager$732:	
	.db $02
	
; Data from DBC to DBC (1 bytes)	
A$cursor_manager$737:	
C$cursor_manager.c$150$1$44:	
XFcursor_manager$update_values$0:	
	.db $C9
	
; Data from DBD to DBE (2 bytes)	
A$font_manager$56:	
C$font_manager.c$10$0$0:	
G$engine_font_manager_draw_char$:	
_engine_font_manager_draw_char:	
	.db $DD $E5
	
; Data from DBF to DC2 (4 bytes)	
A$font_manager$57:	
	.db $DD $21 $00 $00
	
; Data from DC3 to DC4 (2 bytes)	
A$font_manager$58:	
	.db $DD $39
	
; Data from DC5 to DC7 (3 bytes)	
A$font_manager$65:	
C$font_manager.c$12$1$0:	
C$font_manager.c$13$1$21:	
	.db $DD $7E $04
	
; Data from DC8 to DC9 (2 bytes)	
A$font_manager$66:	
	.db $C6 $E0
	
; Data from DCA to DCA (1 bytes)	
A$font_manager$67:	
	.db $4F
	
; Data from DCB to DCB (1 bytes)	
A$font_manager$71:	
C$font_manager.c$14$1$21:	
	.db $C5
	
; Data from DCC to DCE (3 bytes)	
A$font_manager$72:	
	.db $DD $66 $06
	
; Data from DCF to DD1 (3 bytes)	
A$font_manager$73:	
	.db $DD $6E $05
	
; Data from DD2 to DD2 (1 bytes)	
A$font_manager$74:	
	.db $E5
	
; Data from DD3 to DD5 (3 bytes)	
A$font_manager$75:	
	.db $CD $23 $09
	
; Data from DD6 to DD6 (1 bytes)	
A$font_manager$76:	
	.db $F1
	
; Data from DD7 to DD7 (1 bytes)	
A$font_manager$77:	
	.db $C1
	
; Data from DD8 to DDA (3 bytes)	
A$font_manager$81:	
C$font_manager.c$15$1$21:	
	.db $21 $22 $17
	
; Data from DDB to DDB (1 bytes)	
A$font_manager$82:	
	.db $6E
	
; Data from DDC to DDD (2 bytes)	
A$font_manager$83:	
	.db $26 $00
	
; Data from DDE to DDF (2 bytes)	
A$font_manager$84:	
	.db $06 $00
	
; Data from DE0 to DE0 (1 bytes)	
A$font_manager$85:	
	.db $09
	
; Data from DE1 to DE1 (1 bytes)	
A$font_manager$86:	
	.db $E5
	
; Data from DE2 to DE4 (3 bytes)	
A$font_manager$87:	
	.db $CD $4C $09
	
; Data from DE5 to DE5 (1 bytes)	
A$font_manager$88:	
	.db $F1
	
; Data from DE6 to DE7 (2 bytes)	
A$font_manager$89:	
	.db $DD $E1
	
; Data from DE8 to DE8 (1 bytes)	
A$font_manager$94:	
C$font_manager.c$16$1$21:	
XG$engine_font_manager_draw_char:	
	.db $C9
	
; Data from DE9 to DEA (2 bytes)	
A$font_manager$104:	
C$font_manager.c$18$1$21:	
G$engine_font_manager_draw_text$:	
_engine_font_manager_draw_text:	
	.db $DD $E5
	
; Data from DEB to DEE (4 bytes)	
A$font_manager$105:	
	.db $DD $21 $00 $00
	
; Data from DEF to DF0 (2 bytes)	
A$font_manager$106:	
	.db $DD $39
	
; Data from DF1 to DF1 (1 bytes)	
A$font_manager$107:	
	.db $3B
	
; Data from DF2 to DF4 (3 bytes)	
A$font_manager$114:	
C$font_manager.c$20$1$21:	
C$font_manager.c$23$1$23:	
	.db $DD $4E $06
	
; Data from DF5 to DF8 (4 bytes)	
A$font_manager$115:	
	.db $DD $36 $FF $00
	
; Data from DF9 to DFB (3 bytes)	
A$font_manager$117:	
	.db $DD $7E $04
	
; Data from DFC to DFE (3 bytes)	
A$font_manager$118:	
	.db $DD $86 $FF
	
; Data from DFF to DFF (1 bytes)	
A$font_manager$119:	
	.db $5F
	
; Data from E00 to E02 (3 bytes)	
A$font_manager$120:	
	.db $DD $7E $05
	
; Data from E03 to E04 (2 bytes)	
A$font_manager$121:	
	.db $CE $00
	
; Data from E05 to E05 (1 bytes)	
A$font_manager$122:	
	.db $57
	
; Data from E06 to E06 (1 bytes)	
A$font_manager$123:	
	.db $1A
	
; Data from E07 to E07 (1 bytes)	
A$font_manager$124:	
	.db $B7
	
; Data from E08 to E09 (2 bytes)	
A$font_manager$125:	
	.db $28 $2D
	
; Data from E0A to E0B (2 bytes)	
A$font_manager$129:	
C$font_manager.c$25$2$24:	
	.db $C6 $E0
	
; Data from E0C to E0C (1 bytes)	
A$font_manager$130:	
	.db $47
	
; Data from E0D to E0D (1 bytes)	
A$font_manager$134:	
C$font_manager.c$26$2$24:	
	.db $51
	
; Data from E0E to E0E (1 bytes)	
A$font_manager$135:	
	.db $0C
	
; Data from E0F to E11 (3 bytes)	
A$font_manager$136:	
	.db $DD $71 $06
	
; Data from E12 to E12 (1 bytes)	
A$font_manager$137:	
	.db $C5
	
; Data from E13 to E15 (3 bytes)	
A$font_manager$138:	
	.db $DD $7E $07
	
; Data from E16 to E16 (1 bytes)	
A$font_manager$139:	
	.db $F5
	
; Data from E17 to E17 (1 bytes)	
A$font_manager$140:	
	.db $33
	
; Data from E18 to E18 (1 bytes)	
A$font_manager$141:	
	.db $D5
	
; Data from E19 to E19 (1 bytes)	
A$font_manager$142:	
	.db $33
	
; Data from E1A to E1C (3 bytes)	
A$font_manager$143:	
	.db $CD $23 $09
	
; Data from E1D to E1D (1 bytes)	
A$font_manager$144:	
	.db $F1
	
; Data from E1E to E1E (1 bytes)	
A$font_manager$145:	
	.db $C1
	
; Data from E1F to E21 (3 bytes)	
A$font_manager$149:	
C$font_manager.c$27$2$24:	
	.db $21 $22 $17
	
; Data from E22 to E22 (1 bytes)	
A$font_manager$150:	
	.db $5E
	
; Data from E23 to E24 (2 bytes)	
A$font_manager$151:	
	.db $16 $00
	
; Data from E25 to E25 (1 bytes)	
A$font_manager$152:	
	.db $78
	
; Data from E26 to E26 (1 bytes)	
A$font_manager$153:	
	.db $6F
	
; Data from E27 to E27 (1 bytes)	
A$font_manager$154:	
	.db $17
	
; Data from E28 to E28 (1 bytes)	
A$font_manager$155:	
	.db $9F
	
; Data from E29 to E29 (1 bytes)	
A$font_manager$156:	
	.db $67
	
; Data from E2A to E2A (1 bytes)	
A$font_manager$157:	
	.db $19
	
; Data from E2B to E2B (1 bytes)	
A$font_manager$158:	
	.db $C5
	
; Data from E2C to E2C (1 bytes)	
A$font_manager$159:	
	.db $E5
	
; Data from E2D to E2F (3 bytes)	
A$font_manager$160:	
	.db $CD $4C $09
	
; Data from E30 to E30 (1 bytes)	
A$font_manager$161:	
	.db $F1
	
; Data from E31 to E31 (1 bytes)	
A$font_manager$162:	
	.db $C1
	
; Data from E32 to E34 (3 bytes)	
A$font_manager$166:	
C$font_manager.c$28$2$24:	
	.db $DD $34 $FF
	
; Data from E35 to E36 (2 bytes)	
A$font_manager$167:	
	.db $18 $C2
	
; Data from E37 to E37 (1 bytes)	
A$font_manager$169:	
	.db $33
	
; Data from E38 to E39 (2 bytes)	
A$font_manager$170:	
	.db $DD $E1
	
; Data from E3A to E3A (1 bytes)	
A$font_manager$175:	
C$font_manager.c$30$1$23:	
XG$engine_font_manager_draw_text:	
	.db $C9
	
; Data from E3B to E3C (2 bytes)	
A$font_manager$185:	
C$font_manager.c$32$1$23:	
G$engine_font_manager_draw_data$:	
_engine_font_manager_draw_data:	
	.db $DD $E5
	
; Data from E3D to E40 (4 bytes)	
A$font_manager$186:	
	.db $DD $21 $00 $00
	
; Data from E41 to E42 (2 bytes)	
A$font_manager$187:	
	.db $DD $39
	
; Data from E43 to E43 (1 bytes)	
A$font_manager$188:	
	.db $F5
	
; Data from E44 to E46 (3 bytes)	
A$font_manager$195:	
C$font_manager.c$34$1$23:	
	.db $DD $7E $06
	
; Data from E47 to E49 (3 bytes)	
A$font_manager$196:	
	.db $DD $77 $FF
	
; Data from E4A to E4D (4 bytes)	
A$font_manager$197:	
	.db $DD $36 $FE $00
	
; Data from E4E to E50 (3 bytes)	
A$font_manager$202:	
C$font_manager.c$44$2$27:	
	.db $21 $0A $00
	
; Data from E51 to E51 (1 bytes)	
A$font_manager$203:	
	.db $E5
	
; Data from E52 to E54 (3 bytes)	
A$font_manager$204:	
	.db $DD $6E $04
	
; Data from E55 to E57 (3 bytes)	
A$font_manager$205:	
	.db $DD $66 $05
	
; Data from E58 to E58 (1 bytes)	
A$font_manager$206:	
	.db $E5
	
; Data from E59 to E5B (3 bytes)	
A$font_manager$207:	
	.db $CD $9F $1A
	
; Data from E5C to E5C (1 bytes)	
A$font_manager$208:	
	.db $F1
	
; Data from E5D to E5D (1 bytes)	
A$font_manager$209:	
	.db $F1
	
; Data from E5E to E5E (1 bytes)	
A$font_manager$210:	
	.db $5D
	
; Data from E5F to E5F (1 bytes)	
A$font_manager$211:	
	.db $54
	
; Data from E60 to E60 (1 bytes)	
A$font_manager$215:	
C$font_manager.c$45$2$27:	
	.db $E5
	
; Data from E61 to E61 (1 bytes)	
A$font_manager$216:	
	.db $D5
	
; Data from E62 to E64 (3 bytes)	
A$font_manager$217:	
	.db $01 $0A $00
	
; Data from E65 to E65 (1 bytes)	
A$font_manager$218:	
	.db $C5
	
; Data from E66 to E68 (3 bytes)	
A$font_manager$219:	
	.db $DD $4E $04
	
; Data from E69 to E6B (3 bytes)	
A$font_manager$220:	
	.db $DD $46 $05
	
; Data from E6C to E6C (1 bytes)	
A$font_manager$221:	
	.db $C5
	
; Data from E6D to E6F (3 bytes)	
A$font_manager$222:	
	.db $CD $34 $1E
	
; Data from E70 to E70 (1 bytes)	
A$font_manager$223:	
	.db $F1
	
; Data from E71 to E71 (1 bytes)	
A$font_manager$224:	
	.db $F1
	
; Data from E72 to E72 (1 bytes)	
A$font_manager$225:	
	.db $45
	
; Data from E73 to E73 (1 bytes)	
A$font_manager$226:	
	.db $D1
	
; Data from E74 to E74 (1 bytes)	
A$font_manager$227:	
	.db $E1
	
; Data from E75 to E77 (3 bytes)	
A$font_manager$231:	
C$font_manager.c$47$3$28:	
	.db $DD $75 $04
	
; Data from E78 to E7A (3 bytes)	
A$font_manager$232:	
	.db $DD $74 $05
	
; Data from E7B to E7B (1 bytes)	
A$font_manager$236:	
C$font_manager.c$48$3$28:	
	.db $78
	
; Data from E7C to E7D (2 bytes)	
A$font_manager$237:	
	.db $C6 $10
	
; Data from E7E to E7E (1 bytes)	
A$font_manager$238:	
	.db $4F
	
; Data from E7F to E7F (1 bytes)	
A$font_manager$242:	
C$font_manager.c$49$3$28:	
	.db $7A
	
; Data from E80 to E80 (1 bytes)	
A$font_manager$243:	
	.db $B3
	
; Data from E81 to E82 (2 bytes)	
A$font_manager$244:	
	.db $20 $0B
	
; Data from E83 to E83 (1 bytes)	
A$font_manager$245:	
	.db $B0
	
; Data from E84 to E85 (2 bytes)	
A$font_manager$246:	
	.db $20 $08
	
; Data from E86 to E88 (3 bytes)	
A$font_manager$247:	
	.db $DD $7E $FE
	
; Data from E89 to E89 (1 bytes)	
A$font_manager$248:	
	.db $B7
	
; Data from E8A to E8B (2 bytes)	
A$font_manager$249:	
	.db $28 $02
	
; Data from E8C to E8D (2 bytes)	
A$font_manager$253:	
C$font_manager.c$52$4$29:	
	.db $0E $00
	
; Data from E8E to E90 (3 bytes)	
A$font_manager$258:	
C$font_manager.c$55$3$28:	
	.db $DD $46 $FF
	
; Data from E91 to E93 (3 bytes)	
A$font_manager$259:	
	.db $DD $35 $FF
	
; Data from E94 to E96 (3 bytes)	
A$font_manager$260:	
	.db $DD $7E $FF
	
; Data from E97 to E99 (3 bytes)	
A$font_manager$261:	
	.db $DD $77 $06
	
; Data from E9A to E9A (1 bytes)	
A$font_manager$262:	
	.db $C5
	
; Data from E9B to E9D (3 bytes)	
A$font_manager$263:	
	.db $DD $7E $07
	
; Data from E9E to E9E (1 bytes)	
A$font_manager$264:	
	.db $F5
	
; Data from E9F to E9F (1 bytes)	
A$font_manager$265:	
	.db $33
	
; Data from EA0 to EA0 (1 bytes)	
A$font_manager$266:	
	.db $C5
	
; Data from EA1 to EA1 (1 bytes)	
A$font_manager$267:	
	.db $33
	
; Data from EA2 to EA4 (3 bytes)	
A$font_manager$268:	
	.db $CD $23 $09
	
; Data from EA5 to EA5 (1 bytes)	
A$font_manager$269:	
	.db $F1
	
; Data from EA6 to EA6 (1 bytes)	
A$font_manager$270:	
	.db $C1
	
; Data from EA7 to EA9 (3 bytes)	
A$font_manager$274:	
C$font_manager.c$56$3$28:	
	.db $21 $22 $17
	
; Data from EAA to EAA (1 bytes)	
A$font_manager$275:	
	.db $6E
	
; Data from EAB to EAC (2 bytes)	
A$font_manager$276:	
	.db $26 $00
	
; Data from EAD to EAD (1 bytes)	
A$font_manager$277:	
	.db $79
	
; Data from EAE to EAE (1 bytes)	
A$font_manager$278:	
	.db $17
	
; Data from EAF to EAF (1 bytes)	
A$font_manager$279:	
	.db $9F
	
; Data from EB0 to EB0 (1 bytes)	
A$font_manager$280:	
	.db $47
	
; Data from EB1 to EB1 (1 bytes)	
A$font_manager$281:	
	.db $09
	
; Data from EB2 to EB2 (1 bytes)	
A$font_manager$282:	
	.db $E5
	
; Data from EB3 to EB5 (3 bytes)	
A$font_manager$283:	
	.db $CD $4C $09
	
; Data from EB6 to EB6 (1 bytes)	
A$font_manager$284:	
	.db $F1
	
; Data from EB7 to EB9 (3 bytes)	
A$font_manager$288:	
C$font_manager.c$42$2$27:	
	.db $DD $34 $FE
	
; Data from EBA to EBC (3 bytes)	
A$font_manager$289:	
	.db $DD $7E $FE
	
; Data from EBD to EBE (2 bytes)	
A$font_manager$290:	
	.db $D6 $05
	
; Data from EBF to EC0 (2 bytes)	
A$font_manager$291:	
	.db $38 $8D
	
; Data from EC1 to EC2 (2 bytes)	
A$font_manager$292:	
	.db $DD $F9
	
; Data from EC3 to EC4 (2 bytes)	
A$font_manager$293:	
	.db $DD $E1
	
; Data from EC5 to EC5 (1 bytes)	
A$font_manager$298:	
C$font_manager.c$58$2$27:	
XG$engine_font_manager_draw_data:	
	.db $C9
	
A$input_manager$64:	
		ld hl, (_RAM_C146_)
		ld (_RAM_C148_), hl
		call A$_sms_manager$874
		ld (_RAM_C146_), hl
		ret
	
	; Data from ED3 to F8B (185 bytes)
	.db $21 $02 $00 $39 $4E $06 $00 $FD $21 $46 $C1 $FD $7E $00 $A1 $5F
	.db $FD $7E $01 $A0 $B3 $28 $10 $79 $FD $21 $48 $C1 $FD $A6 $00 $4F
	.db $78 $FD $A6 $01 $B1 $28 $03 $2E $00 $C9 $2E $01 $C9 $21 $02 $00
	.db $39 $4E $3A $46 $C1 $A1 $6F $C9 $21 $2A $C0 $FD $21 $02 $00 $FD
	.db $39 $FD $7E $00 $77 $C9 $DD $E5 $DD $21 $00 $00 $DD $39 $3B $3A
	.db $2A $C0 $DD $77 $FF $6F $26 $00 $29 $4D $44 $21 $62 $C1 $09 $5E
	.db $23 $56 $21 $7A $C1 $09 $4E $23 $46 $DD $7E $FF $C6 $89 $6F $3E
	.db $00 $CE $11 $67 $66 $C5 $D5 $E5 $33 $CD $31 $08 $33 $D1 $21 $00
	.db $00 $E5 $D5 $CD $8E $08 $F1 $21 $00 $00 $E3 $CD $A4 $08 $F1 $F1
	.db $2A $92 $C1 $E5 $CD $C5 $08 $F1 $33 $DD $E1 $C9 $01 $2A $C0 $0A
	.db $B7 $20 $04 $3E $0B $02 $C9 $C6 $FF $02 $C9 $01 $2A $C0 $0A $FE
	.db $0B $20 $03 $AF $02 $C9 $3C $02 $C9
	
A$screen_manager$80:	
		ld hl, $0002
		add hl, sp
		ld a, (hl)
		ld (_RAM_C02C_), a
		ld hl, _RAM_C02B_
		ld (hl), $00
		ld hl, $1195
		ld (_RAM_C02D_), hl
		ld hl, $119D
		ld (_RAM_C02F_), hl
		ld hl, $1220
		ld (_RAM_C031_), hl
		ld hl, $1389
		ld (_RAM_C033_), hl
		ld hl, $13EA
		ld (_RAM_C035_), hl
		ld hl, $14E2
		ld (_RAM_C037_), hl
		ld hl, $1196
		ld (_RAM_C039_), hl
		ld hl, $11B9
		ld (_RAM_C03B_), hl
		ld hl, $12BE
		ld (_RAM_C03D_), hl
		ld hl, $138F
		ld (_RAM_C03F_), hl
		ld hl, $144D
		ld (_RAM_C041_), hl
		ld hl, $14E8
		ld (_RAM_C043_), hl
		ret
	
A$screen_manager$166:	
		ld a, (_RAM_C02B_)
		ld iy, _RAM_C02C_
		sub (iy+0)
		jr z, +
		ld a, (iy+0)
		ld iy, _RAM_C02B_
		ld (iy+0), a
		ld bc, _RAM_C02D_
		ld l, (iy+0)
		ld h, $00
		add hl, hl
		add hl, bc
		ld c, (hl)
		inc hl
		ld h, (hl)
		ld l, c
		call _LABEL_2020_
+:	
		ld bc, _RAM_C039_
		ld iy, _RAM_C02B_
		ld l, (iy+0)
		ld h, $00
		add hl, hl
		add hl, bc
		ld c, (hl)
		inc hl
		ld b, (hl)
		ld hl, $C02C
		push hl
		ld l, c
		ld h, b
		call _LABEL_2020_
		pop af
		ret
	
A$scroll_manager$61:	
		xor a
		push af
		inc sp
		call +
		inc sp
		xor a
		push af
		inc sp
		call A$_sms_manager$222
		inc sp
		ret
	
+:	
		ld hl, _RAM_C045_
		ld iy, $0002
		add iy, sp
		ld a, (iy+0)
		ld (hl), a
		ret
	
	; Data from 1042 to 1646 (1541 bytes)
	.incbin "data/File00_01042_01646.dat"
	
; Data from 1647 to 1711 (203 bytes)	
_DATA_1647_:	
	.db $00 $00 $15 $15 $2A $2A $15 $15 $2A $2A $2A $2A $3F $3F $3F $3F
	.db $12 $00 $AA $CF $00 $7F $20 $0F $E0 $80 $C0 $DF $DF $1F $00 $7F
	.db $7F $3F $0F $C0 $FF $FF $FF $E0 $AA $DF $00 $FF $20 $EF $FF $20
	.db $3F $FF $FF $02 $AA $DF $00 $FF $20 $EF $FF $20 $3F $FF $FF $02
	.db $AA $DF $00 $FF $20 $EF $FF $20 $3F $FF $FF $02 $AA $DF $00 $FF
	.db $20 $EF $FF $20 $3F $FF $FF $02 $AA $0F $04 $01 $00 $FC $00 $20
	.db $8F $02 $F8 $F8 $0F $00 $FE $FC $FC $04 $1F $03 $FF $FF $FF $22
	.db $FF $E0 $FF $C0 $00 $00 $00 $00 $A2 $FF $04 $00 $FF $03 $AA $F5
	.db $00 $3F $80 $F8 $E0 $80 $80 $00 $F0 $00 $20 $3F $7F $FF $FC $C0
	.db $80 $00 $88 $F7 $00 $FF $F8 $00 $FF $FF $FF $88 $F7 $00 $FF $F8
	.db $00 $FF $FF $FF $88 $F7 $00 $FF $F8 $00 $FF $FF $FF $88 $F7 $00
	.db $FF $F8 $00 $FF $FF $FF $AA $F0 $04 $F8 $02 $01 $00 $F8 $04 $00
	.db $06 $07 $F8 $00 $FC $FE $FF $FC $03 $01 $00
	
; Data from 1712 to 1ADF (974 bytes)	
_DATA_1712_:	
	.db $00 $02 $08 $0A $20 $22 $28 $2A $3F $03 $0C $0F $30 $33 $3C $3F
	.db $00 $00 $01 $00 $02 $00 $03 $00 $04 $00 $05 $00 $06 $00 $07 $00
	.db $08 $00 $09 $00 $0A $00 $0B $00 $0C $00 $0D $00 $0E $00 $0F $00
	.db $10 $00 $11 $00 $12 $00 $13 $00 $14 $00 $15 $00 $16 $00 $17 $00
	.db $18 $00 $19 $00 $1A $00 $1B $00 $1C $00 $1D $00 $1E $00 $1F $00
	.db $20 $00 $21 $00 $22 $00 $23 $00 $24 $00 $25 $00 $26 $00 $27 $00
	.db $28 $00 $29 $00 $2A $00 $2B $00 $2C $00 $2D $00 $2E $00 $2F $00
	.db $30 $00 $31 $00 $32 $00 $33 $00 $34 $00 $35 $00 $36 $00 $37 $00
	.db $38 $00 $39 $00 $3A $00 $3B $00 $3C $00 $3D $00 $3E $00 $3F $00
	.db $40 $00 $00 $AA $1A $18 $1C $1C $1C $00 $00 $00 $00 $00 $AA $1F
	.db $00 $36 $36 $24 $00 $00 $00 $AA $D6 $36 $7F $7F $00 $00 $00 $00
	.db $AA $54 $3E $08 $68 $0B $08 $00 $00 $00 $00 $EA $21 $52 $24 $08
	.db $12 $25 $42 $00 $00 $00 $00 $EA $18 $24 $34 $38 $4D $46 $3D $00
	.db $00 $00 $00 $AA $0F $00 $30 $30 $10 $20 $00 $00 $00 $AA $38 $30
	.db $0C $18 $18 $0C $00 $00 $00 $00 $AA $38 $06 $18 $0C $0C $18 $00
	.db $00 $00 $00 $AA $83 $00 $22 $14 $08 $14 $22 $00 $00 $00 $AA $6C
	.db $08 $00 $3E $00 $00 $00 $00 $00 $AA $F1 $00 $18 $18 $30 $00 $00
	.db $00 $AA $EF $00 $3E $00 $00 $00 $AA $F9 $00 $18 $18 $00 $00 $00
	.db $EA $01 $02 $04 $08 $10 $20 $40 $00 $00 $00 $00 $AA $38 $63 $1C
	.db $26 $32 $1C $00 $00 $00 $00 $AA $BC $0C $1C $3F $00 $00 $00 $00
	.db $EA $3E $63 $07 $1E $3C $70 $7F $00 $00 $00 $00 $EA $3F $06 $0C
	.db $1E $03 $63 $3E $00 $00 $00 $00 $EA $0E $1E $36 $66 $7F $06 $06
	.db $00 $00 $00 $00 $EA $7E $60 $7E $03 $03 $63 $3E $00 $00 $00 $00
	.db $EA $1E $30 $60 $7E $63 $63 $3E $00 $00 $00 $00 $AA $0E $18 $7F
	.db $63 $06 $0C $00 $00 $00 $00 $EA $3C $62 $72 $3C $4F $43 $3E $00
	.db $00 $00 $00 $EA $3E $63 $63 $3F $03 $06 $3C $00 $00 $00 $00 $AA
	.db $93 $00 $18 $18 $18 $18 $00 $00 $00 $AA $6C $18 $00 $00 $30 $00
	.db $00 $00 $00 $EA $06 $0C $18 $30 $18 $0C $06 $00 $00 $00 $00 $AA
	.db $D7 $00 $3E $3E $00 $00 $00 $EA $30 $18 $0C $06 $0C $18 $30 $00
	.db $00 $00 $00 $EA $3E $7F $63 $06 $1C $00 $1C $00 $00 $00 $00 $EA
	.db $1E $33 $67 $67 $60 $33 $1E $00 $00 $00 $00 $AA $36 $63 $1C $36
	.db $7F $00 $00 $00 $00 $AA $6C $63 $7E $7E $7E $00 $00 $00 $00 $AA
	.db $38 $60 $1E $33 $33 $1E $00 $00 $00 $00 $AA $38 $63 $7C $66 $66
	.db $7C $00 $00 $00 $00 $AA $6C $60 $7F $7E $7F $00 $00 $00 $00 $AA
	.db $6E $60 $7F $7E $00 $00 $00 $00 $EA $1F $30 $60 $67 $63 $33 $1F
	.db $00 $00 $00 $00 $AA $EE $63 $7F $00 $00 $00 $00 $AA $7C $0C $3F
	.db $3F $00 $00 $00 $00 $AA $F8 $03 $63 $3E $00 $00 $00 $00 $EA $63
	.db $66 $6C $78 $7C $6E $67 $00 $00 $00 $00 $AA $FC $60 $7F $00 $00
	.db $00 $00 $AA $86 $63 $77 $7F $7F $6B $00 $00 $00 $00 $EA $63 $73
	.db $7B $7F $6F $67 $63 $00 $00 $00 $00 $AA $7C $63 $3E $3E $00 $00
	.db $00 $00 $AA $70 $63 $7E $7E $60 $60 $00 $00 $00 $00 $AA $70 $63
	.db $3E $6F $66 $3D $00 $00 $00 $00 $EA $7E $63 $63 $67 $7C $6E $67
	.db $00 $00 $00 $00 $EA $3C $66 $60 $3E $03 $63 $3E $00 $00 $00 $00
	.db $AA $7E $0C $3F $00 $00 $00 $00 $AA $FC $63 $3E $00 $00 $00 $00
	.db $AA $E0 $63 $77 $3E $1C $08 $00 $00 $00 $00 $AA $C2 $63 $6B $7F
	.db $7F $77 $00 $00 $00 $00 $EA $63 $77 $3E $1C $3E $77 $63 $00 $00
	.db $00 $00 $AA $0E $0C $33 $33 $33 $1E $00 $00 $00 $00 $EA $7F $07
	.db $0E $1C $38 $70 $7F $00 $00 $00 $00 $AA $7C $18 $1E $1E $00 $00
	.db $00 $00 $EA $40 $20 $10 $08 $04 $02 $01 $00 $00 $00 $00 $AA $7C
	.db $0C $3C $3C $00 $00 $00 $00 $AA $1F $00 $08 $14 $2A $00 $00 $00
	.db $AA $FE $00 $7F $00 $00 $00 $CE $4B $D0 $3B $D1 $38 $CF $47 $08
	.db $02 $00 $C7 $49 $0A $02 $00 $09 $02 $00 $45 $D0 $3B $D1 $3B $D2
	.db $3A $D3 $39 $D4 $39 $C3 $55 $DF $3C $00 $C5 $4D $D0 $3B $CE $48
	.db $3B $C7 $44 $D5 $3A $CA $46 $3B $C5 $4D $DA $3A $09 $04 $00 $DB
	.db $3B $CA $46 $DD $3A $C0 $40 $DF $38 $00 $C5 $4D $D0 $3B $C0 $4A
	.db $3B $C7 $49 $3B $CE $48 $D5 $3B $C5 $4D $3B $C0 $4A $3B $C7 $49
	.db $DA $3B $CE $48 $3B $C0 $49 $3B $C0 $40 $DF $3B $00 $F1 $E1 $D1
	.db $D5 $E5 $F5 $18 $0A $21 $03 $00 $39 $5E $2B $6E $26 $00 $54 $7B
	.db $E6 $80 $B2 $20 $10 $06 $10 $ED $6A $17 $93 $30 $01 $83 $3F $ED
	.db $6A $10 $F6 $5F $C9 $06 $09 $7D $6C $26 $00 $CB $1D $ED $6A $ED
	.db $52 $30 $01 $19 $3F $17 $10 $F5 $CB $10 $50 $5F $EB $C9
	
_UNSAFE_SMS_copySpritestoSAT:	
		ld hl, $7F00
		rst $08	; _LABEL_8_
		ld c, Port_VDPData
		ld hl, _RAM_C063_
		call _OUTI64
		ld hl, $7F80
		rst $08	; _LABEL_8_
		ld c, Port_VDPData
		ld hl, _RAM_C0A3_
		jp _OUTI128
	
	; Data from 1AF8 to 1B4E (87 bytes)
	.db $FD $21 $02 $00 $FD $39 $FD $6E $00 $FD $7E $01 $CB $F7 $67 $CF
	.db $0E $BE $21 $04 $00 $39 $7E $23 $66 $6F $C3 $59 $01 $FD $21 $02
	.db $00 $FD $39 $FD $6E $00 $FD $7E $01 $CB $F7 $67 $CF $0E $BE $21
	.db $04 $00 $39 $7E $23 $66 $6F $C3 $19 $01 $FD $21 $02 $00 $FD $39
	.db $FD $6E $00 $FD $7E $01 $CB $F7 $67 $CF $0E $BE $21 $04 $00 $39
	.db $7E $23 $66 $6F $C3 $99 $00
	
_SMS_init:	
		ld hl, $0000
		push hl
		call _LABEL_1C71_
		pop af
		ld c, $00
-:	
		ld hl, _DATA_1BA3_
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
		call _LABEL_1D1E_
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
		ld hl, _RAM_C05E_
		ld (hl), $80
		ret
	
+:	
		ld hl, _RAM_C05E_
		ld (hl), $40
		ret
	
; Data from 1BA3 to 1BB5 (19 bytes)	
_DATA_1BA3_:	
	.db $04 $20 $FF $FF $FF $FF $FF $00 $00 $00 $FF $FD $21 $5E $C0 $FD
	.db $6E $00 $C9
	
_SMS_VDPturnOnFeature:	
		ld c, l
		ld e, h
		ld d, $00
		ld hl, _RAM_C1AA_
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
		ld hl, $C1AA
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
	
; Data from 1BE6 to 1BEF (10 bytes)	
_SMS_setBGScrollX:	
	.db $F3 $7D $D3 $BF $3E $88 $D3 $BF $FB $C9
	
_SMS_setBGScrollY:	
		di
		ld a, l
		out (Port_VDPAddress), a
		ld a, $89
		out (Port_VDPAddress), a
		ei
		ret
	
	; Data from 1BFA to 1C03 (10 bytes)
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
		ld hl, _RAM_C1AC_
		ld (hl), $10
		jr ++
	
+:	
		push bc
		ld hl, $0102
		call _SMS_VDPturnOffFeature
		pop bc
		ld hl, _RAM_C1AC_
		ld (hl), $08
++:	
		bit 1, c
		jr z, +
		ld hl, $0101
		call _SMS_VDPturnOnFeature
		ld hl, _RAM_C1AD_
		ld (hl), $10
		ld iy, _RAM_C1AC_
		sla (iy+0)
		ret
	
+:	
		ld hl, $0101
		call _SMS_VDPturnOffFeature
		ld hl, _RAM_C1AD_
		ld (hl), $08
		ret
	
	; Data from 1C5D to 1C70 (20 bytes)
	.db $21 $02 $00 $39 $4E $06 $00 $21 $00 $C0 $09 $CF $21 $03 $00 $39
	.db $7E $D3 $BE $C9
	
_LABEL_1C71_:	
		ld hl, $0002
		add hl, sp
		ld c, (hl)
		ld b, $00
		ld hl, $C010
		add hl, bc
		rst $08	; _LABEL_8_
		ld hl, $0003
		add hl, sp
		ld a, (hl)
		out (Port_VDPData), a
		ret
	
_SMS_loadBGPalette:	
		ld de, $C000
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
		ld de, $C010
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
	.db $7D $D3 $BE $C9
	
_SMS_initSprites:	
		ld hl, _RAM_C123_
		ld (hl), $00
		ret
	
	; Data from 1CB7 to 1D0B (85 bytes)
	.db $3A $23 $C1 $D6 $40 $30 $4B $FD $21 $03 $00 $FD $39 $FD $7E $00
	.db $D6 $D1 $28 $3E $3E $63 $21 $23 $C1 $86 $4F $3E $C0 $CE $00 $47
	.db $FD $5E $00 $1D $7B $02 $3A $23 $C1 $87 $4F $21 $A3 $C0 $06 $00
	.db $09 $FD $21 $02 $00 $FD $39 $FD $7E $00 $77 $23 $FD $21 $04 $00
	.db $FD $39 $FD $7E $00 $77 $FD $21 $23 $C1 $FD $4E $00 $FD $34 $00
	.db $69 $C9 $2E $FF $C9
	
_SMS_finalizeSprites:	
		ld a, (_RAM_C123_)
		sub $40
		ret nc
		ld bc, $C063
		ld hl, (_RAM_C123_)
		ld h, $00
		add hl, bc
		ld (hl), $D0
		ret
	
_LABEL_1D1E_:	
		ld hl, $7F00
		rst $08	; _LABEL_8_
		ld bc, _RAM_C063_
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
		ld bc, _RAM_C0A3_
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
		ld hl, _RAM_C05B_
		ld (hl), $00
-:	
		ld hl, _RAM_C05B_
		bit 0, (hl)
		jr z, -
		ret
	
_SMS_getKeysStatus:	
		ld hl, (_RAM_C05F_)
		ret
	
	; Data from 1D58 to 1DA8 (81 bytes)
	.db $FD $21 $61 $C0 $FD $7E $00 $2F $4F $FD $7E $01 $2F $47 $FD $21
	.db $5F $C0 $FD $7E $00 $A1 $6F $FD $7E $01 $A0 $67 $C9 $3A $5F $C0
	.db $FD $21 $61 $C0 $FD $A6 $00 $6F $3A $60 $C0 $FD $21 $61 $C0 $FD
	.db $A6 $01 $67 $C9 $FD $21 $5F $C0 $FD $7E $00 $2F $4F $FD $7E $01
	.db $2F $47 $79 $FD $21 $61 $C0 $FD $A6 $00 $6F $78 $FD $A6 $01 $67
	.db $C9
	
_SMS_queryPauseRequested:	
		ld iy, _RAM_C05D_
		ld l, (iy+0)
		ret
	
_SMS_resetPauseRequest:	
		ld hl, _RAM_C05D_
		ld (hl), $00
		ret
	
	; Data from 1DB7 to 1DDE (40 bytes)
	.db $21 $02 $00 $39 $7E $32 $24 $C1 $21 $03 $00 $39 $7E $32 $25 $C1
	.db $C9 $21 $02 $00 $39 $4E $F3 $79 $D3 $BF $3E $8A $D3 $BF $FB $C9
	.db $DB $7E $6F $C9 $DB $7F $6F $C9
	
_SMS_isr:	
		push af
		push hl
		in a, (Port_VDPStatus)
		ld (_RAM_C05C_), a
		rlca
		jr nc, +
		ld hl, _RAM_C05B_
		ld (hl), $01
		ld hl, (_RAM_C05F_)
		ld (_RAM_C061_), hl
		in a, (Port_IOPort1)
		cpl
		ld hl, _RAM_C05F_
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
		ld hl, (_RAM_C124_)
		call _LABEL_2020_
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
		ld hl, _RAM_C05D_
		ld (hl), $01
		pop iy
		pop hl
		pop de
		pop bc
		pop af
		retn
	
	; Data from 1E28 to 201F (504 bytes)
	.db $21 $03 $00 $39 $5E $2B $6E $CD $AE $1A $EB $C9 $F1 $E1 $D1 $D5
	.db $E5 $F5 $CD $B1 $1A $EB $C9 $DD $E5 $DD $21 $00 $00 $DD $39 $21
	.db $F0 $FF $39 $F9 $DD $36 $FE $00 $DD $36 $FF $00 $DD $36 $F3 $00
	.db $DD $36 $F4 $00 $DD $6E $05 $26 $00 $29 $29 $29 $29 $29 $29 $DD
	.db $75 $FC $7C $F6 $78 $DD $77 $FD $DD $7E $04 $DD $77 $FA $DD $36
	.db $FB $00 $DD $CB $FA $26 $DD $CB $FB $16 $DD $7E $FC $DD $B6 $FA
	.db $5F $DD $7E $FD $DD $B6 $FB $57 $DD $7E $08 $DD $77 $FA $DD $77
	.db $F1 $DD $36 $F0 $00 $6B $62 $CF $DD $6E $06 $DD $66 $07 $7E $DD
	.db $77 $F2 $23 $DD $75 $06 $DD $74 $07 $DD $7E $06 $DD $77 $FC $DD
	.db $7E $07 $DD $77 $FD $DD $7E $F2 $E6 $02 $DD $77 $F9 $DD $7E $F2
	.db $0F $0F $E6 $3F $DD $77 $F8 $DD $CB $F2 $46 $CA $78 $1F $DD $36
	.db $F6 $00 $DD $7E $FF $DD $77 $F7 $DD $4E $FC $DD $46 $FD $03 $DD
	.db $6E $FC $DD $66 $FD $6E $DD $7E $F8 $C6 $02 $DD $77 $F5 $26 $00
	.db $7D $DD $B6 $F6 $6F $7C $DD $B6 $F7 $67 $DD $7E $F9 $B7 $28 $3C
	.db $DD $71 $06 $DD $70 $07 $4D $44 $DD $6E $F5 $7D $B7 $CA $F1 $1F
	.db $E5 $69 $60 $DF $E1 $DD $35 $F1 $DD $7E $F1 $B7 $20 $15 $7B $C6
	.db $40 $5F $7A $CE $00 $57 $E5 $C5 $6B $62 $CF $C1 $E1 $DD $7E $FA
	.db $DD $77 $F1 $3E $01 $95 $30 $01 $03 $2D $18 $CF $DD $71 $06 $DD
	.db $70 $07 $DD $75 $FE $DD $74 $FF $DD $46 $F5 $78 $B7 $CA $01 $20
	.db $DD $6E $FE $DD $66 $FF $DF $DD $35 $F1 $DD $7E $F1 $B7 $20 $0D
	.db $21 $40 $00 $19 $5D $54 $CF $DD $7E $FA $DD $77 $F1 $05 $18 $DB
	.db $DD $7E $F9 $B7 $28 $29 $DD $CB $F2 $56 $28 $10 $DD $7E $FE $DD
	.db $77 $F3 $DD $7E $FF $DD $77 $F4 $DD $36 $F0 $01 $DD $4E $F2 $CB
	.db $39 $CB $39 $CB $39 $DD $71 $FF $DD $36 $FE $00 $C3 $A0 $1E $DD
	.db $6E $F8 $7D $B7 $28 $6D $DD $7E $FF $DD $77 $F6 $DD $36 $F7 $00
	.db $DD $4E $FC $DD $46 $FD $DD $75 $F5 $DD $7E $F5 $B7 $28 $34 $0A
	.db $D3 $BE $03 $00 $00 $00 $DD $7E $F6 $D3 $BE $DD $35 $F1 $DD $7E
	.db $F1 $B7 $20 $10 $21 $40 $00 $19 $EB $C5 $6B $62 $CF $C1 $DD $7E
	.db $FA $DD $77 $F1 $DD $35 $F5 $18 $D0 $DD $71 $FE $DD $70 $FF $18
	.db $08 $18 $06 $DD $71 $06 $DD $70 $07 $DD $CB $F0 $46 $CA $A0 $1E
	.db $DD $7E $F3 $DD $77 $FE $DD $7E $F4 $DD $77 $FF $DD $36 $F0 $00
	.db $C3 $A0 $1E $DD $F9 $DD $E1 $C9
	
_LABEL_2020_:	
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
		ld de, _RAM_C126_
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
		ld iy, _RAM_C126_
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
		ld hl, _RAM_C126_
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
	
; Data from 2103 to 216A (104 bytes)	
_DATA_2103_:	
	.db $00 $00 $00 $00 $4D $11 $52 $11 $57 $11 $5C $11 $61 $11 $66 $11
	.db $6B $11 $70 $11 $75 $11 $7A $11 $7F $11 $84 $11 $89 $80 $32 $81
	.db $70 $80 $9F $80 $18 $81 $8D $80 $87 $80 $67 $80 $67 $80 $9F $80
	.db $C7 $80 $7A $80 $10 $80 $10 $80 $10 $80 $10 $80 $10 $80 $10 $80
	.db $10 $80 $10 $80 $10 $80 $10 $80 $10 $80 $10 $80 $00 $80 $00 $80
	.db $00 $80 $00 $80 $00 $80 $00 $80 $00 $80 $00 $80 $00 $80 $00 $80
	.db $00 $80 $00 $80 $04 $20 $08 $08
	
gsinit:	
		ld bc, $0068
		ld a, b
		or c
		jr z, +
		ld de, _RAM_C146_
		ld hl, _DATA_2103_
		ldir
+:	
		ret
	
	; Data from 217B to 7FEF (24181 bytes)
	.dsb 24081, $00
	.db $56 $61 $6E $20 $48 $61 $6C $65 $6E $20 $52 $65 $63 $6F $72 $64
	.db $20 $43 $6F $76 $65 $72 $73 $20 $66 $6F $72 $20 $74 $68 $65 $20
	.db $53 $4D $53 $20 $50 $6F $77 $65 $72 $21 $20 $32 $30 $32 $31 $20
	.db $43 $6F $6D $70 $65 $74 $69 $74 $69 $6F $6E $00 $56 $61 $6E $20
	.db $48 $61 $6C $65 $6E $00 $53 $74 $65 $76 $65 $6E $20 $42 $6F $6C
	.db $61 $6E $64 $00 $53 $44 $53 $43 $01 $00 $27 $03 $21 $20 $D2 $7F
	.db $C8 $7F $8C $7F
	
.BANK 1 SLOT 1	
.ORG $0000	
	
	; Data from 7FF0 to 7FFF (16 bytes)
	.db $54 $4D $52 $20 $53 $45 $47 $41 $FF $FF $D5 $FF $99 $99 $00 $4C
	
.BANK 2	
.ORG $0000	
	
	; Data from 8000 to BFFF (16384 bytes)
	.incbin "data/File01_08000_0BFFF.dat"
	
.BANK 3	
.ORG $0000	
	
	; Data from C000 to FFFF (16384 bytes)
	.incbin "data/File02_0C000_0FFFF.dat"
	
.BANK 4	
.ORG $0000	
	
	; Data from 10000 to 13FFF (16384 bytes)
	.incbin "data/File03_10000_13FFF.dat"
	
.BANK 5	
.ORG $0000	
	
	; Data from 14000 to 17FFF (16384 bytes)
	.incbin "data/File04_14000_17FFF.dat"
	
.BANK 6	
.ORG $0000	
	
	; Data from 18000 to 1BFFF (16384 bytes)
	.incbin "data/File05_18000_1BFFF.dat"
	
.BANK 7	
.ORG $0000	
	
	; Data from 1C000 to 1FFFF (16384 bytes)
	.incbin "data/File06_1C000_1FFFF.dat"
	
.BANK 8	
.ORG $0000	
	
	; Data from 20000 to 23FFF (16384 bytes)
	.incbin "data/File07_20000_23FFF.dat"
	
.BANK 9	
.ORG $0000	
	
	; Data from 24000 to 27FFF (16384 bytes)
	.incbin "data/File08_24000_27FFF.dat"
	
.BANK 10	
.ORG $0000	
	
	; Data from 28000 to 2BFFF (16384 bytes)
	.incbin "data/File09_28000_2BFFF.dat"
	
.BANK 11	
.ORG $0000	
	
	; Data from 2C000 to 2FFFF (16384 bytes)
	.incbin "data/File10_2C000_2FFFF.dat"
	
.BANK 12	
.ORG $0000	
	
	; Data from 30000 to 33FFF (16384 bytes)
	.incbin "data/File11_30000_33FFF.dat"
	
.BANK 13	
.ORG $0000	
	
	; Data from 34000 to 37FFF (16384 bytes)
	.incbin "data/File12_34000_37FFF.dat"
	
.BANK 14	
.ORG $0000	
	
	; Data from 38000 to 3BFFF (16384 bytes)
	.incbin "data/File13_38000_3BFFF.dat"
	
.BANK 15	
.ORG $0000	
	
	; Data from 3C000 to 3FFFF (16384 bytes)
	.incbin "data/File14_3C000_3FFFF.dat"
