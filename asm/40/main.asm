; .sdsctag 1.0,"Van Halen","Van Halen Record Covers for the SMS Power! 2021 Competition","StevePro Studios"

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
		call _main
		jp _exit

.include "content/out.inc"

; Data from 200 to 203 (4 bytes)	
__clock:
	.db $3E $02 $CF $C9

_exit:
		ld a, $00
		rst $08	; _LABEL_8_
-:
		halt
		jr -
	
_main:
		call _engine_asm_manager_clear_VRAM
		call _devkit_SMS_init
		call _devkit_SMS_displayOff
		call _devkit_SPRITEMODE_NORMAL
		ld b, l
		push bc
		inc sp
		call _devkit_SMS_setSpriteMode
		inc sp
		call _devkit_SMS_useFirstHalfTilesfor
		call _devkit_VDPFEATURE_HIDEFIRSTCOL
		push hl
		call _devkit_SMS_VDPturnOnFeature
		pop af
		call _engine_content_manager_load_til
		call _engine_content_manager_load_spr
		call _engine_scroll_manager_reset
		ld a, $01			; screen_type_splash
		push af
		inc sp
		call _engine_screen_manager_init
		inc sp
		call _devkit_SMS_displayOn
infinite_loop:
		call _devkit_SMS_queryPauseRequested
		ld a, l
		or a
		jr z, global_pause
		call _devkit_SMS_resetPauseRequest
		ld iy, Lmain.main$global_pause$1$55	; Lmain.main$global_pause$1$55 = $C000
		ld a, (iy+0)
		xor $01
		ld (iy+0), a
		bit 0, (iy+0)
		jr z, else_clause
		call _devkit_PSGSilenceChannels
		jr global_pause

else_clause:
		call _devkit_PSGRestoreVolumes
global_pause:
		ld hl, Lmain.main$global_pause$1$55	; Lmain.main$global_pause$1$55 = $C000
		bit 0, (hl)
		jr nz, infinite_loop
		call _devkit_SMS_initSprites
		call _engine_input_manager_update
		call _engine_screen_manager_update
		call _devkit_SMS_finalizeSprites
		call _devkit_SMS_waitForVBlank
		call _devkit_SMS_copySpritestoSAT
		call _devkit_PSGFrame
		call _devkit_PSGSFXFrame
		jr infinite_loop
	
; devkit
.include "devkit/psg_manager.inc"
.include "devkit/devkit_manager.inc"


; engine
.include "engine/asm_manager.inc"
.include "engine/audio_manager.inc"
.include "engine/content_manager.inc"
.include "engine/cursor_manager.inc"
.include "engine/font_manager.inc"
.include "engine/input_manager.inc"
.include "engine/record_manager.inc"
.include "engine/screen_manager.inc"
.include "engine/scroll_manager.inc"
.include "engine/storage_manager.inc"
.include "engine/timer_manager.inc"


; object
.include "object/cursor_object.inc"
.include "object/record_object.inc"


; screen
.include "screen/none_screen.inc"
.include "screen/splash_screen.inc"
.include "screen/title_screen.inc"
.include "screen/scroll_screen.inc"
.include "screen/select_screen.inc"
.include "screen/record_screen.inc"




	

	
; Data from 156F to 156F (1 bytes)	
A$detail_screen$60:
C$detail_screen.c$12$0$0:
C$detail_screen.c$15$0$0:
G$screen_detail_screen_load$0$0:
XG$screen_detail_screen_load$0$0:
_screen_detail_screen_load:
	.db $C9
	
; Data from 1570 to 1570 (1 bytes)	
A$detail_screen$73:
C$detail_screen.c$17$0$0:
C$detail_screen.c$19$1$25:
G$screen_detail_screen_update$0$:
_screen_detail_screen_update:
	.db $C1
	
; Data from 1571 to 1571 (1 bytes)	
A$detail_screen$74:
	.db $E1
	
; Data from 1572 to 1572 (1 bytes)	
A$detail_screen$75:
	.db $E5
	
; Data from 1573 to 1573 (1 bytes)	
A$detail_screen$76:
	.db $C5
	
; Data from 1574 to 1575 (2 bytes)	
A$detail_screen$77:
	.db $36 $06
	
; Data from 1576 to 1576 (1 bytes)	
A$detail_screen$82:
C$detail_screen.c$20$1$25:
XG$screen_detail_screen_update$0:
	.db $C9
	
; Data from 1577 to 1579 (3 bytes)	
A$test_screen$65:
C$test_screen.c$13$0$0:
C$test_screen.c$15$1$23:
G$screen_test_screen_load$0$0:
_screen_test_screen_load:
	.db $CD $2B $08
	
; Data from 157A to 157C (3 bytes)	
A$test_screen$69:
C$test_screen.c$16$1$23:
	.db $CD $E3 $0A
	
; Data from 157D to 157F (3 bytes)	
A$test_screen$73:
C$test_screen.c$17$1$23:
	.db $21 $0A $15
	
; Data from 1580 to 1580 (1 bytes)	
A$test_screen$74:
	.db $E5
	
; Data from 1581 to 1583 (3 bytes)	
A$test_screen$75:
	.db $21 $93 $15
	
; Data from 1584 to 1584 (1 bytes)	
A$test_screen$76:
	.db $E5
	
; Data from 1585 to 1587 (3 bytes)	
A$test_screen$77:
	.db $CD $E9 $0D
	
; Data from 1588 to 1588 (1 bytes)	
A$test_screen$78:
	.db $F1
	
; Data from 1589 to 1589 (1 bytes)	
A$test_screen$79:
	.db $F1
	
; Data from 158A to 158C (3 bytes)	
A$test_screen$83:
C$test_screen.c$18$1$23:
	.db $CD $25 $08
	
; Data from 158D to 158F (3 bytes)	
A$test_screen$87:
C$test_screen.c$20$1$23:
	.db $21 $5A $C0
	
; Data from 1590 to 1591 (2 bytes)	
A$test_screen$88:
	.db $36 $00
	
; Data from 1592 to 1592 (1 bytes)	
A$test_screen$93:
C$test_screen.c$21$1$23:
XG$screen_test_screen_load$0$0:
	.db $C9
	
; Data from 1593 to 159E (12 bytes)	
Ftest_screen$__str_0$0$0:
	.db $50 $52 $45 $53 $53 $20 $53 $54 $41 $52 $54 $00
	
; Data from 159F to 15A0 (2 bytes)	
A$test_screen$110:
C$test_screen.c$23$1$23:
C$test_screen.c$28$1$25:
G$screen_test_screen_update$0$0:
_screen_test_screen_update:
	.db $3E $02
	
; Data from 15A1 to 15A1 (1 bytes)	
A$test_screen$111:
	.db $F5
	
; Data from 15A2 to 15A2 (1 bytes)	
A$test_screen$112:
	.db $33
	
; Data from 15A3 to 15A5 (3 bytes)	
A$test_screen$113:
	.db $CD $00 $0F
	
; Data from 15A6 to 15A6 (1 bytes)	
A$test_screen$114:
	.db $33
	
; Data from 15A7 to 15A7 (1 bytes)	
A$test_screen$118:
C$test_screen.c$29$1$25:
	.db $7D
	
; Data from 15A8 to 15A8 (1 bytes)	
A$test_screen$119:
	.db $B7
	
; Data from 15A9 to 15AA (2 bytes)	
A$test_screen$120:
	.db $28 $0D
	
; Data from 15AB to 15AD (3 bytes)	
A$test_screen$124:
C$test_screen.c$32$2$26:
	.db $3A $5A $C0
	
; Data from 15AE to 15AE (1 bytes)	
A$test_screen$125:
	.db $F5
	
; Data from 15AF to 15AF (1 bytes)	
A$test_screen$126:
	.db $33
	
; Data from 15B0 to 15B2 (3 bytes)	
A$test_screen$127:
	.db $CD $46 $08
	
; Data from 15B3 to 15B3 (1 bytes)	
A$test_screen$128:
	.db $33
	
; Data from 15B4 to 15B6 (3 bytes)	
A$test_screen$132:
C$test_screen.c$34$2$26:
	.db $21 $5A $C0
	
; Data from 15B7 to 15B7 (1 bytes)	
A$test_screen$133:
	.db $34
	
; Data from 15B8 to 15B8 (1 bytes)	
A$test_screen$138:
C$test_screen.c$38$1$25:
	.db $C1
	
; Data from 15B9 to 15B9 (1 bytes)	
A$test_screen$139:
	.db $E1
	
; Data from 15BA to 15BA (1 bytes)	
A$test_screen$140:
	.db $E5
	
; Data from 15BB to 15BB (1 bytes)	
A$test_screen$141:
	.db $C5
	
; Data from 15BC to 15BD (2 bytes)	
A$test_screen$142:
	.db $36 $07
	
; Data from 15BE to 15BE (1 bytes)	
A$test_screen$147:
C$test_screen.c$39$1$25:
XG$screen_test_screen_update$0$0:
	.db $C9
	
; Data from 15BF to 15C1 (3 bytes)	
A$func_screen$62:
C$func_screen.c$15$0$0:
C$func_screen.c$17$1$23:
G$screen_func_screen_load$0$0:
_screen_func_screen_load:
	.db $CD $2B $08
	
; Data from 15C2 to 15C4 (3 bytes)	
A$func_screen$66:
C$func_screen.c$18$1$23:
	.db $CD $A2 $0A
	
; Data from 15C5 to 15C7 (3 bytes)	
A$func_screen$70:
C$func_screen.c$19$1$23:
	.db $CD $E3 $0A
	
; Data from 15C8 to 15CA (3 bytes)	
A$func_screen$74:
C$func_screen.c$20$1$23:
	.db $CD $51 $0B
	
; Data from 15CB to 15CD (3 bytes)	
A$func_screen$78:
C$func_screen.c$21$1$23:
	.db $21 $06 $0C
	
; Data from 15CE to 15CE (1 bytes)	
A$func_screen$79:
	.db $E5
	
; Data from 15CF to 15D1 (3 bytes)	
A$func_screen$80:
	.db $21 $23 $16
	
; Data from 15D2 to 15D2 (1 bytes)	
A$func_screen$81:
	.db $E5
	
; Data from 15D3 to 15D5 (3 bytes)	
A$func_screen$82:
	.db $CD $E9 $0D
	
; Data from 15D6 to 15D6 (1 bytes)	
A$func_screen$83:
	.db $F1
	
; Data from 15D7 to 15D9 (3 bytes)	
A$func_screen$87:
C$func_screen.c$22$1$23:
	.db $21 $14 $0C
	
; Data from 15DA to 15DA (1 bytes)	
A$func_screen$88:
	.db $E3
	
; Data from 15DB to 15DD (3 bytes)	
A$func_screen$89:
	.db $21 $2A $16
	
; Data from 15DE to 15DE (1 bytes)	
A$func_screen$90:
	.db $E5
	
; Data from 15DF to 15E1 (3 bytes)	
A$func_screen$91:
	.db $CD $E9 $0D
	
; Data from 15E2 to 15E2 (1 bytes)	
A$func_screen$92:
	.db $F1
	
; Data from 15E3 to 15E3 (1 bytes)	
A$func_screen$93:
	.db $F1
	
; Data from 15E4 to 15E6 (3 bytes)	
A$func_screen$97:
C$func_screen.c$24$1$23:
	.db $21 $22 $16
	
; Data from 15E7 to 15E7 (1 bytes)	
A$func_screen$98:
	.db $56
	
; Data from 15E8 to 15EA (3 bytes)	
A$func_screen$99:
	.db $21 $21 $16
	
; Data from 15EB to 15EB (1 bytes)	
A$func_screen$100:
	.db $5E
	
; Data from 15EC to 15EC (1 bytes)	
A$func_screen$101:
	.db $D5
	
; Data from 15ED to 15EF (3 bytes)	
A$func_screen$102:
	.db $21 $31 $16
	
; Data from 15F0 to 15F0 (1 bytes)	
A$func_screen$103:
	.db $E5
	
; Data from 15F1 to 15F3 (3 bytes)	
A$func_screen$104:
	.db $CD $E9 $0D
	
; Data from 15F4 to 15F4 (1 bytes)	
A$func_screen$105:
	.db $F1
	
; Data from 15F5 to 15F5 (1 bytes)	
A$func_screen$106:
	.db $F1
	
; Data from 15F6 to 15F8 (3 bytes)	
A$func_screen$110:
C$func_screen.c$25$1$23:
	.db $21 $22 $16
	
; Data from 15F9 to 15F9 (1 bytes)	
A$func_screen$111:
	.db $46
	
; Data from 15FA to 15FC (3 bytes)	
A$func_screen$112:
	.db $3A $21 $16
	
; Data from 15FD to 15FE (2 bytes)	
A$func_screen$113:
	.db $C6 $07
	
; Data from 15FF to 15FF (1 bytes)	
A$func_screen$114:
	.db $4F
	
; Data from 1600 to 1600 (1 bytes)	
A$func_screen$115:
	.db $C5
	
; Data from 1601 to 1603 (3 bytes)	
A$func_screen$116:
	.db $21 $36 $16
	
; Data from 1604 to 1604 (1 bytes)	
A$func_screen$117:
	.db $E5
	
; Data from 1605 to 1607 (3 bytes)	
A$func_screen$118:
	.db $CD $E9 $0D
	
; Data from 1608 to 1608 (1 bytes)	
A$func_screen$119:
	.db $F1
	
; Data from 1609 to 1609 (1 bytes)	
A$func_screen$120:
	.db $F1
	
; Data from 160A to 160C (3 bytes)	
A$func_screen$124:
C$func_screen.c$26$1$23:
	.db $21 $22 $16
	
; Data from 160D to 160D (1 bytes)	
A$func_screen$125:
	.db $46
	
; Data from 160E to 1610 (3 bytes)	
A$func_screen$126:
	.db $3A $21 $16
	
; Data from 1611 to 1612 (2 bytes)	
A$func_screen$127:
	.db $C6 $0E
	
; Data from 1613 to 1613 (1 bytes)	
A$func_screen$128:
	.db $4F
	
; Data from 1614 to 1614 (1 bytes)	
A$func_screen$129:
	.db $C5
	
; Data from 1615 to 1617 (3 bytes)	
A$func_screen$130:
	.db $21 $3B $16
	
; Data from 1618 to 1618 (1 bytes)	
A$func_screen$131:
	.db $E5
	
; Data from 1619 to 161B (3 bytes)	
A$func_screen$132:
	.db $CD $E9 $0D
	
; Data from 161C to 161C (1 bytes)	
A$func_screen$133:
	.db $F1
	
; Data from 161D to 161D (1 bytes)	
A$func_screen$134:
	.db $F1
	
; Data from 161E to 1620 (3 bytes)	
A$func_screen$142:
C$func_screen.c$27$1$23:
C$func_screen.c$32$1$23:
XG$screen_func_screen_load$0$0:
	.db $C3 $25 $08
	
; Data from 1621 to 1621 (1 bytes)	
Ffunc_screen$x$0$0:
	.db $04
	
; Data from 1622 to 1622 (1 bytes)	
Ffunc_screen$y$0$0:
	.db $14
	
; Data from 1623 to 1629 (7 bytes)	
Ffunc_screen$__str_0$0$0:
	.db $52 $45 $43 $4F $52 $44 $00
	
; Data from 162A to 1630 (7 bytes)	
Ffunc_screen$__str_1$0$0:
	.db $43 $4F $56 $45 $52 $53 $00
	
; Data from 1631 to 1635 (5 bytes)	
Ffunc_screen$__str_2$0$0:
	.db $31 $39 $38 $34 $00
	
; Data from 1636 to 163A (5 bytes)	
Ffunc_screen$__str_3$0$0:
	.db $31 $39 $38 $36 $00
	
; Data from 163B to 163F (5 bytes)	
Ffunc_screen$__str_4$0$0:
	.db $31 $39 $38 $38 $00
	
; Data from 1640 to 1640 (1 bytes)	
A$func_screen$181:
C$func_screen.c$34$1$23:
C$func_screen.c$57$1$25:
G$screen_func_screen_update$0$0:
_screen_func_screen_update:
	.db $C1
	
; Data from 1641 to 1641 (1 bytes)	
A$func_screen$182:
	.db $E1
	
; Data from 1642 to 1642 (1 bytes)	
A$func_screen$183:
	.db $E5
	
; Data from 1643 to 1643 (1 bytes)	
A$func_screen$184:
	.db $C5
	
; Data from 1644 to 1645 (2 bytes)	
A$func_screen$185:
	.db $36 $08
	
; Data from 1646 to 1646 (1 bytes)	
A$func_screen$190:
C$func_screen.c$58$1$25:
XG$screen_func_screen_update$0$0:
	.db $C9

	
; content
.include "content/gfx.inc"
.include "content/psg.inc"


; Data from 1A9F to 1AA6 (8 bytes)	
__divuint:
	.db $F1 $E1 $D1 $D5 $E5 $F5 $18 $0A
	
; Data from 1AA7 to 1AAD (7 bytes)	
__divuchar:
	.db $21 $03 $00 $39 $5E $2B $6E
	
; Data from 1AAE to 1AB0 (3 bytes)	
__divu8:
	.db $26 $00 $54
	
; Data from 1AB1 to 1ADF (47 bytes)	
__divu16:
	.db $7B $E6 $80 $B2 $20 $10 $06 $10 $ED $6A $17 $93 $30 $01 $83 $3F
	.db $ED $6A $10 $F6 $5F $C9 $06 $09 $7D $6C $26 $00 $CB $1D $ED $6A
	.db $ED $52 $30 $01 $19 $3F $17 $10 $F5 $CB $10 $50 $5F $EB $C9
	
.include "devkit/sms_manager.inc"


; Data from 2103 to 2104 (2 bytes)	
Finput_manager$__xinit_curr_joyp:
	.db $00 $00
	
; Data from 2105 to 2106 (2 bytes)	
Finput_manager$__xinit_prev_joyp:
	.db $00 $00
	
; Data from 2107 to 211E (24 bytes)	
Fcursor_object$__xinit_cursor_al:
	.db $4D $11 $52 $11 $57 $11 $5C $11 $61 $11 $66 $11 $6B $11 $70 $11
	.db $75 $11 $7A $11 $7F $11 $84 $11
	
; Data from 211F to 2136 (24 bytes)	
Frecord_object$__xinit_record_ti:
	.db $89 $80 $32 $81 $70 $80 $9F $80 $18 $81 $8D $80 $87 $80 $67 $80
	.db $67 $80 $9F $80 $C7 $80 $7A $80
	
; Data from 2137 to 214E (24 bytes)	
Grecord_object$__xinit_record_ti:
	.db $10 $80 $10 $80 $10 $80 $10 $80 $10 $80 $10 $80 $10 $80 $10 $80
	.db $10 $80 $10 $80 $10 $80 $10 $80
	
; Data from 214F to 216A (28 bytes)	
Frecord_object$__xinit_record_pa:
	.db $00 $80 $00 $80 $00 $80 $00 $80 $00 $80 $00 $80 $00 $80 $00 $80
	.db $00 $80 $00 $80 $00 $80 $00 $80 $04 $20 $08 $08
	
gsinit:
		ld bc, $0068
		ld a, b
		or c
		jr z, +
		ld de, Finput_manager$curr_joypad1$0$0	; Finput_manager$curr_joypad1$0$0 = $C146
		ld hl, Finput_manager$__xinit_curr_joyp	; Finput_manager$__xinit_curr_joyp = $2103
		ldir
+:
		ret
	
	; Data from 217B to 7F8B (24081 bytes)
	.dsb 24081, $00
	
; Data from 7F8C to 7FC7 (60 bytes)	
G$__SMS__SDSC_descr$0$0:
___SMS__SDSC_descr:
	.db $56 $61 $6E $20 $48 $61 $6C $65 $6E $20 $52 $65 $63 $6F $72 $64
	.db $20 $43 $6F $76 $65 $72 $73 $20 $66 $6F $72 $20 $74 $68 $65 $20
	.db $53 $4D $53 $20 $50 $6F $77 $65 $72 $21 $20 $32 $30 $32 $31 $20
	.db $43 $6F $6D $70 $65 $74 $69 $74 $69 $6F $6E $00
	
; Data from 7FC8 to 7FD1 (10 bytes)	
G$__SMS__SDSC_name$0$0:
___SMS__SDSC_name:
	.db $56 $61 $6E $20 $48 $61 $6C $65 $6E $00
	
; Data from 7FD2 to 7FDF (14 bytes)	
G$__SMS__SDSC_author$0$0:
___SMS__SDSC_author:
	.db $53 $74 $65 $76 $65 $6E $20 $42 $6F $6C $61 $6E $64 $00
	
; Data from 7FE0 to 7FEF (16 bytes)	
G$__SMS__SDSC_signature$0$0:
___SMS__SDSC_signature:
	.db $53 $44 $53 $43 $01 $00 $27 $03 $21 $20 $D2 $7F $C8 $7F $8C $7F
	
.BANK 1 SLOT 1	
.ORG $0000	
	
; Data from 7FF0 to 7FFF (16 bytes)	
G$__SMS__SEGA_signature$0$0:
___SMS__SEGA_signature:
	.db $54 $4D $52 $20 $53 $45 $47 $41 $FF $FF $D5 $FF $99 $99 $00 $4C
	

; Banks.
.include "engine/bank_manager.inc"