; Data from 1042 to 1044 (3 bytes)
_engine_storage_manager_availabl:
	;.db $CD $6D $08
	call _devkit_SMS_SRAM

; Data from 1045 to 1045 (1 bytes)
	push hl

; Data from 1046 to 1048 (3 bytes)
	;.db $CD $52 $08
	call _devkit_SMS_enableSRAM

; Data from 1049 to 1049 (1 bytes)
	.db $E1

; Data from 104A to 104A (1 bytes)
	.db $4E

; Data from 104B to 104B (1 bytes)
	.db $23

; Data from 104C to 104C (1 bytes)
	.db $46

; Data from 104D to 104D (1 bytes)
	.db $23

; Data from 104E to 104E (1 bytes)
	.db $5E

; Data from 104F to 104F (1 bytes)
	.db $23

; Data from 1050 to 1050 (1 bytes)
	.db $56

; Data from 1051 to 1051 (1 bytes)
	.db $79

; Data from 1052 to 1053 (2 bytes)
	.db $D6 $04

; Data from 1054 to 1055 (2 bytes)
	.db $20 $13

; Data from 1056 to 1056 (1 bytes)
	.db $78

; Data from 1057 to 1058 (2 bytes)
	.db $D6 $B0

; Data from 1059 to 105A (2 bytes)
	.db $20 $0E

; Data from 105B to 105B (1 bytes)
	.db $7B

; Data from 105C to 105D (2 bytes)
	.db $D6 $E0

; Data from 105E to 105F (2 bytes)
	.db $20 $09

; Data from 1060 to 1060 (1 bytes)
	.db $7A

; Data from 1061 to 1062 (2 bytes)
	.db $D6 $AC

; Data from 1063 to 1064 (2 bytes)
	.db $20 $04

; Data from 1065 to 1066 (2 bytes)
	.db $3E $01

; Data from 1067 to 1068 (2 bytes)
	.db $18 $01

; Data from 1069 to 1069 (1 bytes)
	.db $AF

; Data from 106A to 106A (1 bytes)
	.db $6F

; Data from 106B to 106B (1 bytes)
	push hl

; Data from 106C to 106E (3 bytes)
	.db $CD $67 $08

; Data from 106F to 106F (1 bytes)
	.db $E1

; Data from 1070 to 1070 (1 bytes)
	.db $C9

; Data from 1071 to 1073 (3 bytes)
_engine_storage_manager_read:
	.db $CD $6D $08

; Data from 1074 to 1074 (1 bytes)
	push hl

; Data from 1075 to 1077 (3 bytes)
	.db $CD $52 $08

; Data from 1078 to 1079 (2 bytes)
	.db $FD $E1

; Data from 107A to 107C (3 bytes)
	.db $FD $4E $04

; Data from 107D to 107F (3 bytes)
	.db $21 $2A $C0

; Data from 1080 to 1080 (1 bytes)
	.db $71

; Data from 1081 to 1083 (3 bytes)
	.db $C3 $67 $08

; Data from 1084 to 1086 (3 bytes)
_engine_storage_manager_write:
	.db $CD $6D $08

; Data from 1087 to 1087 (1 bytes)
	push hl

; Data from 1088 to 108A (3 bytes)
	.db $CD $52 $08

; Data from 108B to 108B (1 bytes)
	.db $C1

; Data from 108C to 108C (1 bytes)
	.db $69

; Data from 108D to 108D (1 bytes)
	.db $60

; Data from 108E to 108F (2 bytes)
	.db $36 $04

; Data from 1090 to 1090 (1 bytes)
	.db $23

; Data from 1091 to 1092 (2 bytes)
	.db $36 $B0

; Data from 1093 to 1093 (1 bytes)
	.db $23

; Data from 1094 to 1095 (2 bytes)
	.db $36 $E0

; Data from 1096 to 1096 (1 bytes)
	.db $23

; Data from 1097 to 1098 (2 bytes)
	.db $36 $AC

; Data from 1099 to 109B (3 bytes)
	.db $21 $04 $00

; Data from 109C to 109C (1 bytes)
	.db $09

; Data from 109D to 109D (1 bytes)
	.db $EB

; Data from 109E to 10A0 (3 bytes)
	.db $3A $2A $C0

; Data from 10A1 to 10A1 (1 bytes)
	.db $12

; Data from 10A2 to 10A4 (3 bytes)
	.db $21 $05 $00

; Data from 10A5 to 10A5 (1 bytes)
	.db $09

; Data from 10A6 to 10A7 (2 bytes)
	.db $36 $FE

; Data from 10A8 to 10AA (3 bytes)
	.db $C3 $67 $08

; Data from 10AB to 10AD (3 bytes)
_engine_storage_manager_erase:
	.db $CD $6D $08

; Data from 10AE to 10AE (1 bytes)
	push hl

; Data from 10AF to 10B1 (3 bytes)
	.db $CD $52 $08

; Data from 10B2 to 10B2 (1 bytes)
	.db $C1

; Data from 10B3 to 10B3 (1 bytes)
	.db $69

; Data from 10B4 to 10B4 (1 bytes)
	.db $60

; Data from 10B5 to 10B5 (1 bytes)
	.db $AF

; Data from 10B6 to 10B6 (1 bytes)
	.db $77

; Data from 10B7 to 10B7 (1 bytes)
	.db $23

; Data from 10B8 to 10B8 (1 bytes)
	.db $77

; Data from 10B9 to 10B9 (1 bytes)
	.db $23

; Data from 10BA to 10BA (1 bytes)
	.db $AF

; Data from 10BB to 10BB (1 bytes)
	.db $77

; Data from 10BC to 10BC (1 bytes)
	.db $23

; Data from 10BD to 10BD (1 bytes)
	.db $77

; Data from 10BE to 10C0 (3 bytes)
	.db $21 $04 $00

; Data from 10C1 to 10C1 (1 bytes)
	.db $09

; Data from 10C2 to 10C3 (2 bytes)
	.db $36 $00

; Data from 10C4 to 10C6 (3 bytes)
	.db $21 $05 $00

; Data from 10C7 to 10C7 (1 bytes)
	.db $09

; Data from 10C8 to 10C9 (2 bytes)
	.db $36 $FE

; Data from 10CA to 10CC (3 bytes)
	.db $C3 $67 $08
