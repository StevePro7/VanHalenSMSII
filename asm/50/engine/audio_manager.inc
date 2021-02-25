; Data from A70 to A72 (3 bytes)
_engine_audio_manager_sfx_right:
		ld hl, _sfx_right_psg
		push hl
		call play_sfx
		pop af
		ret

; Data from A79 to A7B (3 bytes)
_engine_audio_manager_sfx_wrong:
		ld hl, _sfx_wrong_psg
		push hl
		call play_sfx
		pop af
		ret

; Data from A82 to A84 (3 bytes)
_engine_audio_manager_sfx_cheat:
	.db $21 $39 $1A

; Data from A85 to A85 (1 bytes)
	push hl

; Data from A86 to A88 (3 bytes)
	.db $CD $8B $0A

; Data from A89 to A89 (1 bytes)
	pop af

; Data from A8A to A8A (1 bytes)
	ret

 play_sfx:
; Data from A8B to A8D (3 bytes)
	;.db $CD $42 $0A
	;call $0A42
	call _devkit_PSGSFXGetStatus
	
; Data from A8E to A8E (1 bytes)
	ld a, l

; Data from A8F to A8F (1 bytes)
	.db $B7

; Data from A90 to A90 (1 bytes)
	.db $C0

; Data from A91 to A93 (3 bytes)
	.db $CD $51 $0A

; Data from A94 to A94 (1 bytes)
	.db $65

; Data from A95 to A95 (1 bytes)
	.db $D1

; Data from A96 to A96 (1 bytes)
	.db $C1

; Data from A97 to A97 (1 bytes)
	.db $C5

; Data from A98 to A98 (1 bytes)
	.db $D5

; Data from A99 to A99 (1 bytes)
	push hl

; Data from A9A to A9A (1 bytes)
	.db $33

; Data from A9B to A9B (1 bytes)
	.db $C5

; Data from A9C to A9E (3 bytes)
	.db $CD $2A $0A

; Data from A9F to A9F (1 bytes)
	pop af

; Data from AA0 to AA0 (1 bytes)
	.db $33

; Data from AA1 to AA1 (1 bytes)
	ret
