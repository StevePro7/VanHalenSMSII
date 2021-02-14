;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (MINGW64)
;--------------------------------------------------------
	.module _snd_manager
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _PSGSFXFrame
	.globl _PSGFrame
	.globl _PSGRestoreVolumes
	.globl _PSGSilenceChannels
	.globl _PSGSFXGetStatus
	.globl _PSGSFXStop
	.globl _PSGSFXPlay
	.globl _PSGSetMusicVolumeAttenuation
	.globl _PSGGetStatus
	.globl _PSGResume
	.globl _PSGStop
	.globl _PSGPlayNoRepeat
	.globl _PSGPlay
	.globl _devkit_PSGPlay
	.globl _devkit_PSGPlayNoRepeat
	.globl _devkit_PSGStop
	.globl _devkit_PSGResume
	.globl _devkit_PSGGetStatus
	.globl _devkit_PSGSetMusicVolumeAttenuation
	.globl _devkit_PSGSFXPlay
	.globl _devkit_PSGSFXStop
	.globl _devkit_PSGSFXGetStatus
	.globl _devkit_PSGSilenceChannels
	.globl _devkit_PSGRestoreVolumes
	.globl _devkit_PSGFrame
	.globl _devkit_PSGSFXFrame
	.globl _devkit_SFX_CHANNEL2
	.globl _devkit_SFX_CHANNEL3
	.globl _devkit_SFX_CHANNELS2AND3
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;_snd_manager.c:9: void devkit_PSGPlay( void *song )
;	---------------------------------
; Function devkit_PSGPlay
; ---------------------------------
_devkit_PSGPlay::
;_snd_manager.c:11: PSGPlay( song );
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	call	_PSGPlay
	pop	af
;_snd_manager.c:12: }
	ret
;_snd_manager.c:13: void devkit_PSGPlayNoRepeat( void *song )
;	---------------------------------
; Function devkit_PSGPlayNoRepeat
; ---------------------------------
_devkit_PSGPlayNoRepeat::
;_snd_manager.c:15: PSGPlayNoRepeat( song );
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	call	_PSGPlayNoRepeat
	pop	af
;_snd_manager.c:16: }
	ret
;_snd_manager.c:17: void devkit_PSGStop( void )
;	---------------------------------
; Function devkit_PSGStop
; ---------------------------------
_devkit_PSGStop::
;_snd_manager.c:19: PSGStop();
;_snd_manager.c:20: }
	jp	_PSGStop
;_snd_manager.c:21: void devkit_PSGResume( void )
;	---------------------------------
; Function devkit_PSGResume
; ---------------------------------
_devkit_PSGResume::
;_snd_manager.c:23: PSGResume();
;_snd_manager.c:24: }
	jp	_PSGResume
;_snd_manager.c:25: unsigned char devkit_PSGGetStatus( void )
;	---------------------------------
; Function devkit_PSGGetStatus
; ---------------------------------
_devkit_PSGGetStatus::
;_snd_manager.c:27: return PSGGetStatus();
;_snd_manager.c:28: }
	jp	_PSGGetStatus
;_snd_manager.c:29: void devkit_PSGSetMusicVolumeAttenuation( unsigned char attenuation )
;	---------------------------------
; Function devkit_PSGSetMusicVolumeAttenuation
; ---------------------------------
_devkit_PSGSetMusicVolumeAttenuation::
;_snd_manager.c:31: PSGSetMusicVolumeAttenuation( attenuation );
	ld	hl, #2+0
	add	hl, sp
	ld	a, (hl)
	push	af
	inc	sp
	call	_PSGSetMusicVolumeAttenuation
	inc	sp
;_snd_manager.c:32: }
	ret
;_snd_manager.c:34: void devkit_PSGSFXPlay( void *sfx, unsigned char channels )
;	---------------------------------
; Function devkit_PSGSFXPlay
; ---------------------------------
_devkit_PSGSFXPlay::
;_snd_manager.c:36: PSGSFXPlay( sfx, channels );
	ld	iy, #4
	add	iy, sp
	ld	a, 0 (iy)
	push	af
	inc	sp
	dec	iy
	dec	iy
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	call	_PSGSFXPlay
	pop	af
	inc	sp
;_snd_manager.c:37: }
	ret
;_snd_manager.c:38: void devkit_PSGSFXStop( void )
;	---------------------------------
; Function devkit_PSGSFXStop
; ---------------------------------
_devkit_PSGSFXStop::
;_snd_manager.c:40: PSGSFXStop();
;_snd_manager.c:41: }
	jp	_PSGSFXStop
;_snd_manager.c:42: unsigned char devkit_PSGSFXGetStatus( void )
;	---------------------------------
; Function devkit_PSGSFXGetStatus
; ---------------------------------
_devkit_PSGSFXGetStatus::
;_snd_manager.c:44: return PSGSFXGetStatus();
;_snd_manager.c:45: }
	jp	_PSGSFXGetStatus
;_snd_manager.c:47: void devkit_PSGSilenceChannels( void )
;	---------------------------------
; Function devkit_PSGSilenceChannels
; ---------------------------------
_devkit_PSGSilenceChannels::
;_snd_manager.c:49: PSGSilenceChannels();
;_snd_manager.c:50: }
	jp	_PSGSilenceChannels
;_snd_manager.c:51: void devkit_PSGRestoreVolumes( void )
;	---------------------------------
; Function devkit_PSGRestoreVolumes
; ---------------------------------
_devkit_PSGRestoreVolumes::
;_snd_manager.c:53: PSGRestoreVolumes();
;_snd_manager.c:54: }
	jp	_PSGRestoreVolumes
;_snd_manager.c:56: void devkit_PSGFrame( void )
;	---------------------------------
; Function devkit_PSGFrame
; ---------------------------------
_devkit_PSGFrame::
;_snd_manager.c:58: PSGFrame();
;_snd_manager.c:59: }
	jp	_PSGFrame
;_snd_manager.c:60: void devkit_PSGSFXFrame( void )
;	---------------------------------
; Function devkit_PSGSFXFrame
; ---------------------------------
_devkit_PSGSFXFrame::
;_snd_manager.c:62: PSGSFXFrame();
;_snd_manager.c:63: }
	jp	_PSGSFXFrame
;_snd_manager.c:66: unsigned char devkit_SFX_CHANNEL2()
;	---------------------------------
; Function devkit_SFX_CHANNEL2
; ---------------------------------
_devkit_SFX_CHANNEL2::
;_snd_manager.c:68: return SFX_CHANNEL2;
	ld	l, #0x01
;_snd_manager.c:69: }
	ret
;_snd_manager.c:70: unsigned char devkit_SFX_CHANNEL3()
;	---------------------------------
; Function devkit_SFX_CHANNEL3
; ---------------------------------
_devkit_SFX_CHANNEL3::
;_snd_manager.c:72: return SFX_CHANNEL3;
	ld	l, #0x02
;_snd_manager.c:73: }
	ret
;_snd_manager.c:74: unsigned char devkit_SFX_CHANNELS2AND3()
;	---------------------------------
; Function devkit_SFX_CHANNELS2AND3
; ---------------------------------
_devkit_SFX_CHANNELS2AND3::
;_snd_manager.c:76: return SFX_CHANNELS2AND3;
	ld	l, #0x03
;_snd_manager.c:77: }
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
