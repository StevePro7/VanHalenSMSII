; Data from 119D to 119F (3 bytes)	
_screen_splash_screen_load:
	;.db $CD $2B $08
	call $082B
	
; Data from 11A0 to 11A2 (3 bytes)	
A$splash_screen$73:
C$splash_screen.c$17$1$25:
	;.db $CD $A2 $0A
	call $0AA2
	
; Data from 11A3 to 11A5 (3 bytes)	
A$splash_screen$77:
C$splash_screen.c$18$1$25:
	;.db $CD $B8 $0A
	call $0AB8
	
; Data from 11A6 to 11A8 (3 bytes)	
A$splash_screen$81:
C$splash_screen.c$19$1$25:
	;.db $CD $25 $08
	call $0825
	
; Data from 11A9 to 11AB (3 bytes)	
A$splash_screen$85:
C$splash_screen.c$21$1$25:
	;.db $21 $96 $00
	ld hl, $0096
	
; Data from 11AC to 11AC (1 bytes)	
A$splash_screen$86:
	;.db $E5
	push hl
	
; Data from 11AD to 11AF (3 bytes)	
A$splash_screen$87:
	;.db $CD $CD $10
	call $10CD
	
; Data from 11B0 to 11B2 (3 bytes)	
A$splash_screen$91:
C$splash_screen.c$22$1$25:
	;.db $21 $4B $00
	ld hl, $004B
	
; Data from 11B3 to 11B3 (1 bytes)	
A$splash_screen$92:
	;.db $E3
	ex (sp), hl
	
; Data from 11B4 to 11B6 (3 bytes)	
A$splash_screen$93:
	;.db $CD $08 $11
	call $1108
	
; Data from 11B7 to 11B7 (1 bytes)	
A$splash_screen$94:
	;.db $F1
	pop af
	
; Data from 11B8 to 11B8 (1 bytes)	
A$splash_screen$99:
C$splash_screen.c$23$1$25:
XG$screen_splash_screen_load$0$0:
	;.db $C9
	ret
	
; Data from 11B9 to 11BA (2 bytes)	
A$splash_screen$109:
C$splash_screen.c$25$1$25:
G$screen_splash_screen_update$0$:
_screen_splash_screen_update:
	;.db $DD $E5
	push ix
	
; Data from 11BB to 11BE (4 bytes)	
A$splash_screen$110:
	;.db $DD $21 $00 $00
	ld ix, $0000
	
; Data from 11BF to 11C0 (2 bytes)	
A$splash_screen$111:
	;.db $DD $39
	add ix, sp

; Data from 11C1 to 11C1 (1 bytes)	
A$splash_screen$112:
	;.db $F5
	push af
	
; Data from 11C2 to 11C4 (3 bytes)	
A$splash_screen$116:
C$splash_screen.c$32$1$27:
	;.db $CD $E6 $10
	call $10E6
	
; Data from 11C5 to 11C7 (3 bytes)	
A$splash_screen$117:
	;.db $DD $75 $FE
	ld (ix - 2), l
	
; Data from 11C8 to 11C9 (2 bytes)	
A$splash_screen$121:
C$splash_screen.c$33$1$27:
	;.db $3E $10
	ld a, $10
	
; Data from 11CA to 11CA (1 bytes)	
A$splash_screen$122:
	;.db $F5
	push af
	
; Data from 11CB to 11CB (1 bytes)	
A$splash_screen$123:
	;.db $33
	inc sp

; Data from 11CC to 11CE (3 bytes)	
A$splash_screen$124:
	;.db $CD $D3 $0E
	call $0ED3
	
; Data from 11CF to 11CF (1 bytes)	
A$splash_screen$125:
	;.db $33
	inc sp
	
; Data from 11D0 to 11D2 (3 bytes)	
A$splash_screen$126:
	;.db $DD $75 $FF
	ld (ix - 1), l
	
; Data from 11D3 to 11D4 (2 bytes)	
A$splash_screen$130:
C$splash_screen.c$34$1$27:
	;.db $3E $20
	ld a, $20
	
; Data from 11D5 to 11D5 (1 bytes)	
A$splash_screen$131:
	;.db $F5
	push af
	
; Data from 11D6 to 11D6 (1 bytes)	
A$splash_screen$132:
	;.db $33
	inc sp
	
; Data from 11D7 to 11D9 (3 bytes)	
A$splash_screen$133:
	;.db $CD $00 $0F
	call $0F00
	
; Data from 11DA to 11DA (1 bytes)	
A$splash_screen$134:
	;.db $33
	inc sp
	
; Data from 11DB to 11DB (1 bytes)	
A$splash_screen$138:
C$splash_screen.c$35$1$27:
	;.db $7D
	ld a, l

; Data from 11DC to 11DC (1 bytes)	
A$splash_screen$139:
	;.db $B7
	or a

; Data from 11DD to 11DE (2 bytes)	
A$splash_screen$140:
	;.db $28 $1C
	jr z, $1C

; Data from 11DF to 11E1 (3 bytes)	
A$splash_screen$144:
C$splash_screen.c$37$2$28:
	;.db $CD $1D $11
	call $111D
	
; Data from 11E2 to 11E2 (1 bytes)	
A$splash_screen$148:
C$splash_screen.c$38$2$28:
	;.db $7D
	ld a, l
	
; Data from 11E3 to 11E3 (1 bytes)	
A$splash_screen$149:
	;.db $B7
	or a
	
; Data from 11E4 to 11E5 (2 bytes)	
A$splash_screen$150:
	;.db $28 $18
	jr z, $18
	
; Data from 11E6 to 11E8 (3 bytes)	
A$splash_screen$154:
C$splash_screen.c$40$3$29:
	;.db $CD $AB $10
	call $10AB
	
; Data from 11E9 to 11EB (3 bytes)	
A$splash_screen$158:
C$splash_screen.c$42$3$29:
	;.db $CD $3F $11
	call $113F
	
; Data from 11EC to 11EE (3 bytes)	
A$splash_screen$162:
C$splash_screen.c$43$3$29:
	;.db $21 $1C $17
	ld hl, $171C
	
; Data from 11EF to 11EF (1 bytes)	
A$splash_screen$163:
	;.db $E5
	push hl
	
; Data from 11F0 to 11F2 (3 bytes)	
A$splash_screen$164:
	;.db $21 $1B $12
	ld hl, $121B
	
; Data from 11F3 to 11F3 (1 bytes)	
A$splash_screen$165:
	;.db $E5
	push hl
	
; Data from 11F4 to 11F6 (3 bytes)	
A$splash_screen$166:
	;.db $CD $E9 $0D
	call $0DE9
	
; Data from 11F7 to 11F7 (1 bytes)	
A$splash_screen$167:
	;.db $F1
	pop af
	
; Data from 11F8 to 11F8 (1 bytes)	
A$splash_screen$168:
	;.db $F1
	pop af
	
; Data from 11F9 to 11FA (2 bytes)	
A$splash_screen$169:
	;.db $18 $03
	jr $03
	
; Data from 11FB to 11FD (3 bytes)	
A$splash_screen$174:
C$splash_screen.c$48$2$30:
	;.db $CD $3F $11
	call $113F
	
; Data from 11FE to 1200 (3 bytes)	
A$splash_screen$179:
C$splash_screen.c$53$1$27:
	;.db $DD $6E $04
	ld l, (ix + $04)
	
; Data from 1201 to 1203 (3 bytes)	
A$splash_screen$180:
	;.db $DD $66 $05
	ld h, (ix + $05)
	
; Data from 1204 to 1206 (3 bytes)	
A$splash_screen$184:
C$splash_screen.c$51$1$27:
	;.db $DD $7E $FE
	ld a, (ix - 2)
	
; Data from 1207 to 1207 (1 bytes)	
A$splash_screen$185:
	;.db $B7
	or a
	
; Data from 1208 to 1209 (2 bytes)	
A$splash_screen$186:
	;.db $20 $06
	jr nz, $06
	
; Data from 120A to 120C (3 bytes)	
A$splash_screen$187:
	;.db $DD $7E $FF
	ld a, (ix - 1)
	
; Data from 120D to 120D (1 bytes)	
A$splash_screen$188:
	;.db $B7
	or a
	
; Data from 120E to 120F (2 bytes)	
A$splash_screen$189:
	;.db $28 $04
	jr z, $04
	
; Data from 1210 to 1211 (2 bytes)	
A$splash_screen$194:
C$splash_screen.c$53$2$31:
	;.db $36 $02
	ld (hl), $02
	
; Data from 1212 to 1213 (2 bytes)	
A$splash_screen$198:
C$splash_screen.c$54$2$31:
	;.db $18 $02
	jr $02
	
; Data from 1214 to 1215 (2 bytes)	
A$splash_screen$203:
C$splash_screen.c$57$1$27:
	;.db $36 $01
	ld (hl), $01
	
; Data from 1216 to 1217 (2 bytes)	
A$splash_screen$205:
	;.db $DD $F9
	ld sp, ix
	
; Data from 1218 to 1219 (2 bytes)	
A$splash_screen$206:
	;.db $DD $E1
	pop ix
	
; Data from 121A to 121A (1 bytes)	
A$splash_screen$211:
C$splash_screen.c$58$1$27:
XG$screen_splash_screen_update$0:
	;.db $C9
	ret
	
; Data from 121B to 121F (5 bytes)	
Fsplash_screen$__str_0$0$0:
; "5150"
	.db $35 $31 $35 $30 $00