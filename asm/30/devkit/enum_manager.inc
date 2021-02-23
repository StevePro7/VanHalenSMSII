.enum $C000 export	
Lmain.main$global_pause$1$55 db		; Lmain.main$global_pause$1$55 = $C000
PSGMusicStatus db                   ; PSGMusicStatus = $C001
PSGMusicStart dw                    ; PSGMusicStart = $C002
PSGMusicPointer dw		            ; PSGMusicPointer = $C004
PSGMusicLoopPoint dw		        ; PSGMusicLoopPoint = $C006
PSGMusicSkipFrames db		        ;  PSGMusicSkipFrames = $C008
PSGLoopFlag db		                ; PSGLoopFlag = $C009
PSGMusicLastLatch db		        ; PSGMusicLastLatch = $C00A
PSGMusicVolumeAttenuation db		; PSGMusicVolumeAttenuation = $C00B
PSGMusicSubstringLen db		        ; PSGMusicSubstringLen = $C00C
PSGMusicSubstringRetAddr dw		    ; PSGMusicSubstringRetAddr = $C00D
PSGChan0Volume db		            ; PSGChan0Volume = $C00F
PSGChan1Volume db		            ; PSGChan1Volume = $C010
PSGChan2Volume db		            ; PSGChan2Volume = $C011
PSGChan3Volume db		            ; PSGChan3Volume = $C012
PSGChan2LowTone db		            ; PSGChan2LowTone = $C013
PSGChan2HighTone db		            ; PSGChan2HighTone = $C014
PSGChan3LowTone db		            ; PSGChan3LowTone = $C015
PSGChannel2SFX db		            ; PSGChannel2SFX = $C016
PSGChannel3SFX db		            ; PSGChannel3SFX = $C017
PSGSFXChan2Volume db		        ; PSGSFXChan2Volume = $C018
PSGSFXChan3Volume db		        ; PSGSFXChan3Volume = $C019
PSGSFXStatus db		                ; PSGSFXStatus = $C01A
PSGSFXStart dw		                ; PSGSFXStart = $C01B
PSGSFXPointer dw		            ; PSGSFXPointer = $C01D
PSGSFXLoopPoint dw		            ; PSGSFXLoopPoint = $C01F
PSGSFXSkipFrames db		            ; PSGSFXSkipFrames = $C021
PSGSFXLoopFlag db		            ; PSGSFXLoopFlag = $C022
PSGSFXSubstringLen db		        ; PSGSFXSubstringLen = $C023
PSGSFXSubstringRetAddr dw		    ; PSGSFXSubstringRetAddr = $C024
.ende	
	
.enum $C02B export	
Fscreen_manager$curr_screen_type db	    ; Fscreen_manager$curr_screen_type = $C02B
Fscreen_manager$next_screen_type db	    ; Fscreen_manager$next_screen_type = $C02C
Fscreen_manager$load_method$0$0 dw	    ; Fscreen_manager$load_method$0$0 = $C02D
_RAM_C02F_ dw	
_RAM_C031_ dw	
_RAM_C033_ dw	
_RAM_C035_ dw	
_RAM_C037_ dw	
_RAM_C039_ dw	
_RAM_C03B_ dw	
_RAM_C03D_ dw	
_RAM_C03F_ dw	
_RAM_C041_ dw	
_RAM_C043_ dw	
_RAM_C045_ db	
.ende	
	
.enum $C05B export	
VDPBlank db		                        ; VDPBlank = $C05B
SMS_VDPFlags db		                    ; SMS_VDPFlags = $C05C
PauseRequested db		                ; PauseRequested = $C05D
VDPType db		                        ; VDPType = $C05E
KeysStatus dw		                    ; KeysStatus = $C05F
PreviousKeysStatus dw		            ; PreviousKeysStatus = $C061
SpriteTableY db		                    ; SpriteTableY = $C063
.ende	
	
.enum $C0A3 export	
SpriteTableXN db	                    ; SpriteTableXN = $C0A3
.ende	
	
.enum $C123 export	
_RAM_C123_ db	
_RAM_C124_ dw	
_RAM_C126_ db	
.ende	
	
.enum $C146 export	
Finput_manager$curr_joypad1$0$0 dw		; Finput_manager$curr_joypad1$0$0 = $C146
Finput_manager$prev_joypad1$0$0 dw		; Finput_manager$prev_joypad1$0$0 = $C148
.ende	
	
.enum $C1AA export	
_RAM_C1AA_ db	
.ende	
	
.enum $C1AC export	
_RAM_C1AC_ db	
_RAM_C1AD_ db	
.ende	
	
.enum $FFFC export	
_RAM_FFFC_ db	
.ende	