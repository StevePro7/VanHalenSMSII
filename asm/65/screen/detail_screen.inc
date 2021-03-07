.section "screen_detail_screen_load" free
screen_detail_screen_load:
	ret

.ends

.section "screen_detail_screen_update" free
screen_detail_screen_update:
	pop bc
	pop hl
	push hl
	push bc
	ld (hl), $06		; screen_type_detail
	ret
.ends
