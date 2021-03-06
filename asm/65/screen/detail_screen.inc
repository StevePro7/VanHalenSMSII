.section "Detail screen" free
screen_detail_screen_load:
	ret

screen_detail_screen_update:
	pop bc
	pop hl
	push hl
	push bc
	ld (hl), $06		; screen_type_detail
	ret

.ends
