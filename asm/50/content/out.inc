_OUTI128:	
.rept 64
		outi
.endr
_OUTI64:	
		.rept 64
		outi
.endr
		ret
	
; Data from 19A to 1FF (102 bytes)
;	.dsb 102, $00
.rept 102
	nop
.endr	