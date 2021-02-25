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
		ld hl, _sfx_cheat_psg
		push hl
		call play_sfx
		pop af
		ret

 play_sfx:
; Data from A8B to A8D (3 bytes)
	;.db $CD $42 $0A
	;call $0A42
	call _devkit_PSGSFXGetStatus
	
; Data from A8E to A8E (1 bytes)
	ld a, l

; Data from A8F to A8F (1 bytes)
	;.db $B7
	or a

; Data from A90 to A90 (1 bytes)
	;.db $C0
	ret nz

; Data from A91 to A93 (3 bytes)
	;.db $CD $51 $0A
	;call $0A51
	call _devkit_SFX_CHANNEL2

; Data from A94 to A94 (1 bytes)
	;.db $65
	ld h, l

; Data from A95 to A95 (1 bytes)
	pop de

; Data from A96 to A96 (1 bytes)
	pop bc

; Data from A97 to A97 (1 bytes)
	push bc

; Data from A98 to A98 (1 bytes)
	push de

; Data from A99 to A99 (1 bytes)
	push hl

; Data from A9A to A9A (1 bytes)
	inc sp

; Data from A9B to A9B (1 bytes)
	push bc

; Data from A9C to A9E (3 bytes)
	;.db $CD $2A $0A
	;call $0A2A
	call _devkit_PSGSFXPlay

; Data from A9F to A9F (1 bytes)
	pop af

; Data from AA0 to AA0 (1 bytes)
	inc sp

; Data from AA1 to AA1 (1 bytes)
	ret
