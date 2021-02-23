.BANK 2	
.ORG $0000	
	
	;.incbin "data/File01_08000_0BFFF.dat"
; Data from 8000 to 800F (16 bytes)	
_splash__palette__bin:	
	.incbin "banks/bank2/splash (palette).bin"
	;.include "banks/bank2/splash (palette).inc"
	;.db $00 $03 $01 $05 $05 $06 $06 $07 $07 $17 $1A $2A $0A $1F $0F $3F
	
; Data from 8010 to 8056 (71 bytes)	
_splash__tilemap__stmcompr:	
	.incbin "banks/bank2/splash (tilemap).stmcompr"
	;.include "banks/bank2/splash (tilemap).inc"
	;.db $FD $40 $FD $40 $FD $40 $0D $40 $1B $41 $01 $40 $03 $49 $49 $40
	;.db $3F $4B $35 $40 $3F $5C $35 $40 $3F $6D $5D $40 $03 $7E $FD $40
	;.db $65 $40 $07 $80 $55 $40 $07 $83 $04 $42 $01 $40 $07 $86 $01 $40
	;.db $03 $49 $41 $40 $33 $89 $41 $40 $33 $97 $41 $40 $33 $A5 $FD $40
	;.db $FD $40 $FD $40 $11 $40 $00
	
; Data from 8057 to BFFF (16297 bytes)	
_splash__tiles__psgcompr:	
	.incbin "banks/bank2/splash (tiles).psgcompr"
	;.include "banks/bank2/splash (tiles).inc"
	;.incbin ...
    
    
.BANK 3	
.ORG $0000	
	
	; Data from C000 to FFFF (16384 bytes)
	;.incbin "data/File02_0C000_0FFFF.dat"


; Data from C000 to C00F (16 bytes)	
_VanHalenTitleGap__palette__bin:
	.incbin "banks/bank3/VanHalenTitleGap (palette).bin"	
	;.db $00 $00 $10 $14 $15 $05 $25 $38 $29 $39 $39 $2A $3A $3F $3E $2A
	
; Data from C010 to C076 (103 bytes)	
_VanHalenTitleGap__tilemap__stmc:
	.incbin "banks/bank3/VanHalenTitleGap (tilemap).stmcompr"	
	;.db $FD $40 $FD $40 $67 $41 $11 $40 $63 $5C $11 $40 $5F $76 $19 $40
	;.db $5B $8F $19 $40 $5B $A7 $19 $40 $57 $BF $25 $40 $0F $D6 $04 $40
	;.db $1B $DB $04 $40 $07 $E3 $01 $40 $04 $E6 $25 $40 $04 $E7 $0D $40
	;.db $1B $E8 $59 $40 $16 $04 $E3 $17 $F0 $5D $40 $17 $F7 $5D $40 $13
	;.db $FE $06 $5D $40 $04 $04 $06 $04 $BF $0B $05 $06 $6D $40 $07 $09
	;.db $06 $69 $40 $0B $0C $06 $6D $40 $07 $10 $06 $6D $40 $04 $13 $02
	;.db $FD $40 $FD $40 $31 $40 $00
	
; Data from C077 to D2D7 (4705 bytes)	
_VanHalenTitleGap__tiles__psgcom:	
	.incbin "banks/bank3/VanHalenTitleGap (tiles).psgcompr"
	;.incbin ...
	
; Data from D2D8 to D2E7 (16 bytes)	
_VanHalenTitleTop__palette__bin:
	.incbin "banks/bank3/VanHalenTitleTop (palette).bin"	
	;.db $00 $00 $10 $14 $15 $01 $25 $38 $29 $39 $39 $2A $3A $3F $3E $2A
	
; Data from D2E8 to D344 (93 bytes)	
_VanHalenTitleTop__tilemap__stmc:
	.incbin "banks/bank3/VanHalenTitleTop (tilemap).stmcompr"	
	;.db $01 $40 $67 $41 $11 $40 $63 $5C $11 $40 $63 $76 $15 $40 $5B $90
	;.db $19 $40 $5B $A8 $19 $40 $57 $C0 $25 $40 $0B $D7 $01 $40 $1B $DB
	;.db $04 $40 $0B $E3 $45 $40 $1B $E7 $59 $40 $1B $EF $5D $40 $13 $F7
	;.db $61 $40 $0F $FD $22 $04 $8F $02 $61 $40 $0A $0F $02 $06 $6D $40
	;.db $07 $07 $06 $69 $40 $0B $0A $06 $6D $40 $07 $0E $06 $6D $40 $04
	;.db $11 $02 $FD $40 $FD $40 $FD $40 $FD $40 $29 $40 $00
	
; Data from D345 to FFFF (11451 bytes)	
_VanHalenTitleTop__tiles__psgcom:
	.incbin "banks/bank3/VanHalenTitleTop (tiles).psgcompr"	
	;.incbin ...
	


.BANK 4	
.ORG $0000	
	
	; Data from 10000 to 13FFF (16384 bytes)
	;.incbin "data/File03_10000_13FFF.dat"


; Data from 10000 to 1000F (16 bytes)	
_VanHalen1978__palette__bin:	
	.incbin "banks/bank4/VanHalen1978 (palette).bin"
	;.db $00 $00 $00 $00 $14 $01 $05 $15 $10 $25 $39 $02 $16 $1A $3A $1A
	
; Data from 10010 to 10088 (121 bytes)	
_VanHalen1978__tilemap__stmcompr:	
	.incbin "banks/bank4/VanHalen1978 (tilemap).stmcompr"
	;.db $FD $00 $85 $00 $03 $01 $04 $00 $0F $03 $01 $00 $33 $08 $29 $00
	;.db $07 $16 $09 $00 $07 $19 $04 $00 $1F $1C $25 $00 $4F $25 $21 $00
	;.db $17 $3A $04 $00 $33 $41 $1D $00 $57 $4F $25 $00 $4F $66 $1D $00
	;.db $57 $7B $19 $00 $5B $92 $19 $00 $26 $04 $6B $57 $AA $19 $00 $5B
	;.db $C1 $31 $00 $43 $D9 $19 $00 $03 $EB $09 $00 $03 $ED $01 $00 $33
	;.db $EF $15 $00 $5F $FD $06 $15 $00 $5F $16 $06 $19 $00 $5B $2F $06
	;.db $19 $00 $5B $47 $06 $19 $00 $5B $5F $06 $19 $00 $5B $77 $06 $21
	;.db $00 $04 $8F $02 $FD $00 $59 $00 $00
	
; Data from 10089 to 13FFF (16247 bytes)	
_VanHalen1978__tiles__psgcompr:	
	.incbin "banks/bank4/VanHalen1978 (tiles).psgcompr"
	;.incbin ...


.BANK 5	
.ORG $0000	
	
	; Data from 14000 to 17FFF (16384 bytes)
	;.incbin "data/File04_14000_17FFF.dat"


; Data from 14000 to 1400F (16 bytes)	
_VanHalen1979__palette__bin:	
	.incbin "banks/bank5/VanHalen1979 (palette).bin"
	;.db $00 $00 $10 $10 $10 $15 $29 $07 $1B $2A $2B $2F $3F $3F $3E $25
	
; Data from 14010 to 14131 (290 bytes)	
_VanHalen1979__tilemap__stmcompr:
	.incbin "banks/bank5/VanHalen1979 (tilemap).stmcompr"	
	;.db $FD $00 $81 $00 $33 $01 $04 $09 $03 $0F $26 $04 $0C $08 $11 $09
	;.db $0F $12 $19 $00 $1B $17 $01 $09 $08 $1F $09 $0B $20 $03 $23 $05
	;.db $09 $07 $25 $19 $00 $01 $09 $08 $28 $09 $26 $04 $23 $07 $29 $04
	;.db $09 $26 $04 $08 $04 $09 $13 $2C $26 $04 $08 $05 $09 $07 $32 $15
	;.db $00 $1B $35 $04 $20 $16 $04 $3C $04 $3D $01 $09 $07 $3E $16 $04
	;.db $28 $03 $41 $04 $09 $0F $43 $15 $00 $5F $48 $15 $00 $04 $48 $5B
	;.db $61 $15 $00 $5F $79 $15 $00 $04 $01 $5B $92 $15 $00 $04 $01 $16
	;.db $04 $0C $05 $09 $33 $AA $01 $09 $0B $B8 $15 $00 $08 $01 $BC $16
	;.db $04 $3C $08 $09 $BD $16 $04 $38 $03 $BE $04 $2B $3B $C0 $19 $00
	;.db $04 $09 $36 $04 $1D $01 $09 $04 $D0 $16 $08 $BC $1D $23 $D1 $01
	;.db $09 $0F $DB $15 $00 $08 $79 $3C $36 $04 $2B $03 $E0 $26 $04 $22
	;.db $0B $E2 $04 $09 $13 $E6 $36 $04 $0C $01 $09 $0F $EC $19 $00 $01
	;.db $09 $36 $04 $0C $05 $09 $26 $08 $28 $2B $04 $F1 $16 $04 $41 $04
	;.db $09 $0B $F2 $04 $09 $16 $04 $23 $01 $09 $0F $F6 $19 $00 $19 $09
	;.db $26 $04 $2B $01 $09 $07 $FB $05 $09 $17 $FE $02 $19 $00 $25 $09
	;.db $0A $2F $05 $06 $15 $00 $04 $12 $06 $2D $09 $27 $13 $02 $19 $00
	;.db $05 $09 $0A $03 $1E $06 $04 $09 $04 $20 $06 $0D $09 $2B $21 $02
	;.db $19 $00 $05 $09 $0A $03 $2D $06 $11 $09 $2F $2F $02 $FD $00 $85
	;.db $00 $00
	
; Data from 14132 to 17FFF (16078 bytes)	
_VanHalen1979__tiles__psgcompr:	
	.incbin "banks/bank5/VanHalen1979 (tiles).psgcompr"
	;.incbin ...
    

.BANK 6	
.ORG $0000	
	
	; Data from 18000 to 1BFFF (16384 bytes)
	;.incbin "data/File05_18000_1BFFF.dat"


; Data from 18000 to 1800F (16 bytes)	
_VanHalen1980__palette__bin:	
	.incbin "banks/bank6/VanHalen1980 (palette).bin"
	;.db $00 $00 $00 $14 $15 $15 $15 $15 $15 $2A $2A $2A $3F $3F $3F $29
	
; Data from 18010 to 1806F (96 bytes)	
_VanHalen1980__tilemap__stmcompr:
	.incbin "banks/bank6/VanHalen1980 (tilemap).stmcompr"	
	;.db $FD $00 $85 $00 $5B $01 $19 $00 $5B $19 $19 $00 $5B $31 $19 $00
	;.db $5B $49 $19 $00 $5B $61 $19 $00 $5B $79 $19 $00 $33 $91 $04 $85
	;.db $1F $9F $19 $00 $5B $A8 $19 $00 $5B $C0 $19 $00 $5B $D8 $19 $00
	;.db $5B $F0 $06 $19 $00 $5B $08 $06 $19 $00 $5B $20 $06 $19 $00 $5B
	;.db $38 $06 $19 $00 $5B $50 $06 $19 $00 $5B $68 $06 $19 $00 $5B $80
	;.db $06 $19 $00 $5B $98 $06 $49 $00 $0F $B0 $02 $FD $00 $21 $00 $00
	
; Data from 18070 to 1BFFF (16272 bytes)	
_VanHalen1980__tiles__psgcompr:	
	.incbin "banks/bank6/VanHalen1980 (tiles).psgcompr"
	;.incbin ...
    

.BANK 7	
.ORG $0000	
	
	; Data from 1C000 to 1FFFF (16384 bytes)
	;.incbin "data/File06_1C000_1FFFF.dat"


; Data from 1C000 to 1C00F (16 bytes)	
_VanHalen1981__palette__bin:	
	.incbin "banks/bank7/VanHalen1981 (palette).bin"
	;.db $00 $00 $00 $01 $05 $15 $15 $06 $16 $07 $06 $1B $1A $2F $2F $1A
	
; Data from 1C010 to 1C09E (143 bytes)	
_VanHalen1981__tilemap__stmcompr:
	.incbin "banks/bank7/VanHalen1981 (tilemap).stmcompr"	
	;.db $FD $00 $09 $00 $0C $01 $00 $02 $05 $00 $07 $03 $05 $00 $03 $06
	;.db $10 $02 $08 $00 $09 $05 $00 $04 $0A $1D $00 $5B $0B $15 $00 $63
	;.db $23 $15 $00 $5F $3D $15 $00 $5F $56 $15 $00 $5B $6F $19 $00 $5B
	;.db $87 $19 $00 $5B $9F $19 $00 $5B $B7 $19 $00 $5B $CF $19 $00 $5F
	;.db $E7 $15 $00 $0A $5B $00 $02 $04 $6E $15 $00 $0A $5B $18 $06 $19
	;.db $00 $5B $30 $32 $04 $23 $02 $15 $00 $0A $5B $48 $06 $15 $00 $5F
	;.db $60 $06 $19 $00 $5B $79 $06 $19 $00 $5B $91 $06 $19 $00 $5B $A9
	;.db $06 $19 $00 $0F $C1 $02 $01 $00 $1A $08 $C3 $C5 $0A $04 $C6 $06
	;.db $09 $00 $04 $C7 $26 $04 $02 $03 $C8 $02 $FD $00 $1D $00 $00
	
; Data from 1C09F to 1FFFF (16225 bytes)	
_VanHalen1981__tiles__psgcompr:
	.incbin "banks/bank7/VanHalen1981 (tiles).psgcompr"	
	;.incbin ...
	

.BANK 8	
.ORG $0000	
	
	; Data from 20000 to 23FFF (16384 bytes)
	;.incbin "data/File07_20000_23FFF.dat"


; Data from 20000 to 2000F (16 bytes)	
_VanHalen1982__palette__bin:	
	.incbin "banks/bank8/VanHalen1982 (palette).bin"
	;.db $00 $00 $01 $01 $01 $02 $02 $03 $03 $03 $03 $17 $3F $3F $2B $1B
	
; Data from 20010 to 20117 (264 bytes)	
_VanHalen1982__tilemap__stmcompr:
	.incbin "banks/bank8/VanHalen1982 (tilemap).stmcompr"	
	;.db $FD $00 $15 $00 $03 $01 $11 $00 $03 $03 $01 $00 $03 $05 $04 $00
	;.db $07 $07 $16 $04 $08 $1D $00 $09 $0A $4B $0B $19 $00 $0D $0A $13
	;.db $1F $2F $24 $19 $00 $11 $0A $0B $31 $05 $24 $08 $35 $24 $1F $36
	;.db $19 $00 $19 $0A $07 $3F $19 $24 $0F $42 $19 $00 $04 $47 $15 $0A
	;.db $0B $48 $11 $24 $13 $4C $19 $00 $03 $52 $1D $0A $03 $54 $0D $24
	;.db $08 $56 $24 $0B $57 $19 $00 $0B $5B $11 $0A $08 $5F $0A $07 $60
	;.db $09 $24 $0F $63 $19 $00 $08 $68 $24 $07 $69 $19 $0A $0B $6C $01
	;.db $24 $0F $70 $19 $00 $13 $75 $1D $0A $03 $7B $01 $24 $0F $7D $19
	;.db $00 $03 $82 $04 $24 $0F $84 $19 $0A $1B $89 $19 $00 $23 $91 $15
	;.db $0A $17 $9B $19 $00 $04 $A2 $16 $04 $77 $0D $24 $0F $A3 $11 $0A
	;.db $13 $A8 $19 $00 $04 $AE $19 $24 $07 $AF $19 $0A $0B $B2 $19 $00
	;.db $04 $B6 $1D $24 $07 $B7 $19 $0A $04 $5F $03 $BA $19 $00 $04 $BC
	;.db $25 $24 $03 $BD $1D $0A $04 $BF $19 $00 $04 $C0 $29 $24 $07 $C1
	;.db $08 $0A $C4 $11 $0A $19 $00 $2F $C5 $04 $24 $36 $04 $37 $03 $D2
	;.db $15 $0A $19 $00 $2F $D4 $26 $04 $B7 $01 $24 $03 $E1 $11 $0A $21
	;.db $00 $08 $E3 $05 $0B $E4 $10 $00 $E8 $01 $E9 $16 $04 $07 $05 $00
	;.db $16 $04 $E6 $FD $00 $21 $00 $00
	
; Data from 20118 to 23FFF (16104 bytes)	
_VanHalen1982__tiles__psgcompr:	
	.incbin "banks/bank8/VanHalen1982 (tiles).psgcompr"
	;.incbin ...


.BANK 9	
.ORG $0000	
	
	; Data from 24000 to 27FFF (16384 bytes)
	;.incbin "data/File08_24000_27FFF.dat"


; Data from 24000 to 2400F (16 bytes)	
_VanHalen1984__palette__bin:	
	.incbin "banks/bank9/VanHalen1984 (palette).bin"
	;.db $00 $15 $16 $1A $2B $2A $2B $2B $2F $2F $2F $3F $3F $3F $3E $2A
	
; Data from 24010 to 2408C (125 bytes)	
_VanHalen1984__tilemap__stmcompr:
	.incbin "banks/bank9/VanHalen1984 (tilemap).stmcompr"	
	;.db $FD $00 $85 $00 $5B $01 $19 $00 $5B $19 $19 $00 $5B $31 $19 $00
	;.db $5B $49 $19 $00 $5B $61 $19 $00 $5B $79 $19 $00 $5B $91 $19 $00
	;.db $03 $A9 $16 $04 $92 $4B $AB $04 $A8 $19 $00 $08 $BF $91 $4F $C0
	;.db $04 $A8 $19 $00 $57 $D5 $04 $A8 $19 $00 $57 $EC $02 $04 $A8 $19
	;.db $00 $0A $57 $03 $02 $04 $A8 $19 $00 $0A $07 $1A $06 $04 $A8 $47
	;.db $1D $02 $04 $A8 $19 $00 $0A $07 $30 $4B $32 $02 $04 $A8 $19 $00
	;.db $05 $A8 $0A $4F $46 $02 $19 $00 $05 $A8 $0A $4F $5B $06 $19 $00
	;.db $5B $70 $06 $19 $00 $5B $88 $02 $FD $00 $85 $00 $00
	
; Data from 2408D to 27FFF (16243 bytes)	
_VanHalen1984__tiles__psgcompr:	
	.incbin "banks/bank9/VanHalen1984 (tiles).psgcompr"
	;.incbin ...
    

.BANK 10	
.ORG $0000	
	
	; Data from 28000 to 2BFFF (16384 bytes)
	;.incbin "data/File09_28000_2BFFF.dat"


; Data from 28000 to 2800F (16 bytes)	
_VanHalen1986__palette__bin:	
	.incbin "banks/bank10/VanHalen1986 (palette).bin"
	;.db $00 $00 $00 $04 $01 $05 $15 $10 $16 $1A $1A $2A $2B $3F $2F $19
	
; Data from 28010 to 28086 (119 bytes)	
_VanHalen1986__tilemap__stmcompr:
	.incbin "banks/bank10/VanHalen1986 (tilemap).stmcompr"	
	;.db $FD $00 $85 $00 $5F $01 $15 $00 $5F $1A $15 $00 $5B $33 $04 $32
	;.db $15 $00 $5F $4B $15 $00 $5B $64 $19 $00 $1F $7C $01 $84 $0B $85
	;.db $04 $84 $1B $89 $19 $00 $5B $91 $19 $00 $5B $A9 $19 $00 $5B $C1
	;.db $19 $00 $5B $D9 $19 $00 $5B $F1 $06 $19 $00 $5B $09 $06 $19 $00
	;.db $5B $21 $06 $19 $00 $5B $39 $06 $19 $00 $5F $51 $06 $15 $00 $03
	;.db $6A $06 $04 $00 $53 $6C $06 $19 $00 $57 $82 $06 $1D $00 $33 $99
	;.db $06 $04 $00 $04 $84 $0B $A7 $06 $01 $00 $04 $AB $06 $25 $00 $17
	;.db $AC $02 $FD $00 $3D $00 $00
	
; Data from 28087 to 2BFFF (16249 bytes)	
_VanHalen1986__tiles__psgcompr:	
	.incbin "banks/bank10/VanHalen1986 (tiles).psgcompr"
	;.incbin ...
    
.BANK 11	
.ORG $0000	
	
	; Data from 2C000 to 2FFFF (16384 bytes)
	;.incbin "data/File10_2C000_2FFFF.dat"


; Data from 2C000 to 2C00F (16 bytes)	
_VanHalen1988__palette__bin:	
	.incbin "banks/bank11/VanHalen1988 (palette).bin"
	;.db $00 $00 $00 $00 $15 $15 $15 $15 $2A $2A $2A $3F $3F $3F $3F $2A
	
; Data from 2C010 to 2C066 (87 bytes)	
_VanHalen1988__tilemap__stmcompr:
	.incbin "banks/bank11/VanHalen1988 (tilemap).stmcompr"	
	;.db $FD $00 $85 $00 $53 $01 $21 $00 $53 $17 $21 $00 $57 $2D $1D $00
	;.db $5B $44 $19 $00 $5B $5C $19 $00 $5B $74 $19 $00 $5B $8C $19 $00
	;.db $5B $A4 $19 $00 $5B $BC $19 $00 $5B $D4 $19 $00 $5B $EC $06 $19
	;.db $00 $5B $04 $06 $19 $00 $5B $1C $06 $19 $00 $5B $34 $06 $19 $00
	;.db $5B $4C $06 $19 $00 $5B $64 $06 $19 $00 $57 $7C $06 $1D $00 $57
	;.db $93 $02 $FD $00 $89 $00 $00
	
; Data from 2C067 to 2FFFF (16281 bytes)	
_VanHalen1988__tiles__psgcompr:	
	.incbin "banks/bank11/VanHalen1988 (tiles).psgcompr"
	;.incbin ...
    
    
.BANK 12	
.ORG $0000	
	
	; Data from 30000 to 33FFF (16384 bytes)
	;.incbin "data/File11_30000_33FFF.dat"

; Data from 30000 to 3000F (16 bytes)	
_VanHalen1991__palette__bin:	
	.incbin "banks/bank12/VanHalen1991 (palette).bin"
	;.db $00 $00 $01 $01 $01 $01 $01 $01 $01 $01 $15 $15 $16 $16 $2B $2A
	
; Data from 30010 to 30066 (87 bytes)	
_VanHalen1991__tilemap__stmcompr:
	.incbin "banks/bank12/VanHalen1991 (tilemap).stmcompr"	
	;.db $FD $00 $85 $00 $5B $01 $19 $00 $5B $19 $19 $00 $5B $31 $19 $00
	;.db $5B $49 $19 $00 $5B $61 $19 $00 $5B $79 $19 $00 $5B $91 $19 $00
	;.db $5B $A9 $19 $00 $5B $C1 $19 $00 $5B $D9 $15 $00 $5F $F1 $06 $19
	;.db $00 $5B $0A $06 $19 $00 $5B $22 $06 $19 $00 $5B $3A $06 $19 $00
	;.db $5B $52 $06 $19 $00 $5B $6A $06 $19 $00 $5B $82 $06 $19 $00 $5B
	;.db $9A $02 $FD $00 $85 $00 $00
	
; Data from 30067 to 33FFF (16281 bytes)	
_VanHalen1991__tiles__psgcompr:	
	.incbin "banks/bank12/VanHalen1991 (tiles).psgcompr"
	;.incbin ...


.BANK 13	
.ORG $0000	
	
	; Data from 34000 to 37FFF (16384 bytes)
	;.incbin "data/File12_34000_37FFF.dat"


; Data from 34000 to 3400F (16 bytes)	
_VanHalen1995__palette__bin:	
	.incbin "banks/bank13/VanHalen1995 (palette).bin"
	;.db $00 $00 $00 $01 $01 $01 $15 $15 $06 $16 $16 $1B $1B $2F $3F $2B
	
; Data from 34010 to 3409E (143 bytes)	
_VanHalen1995__tilemap__stmcompr:	
	.incbin "banks/bank13/VanHalen1995 (tilemap).stmcompr"
	;.db $FD $00 $29 $00 $04 $01 $05 $00 $08 $01 $00 $01 $02 $16 $04 $02
	;.db $31 $00 $5B $03 $19 $00 $5F $1B $15 $00 $5F $34 $11 $00 $63 $4D
	;.db $11 $00 $5F $67 $19 $00 $5B $80 $19 $00 $5B $98 $19 $00 $2F $B0
	;.db $04 $A2 $23 $BD $19 $00 $5B $C7 $15 $00 $5F $DF $15 $00 $36 $04
	;.db $33 $5B $F8 $02 $04 $33 $15 $00 $0A $5B $10 $02 $04 $4C $15 $00
	;.db $0A $5B $28 $06 $19 $00 $5F $40 $02 $11 $00 $12 $04 $33 $0A $5F
	;.db $59 $06 $11 $00 $5F $72 $02 $04 $66 $11 $00 $0A $63 $8B $06 $15
	;.db $00 $5F $A5 $06 $1D $00 $04 $BE $06 $11 $00 $07 $BF $06 $01 $00
	;.db $04 $C2 $06 $05 $00 $03 $C3 $0B $C4 $02 $FD $00 $05 $00 $00
	
; Data from 3409F to 37FFF (16225 bytes)	
_VanHalen1995__tiles__psgcompr:	
	.incbin "banks/bank13/VanHalen1995 (tiles).psgcompr"
	;.incbin ...
	


.BANK 14	
.ORG $0000	
	
	; Data from 38000 to 3BFFF (16384 bytes)
	;.incbin "data/File13_38000_3BFFF.dat"


; Data from 38000 to 3800F (16 bytes)	
_VanHalen1998__palette__bin:	
	.incbin "banks/bank14/VanHalen1998 (palette).bin"
	;.db $00 $00 $00 $00 $01 $05 $15 $16 $1A $2B $2F $3F $3F $3F $2B $2A
	
; Data from 38010 to 380C6 (183 bytes)	
_VanHalen1998__tilemap__stmcompr:
	.incbin "banks/bank14/VanHalen1998 (tilemap).stmcompr"
	;.db $FD $00 $85 $00 $03 $01 $0D $00 $07 $03 $29 $00 $04 $01 $1D $00
	;.db $0B $06 $04 $00 $0F $0A $29 $00 $04 $0F $1D $00 $33 $10 $04 $00
	;.db $1F $1E $19 $00 $5B $27 $19 $00 $03 $3F $53 $40 $19 $00 $01 $40
	;.db $53 $56 $19 $00 $5B $6C $19 $00 $5B $84 $19 $00 $2B $9C $04 $00
	;.db $27 $A8 $19 $00 $1B $B3 $08 $00 $1E $03 $BB $04 $00 $27 $BD $19
	;.db $00 $37 $C8 $16 $04 $1E $01 $00 $13 $D7 $19 $00 $43 $DD $16 $04
	;.db $01 $2D $00 $5B $EF $06 $19 $00 $53 $07 $1A $04 $06 $02 $1D $00
	;.db $0A $4F $1D $02 $04 $01 $16 $04 $1E $1D $00 $0A $0B $32 $06 $04
	;.db $00 $37 $36 $06 $04 $00 $04 $45 $06 $04 $00 $04 $46 $06 $19 $00
	;.db $0B $47 $06 $04 $00 $04 $4B $36 $04 $90 $2B $4C $1E $04 $06 $04
	;.db $58 $06 $25 $00 $3B $59 $2A $04 $46 $22 $04 $01 $02 $35 $00 $0E
	;.db $04 $69 $FD $00 $5D $00 $00
	
; Data from 380C7 to 3BFFF (16185 bytes)	
_VanHalen1998__tiles__psgcompr:	
	.incbin "banks/bank14/VanHalen1998 (tiles).psgcompr"
	;.incbin ...


.BANK 15	
.ORG $0000	
	
	; Data from 3C000 to 3FFFF (16384 bytes)
	;.incbin "data/File14_3C000_3FFFF.dat"
	
; Data from 3C000 to 3C00F (16 bytes)	
_VanHalen2012__palette__bin:
	.incbin "banks/bank15/VanHalen2012 (palette).bin"
	;.db $00 $00 $01 $15 $15 $1A $02 $03 $2A $2B $2A $2A $2F $2F $3F $2A
	
; Data from 3C010 to 3C079 (106 bytes)	
_VanHalen2012__tilemap__stmcompr:
	.incbin "banks/bank15/VanHalen2012 (tilemap).stmcompr"
	;.db $FD $00 $85 $00 $5B $01 $19 $00 $5B $19 $19 $00 $5B $31 $19 $00
	;.db $5B $49 $19 $00 $5B $61 $19 $00 $5B $79 $19 $00 $5B $91 $19 $00
	;.db $5B $A9 $19 $00 $5B $C1 $19 $00 $5B $D9 $19 $00 $07 $F1 $04 $00
	;.db $4B $F4 $06 $19 $00 $5B $08 $06 $19 $00 $5B $20 $06 $19 $00 $5B
	;.db $38 $06 $19 $00 $5B $50 $06 $19 $00 $5B $68 $06 $19 $00 $5B $80
	;.db $06 $15 $00 $5F $98 $06 $19 $00 $1F $B1 $02 $29 $00 $1E $04 $B7
	;.db $04 $00 $0E $04 $BA $FD $00 $05 $00 $00
	
; Data from 3C07A to 3FFFF (16262 bytes)	
_VanHalen2012__tiles__psgcompr:	
	.incbin "banks/bank15/VanHalen2012 (tiles).psgcompr"
	;.incbin ...