
.section "OUTI128:" free
OUTI128:	
.rept 64
		outi
.endr
.ends

.section "OUTI64:" free
OUTI64:	
		.rept 32
		outi
.endr
.ends

.section "OUTI32:" free
OUTI32:	
		.rept 32
		outi
.endr
		ret
	
; Data from 19A to 1FF (102 bytes)
;	.dsb 102, $00
.rept 102
	nop
.endr	
.ends
