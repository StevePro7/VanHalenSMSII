A$content_manager$65:	
C$content_manager.c$12$0$0:	
C$content_manager.c$14$1$17:	
G$engine_content_manager_load_ti:	
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
	
A$content_manager$96:	
C$content_manager.c$17$1$17:	
C$content_manager.c$19$1$18:	
G$engine_content_manager_load_sp:	
_engine_content_manager_load_spl:	
		ld a, $02
		push af
		inc sp
		call A$_sms_manager$181
		inc sp
		ld hl, $0040
		push hl
		ld hl, $8057
		push hl
		call A$_sms_manager$400
		pop af
		pop af
		ld bc, _SMS_crt0_RST18 - 1	; _SMS_crt0_RST18 - 1 = $0010
		push bc
		ld hl, $0000
		push hl
		call A$_sms_manager$432
		pop af
		pop af
		ld bc, $8000
		push bc
		call A$_sms_manager$472
		pop af
		ret
	
A$content_manager$145:	
C$content_manager.c$25$1$18:	
C$content_manager.c$27$1$19:	
G$engine_content_manager_load_ti:	
_engine_content_manager_load_tit:	
		ld a, $03
		push af
		inc sp
		call A$_sms_manager$181
		inc sp
		ld hl, $0040
		push hl
		ld hl, $8077
		push hl
		call A$_sms_manager$400
		pop af
		pop af
		ld bc, _SMS_crt0_RST18 - 1	; _SMS_crt0_RST18 - 1 = $0010
		push bc
		ld hl, $0000
		push hl
		call A$_sms_manager$432
		pop af
		pop af
		ld bc, $8000
		push bc
		call A$_sms_manager$472
		pop af
		ld hl, $0303
		push hl
		ld l, $0F
		push hl
		call A$_sms_manager$514
		pop af
		pop af
		ret
	
A$content_manager$204:	
C$content_manager.c$35$1$19:	
C$content_manager.c$37$1$20:	
G$engine_content_manager_load_ti:	
_engine_content_manager_load_tit:	
		ld a, $03
		push af
		inc sp
		call A$_sms_manager$181
		inc sp
		ld hl, $0040
		push hl
		ld hl, A$title_screen$347	; A$title_screen$347 = $1345
		push hl
		call A$_sms_manager$400
		pop af
		pop af
		ld bc, A$title_screen$264 + 1	; A$title_screen$264 + 1 = $12E8
		push bc
		ld hl, $0000
		push hl
		call A$_sms_manager$432
		pop af
		pop af
		ld bc, A$title_screen$246	; A$title_screen$246 = $12D8
		push bc
		call A$_sms_manager$472
		pop af
		ld hl, $0303
		push hl
		ld l, $0F
		push hl
		call A$_sms_manager$514
		pop af
		pop af
		ret
	
A$content_manager$263:	
C$content_manager.c$47$1$20:	
C$content_manager.c$50$1$21:	
G$engine_content_manager_load_sp:	
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