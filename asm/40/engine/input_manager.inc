_engine_input_manager_update:
		ld hl, (Finput_manager$curr_joypad1$0$0)	; Finput_manager$curr_joypad1$0$0 = $C146
		ld (Finput_manager$prev_joypad1$0$0), hl	; Finput_manager$prev_joypad1$0$0 = $C148
		call A$_sms_manager$874
		ld (Finput_manager$curr_joypad1$0$0), hl	; Finput_manager$curr_joypad1$0$0 = $C146
		ret

; Data from ED3 to ED5 (3 bytes)
_engine_input_manager_hold:
	.db $21 $02 $00

; Data from ED6 to ED6 (1 bytes)
	.db $39

; Data from ED7 to ED7 (1 bytes)
	.db $4E

; Data from ED8 to ED9 (2 bytes)
	.db $06 $00

; Data from EDA to EDD (4 bytes)
	.db $FD $21 $46 $C1

; Data from EDE to EE0 (3 bytes)
	.db $FD $7E $00

; Data from EE1 to EE1 (1 bytes)
	.db $A1

; Data from EE2 to EE2 (1 bytes)
	.db $5F

; Data from EE3 to EE5 (3 bytes)
	.db $FD $7E $01

; Data from EE6 to EE6 (1 bytes)
	.db $A0

; Data from EE7 to EE7 (1 bytes)
	.db $B3

; Data from EE8 to EE9 (2 bytes)
	.db $28 $10

; Data from EEA to EEA (1 bytes)
	.db $79

; Data from EEB to EEE (4 bytes)
	.db $FD $21 $48 $C1

; Data from EEF to EF1 (3 bytes)
	.db $FD $A6 $00

; Data from EF2 to EF2 (1 bytes)
	.db $4F

; Data from EF3 to EF3 (1 bytes)
	.db $78

; Data from EF4 to EF6 (3 bytes)
	.db $FD $A6 $01

; Data from EF7 to EF7 (1 bytes)
	.db $B1

; Data from EF8 to EF9 (2 bytes)
	.db $28 $03

; Data from EFA to EFB (2 bytes)
	.db $2E $00

; Data from EFC to EFC (1 bytes)
	.db $C9

; Data from EFD to EFE (2 bytes)
	.db $2E $01

; Data from EFF to EFF (1 bytes)
	.db $C9

; Data from F00 to F02 (3 bytes)
_engine_input_manager_move:
	.db $21 $02 $00

; Data from F03 to F03 (1 bytes)
	.db $39

; Data from F04 to F04 (1 bytes)
	.db $4E

; Data from F05 to F07 (3 bytes)
	.db $3A $46 $C1

; Data from F08 to F08 (1 bytes)
	.db $A1

; Data from F09 to F09 (1 bytes)
	.db $6F

; Data from F0A to F0A (1 bytes)
	.db $C9
