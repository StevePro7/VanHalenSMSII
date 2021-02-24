; .sdsctag 1.0,"Van Halen","Van Halen Record Covers for the SMS Power! 2021 Competition","StevePro Studios"

.include "devkit/memory_manager.inc"
.include "devkit/enum_manager.inc"
.include "devkit/define_manager.inc"

;.include "content/gfx.inc"

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


; ; object
; .include "object/cursor_object.inc"
; .include "object/record_object.inc"


; ; screen
; .include "screen/none_screen.inc"
; .include "screen/splash_screen.inc"	
; .include "screen/title_screen.inc"	
; .include "screen/scroll_screen.inc"
; .include "screen/select_screen.inc"
; .include "screen/record_screen.inc"
; .include "screen/detail_screen.inc"
; .include "screen/test_screen.inc"
; .include "screen/func_screen.inc"

	
; Data from 1146 to 1149 (4 bytes)	
G$cursor_gridX$0$0:
_cursor_gridX:
	.db $04 $0B $12 $19
	
; Data from 114A to 114C (3 bytes)	
G$cursor_gridY$0$0:
_cursor_gridY:
	.db $10 $13 $16
	
; Data from 114D to 1151 (5 bytes)	
Fcursor_object$__str_0$0$0:
	.db $31 $39 $37 $38 $00
	
; Data from 1152 to 1156 (5 bytes)	
Fcursor_object$__str_1$0$0:
	.db $31 $39 $37 $39 $00
	
; Data from 1157 to 115B (5 bytes)	
Fcursor_object$__str_2$0$0:
	.db $31 $39 $38 $30 $00
	
; Data from 115C to 1160 (5 bytes)	
Fcursor_object$__str_3$0$0:
	.db $31 $39 $38 $31 $00
	
; Data from 1161 to 1165 (5 bytes)	
Fcursor_object$__str_4$0$0:
	.db $31 $39 $38 $32 $00
	
; Data from 1166 to 116A (5 bytes)	
Fcursor_object$__str_5$0$0:
	.db $31 $39 $38 $34 $00
	
; Data from 116B to 116F (5 bytes)	
Fcursor_object$__str_6$0$0:
	.db $31 $39 $38 $36 $00
	
; Data from 1170 to 1174 (5 bytes)	
Fcursor_object$__str_7$0$0:
	.db $31 $39 $38 $38 $00
	
; Data from 1175 to 1179 (5 bytes)	
Fcursor_object$__str_8$0$0:
	.db $31 $39 $39 $31 $00
	
; Data from 117A to 117E (5 bytes)	
Fcursor_object$__str_9$0$0:
	.db $31 $39 $39 $35 $00
	
; Data from 117F to 1183 (5 bytes)	
Fcursor_object$__str_10$0$0:
	.db $31 $39 $39 $38 $00
	
; Data from 1184 to 1188 (5 bytes)	
Fcursor_object$__str_11$0$0:
	.db $32 $30 $31 $32 $00
	
; Data from 1189 to 1194 (12 bytes)	
G$record_tiles_bank$0$0:
_record_tiles_bank:
	.db $04 $05 $06 $07 $08 $09 $0A $0B $0C $0D $0E $0F
	
; Data from 1195 to 1195 (1 bytes)	
A$none_screen$60:
C$none_screen.c$4$0$0:
C$none_screen.c$6$0$0:
G$screen_none_screen_load$0$0:
XG$screen_none_screen_load$0$0:
_screen_none_screen_load:
	.db $C9
	
; Data from 1196 to 1196 (1 bytes)	
A$none_screen$73:
C$none_screen.c$10$1$4:
C$none_screen.c$8$0$0:
G$screen_none_screen_update$0$0:
_screen_none_screen_update:
	.db $D1
	
; Data from 1197 to 1197 (1 bytes)	
A$none_screen$74:
	.db $C1
	
; Data from 1198 to 1198 (1 bytes)	
A$none_screen$75:
	.db $C5
	
; Data from 1199 to 1199 (1 bytes)	
A$none_screen$76:
	.db $D5
	
; Data from 119A to 119A (1 bytes)	
A$none_screen$77:
	.db $AF
	
; Data from 119B to 119B (1 bytes)	
A$none_screen$78:
	.db $02
	
; Data from 119C to 119C (1 bytes)	
A$none_screen$83:
C$none_screen.c$11$1$4:
XG$screen_none_screen_update$0$0:
	.db $C9
	
; Data from 119D to 119F (3 bytes)	
A$splash_screen$69:
C$splash_screen.c$14$0$0:
C$splash_screen.c$16$1$25:
G$screen_splash_screen_load$0$0:
_screen_splash_screen_load:
	.db $CD $2B $08
	
; Data from 11A0 to 11A2 (3 bytes)	
A$splash_screen$73:
C$splash_screen.c$17$1$25:
	.db $CD $A2 $0A
	
; Data from 11A3 to 11A5 (3 bytes)	
A$splash_screen$77:
C$splash_screen.c$18$1$25:
	.db $CD $B8 $0A
	
; Data from 11A6 to 11A8 (3 bytes)	
A$splash_screen$81:
C$splash_screen.c$19$1$25:
	.db $CD $25 $08
	
; Data from 11A9 to 11AB (3 bytes)	
A$splash_screen$85:
C$splash_screen.c$21$1$25:
	.db $21 $96 $00
	
; Data from 11AC to 11AC (1 bytes)	
A$splash_screen$86:
	.db $E5
	
; Data from 11AD to 11AF (3 bytes)	
A$splash_screen$87:
	.db $CD $CD $10
	
; Data from 11B0 to 11B2 (3 bytes)	
A$splash_screen$91:
C$splash_screen.c$22$1$25:
	.db $21 $4B $00
	
; Data from 11B3 to 11B3 (1 bytes)	
A$splash_screen$92:
	.db $E3
	
; Data from 11B4 to 11B6 (3 bytes)	
A$splash_screen$93:
	.db $CD $08 $11
	
; Data from 11B7 to 11B7 (1 bytes)	
A$splash_screen$94:
	.db $F1
	
; Data from 11B8 to 11B8 (1 bytes)	
A$splash_screen$99:
C$splash_screen.c$23$1$25:
XG$screen_splash_screen_load$0$0:
	.db $C9
	
; Data from 11B9 to 11BA (2 bytes)	
A$splash_screen$109:
C$splash_screen.c$25$1$25:
G$screen_splash_screen_update$0$:
_screen_splash_screen_update:
	.db $DD $E5
	
; Data from 11BB to 11BE (4 bytes)	
A$splash_screen$110:
	.db $DD $21 $00 $00
	
; Data from 11BF to 11C0 (2 bytes)	
A$splash_screen$111:
	.db $DD $39
	
; Data from 11C1 to 11C1 (1 bytes)	
A$splash_screen$112:
	.db $F5
	
; Data from 11C2 to 11C4 (3 bytes)	
A$splash_screen$116:
C$splash_screen.c$32$1$27:
	.db $CD $E6 $10
	
; Data from 11C5 to 11C7 (3 bytes)	
A$splash_screen$117:
	.db $DD $75 $FE
	
; Data from 11C8 to 11C9 (2 bytes)	
A$splash_screen$121:
C$splash_screen.c$33$1$27:
	.db $3E $10
	
; Data from 11CA to 11CA (1 bytes)	
A$splash_screen$122:
	.db $F5
	
; Data from 11CB to 11CB (1 bytes)	
A$splash_screen$123:
	.db $33
	
; Data from 11CC to 11CE (3 bytes)	
A$splash_screen$124:
	.db $CD $D3 $0E
	
; Data from 11CF to 11CF (1 bytes)	
A$splash_screen$125:
	.db $33
	
; Data from 11D0 to 11D2 (3 bytes)	
A$splash_screen$126:
	.db $DD $75 $FF
	
; Data from 11D3 to 11D4 (2 bytes)	
A$splash_screen$130:
C$splash_screen.c$34$1$27:
	.db $3E $20
	
; Data from 11D5 to 11D5 (1 bytes)	
A$splash_screen$131:
	.db $F5
	
; Data from 11D6 to 11D6 (1 bytes)	
A$splash_screen$132:
	.db $33
	
; Data from 11D7 to 11D9 (3 bytes)	
A$splash_screen$133:
	.db $CD $00 $0F
	
; Data from 11DA to 11DA (1 bytes)	
A$splash_screen$134:
	.db $33
	
; Data from 11DB to 11DB (1 bytes)	
A$splash_screen$138:
C$splash_screen.c$35$1$27:
	.db $7D
	
; Data from 11DC to 11DC (1 bytes)	
A$splash_screen$139:
	.db $B7
	
; Data from 11DD to 11DE (2 bytes)	
A$splash_screen$140:
	.db $28 $1C
	
; Data from 11DF to 11E1 (3 bytes)	
A$splash_screen$144:
C$splash_screen.c$37$2$28:
	.db $CD $1D $11
	
; Data from 11E2 to 11E2 (1 bytes)	
A$splash_screen$148:
C$splash_screen.c$38$2$28:
	.db $7D
	
; Data from 11E3 to 11E3 (1 bytes)	
A$splash_screen$149:
	.db $B7
	
; Data from 11E4 to 11E5 (2 bytes)	
A$splash_screen$150:
	.db $28 $18
	
; Data from 11E6 to 11E8 (3 bytes)	
A$splash_screen$154:
C$splash_screen.c$40$3$29:
	.db $CD $AB $10
	
; Data from 11E9 to 11EB (3 bytes)	
A$splash_screen$158:
C$splash_screen.c$42$3$29:
	.db $CD $3F $11
	
; Data from 11EC to 11EE (3 bytes)	
A$splash_screen$162:
C$splash_screen.c$43$3$29:
	.db $21 $1C $17
	
; Data from 11EF to 11EF (1 bytes)	
A$splash_screen$163:
	.db $E5
	
; Data from 11F0 to 11F2 (3 bytes)	
A$splash_screen$164:
	.db $21 $1B $12
	
; Data from 11F3 to 11F3 (1 bytes)	
A$splash_screen$165:
	.db $E5
	
; Data from 11F4 to 11F6 (3 bytes)	
A$splash_screen$166:
	.db $CD $E9 $0D
	
; Data from 11F7 to 11F7 (1 bytes)	
A$splash_screen$167:
	.db $F1
	
; Data from 11F8 to 11F8 (1 bytes)	
A$splash_screen$168:
	.db $F1
	
; Data from 11F9 to 11FA (2 bytes)	
A$splash_screen$169:
	.db $18 $03
	
; Data from 11FB to 11FD (3 bytes)	
A$splash_screen$174:
C$splash_screen.c$48$2$30:
	.db $CD $3F $11
	
; Data from 11FE to 1200 (3 bytes)	
A$splash_screen$179:
C$splash_screen.c$53$1$27:
	.db $DD $6E $04
	
; Data from 1201 to 1203 (3 bytes)	
A$splash_screen$180:
	.db $DD $66 $05
	
; Data from 1204 to 1206 (3 bytes)	
A$splash_screen$184:
C$splash_screen.c$51$1$27:
	.db $DD $7E $FE
	
; Data from 1207 to 1207 (1 bytes)	
A$splash_screen$185:
	.db $B7
	
; Data from 1208 to 1209 (2 bytes)	
A$splash_screen$186:
	.db $20 $06
	
; Data from 120A to 120C (3 bytes)	
A$splash_screen$187:
	.db $DD $7E $FF
	
; Data from 120D to 120D (1 bytes)	
A$splash_screen$188:
	.db $B7
	
; Data from 120E to 120F (2 bytes)	
A$splash_screen$189:
	.db $28 $04
	
; Data from 1210 to 1211 (2 bytes)	
A$splash_screen$194:
C$splash_screen.c$53$2$31:
	.db $36 $02
	
; Data from 1212 to 1213 (2 bytes)	
A$splash_screen$198:
C$splash_screen.c$54$2$31:
	.db $18 $02
	
; Data from 1214 to 1215 (2 bytes)	
A$splash_screen$203:
C$splash_screen.c$57$1$27:
	.db $36 $01
	
; Data from 1216 to 1217 (2 bytes)	
A$splash_screen$205:
	.db $DD $F9
	
; Data from 1218 to 1219 (2 bytes)	
A$splash_screen$206:
	.db $DD $E1
	
; Data from 121A to 121A (1 bytes)	
A$splash_screen$211:
C$splash_screen.c$58$1$27:
XG$screen_splash_screen_update$0:
	.db $C9
	
; Data from 121B to 121F (5 bytes)	
Fsplash_screen$__str_0$0$0:
	.db $35 $31 $35 $30 $00
	
; Data from 1220 to 1222 (3 bytes)	
A$title_screen$81:
C$title_screen.c$20$0$0:
C$title_screen.c$22$1$28:
C$title_screen.c$25$1$28:
G$screen_title_screen_load$0$0:
_screen_title_screen_load:
	.db $CD $2B $08
	
; Data from 1223 to 1225 (3 bytes)	
A$title_screen$85:
C$title_screen.c$26$1$28:
	.db $CD $A2 $0A
	
; Data from 1226 to 1228 (3 bytes)	
A$title_screen$89:
C$title_screen.c$27$1$28:
	.db $CD $51 $0B
	
; Data from 1229 to 122B (3 bytes)	
A$title_screen$93:
C$title_screen.c$28$1$28:
	.db $CD $E3 $0A
	
; Data from 122C to 122E (3 bytes)	
A$title_screen$97:
C$title_screen.c$29$1$28:
	.db $21 $0A $15
	
; Data from 122F to 122F (1 bytes)	
A$title_screen$98:
	.db $E5
	
; Data from 1230 to 1232 (3 bytes)	
A$title_screen$99:
	.db $21 $9F $12
	
; Data from 1233 to 1233 (1 bytes)	
A$title_screen$100:
	.db $E5
	
; Data from 1234 to 1236 (3 bytes)	
A$title_screen$101:
	.db $CD $E9 $0D
	
; Data from 1237 to 1237 (1 bytes)	
A$title_screen$102:
	.db $F1
	
; Data from 1238 to 123A (3 bytes)	
A$title_screen$106:
C$title_screen.c$31$1$28:
	.db $21 $06 $0C
	
; Data from 123B to 123B (1 bytes)	
A$title_screen$107:
	.db $E3
	
; Data from 123C to 123E (3 bytes)	
A$title_screen$108:
	.db $21 $AB $12
	
; Data from 123F to 123F (1 bytes)	
A$title_screen$109:
	.db $E5
	
; Data from 1240 to 1242 (3 bytes)	
A$title_screen$110:
	.db $CD $E9 $0D
	
; Data from 1243 to 1243 (1 bytes)	
A$title_screen$111:
	.db $F1
	
; Data from 1244 to 1246 (3 bytes)	
A$title_screen$115:
C$title_screen.c$32$1$28:
	.db $21 $14 $0C
	
; Data from 1247 to 1247 (1 bytes)	
A$title_screen$116:
	.db $E3
	
; Data from 1248 to 124A (3 bytes)	
A$title_screen$117:
	.db $21 $B2 $12
	
; Data from 124B to 124B (1 bytes)	
A$title_screen$118:
	.db $E5
	
; Data from 124C to 124E (3 bytes)	
A$title_screen$119:
	.db $CD $E9 $0D
	
; Data from 124F to 124F (1 bytes)	
A$title_screen$120:
	.db $F1
	
; Data from 1250 to 1252 (3 bytes)	
A$title_screen$124:
C$title_screen.c$33$1$28:
	.db $21 $1C $17
	
; Data from 1253 to 1253 (1 bytes)	
A$title_screen$125:
	.db $E3
	
; Data from 1254 to 1256 (3 bytes)	
A$title_screen$126:
	.db $21 $B9 $12
	
; Data from 1257 to 1257 (1 bytes)	
A$title_screen$127:
	.db $E5
	
; Data from 1258 to 125A (3 bytes)	
A$title_screen$128:
	.db $CD $E9 $0D
	
; Data from 125B to 125B (1 bytes)	
A$title_screen$129:
	.db $F1
	
; Data from 125C to 125C (1 bytes)	
A$title_screen$130:
	.db $F1
	
; Data from 125D to 125F (3 bytes)	
A$title_screen$134:
C$title_screen.c$34$1$28:
	.db $CD $25 $08
	
; Data from 1260 to 1262 (3 bytes)	
A$title_screen$138:
C$title_screen.c$36$1$28:
	.db $21 $32 $00
	
; Data from 1263 to 1263 (1 bytes)	
A$title_screen$139:
	.db $E5
	
; Data from 1264 to 1266 (3 bytes)	
A$title_screen$140:
	.db $CD $CD $10
	
; Data from 1267 to 1269 (3 bytes)	
A$title_screen$144:
C$title_screen.c$37$1$28:
	.db $21 $4B $00
	
; Data from 126A to 126A (1 bytes)	
A$title_screen$145:
	.db $E3
	
; Data from 126B to 126D (3 bytes)	
A$title_screen$146:
	.db $CD $08 $11
	
; Data from 126E to 126E (1 bytes)	
A$title_screen$147:
	.db $F1
	
; Data from 126F to 126F (1 bytes)	
A$title_screen$151:
C$title_screen.c$40$1$28:
	.db $AF
	
; Data from 1270 to 1270 (1 bytes)	
A$title_screen$152:
	.db $F5
	
; Data from 1271 to 1271 (1 bytes)	
A$title_screen$153:
	.db $33
	
; Data from 1272 to 1274 (3 bytes)	
A$title_screen$154:
	.db $CD $0B $0F
	
; Data from 1275 to 1275 (1 bytes)	
A$title_screen$155:
	.db $33
	
; Data from 1276 to 1278 (3 bytes)	
A$title_screen$159:
C$title_screen.c$42$1$28:
	.db $CD $42 $10
	
; Data from 1279 to 1279 (1 bytes)	
A$title_screen$163:
C$title_screen.c$43$1$28:
	.db $7D
	
; Data from 127A to 127A (1 bytes)	
A$title_screen$164:
	.db $B7
	
; Data from 127B to 127C (2 bytes)	
A$title_screen$165:
	.db $28 $03
	
; Data from 127D to 127F (3 bytes)	
A$title_screen$169:
C$title_screen.c$45$2$29:
	.db $CD $71 $10
	
; Data from 1280 to 1282 (3 bytes)	
A$title_screen$174:
C$title_screen.c$48$1$28:
	.db $21 $2A $C0
	
; Data from 1283 to 1283 (1 bytes)	
A$title_screen$175:
	.db $46
	
; Data from 1284 to 1284 (1 bytes)	
A$title_screen$176:
	.db $C5
	
; Data from 1285 to 1285 (1 bytes)	
A$title_screen$177:
	.db $33
	
; Data from 1286 to 1288 (3 bytes)	
A$title_screen$178:
	.db $CD $0B $0F
	
; Data from 1289 to 1289 (1 bytes)	
A$title_screen$179:
	.db $33
	
; Data from 128A to 128C (3 bytes)	
A$title_screen$183:
C$title_screen.c$49$1$28:
	.db $21 $2A $C0
	
; Data from 128D to 128D (1 bytes)	
A$title_screen$184:
	.db $46
	
; Data from 128E to 128E (1 bytes)	
A$title_screen$185:
	.db $C5
	
; Data from 128F to 128F (1 bytes)	
A$title_screen$186:
	.db $33
	
; Data from 1290 to 1292 (3 bytes)	
A$title_screen$187:
	.db $CD $67 $0B
	
; Data from 1293 to 1293 (1 bytes)	
A$title_screen$188:
	.db $33
	
; Data from 1294 to 1296 (3 bytes)	
A$title_screen$192:
C$title_screen.c$51$1$28:
	.db $21 $54 $C0
	
; Data from 1297 to 1298 (2 bytes)	
A$title_screen$193:
	.db $36 $00
	
; Data from 1299 to 129B (3 bytes)	
A$title_screen$197:
C$title_screen.c$52$1$28:
	.db $21 $55 $C0
	
; Data from 129C to 129D (2 bytes)	
A$title_screen$198:
	.db $36 $00
	
; Data from 129E to 129E (1 bytes)	
A$title_screen$203:
C$title_screen.c$53$1$28:
XG$screen_title_screen_load$0$0:
	.db $C9
	
; Data from 129F to 12AA (12 bytes)	
Ftitle_screen$__str_0$0$0:
	.db $50 $52 $45 $53 $53 $20 $53 $54 $41 $52 $54 $00
	
; Data from 12AB to 12B1 (7 bytes)	
Ftitle_screen$__str_1$0$0:
	.db $52 $45 $43 $4F $52 $44 $00
	
; Data from 12B2 to 12B8 (7 bytes)	
Ftitle_screen$__str_2$0$0:
	.db $43 $4F $56 $45 $52 $53 $00
	
; Data from 12B9 to 12BD (5 bytes)	
Ftitle_screen$__str_3$0$0:
	.db $56 $31 $2E $30 $00
	
; Data from 12BE to 12BF (2 bytes)	
A$title_screen$229:
C$title_screen.c$55$1$28:
G$screen_title_screen_update$0$0:
_screen_title_screen_update:
	.db $DD $E5
	
; Data from 12C0 to 12C3 (4 bytes)	
A$title_screen$230:
	.db $DD $21 $00 $00
	
; Data from 12C4 to 12C5 (2 bytes)	
A$title_screen$231:
	.db $DD $39
	
; Data from 12C6 to 12C6 (1 bytes)	
A$title_screen$232:
	.db $F5
	
; Data from 12C7 to 12C7 (1 bytes)	
A$title_screen$233:
	.db $3B
	
; Data from 12C8 to 12CA (3 bytes)	
A$title_screen$237:
C$title_screen.c$69$1$31:
	.db $DD $7E $04
	
; Data from 12CB to 12CD (3 bytes)	
A$title_screen$238:
	.db $DD $77 $FE
	
; Data from 12CE to 12D0 (3 bytes)	
A$title_screen$239:
	.db $DD $7E $05
	
; Data from 12D1 to 12D3 (3 bytes)	
A$title_screen$240:
	.db $DD $77 $FF
	
; Data from 12D4 to 12D6 (3 bytes)	
A$title_screen$244:
C$title_screen.c$60$1$31:
	.db $3A $54 $C0
	
; Data from 12D7 to 12D7 (1 bytes)	
A$title_screen$245:
	.db $3D
	
; Data from 12D8 to 12D9 (2 bytes)	
A$title_screen$246:
	.db $20 $36
	
; Data from 12DA to 12DC (3 bytes)	
A$title_screen$250:
C$title_screen.c$62$2$32:
	.db $CD $1D $11
	
; Data from 12DD to 12DD (1 bytes)	
A$title_screen$251:
	.db $4D
	
; Data from 12DE to 12DE (1 bytes)	
A$title_screen$255:
C$title_screen.c$63$2$32:
	.db $79
	
; Data from 12DF to 12DF (1 bytes)	
A$title_screen$256:
	.db $B7
	
; Data from 12E0 to 12E1 (2 bytes)	
A$title_screen$257:
	.db $28 $1B
	
; Data from 12E2 to 12E2 (1 bytes)	
A$title_screen$261:
C$title_screen.c$65$3$33:
	.db $C5
	
; Data from 12E3 to 12E5 (3 bytes)	
A$title_screen$262:
	.db $21 $0A $15
	
; Data from 12E6 to 12E6 (1 bytes)	
A$title_screen$263:
	.db $E5
	
; Data from 12E7 to 12E9 (3 bytes)	
A$title_screen$264:
	.db $21 $71 $13
	
; Data from 12EA to 12EA (1 bytes)	
A$title_screen$265:
	.db $E5
	
; Data from 12EB to 12ED (3 bytes)	
A$title_screen$266:
	.db $CD $E9 $0D
	
; Data from 12EE to 12EE (1 bytes)	
A$title_screen$267:
	.db $F1
	
; Data from 12EF to 12F1 (3 bytes)	
A$title_screen$268:
	.db $21 $15 $17
	
; Data from 12F2 to 12F2 (1 bytes)	
A$title_screen$269:
	.db $E3
	
; Data from 12F3 to 12F5 (3 bytes)	
A$title_screen$270:
	.db $21 $71 $13
	
; Data from 12F6 to 12F6 (1 bytes)	
A$title_screen$271:
	.db $E5
	
; Data from 12F7 to 12F9 (3 bytes)	
A$title_screen$272:
	.db $CD $E9 $0D
	
; Data from 12FA to 12FA (1 bytes)	
A$title_screen$273:
	.db $F1
	
; Data from 12FB to 12FB (1 bytes)	
A$title_screen$274:
	.db $F1
	
; Data from 12FC to 12FC (1 bytes)	
A$title_screen$275:
	.db $C1
	
; Data from 12FD to 12FD (1 bytes)	
A$title_screen$280:
C$title_screen.c$69$2$32:
	.db $79
	
; Data from 12FE to 12FE (1 bytes)	
A$title_screen$281:
	.db $B7
	
; Data from 12FF to 1300 (2 bytes)	
A$title_screen$282:
	.db $28 $04
	
; Data from 1301 to 1302 (2 bytes)	
A$title_screen$283:
	.db $0E $03
	
; Data from 1303 to 1304 (2 bytes)	
A$title_screen$284:
	.db $18 $02
	
; Data from 1305 to 1306 (2 bytes)	
A$title_screen$286:
	.db $0E $02
	
; Data from 1307 to 1309 (3 bytes)	
A$title_screen$288:
	.db $DD $6E $FE
	
; Data from 130A to 130C (3 bytes)	
A$title_screen$289:
	.db $DD $66 $FF
	
; Data from 130D to 130D (1 bytes)	
A$title_screen$290:
	.db $71
	
; Data from 130E to 130F (2 bytes)	
A$title_screen$294:
C$title_screen.c$70$2$32:
	.db $18 $5C
	
; Data from 1310 to 1312 (3 bytes)	
A$title_screen$299:
C$title_screen.c$73$1$31:
	.db $CD $E6 $10
	
; Data from 1313 to 1315 (3 bytes)	
A$title_screen$303:
C$title_screen.c$74$1$31:
	.db $DD $75 $FD
	
; Data from 1316 to 1316 (1 bytes)	
A$title_screen$304:
	.db $7D
	
; Data from 1317 to 1317 (1 bytes)	
A$title_screen$305:
	.db $B7
	
; Data from 1318 to 1319 (2 bytes)	
A$title_screen$306:
	.db $28 $29
	
; Data from 131A to 131C (3 bytes)	
A$title_screen$310:
C$title_screen.c$76$2$34:
	.db $21 $55 $C0
	
; Data from 131D to 131E (2 bytes)	
A$title_screen$311:
	.db $3E $01
	
; Data from 131F to 131F (1 bytes)	
A$title_screen$312:
	.db $96
	
; Data from 1320 to 1320 (1 bytes)	
A$title_screen$313:
	.db $77
	
; Data from 1321 to 1323 (3 bytes)	
A$title_screen$317:
C$title_screen.c$77$2$34:
	.db $3A $55 $C0
	
; Data from 1324 to 1324 (1 bytes)	
A$title_screen$318:
	.db $B7
	
; Data from 1325 to 1326 (2 bytes)	
A$title_screen$319:
	.db $28 $0F
	
; Data from 1327 to 1329 (3 bytes)	
A$title_screen$323:
C$title_screen.c$79$3$35:
	.db $21 $0A $15
	
; Data from 132A to 132A (1 bytes)	
A$title_screen$324:
	.db $E5
	
; Data from 132B to 132D (3 bytes)	
A$title_screen$325:
	.db $21 $71 $13
	
; Data from 132E to 132E (1 bytes)	
A$title_screen$326:
	.db $E5
	
; Data from 132F to 1331 (3 bytes)	
A$title_screen$327:
	.db $CD $E9 $0D
	
; Data from 1332 to 1332 (1 bytes)	
A$title_screen$328:
	.db $F1
	
; Data from 1333 to 1333 (1 bytes)	
A$title_screen$329:
	.db $F1
	
; Data from 1334 to 1335 (2 bytes)	
A$title_screen$330:
	.db $18 $0D
	
; Data from 1336 to 1338 (3 bytes)	
A$title_screen$335:
C$title_screen.c$83$3$36:
	.db $21 $0A $15
	
; Data from 1339 to 1339 (1 bytes)	
A$title_screen$336:
	.db $E5
	
; Data from 133A to 133C (3 bytes)	
A$title_screen$337:
	.db $21 $7D $13
	
; Data from 133D to 133D (1 bytes)	
A$title_screen$338:
	.db $E5
	
; Data from 133E to 1340 (3 bytes)	
A$title_screen$339:
	.db $CD $E9 $0D
	
; Data from 1341 to 1341 (1 bytes)	
A$title_screen$340:
	.db $F1
	
; Data from 1342 to 1342 (1 bytes)	
A$title_screen$341:
	.db $F1
	
; Data from 1343 to 1344 (2 bytes)	
A$title_screen$346:
C$title_screen.c$87$1$31:
	.db $3E $10
	
; Data from 1345 to 1345 (1 bytes)	
A$title_screen$347:
	.db $F5
	
; Data from 1346 to 1346 (1 bytes)	
A$title_screen$348:
	.db $33
	
; Data from 1347 to 1349 (3 bytes)	
A$title_screen$349:
	.db $CD $D3 $0E
	
; Data from 134A to 134A (1 bytes)	
A$title_screen$350:
	.db $33
	
; Data from 134B to 134B (1 bytes)	
A$title_screen$354:
C$title_screen.c$88$1$31:
	.db $7D
	
; Data from 134C to 134C (1 bytes)	
A$title_screen$355:
	.db $B7
	
; Data from 134D to 134E (2 bytes)	
A$title_screen$356:
	.db $28 $15
	
; Data from 134F to 1351 (3 bytes)	
A$title_screen$360:
C$title_screen.c$90$2$37:
	.db $21 $0A $15
	
; Data from 1352 to 1352 (1 bytes)	
A$title_screen$361:
	.db $E5
	
; Data from 1353 to 1355 (3 bytes)	
A$title_screen$362:
	.db $21 $7D $13
	
; Data from 1356 to 1356 (1 bytes)	
A$title_screen$363:
	.db $E5
	
; Data from 1357 to 1359 (3 bytes)	
A$title_screen$364:
	.db $CD $E9 $0D
	
; Data from 135A to 135A (1 bytes)	
A$title_screen$365:
	.db $F1
	
; Data from 135B to 135B (1 bytes)	
A$title_screen$366:
	.db $F1
	
; Data from 135C to 135E (3 bytes)	
A$title_screen$370:
C$title_screen.c$91$2$37:
	.db $CD $70 $0A
	
; Data from 135F to 1361 (3 bytes)	
A$title_screen$374:
C$title_screen.c$93$2$37:
	.db $21 $54 $C0
	
; Data from 1362 to 1363 (2 bytes)	
A$title_screen$375:
	.db $36 $01
	
; Data from 1364 to 1366 (3 bytes)	
A$title_screen$380:
C$title_screen.c$96$1$31:
	.db $DD $6E $FE
	
; Data from 1367 to 1369 (3 bytes)	
A$title_screen$381:
	.db $DD $66 $FF
	
; Data from 136A to 136B (2 bytes)	
A$title_screen$382:
	.db $36 $02
	
; Data from 136C to 136D (2 bytes)	
A$title_screen$384:
	.db $DD $F9
	
; Data from 136E to 136F (2 bytes)	
A$title_screen$385:
	.db $DD $E1
	
; Data from 1370 to 1370 (1 bytes)	
A$title_screen$390:
C$title_screen.c$97$1$31:
XG$screen_title_screen_update$0$:
	.db $C9
	
; Data from 1371 to 137C (12 bytes)	
Ftitle_screen$__str_4$0$0:
	.dsb 11, $20
	.db $00
	
; Data from 137D to 1388 (12 bytes)	
Ftitle_screen$__str_5$0$0:
	.db $50 $52 $45 $53 $53 $20 $53 $54 $41 $52 $54 $00
	
; Data from 1389 to 138B (3 bytes)	
A$scroll_screen$62:
C$scroll_screen.c$14$0$0:
C$scroll_screen.c$16$1$24:
G$screen_scroll_screen_load$0$0:
_screen_scroll_screen_load:
	.db $21 $56 $C0
	
; Data from 138C to 138D (2 bytes)	
A$scroll_screen$63:
	.db $36 $00
	
; Data from 138E to 138E (1 bytes)	
A$scroll_screen$68:
C$scroll_screen.c$17$1$24:
XG$screen_scroll_screen_load$0$0:
	.db $C9
	
; Data from 138F to 138F (1 bytes)	
A$scroll_screen$78:
C$scroll_screen.c$19$1$24:
G$screen_scroll_screen_update$0$:
_screen_scroll_screen_update:
	.db $3B
	
; Data from 1390 to 1392 (3 bytes)	
A$scroll_screen$82:
C$scroll_screen.c$24$1$26:
	.db $3A $56 $C0
	
; Data from 1393 to 1394 (2 bytes)	
A$scroll_screen$83:
	.db $D6 $20
	
; Data from 1395 to 1396 (2 bytes)	
A$scroll_screen$84:
	.db $20 $04
	
; Data from 1397 to 1398 (2 bytes)	
A$scroll_screen$85:
	.db $3E $01
	
; Data from 1399 to 139A (2 bytes)	
A$scroll_screen$86:
	.db $18 $01
	
; Data from 139B to 139B (1 bytes)	
A$scroll_screen$88:
	.db $AF
	
; Data from 139C to 139C (1 bytes)	
A$scroll_screen$90:
	.db $33
	
; Data from 139D to 139D (1 bytes)	
A$scroll_screen$91:
	.db $F5
	
; Data from 139E to 139E (1 bytes)	
A$scroll_screen$92:
	.db $33
	
; Data from 139F to 13A2 (4 bytes)	
A$scroll_screen$96:
C$scroll_screen.c$25$1$26:
	.db $FD $21 $56 $C0
	
; Data from 13A3 to 13A5 (3 bytes)	
A$scroll_screen$97:
	.db $FD $46 $00
	
; Data from 13A6 to 13A8 (3 bytes)	
A$scroll_screen$98:
	.db $FD $34 $00
	
; Data from 13A9 to 13A9 (1 bytes)	
A$scroll_screen$99:
	.db $C5
	
; Data from 13AA to 13AA (1 bytes)	
A$scroll_screen$100:
	.db $33
	
; Data from 13AB to 13AD (3 bytes)	
A$scroll_screen$101:
	.db $CD $46 $08
	
; Data from 13AE to 13AE (1 bytes)	
A$scroll_screen$102:
	.db $33
	
; Data from 13AF to 13B0 (2 bytes)	
A$scroll_screen$106:
C$scroll_screen.c$27$1$26:
	.db $3E $10
	
; Data from 13B1 to 13B1 (1 bytes)	
A$scroll_screen$107:
	.db $F5
	
; Data from 13B2 to 13B2 (1 bytes)	
A$scroll_screen$108:
	.db $33
	
; Data from 13B3 to 13B5 (3 bytes)	
A$scroll_screen$109:
	.db $CD $D3 $0E
	
; Data from 13B6 to 13B6 (1 bytes)	
A$scroll_screen$110:
	.db $33
	
; Data from 13B7 to 13B7 (1 bytes)	
A$scroll_screen$111:
	.db $4D
	
; Data from 13B8 to 13BA (3 bytes)	
A$scroll_screen$115:
C$scroll_screen.c$33$1$26:
	.db $21 $03 $00
	
; Data from 13BB to 13BB (1 bytes)	
A$scroll_screen$116:
	.db $39
	
; Data from 13BC to 13BC (1 bytes)	
A$scroll_screen$117:
	.db $7E
	
; Data from 13BD to 13BD (1 bytes)	
A$scroll_screen$118:
	.db $23
	
; Data from 13BE to 13BE (1 bytes)	
A$scroll_screen$119:
	.db $66
	
; Data from 13BF to 13BF (1 bytes)	
A$scroll_screen$120:
	.db $6F
	
; Data from 13C0 to 13C0 (1 bytes)	
A$scroll_screen$124:
C$scroll_screen.c$28$1$26:
	.db $79
	
; Data from 13C1 to 13C1 (1 bytes)	
A$scroll_screen$125:
	.db $B7
	
; Data from 13C2 to 13C3 (2 bytes)	
A$scroll_screen$126:
	.db $20 $0C
	
; Data from 13C4 to 13C7 (4 bytes)	
A$scroll_screen$127:
	.db $FD $21 $00 $00
	
; Data from 13C8 to 13C9 (2 bytes)	
A$scroll_screen$128:
	.db $FD $39
	
; Data from 13CA to 13CC (3 bytes)	
A$scroll_screen$129:
	.db $FD $7E $00
	
; Data from 13CD to 13CD (1 bytes)	
A$scroll_screen$130:
	.db $B7
	
; Data from 13CE to 13CF (2 bytes)	
A$scroll_screen$131:
	.db $28 $16
	
; Data from 13D0 to 13D0 (1 bytes)	
A$scroll_screen$136:
C$scroll_screen.c$30$2$27:
	.db $E5
	
; Data from 13D1 to 13D2 (2 bytes)	
A$scroll_screen$137:
	.db $3E $04
	
; Data from 13D3 to 13D3 (1 bytes)	
A$scroll_screen$138:
	.db $F5
	
; Data from 13D4 to 13D4 (1 bytes)	
A$scroll_screen$139:
	.db $33
	
; Data from 13D5 to 13D7 (3 bytes)	
A$scroll_screen$140:
	.db $CD $34 $10
	
; Data from 13D8 to 13D8 (1 bytes)	
A$scroll_screen$141:
	.db $33
	
; Data from 13D9 to 13DA (2 bytes)	
A$scroll_screen$142:
	.db $3E $20
	
; Data from 13DB to 13DB (1 bytes)	
A$scroll_screen$143:
	.db $F5
	
; Data from 13DC to 13DC (1 bytes)	
A$scroll_screen$144:
	.db $33
	
; Data from 13DD to 13DF (3 bytes)	
A$scroll_screen$145:
	.db $CD $46 $08
	
; Data from 13E0 to 13E0 (1 bytes)	
A$scroll_screen$146:
	.db $33
	
; Data from 13E1 to 13E1 (1 bytes)	
A$scroll_screen$147:
	.db $E1
	
; Data from 13E2 to 13E3 (2 bytes)	
A$scroll_screen$151:
C$scroll_screen.c$33$2$27:
	.db $36 $04
	
; Data from 13E4 to 13E5 (2 bytes)	
A$scroll_screen$155:
C$scroll_screen.c$34$2$27:
	.db $18 $02
	
; Data from 13E6 to 13E7 (2 bytes)	
A$scroll_screen$160:
C$scroll_screen.c$37$1$26:
	.db $36 $03
	
; Data from 13E8 to 13E8 (1 bytes)	
A$scroll_screen$162:
	.db $33
	
; Data from 13E9 to 13E9 (1 bytes)	
A$scroll_screen$167:
C$scroll_screen.c$38$1$26:
XG$screen_scroll_screen_update$0:
	.db $C9
	
; Data from 13EA to 13EC (3 bytes)	
A$select_screen$86:
C$select_screen.c$22$0$0:
C$select_screen.c$24$1$29:
C$select_screen.c$25$1$29:
G$screen_select_screen_load$0$0:
_screen_select_screen_load:
	.db $3A $45 $C0
	
; Data from 13ED to 13ED (1 bytes)	
A$select_screen$87:
	.db $B7
	
; Data from 13EE to 13EF (2 bytes)	
A$select_screen$88:
	.db $20 $2B
	
; Data from 13F0 to 13F2 (3 bytes)	
A$select_screen$92:
C$select_screen.c$27$2$30:
	.db $CD $2B $08
	
; Data from 13F3 to 13F5 (3 bytes)	
A$select_screen$96:
C$select_screen.c$28$2$30:
	.db $CD $5A $0A
	
; Data from 13F6 to 13F8 (3 bytes)	
A$select_screen$100:
C$select_screen.c$29$2$30:
	.db $CD $A2 $0A
	
; Data from 13F9 to 13FB (3 bytes)	
A$select_screen$104:
C$select_screen.c$30$2$30:
	.db $CD $1A $0B
	
; Data from 13FC to 13FE (3 bytes)	
A$select_screen$108:
C$select_screen.c$31$2$30:
	.db $CD $51 $0B
	
; Data from 13FF to 1401 (3 bytes)	
A$select_screen$112:
C$select_screen.c$33$2$30:
	.db $21 $06 $08
	
; Data from 1402 to 1402 (1 bytes)	
A$select_screen$113:
	.db $E5
	
; Data from 1403 to 1405 (3 bytes)	
A$select_screen$114:
	.db $21 $3F $14
	
; Data from 1406 to 1406 (1 bytes)	
A$select_screen$115:
	.db $E5
	
; Data from 1407 to 1409 (3 bytes)	
A$select_screen$116:
	.db $CD $E9 $0D
	
; Data from 140A to 140A (1 bytes)	
A$select_screen$117:
	.db $F1
	
; Data from 140B to 140D (3 bytes)	
A$select_screen$121:
C$select_screen.c$34$2$30:
	.db $21 $14 $08
	
; Data from 140E to 140E (1 bytes)	
A$select_screen$122:
	.db $E3
	
; Data from 140F to 1411 (3 bytes)	
A$select_screen$123:
	.db $21 $46 $14
	
; Data from 1412 to 1412 (1 bytes)	
A$select_screen$124:
	.db $E5
	
; Data from 1413 to 1415 (3 bytes)	
A$select_screen$125:
	.db $CD $E9 $0D
	
; Data from 1416 to 1416 (1 bytes)	
A$select_screen$126:
	.db $F1
	
; Data from 1417 to 1417 (1 bytes)	
A$select_screen$127:
	.db $F1
	
; Data from 1418 to 141A (3 bytes)	
A$select_screen$131:
C$select_screen.c$35$2$30:
	.db $CD $25 $08
	
; Data from 141B to 141D (3 bytes)	
A$select_screen$136:
C$select_screen.c$38$1$29:
	.db $21 $45 $C0
	
; Data from 141E to 141E (1 bytes)	
A$select_screen$137:
	.db $46
	
; Data from 141F to 141F (1 bytes)	
A$select_screen$138:
	.db $C5
	
; Data from 1420 to 1420 (1 bytes)	
A$select_screen$139:
	.db $33
	
; Data from 1421 to 1423 (3 bytes)	
A$select_screen$140:
	.db $CD $9B $0B
	
; Data from 1424 to 1424 (1 bytes)	
A$select_screen$141:
	.db $33
	
; Data from 1425 to 1427 (3 bytes)	
A$select_screen$145:
C$select_screen.c$40$1$29:
	.db $21 $0F $00
	
; Data from 1428 to 1428 (1 bytes)	
A$select_screen$146:
	.db $E5
	
; Data from 1429 to 142B (3 bytes)	
A$select_screen$147:
	.db $CD $CD $10
	
; Data from 142C to 142E (3 bytes)	
A$select_screen$151:
C$select_screen.c$41$1$29:
	.db $21 $4B $00
	
; Data from 142F to 142F (1 bytes)	
A$select_screen$152:
	.db $E3
	
; Data from 1430 to 1432 (3 bytes)	
A$select_screen$153:
	.db $CD $08 $11
	
; Data from 1433 to 1433 (1 bytes)	
A$select_screen$154:
	.db $F1
	
; Data from 1434 to 1436 (3 bytes)	
A$select_screen$158:
C$select_screen.c$43$1$29:
	.db $21 $57 $C0
	
; Data from 1437 to 1438 (2 bytes)	
A$select_screen$159:
	.db $36 $00
	
; Data from 1439 to 143B (3 bytes)	
A$select_screen$163:
C$select_screen.c$44$1$29:
	.db $21 $58 $C0
	
; Data from 143C to 143D (2 bytes)	
A$select_screen$164:
	.db $36 $01
	
; Data from 143E to 143E (1 bytes)	
A$select_screen$169:
C$select_screen.c$45$1$29:
XG$screen_select_screen_load$0$0:
	.db $C9
	
; Data from 143F to 1445 (7 bytes)	
Fselect_screen$__str_0$0$0:
	.db $52 $45 $43 $4F $52 $44 $00
	
; Data from 1446 to 144C (7 bytes)	
Fselect_screen$__str_1$0$0:
	.db $43 $4F $56 $45 $52 $53 $00
	
; Data from 144D to 144F (3 bytes)	
A$select_screen$190:
C$select_screen.c$47$1$29:
C$select_screen.c$54$1$32:
G$screen_select_screen_update$0$:
_screen_select_screen_update:
	.db $3A $57 $C0
	
; Data from 1450 to 1450 (1 bytes)	
A$select_screen$191:
	.db $3D
	
; Data from 1451 to 1452 (2 bytes)	
A$select_screen$192:
	.db $20 $2A
	
; Data from 1453 to 1455 (3 bytes)	
A$select_screen$196:
C$select_screen.c$56$2$33:
	.db $3A $58 $C0
	
; Data from 1456 to 1456 (1 bytes)	
A$select_screen$197:
	.db $B7
	
; Data from 1457 to 1458 (2 bytes)	
A$select_screen$198:
	.db $28 $03
	
; Data from 1459 to 145B (3 bytes)	
A$select_screen$202:
C$select_screen.c$58$3$34:
	.db $CD $13 $0C
	
; Data from 145C to 145E (3 bytes)	
A$select_screen$207:
C$select_screen.c$61$2$33:
	.db $CD $E6 $10
	
; Data from 145F to 145F (1 bytes)	
A$select_screen$211:
C$select_screen.c$62$2$33:
	.db $7D
	
; Data from 1460 to 1460 (1 bytes)	
A$select_screen$212:
	.db $B7
	
; Data from 1461 to 1462 (2 bytes)	
A$select_screen$213:
	.db $28 $07
	
; Data from 1463 to 1465 (3 bytes)	
A$select_screen$217:
C$select_screen.c$64$3$35:
	.db $21 $58 $C0
	
; Data from 1466 to 1467 (2 bytes)	
A$select_screen$218:
	.db $3E $01
	
; Data from 1468 to 1468 (1 bytes)	
A$select_screen$219:
	.db $96
	
; Data from 1469 to 1469 (1 bytes)	
A$select_screen$220:
	.db $77
	
; Data from 146A to 146C (3 bytes)	
A$select_screen$225:
C$select_screen.c$67$2$33:
	.db $CD $1D $11
	
; Data from 146D to 146D (1 bytes)	
A$select_screen$229:
C$select_screen.c$68$2$33:
	.db $D1
	
; Data from 146E to 146E (1 bytes)	
A$select_screen$230:
	.db $C1
	
; Data from 146F to 146F (1 bytes)	
A$select_screen$231:
	.db $C5
	
; Data from 1470 to 1470 (1 bytes)	
A$select_screen$232:
	.db $D5
	
; Data from 1471 to 1471 (1 bytes)	
A$select_screen$233:
	.db $7D
	
; Data from 1472 to 1472 (1 bytes)	
A$select_screen$234:
	.db $B7
	
; Data from 1473 to 1474 (2 bytes)	
A$select_screen$235:
	.db $28 $04
	
; Data from 1475 to 1476 (2 bytes)	
A$select_screen$236:
	.db $3E $05
	
; Data from 1477 to 1478 (2 bytes)	
A$select_screen$237:
	.db $18 $02
	
; Data from 1479 to 147A (2 bytes)	
A$select_screen$239:
	.db $3E $04
	
; Data from 147B to 147B (1 bytes)	
A$select_screen$241:
	.db $02
	
; Data from 147C to 147C (1 bytes)	
A$select_screen$245:
C$select_screen.c$69$2$33:
	.db $C9
	
; Data from 147D to 147F (3 bytes)	
A$select_screen$250:
C$select_screen.c$72$1$32:
	.db $CD $13 $0C
	
; Data from 1480 to 1481 (2 bytes)	
A$select_screen$254:
C$select_screen.c$74$1$32:
	.db $3E $10
	
; Data from 1482 to 1482 (1 bytes)	
A$select_screen$255:
	.db $F5
	
; Data from 1483 to 1483 (1 bytes)	
A$select_screen$256:
	.db $33
	
; Data from 1484 to 1486 (3 bytes)	
A$select_screen$257:
	.db $CD $D3 $0E
	
; Data from 1487 to 1487 (1 bytes)	
A$select_screen$258:
	.db $33
	
; Data from 1488 to 1488 (1 bytes)	
A$select_screen$262:
C$select_screen.c$75$1$32:
	.db $7D
	
; Data from 1489 to 1489 (1 bytes)	
A$select_screen$263:
	.db $B7
	
; Data from 148A to 148B (2 bytes)	
A$select_screen$264:
	.db $28 $13
	
; Data from 148C to 148E (3 bytes)	
A$select_screen$268:
C$select_screen.c$77$2$36:
	.db $CD $05 $0C
	
; Data from 148F to 148F (1 bytes)	
A$select_screen$269:
	.db $45
	
; Data from 1490 to 1490 (1 bytes)	
A$select_screen$273:
C$select_screen.c$78$2$36:
	.db $C5
	
; Data from 1491 to 1491 (1 bytes)	
A$select_screen$274:
	.db $33
	
; Data from 1492 to 1494 (3 bytes)	
A$select_screen$275:
	.db $CD $0B $0F
	
; Data from 1495 to 1495 (1 bytes)	
A$select_screen$276:
	.db $33
	
; Data from 1496 to 1498 (3 bytes)	
A$select_screen$280:
C$select_screen.c$80$2$36:
	.db $CD $70 $0A
	
; Data from 1499 to 149B (3 bytes)	
A$select_screen$284:
C$select_screen.c$81$2$36:
	.db $21 $57 $C0
	
; Data from 149C to 149D (2 bytes)	
A$select_screen$285:
	.db $36 $01
	
; Data from 149E to 149E (1 bytes)	
A$select_screen$289:
C$select_screen.c$82$2$36:
	.db $C9
	
; Data from 149F to 14A0 (2 bytes)	
A$select_screen$294:
C$select_screen.c$85$1$32:
	.db $3E $04
	
; Data from 14A1 to 14A1 (1 bytes)	
A$select_screen$295:
	.db $F5
	
; Data from 14A2 to 14A2 (1 bytes)	
A$select_screen$296:
	.db $33
	
; Data from 14A3 to 14A5 (3 bytes)	
A$select_screen$297:
	.db $CD $D3 $0E
	
; Data from 14A6 to 14A6 (1 bytes)	
A$select_screen$298:
	.db $33
	
; Data from 14A7 to 14A7 (1 bytes)	
A$select_screen$302:
C$select_screen.c$86$1$32:
	.db $7D
	
; Data from 14A8 to 14A8 (1 bytes)	
A$select_screen$303:
	.db $B7
	
; Data from 14A9 to 14AA (2 bytes)	
A$select_screen$304:
	.db $28 $03
	
; Data from 14AB to 14AD (3 bytes)	
A$select_screen$308:
C$select_screen.c$88$2$37:
	.db $CD $3E $0D
	
; Data from 14AE to 14AF (2 bytes)	
A$select_screen$313:
C$select_screen.c$90$1$32:
	.db $3E $08
	
; Data from 14B0 to 14B0 (1 bytes)	
A$select_screen$314:
	.db $F5
	
; Data from 14B1 to 14B1 (1 bytes)	
A$select_screen$315:
	.db $33
	
; Data from 14B2 to 14B4 (3 bytes)	
A$select_screen$316:
	.db $CD $D3 $0E
	
; Data from 14B5 to 14B5 (1 bytes)	
A$select_screen$317:
	.db $33
	
; Data from 14B6 to 14B6 (1 bytes)	
A$select_screen$321:
C$select_screen.c$91$1$32:
	.db $7D
	
; Data from 14B7 to 14B7 (1 bytes)	
A$select_screen$322:
	.db $B7
	
; Data from 14B8 to 14B9 (2 bytes)	
A$select_screen$323:
	.db $28 $03
	
; Data from 14BA to 14BC (3 bytes)	
A$select_screen$327:
C$select_screen.c$93$2$38:
	.db $CD $51 $0D
	
; Data from 14BD to 14BE (2 bytes)	
A$select_screen$332:
C$select_screen.c$95$1$32:
	.db $3E $01
	
; Data from 14BF to 14BF (1 bytes)	
A$select_screen$333:
	.db $F5
	
; Data from 14C0 to 14C0 (1 bytes)	
A$select_screen$334:
	.db $33
	
; Data from 14C1 to 14C3 (3 bytes)	
A$select_screen$335:
	.db $CD $D3 $0E
	
; Data from 14C4 to 14C4 (1 bytes)	
A$select_screen$336:
	.db $33
	
; Data from 14C5 to 14C5 (1 bytes)	
A$select_screen$340:
C$select_screen.c$96$1$32:
	.db $7D
	
; Data from 14C6 to 14C6 (1 bytes)	
A$select_screen$341:
	.db $B7
	
; Data from 14C7 to 14C8 (2 bytes)	
A$select_screen$342:
	.db $28 $03
	
; Data from 14C9 to 14CB (3 bytes)	
A$select_screen$346:
C$select_screen.c$98$2$39:
	.db $CD $63 $0D
	
; Data from 14CC to 14CD (2 bytes)	
A$select_screen$351:
C$select_screen.c$100$1$32:
	.db $3E $02
	
; Data from 14CE to 14CE (1 bytes)	
A$select_screen$352:
	.db $F5
	
; Data from 14CF to 14CF (1 bytes)	
A$select_screen$353:
	.db $33
	
; Data from 14D0 to 14D2 (3 bytes)	
A$select_screen$354:
	.db $CD $D3 $0E
	
; Data from 14D3 to 14D3 (1 bytes)	
A$select_screen$355:
	.db $33
	
; Data from 14D4 to 14D4 (1 bytes)	
A$select_screen$359:
C$select_screen.c$101$1$32:
	.db $7D
	
; Data from 14D5 to 14D5 (1 bytes)	
A$select_screen$360:
	.db $B7
	
; Data from 14D6 to 14D7 (2 bytes)	
A$select_screen$361:
	.db $28 $03
	
; Data from 14D8 to 14DA (3 bytes)	
A$select_screen$365:
C$select_screen.c$103$2$40:
	.db $CD $76 $0D
	
; Data from 14DB to 14DB (1 bytes)	
A$select_screen$370:
C$select_screen.c$106$1$32:
	.db $C1
	
; Data from 14DC to 14DC (1 bytes)	
A$select_screen$371:
	.db $E1
	
; Data from 14DD to 14DD (1 bytes)	
A$select_screen$372:
	.db $E5
	
; Data from 14DE to 14DE (1 bytes)	
A$select_screen$373:
	.db $C5
	
; Data from 14DF to 14E0 (2 bytes)	
A$select_screen$374:
	.db $36 $04
	
; Data from 14E1 to 14E1 (1 bytes)	
A$select_screen$379:
C$select_screen.c$107$1$32:
XG$screen_select_screen_update$0:
	.db $C9
	
; Data from 14E2 to 14E4 (3 bytes)	
A$record_screen$71:
C$record_screen.c$16$0$0:
C$record_screen.c$18$1$29:
G$screen_record_screen_load$0$0:
_screen_record_screen_load:
	.db $CD $25 $10
	
; Data from 14E5 to 14E7 (3 bytes)	
A$record_screen$79:
C$record_screen.c$19$1$29:
C$record_screen.c$20$1$29:
XG$screen_record_screen_load$0$0:
	.db $C3 $63 $15
	
; Data from 14E8 to 14E9 (2 bytes)	
A$record_screen$89:
C$record_screen.c$22$1$29:
G$screen_record_screen_update$0$:
_screen_record_screen_update:
	.db $DD $E5
	
; Data from 14EA to 14ED (4 bytes)	
A$record_screen$90:
	.db $DD $21 $00 $00
	
; Data from 14EE to 14EF (2 bytes)	
A$record_screen$91:
	.db $DD $39
	
; Data from 14F0 to 14F1 (2 bytes)	
A$record_screen$98:
C$record_screen.c$24$1$31:
C$record_screen.c$28$1$31:
	.db $3E $04
	
; Data from 14F2 to 14F2 (1 bytes)	
A$record_screen$99:
	.db $F5
	
; Data from 14F3 to 14F3 (1 bytes)	
A$record_screen$100:
	.db $33
	
; Data from 14F4 to 14F6 (3 bytes)	
A$record_screen$101:
	.db $CD $D3 $0E
	
; Data from 14F7 to 14F7 (1 bytes)	
A$record_screen$102:
	.db $33
	
; Data from 14F8 to 14F8 (1 bytes)	
A$record_screen$106:
C$record_screen.c$29$1$31:
	.db $7D
	
; Data from 14F9 to 14F9 (1 bytes)	
A$record_screen$107:
	.db $B7
	
; Data from 14FA to 14FB (2 bytes)	
A$record_screen$108:
	.db $28 $06
	
; Data from 14FC to 14FE (3 bytes)	
A$record_screen$112:
C$record_screen.c$31$2$32:
	.db $CD $6F $0F
	
; Data from 14FF to 1501 (3 bytes)	
A$record_screen$116:
C$record_screen.c$32$2$32:
	.db $CD $63 $15
	
; Data from 1502 to 1503 (2 bytes)	
A$record_screen$121:
C$record_screen.c$34$1$31:
	.db $3E $08
	
; Data from 1504 to 1504 (1 bytes)	
A$record_screen$122:
	.db $F5
	
; Data from 1505 to 1505 (1 bytes)	
A$record_screen$123:
	.db $33
	
; Data from 1506 to 1508 (3 bytes)	
A$record_screen$124:
	.db $CD $D3 $0E
	
; Data from 1509 to 1509 (1 bytes)	
A$record_screen$125:
	.db $33
	
; Data from 150A to 150A (1 bytes)	
A$record_screen$129:
C$record_screen.c$35$1$31:
	.db $7D
	
; Data from 150B to 150B (1 bytes)	
A$record_screen$130:
	.db $B7
	
; Data from 150C to 150D (2 bytes)	
A$record_screen$131:
	.db $28 $06
	
; Data from 150E to 1510 (3 bytes)	
A$record_screen$135:
C$record_screen.c$37$2$33:
	.db $CD $7E $0F
	
; Data from 1511 to 1513 (3 bytes)	
A$record_screen$139:
C$record_screen.c$38$2$33:
	.db $CD $63 $15
	
; Data from 1514 to 1515 (2 bytes)	
A$record_screen$144:
C$record_screen.c$41$1$31:
	.db $3E $10
	
; Data from 1516 to 1516 (1 bytes)	
A$record_screen$145:
	.db $F5
	
; Data from 1517 to 1517 (1 bytes)	
A$record_screen$146:
	.db $33
	
; Data from 1518 to 151A (3 bytes)	
A$record_screen$147:
	.db $CD $D3 $0E
	
; Data from 151B to 151B (1 bytes)	
A$record_screen$148:
	.db $33
	
; Data from 151C to 151C (1 bytes)	
A$record_screen$149:
	.db $4D
	
; Data from 151D to 151D (1 bytes)	
A$record_screen$153:
C$record_screen.c$42$1$31:
	.db $C5
	
; Data from 151E to 151F (2 bytes)	
A$record_screen$154:
	.db $3E $20
	
; Data from 1520 to 1520 (1 bytes)	
A$record_screen$155:
	.db $F5
	
; Data from 1521 to 1521 (1 bytes)	
A$record_screen$156:
	.db $33
	
; Data from 1522 to 1524 (3 bytes)	
A$record_screen$157:
	.db $CD $D3 $0E
	
; Data from 1525 to 1525 (1 bytes)	
A$record_screen$158:
	.db $33
	
; Data from 1526 to 1526 (1 bytes)	
A$record_screen$159:
	.db $C1
	
; Data from 1527 to 1529 (3 bytes)	
A$record_screen$163:
C$record_screen.c$51$1$31:
	.db $DD $5E $04
	
; Data from 152A to 152C (3 bytes)	
A$record_screen$164:
	.db $DD $56 $05
	
; Data from 152D to 152D (1 bytes)	
A$record_screen$168:
C$record_screen.c$43$1$31:
	.db $79
	
; Data from 152E to 152E (1 bytes)	
A$record_screen$169:
	.db $B7
	
; Data from 152F to 1530 (2 bytes)	
A$record_screen$170:
	.db $20 $03
	
; Data from 1531 to 1531 (1 bytes)	
A$record_screen$171:
	.db $B5
	
; Data from 1532 to 1533 (2 bytes)	
A$record_screen$172:
	.db $28 $29
	
; Data from 1534 to 1534 (1 bytes)	
A$record_screen$177:
C$record_screen.c$45$2$34:
	.db $D5
	
; Data from 1535 to 1535 (1 bytes)	
A$record_screen$178:
	.db $AF
	
; Data from 1536 to 1536 (1 bytes)	
A$record_screen$179:
	.db $F5
	
; Data from 1537 to 1537 (1 bytes)	
A$record_screen$180:
	.db $33
	
; Data from 1538 to 153A (3 bytes)	
A$record_screen$181:
	.db $CD $46 $08
	
; Data from 153B to 153B (1 bytes)	
A$record_screen$182:
	.db $33
	
; Data from 153C to 153C (1 bytes)	
A$record_screen$183:
	.db $D1
	
; Data from 153D to 153F (3 bytes)	
A$record_screen$187:
C$record_screen.c$47$2$34:
	.db $21 $2A $C0
	
; Data from 1540 to 1540 (1 bytes)	
A$record_screen$188:
	.db $46
	
; Data from 1541 to 1541 (1 bytes)	
A$record_screen$189:
	.db $D5
	
; Data from 1542 to 1542 (1 bytes)	
A$record_screen$190:
	.db $C5
	
; Data from 1543 to 1543 (1 bytes)	
A$record_screen$191:
	.db $33
	
; Data from 1544 to 1546 (3 bytes)	
A$record_screen$192:
	.db $CD $0B $0F
	
; Data from 1547 to 1547 (1 bytes)	
A$record_screen$193:
	.db $33
	
; Data from 1548 to 1548 (1 bytes)	
A$record_screen$194:
	.db $D1
	
; Data from 1549 to 154B (3 bytes)	
A$record_screen$198:
C$record_screen.c$48$2$34:
	.db $21 $2A $C0
	
; Data from 154C to 154C (1 bytes)	
A$record_screen$199:
	.db $46
	
; Data from 154D to 154D (1 bytes)	
A$record_screen$200:
	.db $D5
	
; Data from 154E to 154E (1 bytes)	
A$record_screen$201:
	.db $C5
	
; Data from 154F to 154F (1 bytes)	
A$record_screen$202:
	.db $33
	
; Data from 1550 to 1552 (3 bytes)	
A$record_screen$203:
	.db $CD $67 $0B
	
; Data from 1553 to 1553 (1 bytes)	
A$record_screen$204:
	.db $33
	
; Data from 1554 to 1556 (3 bytes)	
A$record_screen$205:
	.db $CD $84 $10
	
; Data from 1557 to 1557 (1 bytes)	
A$record_screen$206:
	.db $D1
	
; Data from 1558 to 1559 (2 bytes)	
A$record_screen$210:
C$record_screen.c$51$2$34:
	.db $3E $04
	
; Data from 155A to 155A (1 bytes)	
A$record_screen$211:
	.db $12
	
; Data from 155B to 155C (2 bytes)	
A$record_screen$215:
C$record_screen.c$52$2$34:
	.db $18 $03
	
; Data from 155D to 155E (2 bytes)	
A$record_screen$220:
C$record_screen.c$55$1$31:
	.db $3E $05
	
; Data from 155F to 155F (1 bytes)	
A$record_screen$221:
	.db $12
	
; Data from 1560 to 1561 (2 bytes)	
A$record_screen$223:
	.db $DD $E1
	
; Data from 1562 to 1562 (1 bytes)	
A$record_screen$228:
C$record_screen.c$56$1$31:
XG$screen_record_screen_update$0:
	.db $C9
	
; Data from 1563 to 1565 (3 bytes)	
A$record_screen$241:
C$record_screen.c$58$1$31:
C$record_screen.c$60$1$35:
Frecord_screen$load_record$0$0:
	.db $CD $2B $08
	
; Data from 1566 to 1568 (3 bytes)	
A$record_screen$245:
C$record_screen.c$61$1$35:
	.db $CD $5A $0A
	
; Data from 1569 to 156B (3 bytes)	
A$record_screen$249:
C$record_screen.c$62$1$35:
	.db $CD $19 $0F
	
; Data from 156C to 156E (3 bytes)	
A$record_screen$257:
C$record_screen.c$63$1$35:
C$record_screen.c$64$1$35:
XFrecord_screen$load_record$0$0:
	.db $C3 $25 $08
	
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