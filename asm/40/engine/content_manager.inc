_engine_content_manager_load_til:
		ld hl, $0000
		push hl
		ld hl, _font__tiles__psgcompr	; _font__tiles__psgcompr = $17A2
		push hl
		call A$_sms_manager$400
		pop af
		pop af
		ld bc, _font__palette__bin	; _font__palette__bin = $1712
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
H$engine_content_manager_load_ti:
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