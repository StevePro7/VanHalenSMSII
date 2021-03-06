.section "Detail screen" free
_screen_detail_screen_load:
	ret

_screen_detail_screen_update:
	pop bc
	pop hl
	push hl
	push bc
	ld (hl), $06		; screen_type_detail
	ret

.ends