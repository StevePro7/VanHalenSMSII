_engine_scroll_manager_reset:
		xor a								; GAP_OFFSET	0
		push af
		inc sp
		call _engine_scroll_manager_load
		inc sp
		xor a
		push af
		inc sp
		call _devkit_SMS_setBGScrollY
		inc sp
		ret

_engine_scroll_manager_load:
		ld hl, G$global_scroll_object$0$0	; G$global_scroll_object$0$0 = $C045
		ld iy, $0002
		add iy, sp
		ld a, (iy+0)
		ld (hl), a
		ret