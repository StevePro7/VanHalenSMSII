A$scroll_manager$61:	
C$scroll_manager.c$10$1$18:	
C$scroll_manager.c$8$0$0:	
G$engine_scroll_manager_reset$0$:	
_engine_scroll_manager_reset:	
		xor a
		push af
		inc sp
		call A$scroll_manager$94
		inc sp
		xor a
		push af
		inc sp
		call A$_sms_manager$222
		inc sp
		ret
	
A$scroll_manager$94:	
C$scroll_manager.c$14$1$18:	
C$scroll_manager.c$16$1$20:	
C$scroll_manager.c$17$1$20:	
G$engine_scroll_manager_load$0$0:	
_engine_scroll_manager_load:	
		ld hl, G$global_scroll_object$0$0	; G$global_scroll_object$0$0 = $C045
		ld iy, $0002
		add iy, sp
		ld a, (iy+0)
		ld (hl), a
		ret