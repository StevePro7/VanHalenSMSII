A$timer_manager$70:	
C$timer_manager.c$11$1$4:	
C$timer_manager.c$12$1$4:	
C$timer_manager.c$9$0$0:	
G$engine_delay_manager_load$0$0:	
_engine_delay_manager_load:	
		ld hl, G$global_delay_object$0$0	; G$global_delay_object$0$0 = $C04C
		ld iy, $0002
		add iy, sp
		ld a, (iy+0)
		ld (hl), a
		inc hl
		ld a, (iy+1)
		ld (hl), a
		ld hl, $0000
		ld (G$global_delay_object$0$0 + 2), hl	; G$global_delay_object$0$0 + 2 = $C04E
		ret
	
A$timer_manager$103:	
C$timer_manager.c$15$1$4:	
C$timer_manager.c$17$1$5:	
C$timer_manager.c$20$1$5:	
G$engine_delay_manager_update$0$:	
_engine_delay_manager_update:	
		ld bc, (G$global_delay_object$0$0 + 2)	; G$global_delay_object$0$0 + 2 = $C04E
		inc bc
		ld (G$global_delay_object$0$0 + 2), bc	; G$global_delay_object$0$0 + 2 = $C04E
		ld hl, (G$global_delay_object$0$0)	; G$global_delay_object$0$0 = $C04C
		ld a, c
		sub l
		ld a, b
		sbc a, h
		ld a, $00
		rla
		xor $01
		ld c, a
		ld b, a
		or a
		jr z, A$timer_manager$133
		ld hl, $0000
		ld (G$global_delay_object$0$0 + 2), hl	; G$global_delay_object$0$0 + 2 = $C04E
A$timer_manager$133:	
C$timer_manager.c$27$1$5:	
		ld l, b
		ret
	
A$timer_manager$154:	
C$timer_manager.c$32$1$5:	
C$timer_manager.c$34$1$8:	
C$timer_manager.c$35$1$8:	
G$engine_reset_manager_load$0$0:	
_engine_reset_manager_load:	
		ld hl, G$global_reset_object$0$0	; G$global_reset_object$0$0 = $C050
		ld iy, $0002
		add iy, sp
		ld a, (iy+0)
		ld (hl), a
		inc hl
		ld a, (iy+1)
		ld (hl), a
		jp A$timer_manager$236
	
A$timer_manager$185:	
C$timer_manager.c$38$1$8:	
C$timer_manager.c$40$1$9:	
C$timer_manager.c$43$1$9:	
G$engine_reset_manager_update$0$:	
_engine_reset_manager_update:	
		ld bc, (G$global_reset_object$0$0 + 2)	; G$global_reset_object$0$0 + 2 = $C052
		inc bc
		ld (G$global_reset_object$0$0 + 2), bc	; G$global_reset_object$0$0 + 2 = $C052
		ld hl, (G$global_reset_object$0$0)	; G$global_reset_object$0$0 = $C050
		ld a, c
		sub l
		ld a, b
		sbc a, h
		ld a, $00
		rla
		xor $01
		ld c, a
		ld b, a
		or a
		jr z, A$timer_manager$215
		ld hl, $0000
		ld (G$global_reset_object$0$0 + 2), hl	; G$global_reset_object$0$0 + 2 = $C052
A$timer_manager$215:	
C$timer_manager.c$50$1$9:	
		ld l, b
		ret
	
A$timer_manager$236:	
C$timer_manager.c$52$1$9:	
C$timer_manager.c$54$1$11:	
C$timer_manager.c$55$1$11:	
G$engine_reset_manager_reset$0$0:	
_engine_reset_manager_reset:	
		ld hl, $0000
		ld (G$global_reset_object$0$0 + 2), hl	; G$global_reset_object$0$0 + 2 = $C052
		ret