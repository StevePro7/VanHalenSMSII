;==============================================================
; SDSC tag and SMS rom header
;==============================================================
.sdsctag 1.0,"Van Halen","Van Halen Record Covers for the SMS Power! 2021 Competition","Steven Boland"

; content
.include "content/gfx.inc"
.include "content/psg.inc"
.include "content/out.inc"

; devkit
.include "devkit/define_manager.inc"
.include "devkit/devkit_manager.inc"
.include "devkit/enum_manager.inc"
.include "devkit/memory_manager.inc"
.include "devkit/psg_manager.inc"
.include "devkit/sms_manager.inc"


; engine
.include "engine/asm_manager.inc"
.include "engine/audio_manager.inc"
;.include "engine/bank_manager.inc"         ; must go last!
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

;==============================================================
; Data
;==============================================================
.section "Text section" free
.asciitable
map " " to "~" = 0
.enda

Message:
.asc "Hello Test42"
.db $ff
.ends



.bank 0 slot 0
.org $0000
;==============================================================
; Boot section
;==============================================================
.section "Boot" force
boot:
    di              ; disable interrupts
    im 1            ; Interrupt mode 1
    jp init         ; jump to main program
.ends

; Data from 6 to 7 (2 bytes)	
SMS_crt0_RST08:
	.db $00 $00

LABEL_8_:
		ld c, Port_VDPAddress
		di
		out (c), l
		out (c), h
		ei
		ret

; Data from 11 to 37 (39 bytes)
SMS_crt0_RST18:
	;.db $00 $00 $00 $00 $00 $00 $00 $7D $D3 $BE $7C $D6 $00 $00 $D3 $BE
	;.db $C9
.rept 7
	nop
.endr

	ld a, l
	out ($be), a
	ld a, h
	sub a, $00
	nop
	out ($be), a
	ret

	;.dsb 22, $00
.rept 22
	nop
.endr

.org $0038
;==============================================================
; VDP interrupt handler
;==============================================================
.section "VDP interrupt" force
    jp SMS_isr
    ;reti
.ends

; Data from 3B to 65 (43 bytes)
	.dsb 43, $00
    
.org $0066
;==============================================================
; Pause button handler
;==============================================================
.section "Pause interrupt" force
    jp SMS_nmi_isr
    ;retn
.ends

; Data from 69 to 6F (7 bytes)
	.db $00 $00 $00 $00 $00 $00 $00
    
;==============================================================
; Main program
;==============================================================
.section "Init control structure" free
init:
    ld sp, $dff0
    ld de, _RAM_FFFC_

    ;==============================================================
    ; Set up VDP registers
    ;==============================================================
    ld hl,VDPInitData
    ld b,VDPInitDataEnd-VDPInitData
    ld c,VDPControl
    otir

    ;==============================================================
    ; Clear VRAM
    ;==============================================================
    ; 1. Set VRAM write address to $0000
    ld hl,$0000 | VRAMWrite
    call SetVDPAddress
    ; 2. Output 16KB of zeroes
    ld bc,$4000     ; Counter for 16KB of VRAM
-:  xor a
    out (VDPData),a ; Output to VRAM address, which is auto-incremented after each write
    dec bc
    ld a,b
    or c
    jr nz,-

    ;==============================================================
    ; Load palette
    ;==============================================================
    ; 1. Set VRAM write address to CRAM (palette) address 0
    ld hl,$0000 | CRAMWrite
    call SetVDPAddress
    ; 2. Output colour data
    ld hl,PaletteData
    ld bc,PaletteDataEnd-PaletteData
    call CopyToVDP

    ;==============================================================
    ; Load tiles (font)
    ;==============================================================
    ; 1. Set VRAM write address to tile index 0
    ld hl,$0000 | VRAMWrite
    call SetVDPAddress
    ; 2. Output tile data
    ld hl,FontData              ; Location of tile data
    ld bc,FontDataSize          ; Counter for number of bytes to write
    call CopyToVDP

    ;==============================================================
    ; Write text to name table
    ;==============================================================
    ; 1. Set VRAM write address to tilemap index 0
    ld hl,$3800 | VRAMWrite
    call SetVDPAddress
    ; 2. Output tilemap data
    ld hl,Message
-:  ld a,(hl)
    cp $ff
    jr z,+
    out (VDPData),a
    xor a
    out (VDPData),a
    inc hl
    jr -
+:

    ; Turn screen on
    ld a,%01000000
;          ||||||`- Zoomed sprites -> 16x16 pixels
;          |||||`-- Doubled sprites -> 2 tiles per sprite, 8x16
;          ||||`--- Mega Drive mode 5 enable
;          |||`---- 30 row/240 line mode
;          ||`----- 28 row/224 line mode
;          |`------ VBlank interrupts
;          `------- Enable display
    out (VDPControl),a
    ld a,$81
    out (VDPControl),a

    ; Infinite loop to stop program
-:  jr -
.ends

;==============================================================
; Helper functions
;==============================================================
.section "Helper functions" free
SetVDPAddress:
; Sets the VDP address
; Parameters: hl = address
    push af
        ld a,l
        out (VDPControl),a
        ld a,h
        out (VDPControl),a
    pop af
    ret

CopyToVDP:
; Copies data to the VDP
; Parameters: hl = data address, bc = data length
; Affects: a, hl, bc
-:  ld a,(hl)    ; Get data byte
    out (VDPData),a
    inc hl       ; Point to next letter
    dec bc
    ld a,b
    or c
    jr nz,-
    ret
.ends



.section "Content section" free
PaletteData:
.db $00,$3f ; Black, white
PaletteDataEnd:

; VDP initialisation data
VDPInitData:
.db $04,$80,$00,$81,$ff,$82,$ff,$85,$ff,$86,$ff,$87,$00,$88,$00,$89,$ff,$8a
VDPInitDataEnd:
.ends

.section "Font include" free
FontData:
.incbin "font.bin" fsize FontDataSize
.ends

.section "Initialize section" free
init2:
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
		call SMS_init
		ei
		call main
		jp exit
.ends

.section "Clock and exit section" free
; NEW code
; Data from 200 to 203 (4 bytes)	
clock:
	;.db $3E $02 $CF $C9
		ld a, $02
		rst $08
		ret

exit:
		ld a, $00
		rst $08	; _LABEL_8_
-:
		halt
		jr -
.ends

.section "Main section" free
main:
		call engine_asm_manager_clear_VRAM
		call devkit_SMS_init
		call devkit_SMS_displayOff
		call devkit_SPRITEMODE_NORMAL
		ld b, l
		push bc
		inc sp
		call devkit_SMS_setSpriteMode
		inc sp
		call devkit_SMS_useFirstHalfTilesfor
		call devkit_VDPFEATURE_HIDEFIRSTCOL
		push hl
		call devkit_SMS_VDPturnOnFeature
		pop af
		call engine_content_manager_load_til
		call engine_content_manager_load_spr
		call engine_scroll_manager_reset
		ld a, $01			; screen_type_splash
		push af
		inc sp
		call engine_screen_manager_init
		inc sp
		call devkit_SMS_displayOn
infinite_loop:
		call devkit_SMS_queryPauseRequested
		ld a, l
		or a
		jr z, global_pause
		call devkit_SMS_resetPauseRequest
		ld iy, Lmain.main$global_pause$1$55	; Lmain.main$global_pause$1$55 = $C000
		ld a, (iy+0)
		xor $01
		ld (iy+0), a
		bit 0, (iy+0)
		jr z, else_clause
		call devkit_PSGSilenceChannels
		jr global_pause

else_clause:
		call devkit_PSGRestoreVolumes
global_pause:
		ld hl, Lmain.main$global_pause$1$55	; Lmain.main$global_pause$1$55 = $C000
		bit 0, (hl)
		jr nz, infinite_loop
		call devkit_SMS_initSprites
		call engine_input_manager_update
		call engine_screen_manager_update
		call devkit_SMS_finalizeSprites
		call devkit_SMS_waitForVBlank
		call devkit_SMS_copySpritestoSAT
		call devkit_PSGFrame
		call devkit_PSGSFXFrame
		jr infinite_loop
.ends

.section "Math functions" free
; Data from 1A9F to 1AA6 (8 bytes)	
divuint:
	;.db $F1 $E1 $D1 $D5 $E5 $F5 $18 $0A
	pop af
	pop hl
	pop de
	push de
	push hl
	push af
	jr $0A
    
; Data from 1AA7 to 1AAD (7 bytes)	
divuchar:
	;.db $21 $03 $00 $39 $5E $2B $6E
	ld hl, $0003
	add hl, sp
	ld e, (hl)
	dec hl
	ld l, (hl)

; Data from 1AAE to 1AB0 (3 bytes)	
divu8:
	;.db $26 $00 $54
	ld h, $00
	ld d, h

; Data from 1AB1 to 1ADF (47 bytes)	
divu16:
	;.db $7B $E6 $80 $B2 $20 $10 $06 $10 $ED $6A $17 $93 $30 $01 $83 $3F
	;.db $ED $6A $10 $F6 $5F $C9 $06 $09 $7D $6C $26 $00 $CB $1D $ED $6A
	;.db $ED $52 $30 $01 $19 $3F $17 $10 $F5 $CB $10 $50 $5F $EB $C9
	ld a, e
	and $80
	or d
	jr nz, $10
	ld b, $10
	adc hl, hl
	rla
	sub a, e
	jr nc, $01
	add a, e
	ccf

	adc hl, hl
	djnz $F6
	ld e,a
	ret
	ld b, $09
	ld a, l
	ld l, h
	ld h, $00
	rr l
	adc hl, hl

	sbc hl, de
	jr nc, $01
	add hl, de
	ccf
	rla
	djnz $F5
	rl b
	ld d, b
	ld e, a
	ex de, hl
	ret
.ends


.section "Object variables" free
; Data from 2103 to 2104 (2 bytes)	
Finput_manager$__xinit_curr_joyp:
; static unsigned int curr_joypad1 = 0;
	.db $00 $00
	
; Data from 2105 to 2106 (2 bytes)	
Finput_manager$__xinit_prev_joyp:
; static unsigned int prev_joypad1 = 0;
	.db $00 $00
	
; Data from 2107 to 211E (24 bytes)	
Fcursor_object$__xinit_cursor_al:
; extern const char *cursor_album[ MAX_ALBUMS ];
; $114D $1152 $1157 $115C $1161 $1166	$116B $1170 $117f5 $117A $117F $1184
	.db $4D $11 $52 $11 $57 $11 $5C $11 $61 $11 $66 $11 $6B $11 $70 $11
	.db $75 $11 $7A $11 $7F $11 $84 $11
	
; Data from 211F to 2136 (24 bytes)	
Frecord_object$__xinit_record_ti:
; const unsigned char *record_tiles_data[]
	.db $89 $80 $32 $81 $70 $80 $9F $80 $18 $81 $8D $80 $87 $80 $67 $80
	.db $67 $80 $9F $80 $C7 $80 $7A $80
	
; Data from 2137 to 214E (24 bytes)	
Grecord_object$__xinit_record_ti:
; const unsigned char *record_tilemap_data[]
	.db $10 $80 $10 $80 $10 $80 $10 $80 $10 $80 $10 $80 $10 $80 $10 $80
	.db $10 $80 $10 $80 $10 $80 $10 $80
	
; Data from 214F to 216A (28 bytes)	
Frecord_object$__xinit_record_pa:
; const unsigned char *record_palette_data[]
	.db $00 $80 $00 $80 $00 $80 $00 $80 $00 $80 $00 $80 $00 $80 $00 $80
	.db $00 $80 $00 $80 $00 $80 $00 $80 $04 $20 $08 $08
.ends

.section "Additional functions" free
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
.ends

; .BANK 1 SLOT 1	
; .ORG $0000	

; ; Data from 7FF0 to 7FFF (16 bytes)	
; G$__SMS__SEGA_signature$0$0:
; ___SMS__SEGA_signature:
; 	.db $54 $4D $52 $20 $53 $45 $47 $41 $FF $FF $D5 $FF $99 $99 $00 $4C
	
    
; Banks.
.include "engine/bank_manager.inc"