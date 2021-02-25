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
; .include "screen/select_screen.inc"
; .include "screen/record_screen.inc"



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