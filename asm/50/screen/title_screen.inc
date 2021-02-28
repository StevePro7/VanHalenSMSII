_screen_title_screen_load:
	;.db $CD $2B $08
	call _devkit_SMS_displayOff

; Data from 12B9 to 12BB (3 bytes)
	;.db $CD $A2 $0A
	call _engine_content_manager_load_til

; Data from 12BC to 12BE (3 bytes)
	;.db $CD $51 $0B
	call _engine_content_manager_load_spr

; Data from 12BF to 12C1 (3 bytes)
	;.db $CD $E3 $0A
	call _engine_content_manager_load_tit

; Data from 12C2 to 12C4 (3 bytes)
	;.db $21 $0A $15
	ld hl, $150A

; Data from 12C5 to 12C5 (1 bytes)
	push hl

; Data from 12C6 to 12C8 (3 bytes)
	;.db $21 $35 $13
	;ld hl, $1335
	ld hl, press_start

; Data from 12C9 to 12C9 (1 bytes)
	push hl

; Data from 12CA to 12CC (3 bytes)
	;.db $CD $E9 $0D
	call _engine_font_manager_draw_text

; Data from 12CD to 12CD (1 bytes)
	pop af

; Data from 12CE to 12D0 (3 bytes)
	;.db $21 $06 $0C
	ld hl, $0C06

; Data from 12D1 to 12D1 (1 bytes)
	ex (sp), hl

; Data from 12D2 to 12D4 (3 bytes)
	;.db $21 $41 $13
	;ld hl, $1341
	ld hl, title_record_label

; Data from 12D5 to 12D5 (1 bytes)
	push hl

; Data from 12D6 to 12D8 (3 bytes)
	;.db $CD $E9 $0D
	call _engine_font_manager_draw_text

; Data from 12D9 to 12D9 (1 bytes)
	pop af

; Data from 12DA to 12DC (3 bytes)
	;.db $21 $14 $0C
	ld hl, $0C14

; Data from 12DD to 12DD (1 bytes)
	ex (sp), hl

; Data from 12DE to 12E0 (3 bytes)
	;.db $21 $48 $13
	;ld hl, $1348
	ld hl, title_covers_label

; Data from 12E1 to 12E1 (1 bytes)
	push hl

; Data from 12E2 to 12E4 (3 bytes)
	;.db $CD $E9 $0D
	call _engine_font_manager_draw_text

; Data from 12E5 to 12E5 (1 bytes)
	pop af

; Data from 12E6 to 12E8 (3 bytes)
	;.db $21 $1C $17
	ld hl, $171C

; Data from 12E9 to 12E9 (1 bytes)
	ex (sp), hl

; Data from 12EA to 12EC (3 bytes)
	;.db $21 $4F $13
	;ld hl, $134F
	ld hl, title_build_label

; Data from 12ED to 12ED (1 bytes)
	push hl

; Data from 12EE to 12F0 (3 bytes)
	;.db $CD $E9 $0D
	call _engine_font_manager_draw_text

; Data from 12F1 to 12F1 (1 bytes)
	pop af

; Data from 12F2 to 12F2 (1 bytes)
	pop af

; Data from 12F3 to 12F5 (3 bytes)
	;.db $CD $25 $08
	call _devkit_SMS_displayOn

; Data from 12F6 to 12F8 (3 bytes)
	;.db $21 $32 $00
	ld hl, $0032		; TITLE_FLASH_DELAY	50

; Data from 12F9 to 12F9 (1 bytes)
	push hl

; Data from 12FA to 12FC (3 bytes)
	;.db $CD $63 $11
	call _engine_delay_manager_load

; Data from 12FD to 12FF (3 bytes)
	;.db $21 $4B $00
	ld hl, $004B		; TITLE_VALUE_RESET	75

; Data from 1300 to 1300 (1 bytes)
	ex (sp), hl

; Data from 1301 to 1303 (3 bytes)
	;.db $CD $9E $11
	call _engine_reset_manager_load

; Data from 1304 to 1304 (1 bytes)
	pop af

; Data from 1305 to 1305 (1 bytes)
	xor a

; Data from 1306 to 1306 (1 bytes)
	push af

; Data from 1307 to 1307 (1 bytes)
	inc sp

; Data from 1308 to 130A (3 bytes)
	;.db $CD $7D $0F
	call _engine_record_manager_init

; Data from 130B to 130B (1 bytes)
	inc sp

; Data from 130C to 130E (3 bytes)
	;.db $CD $D8 $10
	call _engine_storage_manager_availabl

; Data from 130F to 130F (1 bytes)
	ld a, l

; Data from 1310 to 1310 (1 bytes)
	or a

; Data from 1311 to 1312 (2 bytes)
	;.db $28 $03
	jr z, $03

; Data from 1313 to 1315 (3 bytes)
	;.db $CD $07 $11
	call _engine_storage_manager_read

; Data from 1316 to 1318 (3 bytes)
	;.db $21 $2A $C0
	ld hl, $C02A		; ro->record_album_index

; Data from 1319 to 1319 (1 bytes)
	ld b, (hl)

; Data from 131A to 131A (1 bytes)
	push bc

; Data from 131B to 131B (1 bytes)
	inc sp

; Data from 131C to 131E (3 bytes)
	;.db $CD $7D $0F
	call _engine_record_manager_init

; Data from 131F to 131F (1 bytes)
	inc sp

; Data from 1320 to 1322 (3 bytes)
	;.db $21 $2A $C0
	ld hl, $C02A		; ro->record_album_index

; Data from 1323 to 1323 (1 bytes)
	ld b, (hl)

; Data from 1324 to 1324 (1 bytes)
	push bc

; Data from 1325 to 1325 (1 bytes)
	inc sp

; Data from 1326 to 1328 (3 bytes)
	;.db $CD $67 $0B
	call _engine_cursor_manager_init

; Data from 1329 to 1329 (1 bytes)
	inc sp

; Data from 132A to 132C (3 bytes)
	;.db $21 $60 $C0
	ld hl, $C054

; Data from 132D to 132E (2 bytes)
	;.db $36 $00
	ld (hl), $00

; Data from 132F to 1331 (3 bytes)
	;.db $21 $61 $C0
	ld hl, $C055

; Data from 1332 to 1333 (2 bytes)
	;.db $36 $00
	ld (hl), $00

; Data from 1334 to 1334 (1 bytes)
	ret

; Data from 1335 to 1340 (12 bytes)
press_start:
	; "PRESS START"
	.db $50 $52 $45 $53 $53 $20 $53 $54 $41 $52 $54 $00

; Data from 1341 to 1347 (7 bytes)
title_record_label:
	; "RECORD"
	.db $52 $45 $43 $4F $52 $44 $00

; Data from 1348 to 134E (7 bytes)
title_covers_label:
	; "COVERS"
	.db $43 $4F $56 $45 $52 $53 $00

; Data from 134F to 1353 (5 bytes)
title_build_label:
	; "V1.0"
	.db $56 $31 $2E $30 $00

; Data from 1354 to 1355 (2 bytes)
_screen_title_screen_update:
	;.db $DD $E5
	push ix

; Data from 1356 to 1359 (4 bytes)
	;.db $DD $21 $00 $00
	ld ix, $0000

; Data from 135A to 135B (2 bytes)
	;.db $DD $39
	add ix, sp

; Data from 135C to 135C (1 bytes)
	push af

; Data from 135D to 135D (1 bytes)
	;.db $3B
	dec sp

; Data from 135E to 1360 (3 bytes)
	;.db $DD $7E $04
	ld a, (ix + $04)

; Data from 1361 to 1363 (3 bytes)
	;.db $DD $77 $FE
	ld (ix - 2), a

; Data from 1364 to 1366 (3 bytes)
	;.db $DD $7E $05
	ld a, (ix + $05)

; Data from 1367 to 1369 (3 bytes)
	;.db $DD $77 $FF
	ld (ix - 1), a

; Data from 136A to 136C (3 bytes)
	;.db $3A $60 $C0
	ld a, ($C054)

; Data from 136D to 136D (1 bytes)
	dec a

; Data from 136E to 136F (2 bytes)
	;.db $20 $36
	jr nz, $36

; Data from 1370 to 1372 (3 bytes)
	;.db $CD $B3 $11
	call _engine_reset_manager_update

; Data from 1373 to 1373 (1 bytes)
	;.db $4D
	ld c, l

; Data from 1374 to 1374 (1 bytes)
	ld a, c

; Data from 1375 to 1375 (1 bytes)
	or a

; Data from 1376 to 1377 (2 bytes)
	;.db $28 $1B
	jr z, $1B

; Data from 1378 to 1378 (1 bytes)
	push bc

; Data from 1379 to 137B (3 bytes)
	;.db $21 $0A $15
	ld hl, $150A

; Data from 137C to 137C (1 bytes)
	push hl

; Data from 137D to 137F (3 bytes)
	;.db $21 $07 $14
	;.db $21 $71 $13
	ld hl, $1371

; Data from 1380 to 1380 (1 bytes)
	push hl

; Data from 1381 to 1383 (3 bytes)
	;.db $CD $E9 $0D
	call _engine_font_manager_draw_text

; Data from 1384 to 1384 (1 bytes)
	pop af

; Data from 1385 to 1387 (3 bytes)
	;.db $21 $15 $17
	ld hl, $1715

; Data from 1388 to 1388 (1 bytes)
	ex (sp), hl

; Data from 1389 to 138B (3 bytes)
	;.db $21 $07 $14
	ld hl, $1371

; Data from 138C to 138C (1 bytes)
	push hl

; Data from 138D to 138F (3 bytes)
	;.db $CD $E9 $0D
	call _engine_font_manager_draw_text

; Data from 1390 to 1390 (1 bytes)
	pop af

; Data from 1391 to 1391 (1 bytes)
	pop af

; Data from 1392 to 1392 (1 bytes)
	pop bc

; Data from 1393 to 1393 (1 bytes)
	ld a, c

; Data from 1394 to 1394 (1 bytes)
	or a

; Data from 1395 to 1396 (2 bytes)
	;.db $28 $04
	jr z, $04

; Data from 1397 to 1398 (2 bytes)
	;.db $0E $03
	ld c, $03

; Data from 1399 to 139A (2 bytes)
	;.db $18 $02
	jr $02

; Data from 139B to 139C (2 bytes)
	;.db $0E $02
	ld c, $02

; Data from 139D to 139F (3 bytes)
	;.db $DD $6E $FE
	ld l, (ix - 2)

; Data from 13A0 to 13A2 (3 bytes)
	;.db $DD $66 $FF
	ld h, (ix - 1)

; Data from 13A3 to 13A3 (1 bytes)
	;.db $71
	ld (hl), c

; Data from 13A4 to 13A5 (2 bytes)
	;.db $18 $5C
	jr $5C

; Data from 13A6 to 13A8 (3 bytes)
	;.db $CD $7C $11
	call _engine_delay_manager_update

; Data from 13A9 to 13AB (3 bytes)
	;.db $DD $75 $FD
	ld (ix - 3), l

; Data from 13AC to 13AC (1 bytes)
	ld a, l

; Data from 13AD to 13AD (1 bytes)
	or a

; Data from 13AE to 13AF (2 bytes)
	;.db $28 $29
	jr z, $29

; Data from 13B0 to 13B2 (3 bytes)
	;.db $21 $61 $C0
	ld hl, $C055

; Data from 13B3 to 13B4 (2 bytes)
	;.db $3E $01
	ld a, $01

; Data from 13B5 to 13B5 (1 bytes)
	sub a, (hl)

; Data from 13B6 to 13B6 (1 bytes)
	ld (hl), a

; Data from 13B7 to 13B9 (3 bytes)
	;.db $3A $61 $C0
	ld a,($C055)
	
; Data from 13BA to 13BA (1 bytes)
	or a

; Data from 13BB to 13BC (2 bytes)
	;.db $28 $0F
	jr z, $0F
	

; Data from 13BD to 13BF (3 bytes)
	;.db $21 $0A $15
	ld hl, $150A

; Data from 13C0 to 13C0 (1 bytes)
	push hl

; Data from 13C1 to 13C3 (3 bytes)
	;.db $21 $07 $14
	ld hl, $1371
	

; Data from 13C4 to 13C4 (1 bytes)
	push hl

; Data from 13C5 to 13C7 (3 bytes)
	;.db $CD $E9 $0D
	call _engine_font_manager_draw_text

; Data from 13C8 to 13C8 (1 bytes)
	pop af

; Data from 13C9 to 13C9 (1 bytes)
	pop af

; Data from 13CA to 13CB (2 bytes)
	;.db $18 $0D
	jr $0D

; Data from 13CC to 13CE (3 bytes)
	;.db $21 $0A $15
	ld hl, $150A

; Data from 13CF to 13CF (1 bytes)
	push hl

; Data from 13D0 to 13D2 (3 bytes)
	;.db $21 $13 $14
	;ld hl, $_engine_content_manager_load_spr
	ld hl, press_start2

; Data from 13D3 to 13D3 (1 bytes)
	push hl

; Data from 13D4 to 13D6 (3 bytes)
	;.db $CD $E9 $0D
	call _engine_font_manager_draw_text

; Data from 13D7 to 13D7 (1 bytes)
	pop af

; Data from 13D8 to 13D8 (1 bytes)
	pop af

; Data from 13D9 to 13DA (2 bytes)
	;.db $3E $10
	ld a, $10		; input_type_fire1

; Data from 13DB to 13DB (1 bytes)
	push af

; Data from 13DC to 13DC (1 bytes)
	inc sp

; Data from 13DD to 13DF (3 bytes)
	;.db $CD $D3 $0E
	call _engine_input_manager_hold

; Data from 13E0 to 13E0 (1 bytes)
	inc sp

; Data from 13E1 to 13E1 (1 bytes)
	ld a, l

; Data from 13E2 to 13E2 (1 bytes)
	or a

; Data from 13E3 to 13E4 (2 bytes)
	;.db $28 $15
	jr z, $15

; Data from 13E5 to 13E7 (3 bytes)
	;.db $21 $0A $15
	ld hl, $150A

; Data from 13E8 to 13E8 (1 bytes)
	push hl

; Data from 13E9 to 13EB (3 bytes)
	;.db $21 $13 $14
	;ld hl, $1413
	ld hl, press_start2

; Data from 13EC to 13EC (1 bytes)
	push hl

; Data from 13ED to 13EF (3 bytes)
	;.db $CD $E9 $0D
	call _engine_font_manager_draw_text
	

; Data from 13F0 to 13F0 (1 bytes)
	pop af

; Data from 13F1 to 13F1 (1 bytes)
	pop af

; Data from 13F2 to 13F4 (3 bytes)
	;.db $CD $70 $0A
	call _engine_audio_manager_sfx_right

; Data from 13F5 to 13F7 (3 bytes)
	;.db $21 $60 $C0
	ld hl, $C054

; Data from 13F8 to 13F9 (2 bytes)
	;.db $36 $01
	ld (hl), $01

; Data from 13FA to 13FC (3 bytes)
	;.db $DD $6E $FE
	ld l, (ix - 2)
	
; Data from 13FD to 13FF (3 bytes)
	;.db $DD $66 $FF
	ld h, (ix - 1)

; Data from 1400 to 1401 (2 bytes)
	;.db $36 $02
	ld (hl), $02

; Data from 1402 to 1403 (2 bytes)
	;.db $DD $F9
	ld sp, ix

; Data from 1404 to 1405 (2 bytes)
	;.db $DD $E1
	pop ix

; Data from 1406 to 1406 (1 bytes)
	ret

; Data from 1407 to 1412 (12 bytes)
	; "           "
	.dsb 11, $20
	.db $00

; Data from 1413 to 141E (12 bytes)
press_start2:
	; "PRESS START"
	.db $50 $52 $45 $53 $53 $20 $53 $54 $41 $52 $54 $00