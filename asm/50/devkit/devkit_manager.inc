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
		jp $1C04

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
		call $1C5D
		pop af
		ret
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
		call $1C71
		pop af
		ret
	
_devkit_SMS_setNextTileatXY:	
	push ix
	ld ix, $0000
	add ix, sp
	ld l, (ix + $05)
	ld h, $00
	
A$_sms_manager$615:	
	add hl, hl
	
A$_sms_manager$616:	
	add hl, hl
	
; Data from 932 to 932 (1 bytes)	
A$_sms_manager$617:	
	add hl, hl
	
; Data from 933 to 933 (1 bytes)	
A$_sms_manager$618:	
	add hl, hl
	
; Data from 934 to 934 (1 bytes)	
A$_sms_manager$619:	
	add hl, hl
	
; Data from 935 to 935 (1 bytes)	
A$_sms_manager$620:	
	add hl, hl
	
; Data from 936 to 936 (1 bytes)	
A$_sms_manager$621:	
	ld c, l
	
; Data from 937 to 937 (1 bytes)	
A$_sms_manager$622:	
	ld a, h
	
; Data from 938 to 939 (2 bytes)	
A$_sms_manager$623:	
	or $78
	
; Data from 93A to 93A (1 bytes)	
A$_sms_manager$624:	
	ld b, a
	
; Data from 93B to 93D (3 bytes)	
A$_sms_manager$625:	
	;.db $DD $6E $04
	ld l, (ix + $04)
	
; Data from 93E to 93F (2 bytes)	
A$_sms_manager$626:	
	ld h, $00
	
; Data from 940 to 940 (1 bytes)	
A$_sms_manager$627:	
	add hl, hl
	
; Data from 941 to 941 (1 bytes)	
A$_sms_manager$628:	
	.db $7D
	
; Data from 942 to 942 (1 bytes)	
A$_sms_manager$629:	
	or c
	
; Data from 943 to 943 (1 bytes)	
A$_sms_manager$630:	
	ld l, a
	
; Data from 944 to 944 (1 bytes)	
A$_sms_manager$631:	
	ld a, h
	
; Data from 945 to 945 (1 bytes)	
A$_sms_manager$632:	
	or b
	
; Data from 946 to 946 (1 bytes)	
A$_sms_manager$633:	
	ld h, a
	
; Data from 947 to 948 (2 bytes)	
A$_sms_manager$638:	
C$_sms_manager.c$103$1$107:	
XG$devkit_SMS_setNextTileatXY$0$:	
	pop ix
	
; Data from 949 to 94B (3 bytes)	
A$_sms_manager$639:	
	;.db $C3 $06 $00
	jp $0006
	
; Data from 94C to 94C (1 bytes)	
A$_sms_manager$652:	
C$_sms_manager.c$104$1$107:	
C$_sms_manager.c$106$1$109:	
G$devkit_SMS_setTile$0$0:	
_devkit_SMS_setTile:	
	pop bc
	
; Data from 94D to 94D (1 bytes)	
A$_sms_manager$653:	
	pop hl
	
; Data from 94E to 94E (1 bytes)	
A$_sms_manager$654:	
	push hl
	
; Data from 94F to 94F (1 bytes)	
A$_sms_manager$655:	
	push bc
	
; Data from 950 to 952 (3 bytes)	
A$_sms_manager$660:	
C$_sms_manager.c$107$1$109:	
XG$devkit_SMS_setTile$0$0:	
	;.db $C3 $11 $00
	jp $0011
	
; Data from 953 to 956 (4 bytes)	
A$_sms_manager$673:	
C$_sms_manager.c$108$1$109:	
C$_sms_manager.c$110$1$111:	
G$devkit_SMS_setTilePriority$0$0:	
_devkit_SMS_setTilePriority:	
	;.db $FD $21 $02 $00
	ld iy, $0002
	
; Data from 957 to 958 (2 bytes)	
A$_sms_manager$674:	
	add iy, sp
	
; Data from 959 to 95B (3 bytes)	
A$_sms_manager$675:	
	;.db $FD $6E $00
	ld l, (iy + $00)
	
; Data from 95C to 95D (2 bytes)	
A$_sms_manager$676:	
	ld a, $00
	
; Data from 95E to 95F (2 bytes)	
A$_sms_manager$677:	
	or $18
	
; Data from 960 to 960 (1 bytes)	
A$_sms_manager$678:	
	ld h, a
	
; Data from 961 to 963 (3 bytes)	
A$_sms_manager$683:	
C$_sms_manager.c$111$1$111:	
XG$devkit_SMS_setTilePriority$0$:	
	;.db $C3 $11 $00
	jp $0011
	
; Data from 964 to 966 (3 bytes)	
A$_sms_manager$696:	
C$_sms_manager.c$113$1$111:	
C$_sms_manager.c$115$1$113:	
G$devkit_SMS_addSprite$0$0:	
_devkit_SMS_addSprite:	
	.db $21 $04 $00
	
; Data from 967 to 967 (1 bytes)	
A$_sms_manager$697:	
	add hl, sp
	
; Data from 968 to 968 (1 bytes)	
A$_sms_manager$698:	
	ld b, (hl)
	
; Data from 969 to 969 (1 bytes)	
A$_sms_manager$699:	
	push bc
	
; Data from 96A to 96A (1 bytes)	
A$_sms_manager$700:	
	inc sp
	
; Data from 96B to 96D (3 bytes)	
A$_sms_manager$701:	
	.db $21 $04 $00
	
; Data from 96E to 96E (1 bytes)	
A$_sms_manager$702:	
	add hl, sp
	
; Data from 96F to 96F (1 bytes)	
A$_sms_manager$703:	
	ld a, (hl)
	
; Data from 970 to 970 (1 bytes)	
A$_sms_manager$704:	
	push af
	
; Data from 971 to 971 (1 bytes)	
A$_sms_manager$705:	
	inc sp
	
; Data from 972 to 974 (3 bytes)	
A$_sms_manager$706:	
	.db $21 $04 $00
	
; Data from 975 to 975 (1 bytes)	
A$_sms_manager$707:	
	add hl, sp
	
; Data from 976 to 976 (1 bytes)	
A$_sms_manager$708:	
	ld a, (hl)
	
; Data from 977 to 977 (1 bytes)	
A$_sms_manager$709:	
	push af
	
; Data from 978 to 978 (1 bytes)	
A$_sms_manager$710:	
	inc sp
	
; Data from 979 to 97B (3 bytes)	
A$_sms_manager$711:	
	.db $CD $B7 $1C
	
; Data from 97C to 97C (1 bytes)	
A$_sms_manager$712:	
	pop af
	
; Data from 97D to 97D (1 bytes)	
A$_sms_manager$713:	
	inc sp
	
; Data from 97E to 97E (1 bytes)	
A$_sms_manager$718:	
C$_sms_manager.c$116$1$113:	
XG$devkit_SMS_addSprite$0$0:	
	ret
	
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
	and $20
	
; Data from 999 to 999 (1 bytes)	
A$_sms_manager$852:	
	ld l, a
	
; Data from 99A to 99A (1 bytes)	
A$_sms_manager$857:	
C$_sms_manager.c$151$1$121:	
XG$devkit_isCollisionDetected$0$:	
	ret
	
A$_sms_manager$874:	
C$_sms_manager.c$154$1$121:	
C$_sms_manager.c$156$1$122:	
C$_sms_manager.c$157$1$122:	
G$devkit_SMS_getKeysStatus$0$0:	
XG$devkit_SMS_getKeysStatus$0$0:	
_devkit_SMS_getKeysStatus:
		jp _SMS_getKeysStatus

_devkit_SPRITEMODE_NORMAL:	
		ld l, $00
		ret

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
	ret
	
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
	ret
	
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
	pop bc
	
; Data from A02 to A02 (1 bytes)	
A$_snd_manager$84:	
	pop hl
	
; Data from A03 to A03 (1 bytes)	
A$_snd_manager$85:	
	push hl
	
; Data from A04 to A04 (1 bytes)	
A$_snd_manager$86:	
	push bc
	
; Data from A05 to A05 (1 bytes)	
A$_snd_manager$87:	
	push hl
	
; Data from A06 to A08 (3 bytes)	
A$_snd_manager$88:	
	.db $CD $F4 $02
	
; Data from A09 to A09 (1 bytes)	
A$_snd_manager$89:	
	pop af
	
; Data from A0A to A0A (1 bytes)	
A$_snd_manager$94:	
C$_snd_manager.c$12$1$31:	
XG$devkit_PSGPlay$0$0:	
	ret
	
; Data from A0B to A0B (1 bytes)	
A$_snd_manager$107:	
C$_snd_manager.c$13$1$31:	
C$_snd_manager.c$15$1$33:	
G$devkit_PSGPlayNoRepeat$0$0:	
_devkit_PSGPlayNoRepeat:	
	pop bc
	
; Data from A0C to A0C (1 bytes)	
A$_snd_manager$108:	
	pop hl
	
; Data from A0D to A0D (1 bytes)	
A$_snd_manager$109:	
	push hl
	
; Data from A0E to A0E (1 bytes)	
A$_snd_manager$110:	
	push bc
	
; Data from A0F to A0F (1 bytes)	
A$_snd_manager$111:	
	push hl
	
; Data from A10 to A12 (3 bytes)	
A$_snd_manager$112:	
	.db $CD $27 $03
	
; Data from A13 to A13 (1 bytes)	
A$_snd_manager$113:	
	pop af
	
; Data from A14 to A14 (1 bytes)	
A$_snd_manager$118:	
C$_snd_manager.c$16$1$33:	
XG$devkit_PSGPlayNoRepeat$0$0:	
	ret
	
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

; Data from A51 to A52 (2 bytes)	
_devkit_SFX_CHANNEL2:	
	;.db $2E $01
	;ret
	ld l, $01
	ret
	
; Data from A54 to A55 (2 bytes)	
_devkit_SFX_CHANNEL3:	
	;.db $2E $02
	;ret
	ld l, $02
	ret
	
; Data from A57 to A58 (2 bytes)	
_devkit_SFX_CHANNELS2AND3:	
	;.db $2E $03
	;ret
	ld l, $03
	ret