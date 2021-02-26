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
		call _devkit_PSGSFXGetStatus
		ld a, l
		or a
		ret nz
		call _devkit_SFX_CHANNEL2
		ld h, l
		pop de
		pop bc
		push bc
		push de
		push hl
		inc sp
		push bc
		call _devkit_PSGSFXPlay
		pop af
		inc sp
		ret