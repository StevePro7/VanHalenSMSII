A$select_screen$86:	
C$select_screen.c$22$0$0:	
C$select_screen.c$24$1$29:	
C$select_screen.c$25$1$29:	
G$screen_select_screen_load$0$0:	
_screen_select_screen_load:	
		ld a, (G$global_scroll_object$0$0)	; G$global_scroll_object$0$0 = $C045
		or a
		jr nz, A$select_screen$136
		call A$_sms_manager$163
		call A$asm_manager$59
		call A$content_manager$65
		call A$content_manager$204
		call A$content_manager$263
		ld hl, $0806
		push hl
		ld hl, Fselect_screen$__str_0$0$0	; Fselect_screen$__str_0$0$0 = $143F
		push hl
		call A$font_manager$104
		pop af
		ld hl, $0814
		ex (sp), hl
		ld hl, Fselect_screen$__str_1$0$0	; Fselect_screen$__str_1$0$0 = $1446
		push hl
		call A$font_manager$104
		pop af
		pop af
		call A$_sms_manager$145
A$select_screen$136:	
C$select_screen.c$38$1$29:	
		ld hl, G$global_scroll_object$0$0	; G$global_scroll_object$0$0 = $C045
		ld b, (hl)
		push bc
		inc sp
		call A$cursor_manager$129
		inc sp
		ld hl, $000F
		push hl
		call A$timer_manager$70
		ld hl, $004B
		ex (sp), hl
		call A$timer_manager$154
		pop af
		ld hl, Fselect_screen$event_stage$0$0	; Fselect_screen$event_stage$0$0 = $C057
		ld (hl), $00
		ld hl, Fselect_screen$flash$0$0	; Fselect_screen$flash$0$0 = $C058
		ld (hl), $01
		ret
	
; Data from 143F to 1445 (7 bytes)	
Fselect_screen$__str_0$0$0:	
	.db $52 $45 $43 $4F $52 $44 $00
	
; Data from 1446 to 144C (7 bytes)	
Fselect_screen$__str_1$0$0:	
	.db $43 $4F $56 $45 $52 $53 $00
	
A$select_screen$190:	
C$select_screen.c$47$1$29:	
C$select_screen.c$54$1$32:	
G$screen_select_screen_update$0$:	
_screen_select_screen_update:	
		ld a, (Fselect_screen$event_stage$0$0)	; Fselect_screen$event_stage$0$0 = $C057
		dec a
		jr nz, A$select_screen$250
		ld a, (Fselect_screen$flash$0$0)	; Fselect_screen$flash$0$0 = $C058
		or a
		jr z, A$select_screen$207
		call A$cursor_manager$258
A$select_screen$207:	
C$select_screen.c$61$2$33:	
		call A$timer_manager$103
		ld a, l
		or a
		jr z, A$select_screen$225
		ld hl, Fselect_screen$flash$0$0	; Fselect_screen$flash$0$0 = $C058
		ld a, $01
		sub (hl)
		ld (hl), a
A$select_screen$225:	
C$select_screen.c$67$2$33:	
		call A$timer_manager$185
		pop de
		pop bc
		push bc
		push de
		ld a, l
		or a
		jr z, A$select_screen$239
		ld a, $05
		jr A$select_screen$241
	
A$select_screen$239:	
		ld a, $04
A$select_screen$241:	
		ld (bc), a
		ret
	
A$select_screen$250:	
C$select_screen.c$72$1$32:	
		call A$cursor_manager$258
		ld a, $10
		push af
		inc sp
		call A$input_manager$88
		inc sp
		ld a, l
		or a
		jr z, A$select_screen$294
		call A$cursor_manager$235
		ld b, l
		push bc
		inc sp
		call A$record_manager$69
		inc sp
		call A$audio_manager$60
		ld hl, Fselect_screen$event_stage$0$0	; Fselect_screen$event_stage$0$0 = $C057
		ld (hl), $01
		ret
	
A$select_screen$294:	
C$select_screen.c$85$1$32:	
		ld a, $04
		push af
		inc sp
		call A$input_manager$88
		inc sp
		ld a, l
		or a
		jr z, A$select_screen$313
		call A$cursor_manager$523
A$select_screen$313:	
C$select_screen.c$90$1$32:	
		ld a, $08
		push af
		inc sp
		call A$input_manager$88
		inc sp
		ld a, l
		or a
		jr z, A$select_screen$332
		call A$cursor_manager$562
A$select_screen$332:	
C$select_screen.c$95$1$32:	
		ld a, $01
		push af
		inc sp
		call A$input_manager$88
		inc sp
		ld a, l
		or a
		jr z, A$select_screen$351
		call A$cursor_manager$604
A$select_screen$351:	
C$select_screen.c$100$1$32:	
		ld a, $02
		push af
		inc sp
		call A$input_manager$88
		inc sp
		ld a, l
		or a
		jr z, A$select_screen$370
		call A$cursor_manager$643
A$select_screen$370:	
C$select_screen.c$106$1$32:	
		pop bc
		pop hl
		push hl
		push bc
		ld (hl), $04
		ret