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
		jp _LABEL_1DA9_
	
A$_sms_manager$837:	
C$_sms_manager.c$142$1$119:	
C$_sms_manager.c$144$1$120:	
C$_sms_manager.c$145$1$120:	
G$devkit_SMS_resetPauseRequest$0:	
XG$devkit_SMS_resetPauseRequest$:	
_devkit_SMS_resetPauseRequest:
		jp _LABEL_1DB1_
	
	; Data from 994 to 99A (7 bytes)
	.db $3A $5C $C0 $E6 $20 $6F $C9
	
_LABEL_99B_:	
		jp _LABEL_1D54_
	
A$_sms_manager$887:	
		ld l, $00
		ret
	
A$_sms_manager$905:	
		ld hl, $0020
		ret
	
	; Data from 9A5 to A44 (160 bytes)
	.db $21 $00 $10 $C9 $21 $00 $08 $C9 $53 $74 $65 $76 $65 $6E $20 $42
	.db $6F $6C $61 $6E $64 $00 $56 $61 $6E $20 $48 $61 $6C $65 $6E $00
	.db $56 $61 $6E $20 $48 $61 $6C $65 $6E $20 $52 $65 $63 $6F $72 $64
	.db $20 $43 $6F $76 $65 $72 $73 $20 $66 $6F $72 $20 $74 $68 $65 $20
	.db $53 $4D $53 $20 $50 $6F $77 $65 $72 $21 $20 $32 $30 $32 $31 $20
	.db $43 $6F $6D $70 $65 $74 $69 $74 $69 $6F $6E $00 $C1 $E1 $E5 $C5
	.db $E5 $CD $F4 $02 $F1 $C9 $C1 $E1 $E5 $C5 $E5 $CD $27 $03 $F1 $C9
	.db $C3 $81 $02 $C3 $A8 $02 $C3 $36 $03 $21 $02 $00 $39 $7E $F5 $33
	.db $CD $4E $04 $33 $C9 $21 $04 $00 $39 $7E $F5 $33 $21 $03 $00 $39
	.db $4E $23 $46 $C5 $CD $07 $06 $F1 $33 $C9 $C3 $3D $05 $C3 $5A $06
	
A$_snd_manager$275:	
		jp _PSGSilenceChannels
	
A$_snd_manager$292:	
		jp _PSGRestoreVolumes
	
A$_snd_manager$309:	
		jp _PSGFrame
	
A$_snd_manager$326:	
		jp _PSGSFXFrame
	
	; Data from A51 to A59 (9 bytes)
	.db $2E $01 $C9 $2E $02 $C9 $2E $03 $C9
	
A$asm_manager$59:	
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
	
	; Data from A70 to AA1 (50 bytes)
	.db $21 $5C $1A $E5 $CD $8B $0A $F1 $C9 $21 $7C $1A $E5 $CD $8B $0A
	.db $F1 $C9 $21 $39 $1A $E5 $CD $8B $0A $F1 $C9 $CD $42 $0A $7D $B7
	.db $C0 $CD $51 $0A $65 $D1 $C1 $C5 $D5 $E5 $33 $C5 $CD $2A $0A $F1
	.db $33 $C9
	
A$content_manager$65:	
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
	
	; Data from AB8 to B50 (153 bytes)
	.db $3E $02 $F5 $33 $CD $31 $08 $33 $21 $40 $00 $E5 $21 $57 $80 $E5
	.db $CD $8E $08 $F1 $F1 $01 $10 $80 $C5 $21 $00 $00 $E5 $CD $A4 $08
	.db $F1 $F1 $01 $00 $80 $C5 $CD $C5 $08 $F1 $C9 $3E $03 $F5 $33 $CD
	.db $31 $08 $33 $21 $40 $00 $E5 $21 $77 $80 $E5 $CD $8E $08 $F1 $F1
	.db $01 $10 $80 $C5 $21 $00 $00 $E5 $CD $A4 $08 $F1 $F1 $01 $00 $80
	.db $C5 $CD $C5 $08 $F1 $21 $03 $03 $E5 $2E $0F $E5 $CD $D3 $08 $F1
	.db $F1 $C9 $3E $03 $F5 $33 $CD $31 $08 $33 $21 $40 $00 $E5 $21 $45
	.db $93 $E5 $CD $8E $08 $F1 $F1 $01 $E8 $92 $C5 $21 $00 $00 $E5 $CD
	.db $A4 $08 $F1 $F1 $01 $D8 $92 $C5 $CD $C5 $08 $F1 $21 $03 $03 $E5
	.db $2E $0F $E5 $CD $D3 $08 $F1 $F1 $C9
	
A$content_manager$263:	
		ld hl, $0120
		push hl
		ld hl, $1657
		push hl
		call A$_sms_manager$400
		pop af
		pop af
		ld bc, _DATA_1647_
		push bc
		call A$_sms_manager$493
		pop af
		ret
	
	; Data from B67 to EC5 (863 bytes)
	.db $01 $26 $C0 $AF $02 $21 $27 $C0 $36 $00 $C5 $3E $03 $F5 $33 $21
	.db $05 $00 $39 $7E $F5 $33 $CD $A7 $1A $F1 $7D $C1 $02 $3E $03 $F5
	.db $33 $21 $03 $00 $39 $7E $F5 $33 $CD $28 $1E $F1 $4D $21 $27 $C0
	.db $71 $C3 $88 $0D $DD $E5 $DD $21 $00 $00 $DD $39 $F5 $F5 $DD $36
	.db $FD $00 $3E $4A $DD $86 $FD $DD $77 $FE $3E $11 $CE $00 $DD $77
	.db $FF $0E $00 $69 $29 $09 $7D $DD $86 $FD $5F $21 $46 $11 $06 $00
	.db $09 $46 $DD $6E $FE $DD $66 $FF $7E $DD $77 $FC $26 $00 $6B $29
	.db $11 $4A $C1 $19 $5E $23 $56 $DD $7E $FC $DD $86 $04 $C5 $F5 $33
	.db $C5 $33 $D5 $CD $E9 $0D $F1 $F1 $C1 $0C $79 $D6 $04 $38 $C4 $DD
	.db $34 $FD $DD $7E $FD $D6 $03 $38 $A9 $DD $F9 $DD $E1 $C9 $3A $26
	.db $C0 $4F $87 $81 $4F $21 $26 $C0 $23 $6E $09 $C9 $DD $E5 $DD $21
	.db $00 $00 $DD $39 $F5 $F5 $21 $26 $C0 $23 $23 $4E $21 $26 $C0 $23
	.db $23 $23 $46 $C5 $21 $20 $01 $E5 $C5 $CD $64 $09 $F1 $F1 $C1 $79
	.db $C6 $28 $5F $C5 $D5 $21 $25 $01 $E5 $C5 $33 $7B $F5 $33 $CD $64
	.db $09 $F1 $F1 $D1 $C1 $78 $C6 $10 $57 $C5 $D5 $21 $2C $01 $E5 $59
	.db $D5 $CD $64 $09 $F1 $F1 $D1 $D5 $21 $31 $01 $E5 $D5 $CD $64 $09
	.db $F1 $F1 $D1 $C1 $79 $C6 $08 $DD $77 $FC $C5 $D5 $21 $21 $01 $E5
	.db $C5 $33 $DD $7E $FC $F5 $33 $CD $64 $09 $F1 $F1 $D1 $C1 $79 $C6
	.db $10 $DD $77 $FF $C5 $D5 $21 $22 $01 $E5 $C5 $33 $DD $7E $FF $F5
	.db $33 $CD $64 $09 $F1 $F1 $D1 $C1 $79 $C6 $18 $DD $77 $FE $C5 $D5
	.db $21 $23 $01 $E5 $C5 $33 $DD $7E $FE $F5 $33 $CD $64 $09 $F1 $F1
	.db $D1 $C1 $79 $C6 $20 $DD $77 $FD $C5 $D5 $21 $24 $01 $E5 $C5 $33
	.db $DD $7E $FD $F5 $33 $CD $64 $09 $F1 $F1 $D1 $C1 $78 $C6 $08 $47
	.db $C5 $D5 $21 $26 $01 $E5 $C5 $CD $64 $09 $F1 $F1 $D1 $C1 $D5 $21
	.db $2B $01 $E5 $C5 $33 $7B $F5 $33 $CD $64 $09 $F1 $F1 $D1 $D5 $21
	.db $2D $01 $E5 $D5 $33 $DD $7E $FC $F5 $33 $CD $64 $09 $F1 $F1 $D1
	.db $D5 $21 $2E $01 $E5 $D5 $33 $DD $7E $FF $F5 $33 $CD $64 $09 $F1
	.db $F1 $D1 $D5 $21 $2F $01 $E5 $D5 $33 $DD $7E $FE $F5 $33 $CD $64
	.db $09 $F1 $F1 $D1 $21 $30 $01 $E5 $D5 $33 $DD $7E $FD $F5 $33 $CD
	.db $64 $09 $DD $F9 $DD $E1 $C9 $01 $26 $C0 $0A $B7 $20 $06 $3E $03
	.db $02 $C3 $88 $0D $C6 $FF $02 $C3 $88 $0D $01 $26 $C0 $0A $FE $03
	.db $20 $05 $AF $02 $C3 $88 $0D $3C $02 $C3 $88 $0D $01 $27 $C0 $0A
	.db $B7 $20 $06 $3E $02 $02 $C3 $88 $0D $C6 $FF $02 $C3 $88 $0D $01
	.db $27 $C0 $0A $FE $02 $20 $05 $AF $02 $C3 $88 $0D $3C $02 $C3 $88
	.db $0D $01 $46 $11 $21 $26 $C0 $6E $26 $00 $09 $4E $11 $4A $11 $21
	.db $26 $C0 $23 $6E $26 $00 $19 $5E $0D $79 $07 $07 $07 $E6 $F8 $57
	.db $21 $28 $C0 $72 $01 $29 $C0 $1D $7B $07 $07 $07 $E6 $F8 $5F $02
	.db $14 $72 $1D $7B $02 $C9 $DD $E5 $DD $21 $00 $00 $DD $39 $DD $7E
	.db $04 $C6 $E0 $4F $C5 $DD $66 $06 $DD $6E $05 $E5 $CD $23 $09 $F1
	.db $C1 $21 $22 $17 $6E $26 $00 $06 $00 $09 $E5 $CD $4C $09 $F1 $DD
	.db $E1 $C9 $DD $E5 $DD $21 $00 $00 $DD $39 $3B $DD $4E $06 $DD $36
	.db $FF $00 $DD $7E $04 $DD $86 $FF $5F $DD $7E $05 $CE $00 $57 $1A
	.db $B7 $28 $2D $C6 $E0 $47 $51 $0C $DD $71 $06 $C5 $DD $7E $07 $F5
	.db $33 $D5 $33 $CD $23 $09 $F1 $C1 $21 $22 $17 $5E $16 $00 $78 $6F
	.db $17 $9F $67 $19 $C5 $E5 $CD $4C $09 $F1 $C1 $DD $34 $FF $18 $C2
	.db $33 $DD $E1 $C9 $DD $E5 $DD $21 $00 $00 $DD $39 $F5 $DD $7E $06
	.db $DD $77 $FF $DD $36 $FE $00 $21 $0A $00 $E5 $DD $6E $04 $DD $66
	.db $05 $E5 $CD $9F $1A $F1 $F1 $5D $54 $E5 $D5 $01 $0A $00 $C5 $DD
	.db $4E $04 $DD $46 $05 $C5 $CD $34 $1E $F1 $F1 $45 $D1 $E1 $DD $75
	.db $04 $DD $74 $05 $78 $C6 $10 $4F $7A $B3 $20 $0B $B0 $20 $08 $DD
	.db $7E $FE $B7 $28 $02 $0E $00 $DD $46 $FF $DD $35 $FF $DD $7E $FF
	.db $DD $77 $06 $C5 $DD $7E $07 $F5 $33 $C5 $33 $CD $23 $09 $F1 $C1
	.db $21 $22 $17 $6E $26 $00 $79 $17 $9F $47 $09 $E5 $CD $4C $09 $F1
	.db $DD $34 $FE $DD $7E $FE $D6 $05 $38 $8D $DD $F9 $DD $E1 $C9
	
A$input_manager$64:	
		ld hl, (_RAM_C146_)
		ld (_RAM_C148_), hl
		call _LABEL_99B_
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
		call _LABEL_1DB1_
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
	
_LABEL_1D54_:	
		ld hl, (_RAM_C05F_)
		ret
	
	; Data from 1D58 to 1DA8 (81 bytes)
	.db $FD $21 $61 $C0 $FD $7E $00 $2F $4F $FD $7E $01 $2F $47 $FD $21
	.db $5F $C0 $FD $7E $00 $A1 $6F $FD $7E $01 $A0 $67 $C9 $3A $5F $C0
	.db $FD $21 $61 $C0 $FD $A6 $00 $6F $3A $60 $C0 $FD $21 $61 $C0 $FD
	.db $A6 $01 $67 $C9 $FD $21 $5F $C0 $FD $7E $00 $2F $4F $FD $7E $01
	.db $2F $47 $79 $FD $21 $61 $C0 $FD $A6 $00 $6F $78 $FD $A6 $01 $67
	.db $C9
	
_LABEL_1DA9_:	
		ld iy, _RAM_C05D_
		ld l, (iy+0)
		ret
	
_LABEL_1DB1_:	
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
