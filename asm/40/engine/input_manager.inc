A$input_manager$64:
C$input_manager.c$10$0$0:
C$input_manager.c$12$1$19:
G$engine_input_manager_update$0$:
_engine_input_manager_update:
		ld hl, (Finput_manager$curr_joypad1$0$0)	; Finput_manager$curr_joypad1$0$0 = $C146
		ld (Finput_manager$prev_joypad1$0$0), hl	; Finput_manager$prev_joypad1$0$0 = $C148
		call A$_sms_manager$874
		ld (Finput_manager$curr_joypad1$0$0), hl	; Finput_manager$curr_joypad1$0$0 = $C146
		ret
	
; Data from ED3 to ED5 (3 bytes)	
A$input_manager$88:
C$input_manager.c$17$1$19:
C$input_manager.c$19$1$21:
G$engine_input_manager_hold$0$0:
_engine_input_manager_hold:
	.db $21 $02 $00
	
; Data from ED6 to ED6 (1 bytes)	
A$input_manager$89:
	.db $39
	
; Data from ED7 to ED7 (1 bytes)	
A$input_manager$90:
	.db $4E
	
; Data from ED8 to ED9 (2 bytes)	
A$input_manager$91:
	.db $06 $00
	
; Data from EDA to EDD (4 bytes)	
A$input_manager$92:
	.db $FD $21 $46 $C1
	
; Data from EDE to EE0 (3 bytes)	
A$input_manager$93:
	.db $FD $7E $00
	
; Data from EE1 to EE1 (1 bytes)	
A$input_manager$94:
	.db $A1
	
; Data from EE2 to EE2 (1 bytes)	
A$input_manager$95:
	.db $5F
	
; Data from EE3 to EE5 (3 bytes)	
A$input_manager$96:
	.db $FD $7E $01
	
; Data from EE6 to EE6 (1 bytes)	
A$input_manager$97:
	.db $A0
	
; Data from EE7 to EE7 (1 bytes)	
A$input_manager$98:
	.db $B3
	
; Data from EE8 to EE9 (2 bytes)	
A$input_manager$99:
	.db $28 $10
	
; Data from EEA to EEA (1 bytes)	
A$input_manager$100:
	.db $79
	
; Data from EEB to EEE (4 bytes)	
A$input_manager$101:
	.db $FD $21 $48 $C1
	
; Data from EEF to EF1 (3 bytes)	
A$input_manager$102:
	.db $FD $A6 $00
	
; Data from EF2 to EF2 (1 bytes)	
A$input_manager$103:
	.db $4F
	
; Data from EF3 to EF3 (1 bytes)	
A$input_manager$104:
	.db $78
	
; Data from EF4 to EF6 (3 bytes)	
A$input_manager$105:
	.db $FD $A6 $01
	
; Data from EF7 to EF7 (1 bytes)	
A$input_manager$106:
	.db $B1
	
; Data from EF8 to EF9 (2 bytes)	
A$input_manager$107:
	.db $28 $03
	
; Data from EFA to EFB (2 bytes)	
A$input_manager$109:
	.db $2E $00
	
; Data from EFC to EFC (1 bytes)	
A$input_manager$110:
	.db $C9
	
; Data from EFD to EFE (2 bytes)	
A$input_manager$112:
	.db $2E $01
	
; Data from EFF to EFF (1 bytes)	
A$input_manager$117:
C$input_manager.c$20$1$21:
XG$engine_input_manager_hold$0$0:
	.db $C9
	
; Data from F00 to F02 (3 bytes)	
A$input_manager$130:
C$input_manager.c$22$1$21:
C$input_manager.c$24$1$23:
G$engine_input_manager_move$0$0:
_engine_input_manager_move:
	.db $21 $02 $00
	
; Data from F03 to F03 (1 bytes)	
A$input_manager$131:
	.db $39
	
; Data from F04 to F04 (1 bytes)	
A$input_manager$132:
	.db $4E
	
; Data from F05 to F07 (3 bytes)	
A$input_manager$133:
	.db $3A $46 $C1
	
; Data from F08 to F08 (1 bytes)	
A$input_manager$134:
	.db $A1
	
; Data from F09 to F09 (1 bytes)	
A$input_manager$135:
	.db $6F
	
; Data from F0A to F0A (1 bytes)	
A$input_manager$140:
C$input_manager.c$25$1$23:
XG$engine_input_manager_move$0$0:
	.db $C9