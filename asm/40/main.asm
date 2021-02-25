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
.include "screen/detail_screen.inc"
.include "screen/test_screen.inc"
.include "screen/func_screen.inc"


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