;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.2 #13350 (MINGW64)
;--------------------------------------------------------
	.module EyeExec
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _HitCheck
	.globl _DamageCheck
	.globl _EyePosAdjust
	.globl _EyeExec
	.globl _EyeExecMain
	.globl _EyeModeChange
	.globl _ChangeDirection
	.globl _EyeInit
	.globl _randGenetate
	.globl _EyeExecInit
	.globl _rand
	.globl _initrand
	.globl _set_sprite_data
	.globl _adjustCnt
	.globl _eye2Cnt
	.globl _eye1Cnt
	.globl _eye2Flag
	.globl _eye1Flag
	.globl _eye2Mode
	.globl _eye1Mode
	.globl _eye2Y
	.globl _eye2X
	.globl _eye1Y
	.globl _eye1X
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_eye1X::
	.ds 1
_eye1Y::
	.ds 1
_eye2X::
	.ds 1
_eye2Y::
	.ds 1
_eye1Mode::
	.ds 1
_eye2Mode::
	.ds 1
_eye1Flag::
	.ds 1
_eye2Flag::
	.ds 1
_eye1Cnt::
	.ds 1
_eye2Cnt::
	.ds 1
_adjustCnt::
	.ds 1
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
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:36: void EyeExecInit(){
;	---------------------------------
; Function EyeExecInit
; ---------------------------------
_EyeExecInit::
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:37: eye1X = 255;
	ld	hl, #_eye1X
	ld	(hl), #0xff
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:38: eye1Y = 255;
	ld	hl, #_eye1Y
	ld	(hl), #0xff
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:39: eye2X = 255;
	ld	hl, #_eye2X
	ld	(hl), #0xff
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:40: eye2Y = 255;
	ld	hl, #_eye2Y
	ld	(hl), #0xff
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:41: eye1Cnt = 0;
	ld	hl, #_eye1Cnt
	ld	(hl), #0x00
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:42: eye2Cnt = 0;
	ld	hl, #_eye2Cnt
	ld	(hl), #0x00
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:43: adjustCnt = 0;
	ld	hl, #_adjustCnt
	ld	(hl), #0x00
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:45: }
	ret
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:48: uint8_t randGenetate(uint8_t step){
;	---------------------------------
; Function randGenetate
; ---------------------------------
_randGenetate::
	add	sp, #-7
	ldhl	sp,	#6
	ld	(hl), a
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:49: uint16_t seed = LY_REG;
	ldh	a, (_LY_REG + 0)
	ld	c, a
	ld	b, #0x00
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:50: seed |= (uint16_t)DIV_REG << 8;
	ldh	a, (_DIV_REG + 0)
	ld	d, a
	ld	e, #0x00
	ld	a, c
	or	a, e
	ld	c, a
	ld	a, b
	or	a, d
	ld	b, a
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:51: initrand(seed);
	push	bc
	call	_initrand
	pop	hl
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:54: uI = rand();
	call	_rand
	ldhl	sp,	#0
	ld	(hl), e
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:55: if(step <= 2){
	ld	a, #0x02
	ldhl	sp,	#6
	sub	a, (hl)
	ld	a, #0x00
	rla
	ldhl	sp,	#1
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:57: if(uI <= 127){
	ld	(hl-), a
	ld	a, #0x7f
	sub	a, (hl)
	inc	hl
	inc	hl
	ld	a, #0x00
	rla
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:55: if(step <= 2){
	ld	(hl-), a
	bit	0, (hl)
	jr	NZ, 00149$
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:57: if(uI <= 127){
	inc	hl
	bit	0, (hl)
	jr	NZ, 00102$
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:58: return 0;
	xor	a, a
	jp	00151$
00102$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:61: return 1;
	ld	a, #0x01
	jp	00151$
00149$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:66: if(uI >= 0 && uI <= 63){
	ld	a, #0x3f
	ldhl	sp,	#0
	sub	a, (hl)
	ld	a, #0x00
	rla
	ldhl	sp,	#3
	ld	(hl), a
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:69: else if(uI >= 64 && uI <= 127){
	ldhl	sp,	#0
	ld	a, (hl)
	sub	a, #0x40
	ld	a, #0x00
	rla
	ldhl	sp,	#4
	ld	(hl), a
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:72: else if(uI >= 128 && uI <= 191){
	ldhl	sp,	#0
	ld	a, (hl)
	sub	a, #0x80
	ld	a, #0x00
	rla
	ldhl	sp,	#5
	ld	(hl), a
	ld	a, #0xbf
	ldhl	sp,	#0
	sub	a, (hl)
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:64: else if(step > 2 && step <= 4){
	inc	hl
	ld	a, #0x00
	rla
	ld	c, a
	ld	a, (hl)
	or	a, a
	jr	Z, 00143$
	ld	a, #0x04
	ldhl	sp,	#6
	sub	a, (hl)
	jr	C, 00143$
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:66: if(uI >= 0 && uI <= 63){
	ldhl	sp,	#3
	bit	0, (hl)
	jr	NZ, 00113$
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:67: return 0;
	xor	a, a
	jp	00151$
00113$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:69: else if(uI >= 64 && uI <= 127){
	ldhl	sp,	#4
	bit	0, (hl)
	jr	NZ, 00109$
	dec	hl
	dec	hl
	bit	0, (hl)
	jr	NZ, 00109$
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:70: return 1;
	ld	a, #0x01
	jp	00151$
00109$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:72: else if(uI >= 128 && uI <= 191){
	ldhl	sp,	#5
	bit	0, (hl)
	jr	NZ, 00105$
	bit	0, c
	jr	NZ, 00105$
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:73: return 2;
	ld	a, #0x02
	jr	00151$
00105$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:76: return 3;
	ld	a, #0x03
	jr	00151$
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:81: if(uI >= 0 && uI <= 31){
00143$:
	ld	a, #0x1f
	ldhl	sp,	#0
	sub	a, (hl)
	jr	C, 00141$
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:82: return 0;
	xor	a, a
	jr	00151$
00141$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:84: else if(uI >= 32 && uI <= 63){
	ldhl	sp,	#0
	ld	a, (hl)
	sub	a, #0x20
	jr	C, 00137$
	ldhl	sp,	#3
	bit	0, (hl)
	jr	NZ, 00137$
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:85: return 1;
	ld	a, #0x01
	jr	00151$
00137$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:87: else if(uI >= 64 && uI <= 95){
	ldhl	sp,	#4
	bit	0, (hl)
	jr	NZ, 00133$
	ld	a, #0x5f
	ldhl	sp,	#0
	sub	a, (hl)
	jr	C, 00133$
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:88: return 2;
	ld	a, #0x02
	jr	00151$
00133$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:90: else if(uI >= 96 && uI <= 127){
	ldhl	sp,	#0
	ld	a, (hl)
	sub	a, #0x60
	jr	C, 00129$
	inc	hl
	inc	hl
	bit	0, (hl)
	jr	NZ, 00129$
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:91: return 3;
	ld	a, #0x03
	jr	00151$
00129$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:93: else if(uI >= 128 && uI <= 159){
	ldhl	sp,	#5
	bit	0, (hl)
	jr	NZ, 00125$
	ld	a, #0x9f
	ldhl	sp,	#0
	sub	a, (hl)
	jr	C, 00125$
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:94: return 4;
	ld	a, #0x04
	jr	00151$
00125$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:96: else if(uI >= 160 && uI <= 191){
	ldhl	sp,	#0
	ld	a, (hl)
	sub	a, #0xa0
	jr	C, 00121$
	bit	0, c
	jr	NZ, 00121$
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:97: return 5;
	ld	a, #0x05
	jr	00151$
00121$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:99: else if(uI >= 192 && uI <= 223){
	ldhl	sp,	#0
	ld	a, (hl)
	sub	a, #0xc0
	jr	C, 00117$
	ld	a, #0xdf
	sub	a, (hl)
	jr	C, 00117$
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:100: return 6;
	ld	a, #0x06
	jr	00151$
00117$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:103: return 7;
	ld	a, #0x07
00151$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:106: }
	add	sp, #7
	ret
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:109: void EyeInit(uint8_t *eyeX, uint8_t *eyeY, 
;	---------------------------------
; Function EyeInit
; ---------------------------------
_EyeInit::
	add	sp, #-15
	ldhl	sp,	#13
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
	ldhl	sp,	#11
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:113: set_sprite_data(tile,4,EyeBeamShot1Tile);
	ld	de, #_EyeBeamShot1Tile
	push	de
	ld	a, #0x04
	push	af
	inc	sp
	ldhl	sp,	#28
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_sprite_data
	add	sp, #4
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:114: set_sprite_data(tile+4,4,EyeShadowTile);
	ld	bc, #_EyeShadowTile+0
	ldhl	sp,	#25
	ld	a, (hl)
	add	a, #0x04
	push	bc
	ld	h, #0x04
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	push	af
	inc	sp
	call	_set_sprite_data
	add	sp, #4
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:115: set_sprite_tile(spriteNum,tileIndex);
	ldhl	sp,	#27
	ld	a, (hl)
	ldhl	sp,	#9
	ld	(hl), a
	ldhl	sp,	#26
	ld	a, (hl)
	ldhl	sp,	#10
	ld	(hl), a
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	a, (hl)
	ldhl	sp,	#7
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
	ldhl	sp,	#8
	ld	a, (hl)
	ldhl	sp,	#1
	ld	(hl), a
	ld	a, #0x02
00409$:
	ldhl	sp,	#0
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00409$
	ld	de, #_shadow_OAM
	pop	hl
	push	hl
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#9
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#8
	ld	(hl-), a
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl+)
	ld	b, a
	inc	bc
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:116: set_sprite_tile(spriteNum+1,tileIndex+2);
	ld	a, (hl)
	ldhl	sp,	#2
	ld	(hl), a
	ld	a, (hl)
	add	a, #0x02
	ldhl	sp,	#6
	ld	(hl), a
	ldhl	sp,	#10
	ld	a, (hl)
	ldhl	sp,	#3
	ld	(hl), a
	ld	a, (hl+)
	inc	a
	ld	(hl), a
	ld	a, (hl)
	ldhl	sp,	#10
	ld	(hl), a
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	a, (hl-)
	ld	(hl+), a
	ld	(hl), #0x00
	ld	a, #0x02
00410$:
	ldhl	sp,	#9
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00410$
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_shadow_OAM
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#9
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#8
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0002
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#11
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#10
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#6
	ld	a, (hl)
	ld	(de), a
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:117: set_sprite_tile(spriteNum+2,tileIndex+4);
	ldhl	sp,	#2
	ld	a, (hl)
	add	a, #0x04
	ldhl	sp,	#5
	ld	(hl-), a
	dec	hl
	ld	a, (hl)
	add	a, #0x02
	ldhl	sp,	#6
	ld	(hl), a
	ld	a, (hl)
	ldhl	sp,	#10
	ld	(hl), a
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	a, (hl-)
	ld	(hl+), a
	ld	(hl), #0x00
	ld	a, #0x02
00411$:
	ldhl	sp,	#9
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00411$
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_shadow_OAM
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#9
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#8
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0002
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#11
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#10
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#5
	ld	a, (hl)
	ld	(de), a
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:118: set_sprite_tile(spriteNum+3,tileIndex+6);
	ldhl	sp,	#2
	ld	a, (hl)
	add	a, #0x06
	ldhl	sp,	#9
	ld	(hl), a
	ldhl	sp,	#3
	ld	a, (hl)
	add	a, #0x03
	ldhl	sp,	#10
	ld	(hl), a
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	a, (hl-)
	ld	(hl+), a
	ld	(hl), #0x00
	ld	a, #0x02
00412$:
	ldhl	sp,	#7
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00412$
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_shadow_OAM
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0002
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#9
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#8
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (hl)
	ld	(de), a
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1648: shadow_OAM[nb].prop=prop;
	ld	bc, #_shadow_OAM+0
	pop	hl
	push	hl
	add	hl, bc
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x02
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:120: set_sprite_prop(spriteNum+1,0x02);
	ldhl	sp,	#4
	ld	c, (hl)
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1648: shadow_OAM[nb].prop=prop;
	ldhl	sp,	#8
	ld	a, c
	ld	(hl+), a
	ld	(hl), #0x00
	ld	a, #0x02
00413$:
	ldhl	sp,	#8
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00413$
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_shadow_OAM
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0003
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#10
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#9
	ld	(hl-), a
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x02
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:121: set_sprite_prop(spriteNum+2,0x01);
	ldhl	sp,	#6
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1648: shadow_OAM[nb].prop=prop;
	ld	a, (hl+)
	inc	hl
	ld	(hl+), a
	ld	(hl), #0x00
	ld	a, #0x02
00414$:
	ldhl	sp,	#8
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00414$
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_shadow_OAM
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0003
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#10
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#9
	ld	(hl-), a
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x01
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:122: set_sprite_prop(spriteNum+3,0x01);
	ldhl	sp,	#10
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1648: shadow_OAM[nb].prop=prop;
	ld	a, (hl-)
	dec	hl
	ld	(hl+), a
	ld	(hl), #0x00
	ld	a, #0x02
00415$:
	ldhl	sp,	#8
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00415$
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_shadow_OAM
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0003
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#10
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#9
	ld	(hl-), a
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x01
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:123: if(*bkgX < 48 && *bkgY < 48){
	ldhl	sp,	#21
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, (bc)
	ldhl	sp,	#9
	ld	(hl), a
	ld	a, (hl-)
	sub	a, #0x30
	ld	a, #0x00
	rla
	ld	(hl), a
	ldhl	sp,	#23
	ld	a, (hl)
	ldhl	sp,	#2
	ld	(hl), a
	ldhl	sp,	#24
	ld	a, (hl)
	ldhl	sp,	#3
	ld	(hl), a
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:140: *eyeMode = MOVELEFT;
	ldhl	sp,	#28
	ld	a, (hl)
	ldhl	sp,	#4
	ld	(hl), a
	ldhl	sp,	#29
	ld	a, (hl)
	ldhl	sp,	#5
	ld	(hl), a
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:123: if(*bkgX < 48 && *bkgY < 48){
	ldhl	sp,	#8
	ld	a, (hl)
	or	a, a
	jp	Z, 00183$
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	sub	a, #0x30
	jp	NC, 00183$
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:126: uint8_t randNum1 = randGenetate(2);
	ld	a, #0x02
	call	_randGenetate
	ld	e, a
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:127: uint8_t randNum2 = randGenetate(8);
	push	de
	ld	a, #0x08
	call	_randGenetate
	pop	de
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:129: adjustCnt = adjustCnt + 1;
	ld	hl, #_adjustCnt
	ld	c, (hl)
	inc	c
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:128: if(randNum2 == 7){
	cp	a, #0x07
	jr	NZ, 00102$
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:129: adjustCnt = adjustCnt + 1;
	ld	(hl), c
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:130: return;
	jp	00222$
00102$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:139: *eyeY = 16 * (randNum2 + 1);
	ldhl	sp,	#9
	ld	(hl), a
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:132: if(randNum1 == 0){
	inc	e
	dec	e
	jp	NZ, 00106$
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:134: if(randNum2 < 2){
	sub	a, #0x02
	jr	NC, 00104$
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:135: adjustCnt = adjustCnt + 1;
	ld	hl, #_adjustCnt
	ld	(hl), c
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:136: return;
	jp	00222$
00104$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:138: *eyeX = 168;
	ldhl	sp,	#13
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0xa8
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:139: *eyeY = 16 * (randNum2 + 1);
	ldhl	sp,	#9
	ld	a, (hl)
	inc	a
	swap	a
	and	a, #0xf0
	ld	(hl), a
	ldhl	sp,#11
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#9
	ld	a, (hl)
	ld	(de), a
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:140: *eyeMode = MOVELEFT;
	ldhl	sp,	#4
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x04
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:141: move_sprite(spriteNum+2,*eyeX, *eyeY);
	ldhl	sp,	#9
	ld	a, (hl)
	ldhl	sp,	#5
	ld	(hl), a
	ldhl	sp,#13
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#7
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
	ld	(hl), a
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	a, (hl)
	ldhl	sp,	#3
	ld	(hl+), a
	ld	(hl), #0x00
	ld	a, #0x02
00418$:
	ldhl	sp,	#3
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00418$
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_shadow_OAM
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#3
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#2
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (hl-)
	dec	hl
	ld	(de), a
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	bc
	ldhl	sp,	#7
	ld	a, (hl)
	ld	(bc), a
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:142: move_sprite(spriteNum+3,*eyeX + 8, *eyeY);
	ldhl	sp,#13
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, #0x08
	ldhl	sp,	#8
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	(hl+), a
	inc	hl
	ld	a, (hl)
	ldhl	sp,	#6
	ld	(hl+), a
	ld	(hl), #0x00
	ld	a, #0x02
00419$:
	ldhl	sp,	#6
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00419$
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_shadow_OAM
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	inc	hl
	ld	d, a
	ld	a, (hl)
	ld	(de), a
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl+)
	ld	b, a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:142: move_sprite(spriteNum+3,*eyeX + 8, *eyeY);
	jp	00222$
00106$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:146: *eyeX = (16 * (randNum2 + 2) + 8);
	ldhl	sp,	#9
	ld	a, (hl)
	inc	a
	inc	a
	swap	a
	and	a, #0xf0
	add	a, #0x08
	ld	c, a
	ldhl	sp,	#13
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:147: *eyeY = 144;
	ldhl	sp,	#11
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x90
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:148: *eyeMode = MOVEUP;
	ldhl	sp,	#4
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x01
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:149: move_sprite(spriteNum+2, *eyeX, *eyeY );
	ldhl	sp,#11
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#8
	ld	(hl), a
	ldhl	sp,#13
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#9
	ld	(hl), a
	ldhl	sp,	#6
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	a, (hl)
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	ldhl	sp,	#7
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	ld	a, #0x02
00420$:
	ldhl	sp,	#4
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00420$
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_shadow_OAM
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#8
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#7
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (hl-)
	dec	hl
	ld	(de), a
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl+)
	inc	hl
	ld	b, a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:150: move_sprite(spriteNum+3, *eyeX + 8, *eyeY);
	ldhl	sp,#11
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#8
	ld	(hl), a
	ldhl	sp,#13
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, #0x08
	ldhl	sp,	#9
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	(hl+), a
	ld	a, (hl)
	ldhl	sp,	#6
	ld	(hl+), a
	ld	(hl), #0x00
	ld	a, #0x02
00421$:
	ldhl	sp,	#6
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00421$
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_shadow_OAM
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (hl-)
	dec	hl
	ld	(de), a
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl+)
	inc	hl
	ld	b, a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:150: move_sprite(spriteNum+3, *eyeX + 8, *eyeY);
	jp	00222$
00183$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:153: else if(*bkgX < 48  && (*bkgY >= 48 && *bkgY < 64)){
	ldhl	sp,	#8
	ld	a, (hl)
	or	a, a
	jp	Z, 00178$
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	cp	a, #0x30
	jp	C, 00178$
	sub	a, #0x40
	jp	NC, 00178$
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:155: uint8_t randNum1 = randGenetate(4);
	ld	a, #0x04
	call	_randGenetate
	ldhl	sp,	#8
	ld	(hl), a
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:156: uint8_t randNum2 = randGenetate(8);
	ld	a, #0x08
	call	_randGenetate
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:158: *eyeX = (16 * (randNum2 + 2) + 8);
	ldhl	sp,	#9
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:157: if(randNum1 >= 0 && randNum1 <= 1){
	ld	(hl-), a
	ld	a, #0x01
	sub	a, (hl)
	jp	C, 00112$
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:158: *eyeX = (16 * (randNum2 + 2) + 8);
	inc	hl
	inc	(hl)
	inc	(hl)
	ld	a, (hl)
	swap	a
	and	a, #0xf0
	ld	(hl), a
	ld	a, (hl)
	add	a, #0x08
	ld	c, a
	ldhl	sp,	#13
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:159: if(randNum1 == 0){
	ldhl	sp,	#8
	ld	a, (hl)
	or	a, a
	jr	NZ, 00109$
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:161: *eyeY = 0;
	ldhl	sp,	#11
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:162: *eyeMode = MOVEDOWN;
	ldhl	sp,	#4
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x03
	jr	00110$
00109$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:166: *eyeY = 144;
	ldhl	sp,	#11
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x90
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:167: *eyeMode = MOVEUP;
	ldhl	sp,	#4
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x01
00110$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:169: move_sprite(spriteNum+2, *eyeX, *eyeY );
	ldhl	sp,#11
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#7
	ld	(hl), a
	ldhl	sp,#13
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#8
	ld	(hl-), a
	dec	hl
	ld	a, (hl)
	ldhl	sp,	#9
	ld	(hl), a
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	a, (hl)
	ldhl	sp,	#5
	ld	(hl+), a
	ld	(hl), #0x00
	ld	a, #0x02
00422$:
	ldhl	sp,	#5
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00422$
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_shadow_OAM
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#5
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#4
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (hl-)
	dec	hl
	ld	(de), a
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl+)
	inc	hl
	ld	b, a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:170: move_sprite(spriteNum+3, *eyeX + 8, *eyeY);
	ldhl	sp,#11
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#8
	ld	(hl), a
	ldhl	sp,#13
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#9
	ld	(hl), a
	ld	a, (hl)
	add	a, #0x08
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	(hl+), a
	ld	a, (hl)
	ldhl	sp,	#6
	ld	(hl+), a
	ld	(hl), #0x00
	ld	a, #0x02
00423$:
	ldhl	sp,	#6
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00423$
	ld	de, #_shadow_OAM
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (hl-)
	dec	hl
	ld	(de), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	l, e
	ld	h, d
	inc	hl
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#9
	ld	a, (hl)
	ld	(de), a
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:170: move_sprite(spriteNum+3, *eyeX + 8, *eyeY);
	jp	00222$
00112$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:174: *eyeX = 168;
	ldhl	sp,	#13
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0xa8
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:175: *eyeY = 16 * (randNum2 + 1);
	ldhl	sp,	#9
	ld	a, (hl)
	inc	a
	swap	a
	and	a, #0xf0
	ld	(hl), a
	ldhl	sp,#11
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#9
	ld	a, (hl)
	ld	(de), a
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:176: *eyeMode = MOVELEFT;
	ldhl	sp,	#4
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x04
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:177: move_sprite(spriteNum+2,*eyeX, *eyeY);
	ldhl	sp,	#9
	ld	a, (hl)
	ldhl	sp,	#5
	ld	(hl), a
	ldhl	sp,#13
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#7
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
	ld	(hl), a
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	a, (hl)
	ldhl	sp,	#3
	ld	(hl+), a
	ld	(hl), #0x00
	ld	a, #0x02
00424$:
	ldhl	sp,	#3
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00424$
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_shadow_OAM
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#3
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#2
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (hl-)
	dec	hl
	ld	(de), a
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	bc
	ldhl	sp,	#7
	ld	a, (hl)
	ld	(bc), a
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:178: move_sprite(spriteNum+3,*eyeX + 8, *eyeY);
	ldhl	sp,#13
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, #0x08
	ldhl	sp,	#8
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	(hl+), a
	inc	hl
	ld	a, (hl)
	ldhl	sp,	#6
	ld	(hl+), a
	ld	(hl), #0x00
	ld	a, #0x02
00425$:
	ldhl	sp,	#6
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00425$
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_shadow_OAM
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	inc	hl
	ld	d, a
	ld	a, (hl)
	ld	(de), a
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl+)
	ld	b, a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:178: move_sprite(spriteNum+3,*eyeX + 8, *eyeY);
	jp	00222$
00178$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:181: else if((*bkgX >= 48 && *bkgX < 56 ) && (*bkgY >= 48 && *bkgY < 64)){
	ldhl	sp,	#9
	ld	a, (hl)
	sub	a, #0x38
	ld	a, #0x00
	rla
	ld	(hl-), a
	bit	0, (hl)
	jp	NZ, 00172$
	inc	hl
	ld	a, (hl)
	or	a, a
	jp	Z, 00172$
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	cp	a, #0x30
	jp	C, 00172$
	sub	a, #0x40
	jp	NC, 00172$
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:183: uint8_t randNum1 = randGenetate(4);
	ld	a, #0x04
	call	_randGenetate
	ldhl	sp,	#8
	ld	(hl), a
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:184: uint8_t randNum2 = randGenetate(8);
	ld	a, #0x08
	call	_randGenetate
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:186: *eyeX = (16 * (randNum2 + 1) + 8);
	inc	a
	ldhl	sp,	#9
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:185: if(randNum1 >= 0 && randNum1 <= 1){
	ld	(hl-), a
	ld	a, #0x01
	sub	a, (hl)
	jr	C, 00122$
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:186: *eyeX = (16 * (randNum2 + 1) + 8);
	inc	hl
	ld	a, (hl)
	swap	a
	and	a, #0xf0
	add	a, #0x08
	ld	c, a
	ldhl	sp,	#13
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:187: if(randNum1 == 0){
	ldhl	sp,	#8
	ld	a, (hl)
	or	a, a
	jr	NZ, 00116$
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:189: *eyeY = 0;
	ldhl	sp,	#11
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:190: *eyeMode = MOVEDOWN;
	ldhl	sp,	#4
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x03
	jr	00117$
00116$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:194: *eyeY = 144;
	ldhl	sp,	#11
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x90
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:195: *eyeMode = MOVEUP;
	ldhl	sp,	#4
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x01
00117$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:197: move_sprite(spriteNum+2, *eyeX, *eyeY );
	ldhl	sp,#11
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	b, a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	ldhl	sp,	#6
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:198: move_sprite(spriteNum+3, *eyeX + 8, *eyeY);
	ldhl	sp,#11
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	b, a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, #0x08
	ld	c, a
	ldhl	sp,	#10
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	(hl), b
	inc	hl
	ld	(hl), c
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:198: move_sprite(spriteNum+3, *eyeX + 8, *eyeY);
	jp	00222$
00122$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:201: *eyeY = 16 * (randNum2 + 1);
	ldhl	sp,	#9
	ld	a, (hl+)
	inc	hl
	swap	a
	and	a, #0xf0
	ld	c, a
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:202: if(randNum1 == 2){
	ldhl	sp,	#8
	ld	a, (hl)
	sub	a, #0x02
	jr	NZ, 00119$
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:204: *eyeX = 168;
	ldhl	sp,	#13
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0xa8
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:205: *eyeMode = MOVELEFT;
	ldhl	sp,	#4
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x04
	jr	00120$
00119$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:209: *eyeX = 8;
	ldhl	sp,	#13
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x08
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:210: *eyeMode = MOVERIGHT;
	ldhl	sp,	#4
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x02
00120$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:212: move_sprite(spriteNum+2,*eyeX, *eyeY);
	ldhl	sp,#11
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	b, a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	ldhl	sp,	#6
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:213: move_sprite(spriteNum+3,*eyeX + 8, *eyeY);
	ldhl	sp,#11
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	b, a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, #0x08
	ld	c, a
	ldhl	sp,	#10
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	(hl), b
	inc	hl
	ld	(hl), c
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:213: move_sprite(spriteNum+3,*eyeX + 8, *eyeY);
	jp	00222$
00172$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:216: else if((*bkgX >= 48 && *bkgX < 56 ) && (*bkgY >= 64)){
	ldhl	sp,	#8
	bit	0, (hl)
	jp	NZ, 00167$
	inc	hl
	ld	a, (hl)
	or	a, a
	jp	Z, 00167$
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	sub	a, #0x40
	jp	C, 00167$
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:218: uint8_t randNum1 = randGenetate(4);
	ld	a, #0x04
	call	_randGenetate
	ld	c, a
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:219: uint8_t randNum2 = randGenetate(8);
	push	bc
	ld	a, #0x08
	call	_randGenetate
	pop	bc
	ld	e, a
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:220: if(randNum1 >= 0 && randNum1 <= 1){
	ld	a, #0x01
	sub	a, c
	jr	C, 00131$
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:221: *eyeX = (16 * (randNum2 + 1) + 8);
	ld	a, e
	inc	a
	swap	a
	and	a, #0xf0
	add	a, #0x08
	ld	c, a
	ldhl	sp,	#13
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:222: *eyeY = 0;
	ldhl	sp,	#11
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:223: *eyeMode = MOVEDOWN;
	ldhl	sp,	#4
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x03
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:224: move_sprite(spriteNum+2, *eyeX, *eyeY );
	ldhl	sp,#11
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	c, a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#9
	ld	(hl), a
	ldhl	sp,	#6
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	c, l
	ld	b, h
	ldhl	sp,	#9
	ld	a, (hl)
	ld	(bc), a
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:225: move_sprite(spriteNum+3, *eyeX + 8, *eyeY);
	ldhl	sp,#11
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	c, a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, #0x08
	ldhl	sp,	#9
	ld	(hl+), a
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	c, l
	ld	b, h
	ldhl	sp,	#9
	ld	a, (hl)
	ld	(bc), a
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:225: move_sprite(spriteNum+3, *eyeX + 8, *eyeY);
	jp	00222$
00131$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:228: if(randNum1 == 7) return;
	ld	a, c
	sub	a, #0x07
	jp	Z,00222$
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:229: *eyeY = 16 * randNum2;
	ld	a, e
	swap	a
	and	a, #0xf0
	ld	b, a
	ldhl	sp,	#11
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), b
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:230: if(randNum1 == 2){
	ld	a, c
	sub	a, #0x02
	jr	NZ, 00128$
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:232: *eyeX = 168;
	ldhl	sp,	#13
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0xa8
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:233: *eyeMode = MOVELEFT;
	ldhl	sp,	#4
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x04
	jr	00129$
00128$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:237: *eyeX = 8;
	ldhl	sp,	#13
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x08
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:238: *eyeMode = MOVERIGHT;
	ldhl	sp,	#4
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x02
00129$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:240: move_sprite(spriteNum+2,*eyeX, *eyeY);
	ldhl	sp,#11
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	b, a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	ldhl	sp,	#6
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:241: move_sprite(spriteNum+3,*eyeX + 8, *eyeY);
	ldhl	sp,#11
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	b, a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, #0x08
	ld	c, a
	ldhl	sp,	#10
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	(hl), b
	inc	hl
	ld	(hl), c
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:241: move_sprite(spriteNum+3,*eyeX + 8, *eyeY);
	jp	00222$
00167$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:244: else if(*bkgX >= 56 && *bkgY >= 64){
	ldhl	sp,	#9
	ld	c, (hl)
	bit	0, c
	jp	NZ, 00163$
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	sub	a, #0x40
	jp	C, 00163$
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:246: uint8_t randNum1 = randGenetate(4);
	ld	a, #0x04
	call	_randGenetate
	ld	e, a
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:247: uint8_t randNum2 = randGenetate(8);
	push	de
	ld	a, #0x08
	call	_randGenetate
	pop	de
	ld	c, a
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:248: if(randNum1 >= 0 && randNum1 <= 1){
	ld	a, #0x01
	sub	a, e
	jr	C, 00137$
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:249: *eyeX = (16 * (randNum2 + 1) + 8);
	ld	a, c
	inc	a
	swap	a
	and	a, #0xf0
	add	a, #0x08
	ld	c, a
	ldhl	sp,	#13
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:250: *eyeY = 0;
	ldhl	sp,	#11
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:251: *eyeMode = MOVEDOWN;
	ldhl	sp,	#4
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x03
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:252: move_sprite(spriteNum+2, *eyeX, *eyeY );
	ldhl	sp,#11
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	c, a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#9
	ld	(hl), a
	ldhl	sp,	#6
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	c, l
	ld	b, h
	ldhl	sp,	#9
	ld	a, (hl)
	ld	(bc), a
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:253: move_sprite(spriteNum+3, *eyeX + 8, *eyeY);
	ldhl	sp,#11
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	c, a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, #0x08
	ldhl	sp,	#9
	ld	(hl+), a
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	c, l
	ld	b, h
	ldhl	sp,	#9
	ld	a, (hl)
	ld	(bc), a
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:253: move_sprite(spriteNum+3, *eyeX + 8, *eyeY);
	jp	00222$
00137$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:257: if(randNum1 == 7) return;
	ld	a, e
	sub	a, #0x07
	jp	Z,00222$
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:258: *eyeY = 16 * randNum2;
	ld	a, c
	swap	a
	and	a, #0xf0
	ld	b, a
	ldhl	sp,	#11
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), b
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:259: *eyeX = 8;
	ldhl	sp,	#13
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x08
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:260: *eyeMode = MOVERIGHT;
	ldhl	sp,	#4
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x02
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:261: move_sprite(spriteNum+2,*eyeX, *eyeY);
	ld	c, b
	ldhl	sp,#13
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#9
	ld	(hl), a
	ldhl	sp,	#6
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	e, l
	ld	d, h
	ldhl	sp,	#9
	ld	a, (hl)
	ld	(de), a
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:262: move_sprite(spriteNum+3,*eyeX + 8, *eyeY);
	ldhl	sp,#13
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, #0x08
	ld	c, a
	ldhl	sp,	#10
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	(hl), b
	inc	hl
	ld	(hl), c
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:262: move_sprite(spriteNum+3,*eyeX + 8, *eyeY);
	jp	00222$
00163$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:265: else if(*bkgX >= 56 && *bkgY < 48){
	bit	0, c
	jp	NZ, 00159$
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	sub	a, #0x30
	jp	NC, 00159$
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:267: uint8_t randNum1 = randGenetate(2);
	ld	a, #0x02
	call	_randGenetate
	ld	b, a
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:268: uint8_t randNum2 = randGenetate(8);
	push	bc
	ld	a, #0x08
	call	_randGenetate
	pop	bc
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:129: adjustCnt = adjustCnt + 1;
	ld	hl, #_adjustCnt
	ld	c, (hl)
	inc	c
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:269: if(randNum2 == 7){
	cp	a, #0x07
	jr	NZ, 00141$
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:270: adjustCnt = adjustCnt + 1;
	ld	(hl), c
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:271: return;
	jp	00222$
00141$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:273: if(randNum1 == 0){
	inc	b
	dec	b
	jr	NZ, 00145$
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:275: if(randNum2 < 2){
	cp	a, #0x02
	jr	NC, 00143$
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:276: adjustCnt = adjustCnt + 1;
	ld	hl, #_adjustCnt
	ld	(hl), c
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:277: return;
	jp	00222$
00143$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:279: *eyeX = 8;
	ldhl	sp,	#13
	push	af
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	pop	af
	ld	(hl), #0x08
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:280: *eyeY = 16 * (randNum2 + 1);
	inc	a
	swap	a
	and	a, #0xf0
	ld	b, a
	ldhl	sp,	#11
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), b
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:281: *eyeMode = MOVERIGHT;
	ldhl	sp,	#4
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x02
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:282: move_sprite(spriteNum+2,*eyeX, *eyeY);
	ld	c, b
	ldhl	sp,#13
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#9
	ld	(hl), a
	ldhl	sp,	#6
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	e, l
	ld	d, h
	ldhl	sp,	#9
	ld	a, (hl)
	ld	(de), a
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:283: move_sprite(spriteNum+3,*eyeX + 8, *eyeY);
	ldhl	sp,#13
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, #0x08
	ld	c, a
	ldhl	sp,	#10
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	(hl), b
	inc	hl
	ld	(hl), c
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:283: move_sprite(spriteNum+3,*eyeX + 8, *eyeY);
	jp	00222$
00145$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:287: *eyeX = (16 * randNum2 + 8);
	swap	a
	and	a, #0xf0
	add	a, #0x08
	ld	c, a
	ldhl	sp,	#13
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:288: *eyeY = 144;
	ldhl	sp,	#11
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x90
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:289: *eyeMode = MOVEUP;
	ldhl	sp,	#4
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x01
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:290: move_sprite(spriteNum+2, *eyeX, *eyeY );
	ldhl	sp,#11
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	b, a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	ldhl	sp,	#6
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:291: move_sprite(spriteNum+3, *eyeX + 8, *eyeY);
	ldhl	sp,#11
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	b, a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, #0x08
	ld	c, a
	ldhl	sp,	#10
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	(hl), b
	inc	hl
	ld	(hl), c
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:291: move_sprite(spriteNum+3, *eyeX + 8, *eyeY);
	jp	00222$
00159$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:295: else if(*bkgX >= 56 && (*bkgY >= 48 && *bkgY < 64)){
	bit	0, c
	jp	NZ, 00222$
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	cp	a, #0x30
	jp	C, 00222$
	sub	a, #0x40
	jp	NC, 00222$
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:297: uint8_t randNum1 = randGenetate(4);
	ld	a, #0x04
	call	_randGenetate
	ld	b, a
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:298: uint8_t randNum2 = randGenetate(8);
	push	bc
	ld	a, #0x08
	call	_randGenetate
	pop	bc
	ld	c, a
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:299: if(randNum1 >= 0 && randNum1 <= 1){
	ld	a, #0x01
	sub	a, b
	jr	C, 00151$
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:300: *eyeX = (16 * randNum2 + 8);
	ld	a, c
	swap	a
	and	a, #0xf0
	add	a, #0x08
	ld	c, a
	ldhl	sp,	#13
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:301: if(randNum1 == 0){
	ld	a, b
	or	a, a
	jr	NZ, 00148$
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:303: *eyeY = 0;
	ldhl	sp,	#11
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:304: *eyeMode = MOVEDOWN;
	ldhl	sp,	#4
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x03
	jr	00149$
00148$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:308: *eyeY = 144;
	ldhl	sp,	#11
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x90
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:309: *eyeMode = MOVEUP;
	ldhl	sp,	#4
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x01
00149$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:311: move_sprite(spriteNum+2, *eyeX, *eyeY );
	ldhl	sp,#11
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	b, a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	ldhl	sp,	#6
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:312: move_sprite(spriteNum+3, *eyeX + 8, *eyeY);
	ldhl	sp,#11
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	b, a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, #0x08
	ld	c, a
	ldhl	sp,	#10
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	(hl), b
	inc	hl
	ld	(hl), c
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:312: move_sprite(spriteNum+3, *eyeX + 8, *eyeY);
	jr	00222$
00151$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:316: *eyeX = 8;
	ldhl	sp,	#13
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x08
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:317: *eyeY = 16 * (randNum2 + 1);
	ld	a, c
	inc	a
	swap	a
	and	a, #0xf0
	ld	b, a
	ldhl	sp,	#11
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), b
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:318: *eyeMode = MOVERIGHT;
	ldhl	sp,	#4
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x02
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:319: move_sprite(spriteNum+2,*eyeX, *eyeY);
	ld	c, b
	ldhl	sp,#13
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#9
	ld	(hl), a
	ldhl	sp,	#6
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	e, l
	ld	d, h
	ldhl	sp,	#9
	ld	a, (hl)
	ld	(de), a
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:320: move_sprite(spriteNum+3,*eyeX + 8, *eyeY);
	ldhl	sp,#13
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, #0x08
	ld	c, a
	ldhl	sp,	#10
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	(hl), b
	inc	hl
	ld	(hl), c
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:320: move_sprite(spriteNum+3,*eyeX + 8, *eyeY);
00222$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:323: }
	add	sp, #15
	pop	hl
	add	sp, #15
	jp	(hl)
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:324: uint8_t ChangeDirection(){
;	---------------------------------
; Function ChangeDirection
; ---------------------------------
_ChangeDirection::
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:326: uint8_t randNum = randGenetate(4);
	ld	a, #0x04
	call	_randGenetate
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:327: if(randNum == 0){
	or	a, a
	jr	NZ, 00111$
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:328: return MOVEUP;
	ld	a, #0x01
	ret
00111$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:330: else if(randNum == 1){
	cp	a, #0x01
	jr	NZ, 00108$
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:331: return MOVERIGHT;
	ld	a, #0x02
	ret
00108$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:333: else if(randNum == 2){
	cp	a, #0x02
	jr	NZ, 00105$
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:334: return MOVEDOWN;
	ld	a, #0x03
	ret
00105$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:336: else if(randNum == 3){
	sub	a, #0x03
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:337: return MOVELEFT;
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:340: return MOVELEFT;
	ld	a, #0x04
	ret	Z
	ld	a, #0x04
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:342: }
	ret
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:344: void EyeModeChange(uint8_t *eyeMode){
;	---------------------------------
; Function EyeModeChange
; ---------------------------------
_EyeModeChange::
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, d
;	spillPairReg hl
;	spillPairReg hl
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:347: if(*eyeMode == NOACTION){
	ld	c, (hl)
	ld	a, c
	or	a, a
	ret	Z
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:350: else if(*eyeMode >= MOVEUP && *eyeMode <= MOVELEFT){
	ld	a, c
	sub	a, #0x01
	jr	C, 00189$
	ld	a, #0x04
	sub	a, c
	jr	C, 00189$
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:351: uint8_t randNum = randGenetate(8);
	push	hl
	ld	a, #0x08
	call	_randGenetate
	pop	hl
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:352: if(randNum == 6){
	cp	a, #0x06
	jr	NZ, 00112$
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:353: *eyeMode = ChangeDirection();
	push	hl
	call	_ChangeDirection
	pop	hl
	ld	(hl), a
	ret
00112$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:355: else if(randNum == 7){
	sub	a, #0x07
	ret	NZ
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:356: if(*eyeMode == MOVEUP) *eyeMode = FLOATUP;
	ld	a, (hl)
	dec	a
	jr	NZ, 00102$
	ld	(hl), #0x05
00102$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:357: if(*eyeMode == MOVERIGHT) *eyeMode = FLOATRIGHT;
	ld	a, (hl)
	sub	a, #0x02
	jr	NZ, 00104$
	ld	(hl), #0x06
00104$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:358: if(*eyeMode == MOVEDOWN) *eyeMode = FLOATDOWN;
	ld	a, (hl)
	sub	a, #0x03
	jr	NZ, 00106$
	ld	(hl), #0x07
00106$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:359: if(*eyeMode == MOVELEFT) *eyeMode = FLOATLEFT; 
	ld	a, (hl)
	sub	a, #0x04
	ret	NZ
	ld	(hl), #0x08
	ret
00189$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:362: else if(*eyeMode >= FLOATUP && *eyeMode <= FLOATLEFT){
	ld	a, c
	sub	a, #0x05
	jr	C, 00185$
	ld	a, #0x08
	sub	a, c
	jr	C, 00185$
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:363: uint8_t randNum = randGenetate(2);
	push	hl
	ld	a, #0x02
	call	_randGenetate
	ld	c, a
	pop	hl
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:347: if(*eyeMode == NOACTION){
	ld	a, (hl)
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:365: if(*eyeMode == FLOATUP) *eyeMode = UP;
	sub	a, #0x05
	ld	a, #0x01
	jr	Z, 00435$
	xor	a, a
00435$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:364: if(randNum == 0){
	inc	c
	dec	c
	jr	NZ, 00131$
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:365: if(*eyeMode == FLOATUP) *eyeMode = UP;
	or	a, a
	jr	Z, 00115$
	ld	(hl), #0x09
00115$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:366: if(*eyeMode == FLOATRIGHT) *eyeMode = RIGHT;
	ld	a, (hl)
	sub	a, #0x06
	jr	NZ, 00117$
	ld	(hl), #0x0a
00117$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:367: if(*eyeMode == FLOATDOWN) *eyeMode = DOWN;
	ld	a, (hl)
	sub	a, #0x07
	jr	NZ, 00119$
	ld	(hl), #0x0b
00119$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:368: if(*eyeMode == FLOATLEFT) *eyeMode = LEFT;            
	ld	a, (hl)
	sub	a, #0x08
	ret	NZ
	ld	(hl), #0x0c
	ret
00131$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:371: if(*eyeMode == FLOATUP) *eyeMode = SHOTUP;
	or	a, a
	jr	Z, 00123$
	ld	(hl), #0x11
00123$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:372: if(*eyeMode == FLOATRIGHT) *eyeMode = SHOTRIGHT;
	ld	a, (hl)
	sub	a, #0x06
	jr	NZ, 00125$
	ld	(hl), #0x12
00125$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:373: if(*eyeMode == FLOATDOWN) *eyeMode = SHOTDOWN;
	ld	a, (hl)
	sub	a, #0x07
	jr	NZ, 00127$
	ld	(hl), #0x13
00127$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:374: if(*eyeMode == FLOATLEFT) *eyeMode = SHOTLEFT;    
	ld	a, (hl)
	sub	a, #0x08
	ret	NZ
	ld	(hl), #0x14
	ret
00185$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:377: else if(*eyeMode >= UP && *eyeMode <= LEFT){
	ld	a, c
	sub	a, #0x09
	jr	C, 00181$
	ld	a, #0x0c
	sub	a, c
	jr	C, 00181$
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:378: uint8_t randNum = randGenetate(2);
	push	hl
	ld	a, #0x02
	call	_randGenetate
	ld	c, a
	pop	hl
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:347: if(*eyeMode == NOACTION){
	ld	a, (hl)
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:380: if(*eyeMode == UP) *eyeMode = SINKUP;
	sub	a, #0x09
	ld	a, #0x01
	jr	Z, 00449$
	xor	a, a
00449$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:379: if(randNum == 0){
	inc	c
	dec	c
	jr	NZ, 00150$
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:380: if(*eyeMode == UP) *eyeMode = SINKUP;
	or	a, a
	jr	Z, 00134$
	ld	(hl), #0x0d
00134$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:381: if(*eyeMode == RIGHT) *eyeMode = SINKRIGHT;
	ld	a, (hl)
	sub	a, #0x0a
	jr	NZ, 00136$
	ld	(hl), #0x0e
00136$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:382: if(*eyeMode == DOWN) *eyeMode = SINKDOWN;
	ld	a, (hl)
	sub	a, #0x0b
	jr	NZ, 00138$
	ld	(hl), #0x0f
00138$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:383: if(*eyeMode == LEFT) *eyeMode = SINKLEFT;            
	ld	a, (hl)
	sub	a, #0x0c
	ret	NZ
	ld	(hl), #0x10
	ret
00150$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:386: if(*eyeMode == UP) *eyeMode = SHOTUP;
	or	a, a
	jr	Z, 00142$
	ld	(hl), #0x11
00142$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:387: if(*eyeMode == RIGHT) *eyeMode = SHOTRIGHT;
	ld	a, (hl)
	sub	a, #0x0a
	jr	NZ, 00144$
	ld	(hl), #0x12
00144$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:388: if(*eyeMode == DOWN) *eyeMode = SHOTDOWN;
	ld	a, (hl)
	sub	a, #0x0b
	jr	NZ, 00146$
	ld	(hl), #0x13
00146$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:389: if(*eyeMode == LEFT) *eyeMode = SHOTLEFT;    
	ld	a, (hl)
	sub	a, #0x0c
	ret	NZ
	ld	(hl), #0x14
	ret
00181$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:392: else if(*eyeMode >= SINKUP && *eyeMode <= SINKLEFT){
	ld	a, c
	sub	a, #0x0d
	jr	C, 00177$
	ld	a, #0x10
	sub	a, c
	jr	C, 00177$
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:393: uint8_t randNum = randGenetate(8);
	push	hl
	ld	a, #0x08
	call	_randGenetate
	pop	hl
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:394: if(randNum >= 4){
	sub	a, #0x04
	jr	C, 00161$
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:395: *eyeMode = ChangeDirection();
	push	hl
	call	_ChangeDirection
	pop	hl
	ld	(hl), a
	ret
00161$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:398: if(*eyeMode == SINKUP) *eyeMode = FLOATUP;
	ld	a, (hl)
	sub	a, #0x0d
	jr	NZ, 00153$
	ld	(hl), #0x05
00153$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:399: if(*eyeMode == SINKRIGHT) *eyeMode = FLOATRIGHT;
	ld	a, (hl)
	sub	a, #0x0e
	jr	NZ, 00155$
	ld	(hl), #0x06
00155$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:400: if(*eyeMode == SINKDOWN) *eyeMode = FLOATDOWN;
	ld	a, (hl)
	sub	a, #0x0f
	jr	NZ, 00157$
	ld	(hl), #0x07
00157$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:401: if(*eyeMode == SINKLEFT) *eyeMode = FLOATLEFT;  
	ld	a, (hl)
	sub	a, #0x10
	ret	NZ
	ld	(hl), #0x08
	ret
00177$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:404: else if(*eyeMode >= SHOTUP && *eyeMode <= SHOTLEFT){
	ld	a, c
	sub	a, #0x11
	ret	C
	ld	a, #0x14
	sub	a, c
	ret	C
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:405: uint8_t randNum = randGenetate(8);
	push	hl
	ld	a, #0x08
	call	_randGenetate
	pop	hl
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:406: if(randNum >= 4){
	sub	a, #0x04
	ret	C
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:407: if(*eyeMode == SHOTUP) *eyeMode = SINKUP;
	ld	a, (hl)
	sub	a, #0x11
	jr	NZ, 00164$
	ld	(hl), #0x0d
00164$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:408: if(*eyeMode == SHOTRIGHT) *eyeMode = SINKRIGHT;
	ld	a, (hl)
	sub	a, #0x12
	jr	NZ, 00166$
	ld	(hl), #0x0e
00166$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:409: if(*eyeMode == SHOTDOWN) *eyeMode = SINKDOWN;
	ld	a, (hl)
	sub	a, #0x13
	jr	NZ, 00168$
	ld	(hl), #0x0f
00168$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:410: if(*eyeMode == SHOTLEFT) *eyeMode = SINKLEFT; 
	ld	a, (hl)
	sub	a, #0x14
	ret	NZ
	ld	(hl), #0x10
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:413: }
	ret
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:415: void EyeExecMain(uint8_t *eyeX, uint8_t *eyeY, 
;	---------------------------------
; Function EyeExecMain
; ---------------------------------
_EyeExecMain::
	add	sp, #-11
	ldhl	sp,	#9
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
	ldhl	sp,	#7
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:419: *eyeCnt = *eyeCnt + 1;
	ldhl	sp,	#22
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
	ldhl	sp,	#23
	ld	a, (hl)
	ldhl	sp,	#1
	ld	(hl), a
	pop	de
	push	de
	ld	a, (de)
	ld	c, a
	inc	c
	pop	hl
	push	hl
	ld	(hl), c
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:420: if(*eyeMode >= MOVEUP && *eyeMode <= MOVELEFT){
	ldhl	sp,	#20
	ld	a, (hl)
	ldhl	sp,	#2
	ld	(hl), a
	ldhl	sp,	#21
	ld	a, (hl)
	ldhl	sp,	#3
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:425: move_sprite(spriteNum+2,*eyeX, *eyeY);
	ldhl	sp,	#18
	ld	a, (hl)
	ldhl	sp,	#4
	ld	(hl), a
	ld	a, (hl+)
	add	a, #0x02
	ld	(hl), a
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:420: if(*eyeMode >= MOVEUP && *eyeMode <= MOVELEFT){
	ld	a, c
	sub	a, #0x01
	jp	C, 00180$
	ld	a, #0x04
	sub	a, c
	jp	C, 00180$
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:421: if(*eyeMode == MOVEUP) *eyeY = *eyeY - 1;
	dec	c
	jr	NZ, 00102$
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	dec	hl
	ld	d, a
	ld	a, (de)
	ld	(hl), a
	ld	a, (hl+)
	ld	c, a
	dec	c
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
00102$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:422: if(*eyeMode == MOVERIGHT) *eyeX = *eyeX + 1;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	sub	a, #0x02
	jr	NZ, 00104$
	ldhl	sp,#9
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#6
	ld	(hl), a
	ld	c, (hl)
	inc	c
	ldhl	sp,	#9
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
00104$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:423: if(*eyeMode == MOVEDOWN) *eyeY = *eyeY + 1;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	sub	a, #0x03
	jr	NZ, 00106$
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	c
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	ld	(hl), c
00106$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:424: if(*eyeMode == MOVELEFT) *eyeX = *eyeX - 1;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	sub	a, #0x04
	jr	NZ, 00108$
	ldhl	sp,#9
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	dec	c
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	ld	(hl), c
00108$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:425: move_sprite(spriteNum+2,*eyeX, *eyeY);
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	b, a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	ldhl	sp,	#5
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:426: move_sprite(spriteNum+3,*eyeX + 8, *eyeY);
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	b, a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, #0x08
	ld	c, a
	ldhl	sp,	#4
	ld	e, (hl)
	inc	e
	inc	e
	inc	e
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:427: if(*eyeCnt == 8){
	pop	de
	push	de
	ld	a, (de)
	sub	a, #0x08
	jp	NZ,00181$
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:428: EyeModeChange(eyeMode);
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_EyeModeChange
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:429: *eyeCnt = 0;
	pop	hl
	ld	(hl), #0x00
	push	hl
	jp	00181$
00180$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:435: set_sprite_data(tile+4,4,EyeUpFloatTile);
	ldhl	sp,	#17
	ld	a, (hl)
	add	a, #0x04
	ld	b, a
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:432: else if(*eyeMode >= FLOATUP && *eyeMode <= FLOATLEFT){
	ld	a, c
	sub	a, #0x05
	jp	C, 00176$
	ld	a, #0x08
	sub	a, c
	jp	C, 00176$
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:419: *eyeCnt = *eyeCnt + 1;
	pop	de
	push	de
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:434: if(*eyeMode == FLOATUP){
	ld	a, c
	sub	a, #0x05
	ld	a, #0x01
	jr	Z, 00472$
	xor	a, a
00472$:
	ld	e, a
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:437: else if(*eyeMode == FLOATRIGHT){
	ld	a, c
	sub	a, #0x06
	ld	a, #0x01
	jr	Z, 00474$
	xor	a, a
00474$:
	push	hl
	ldhl	sp,	#7
	ld	(hl), a
	pop	hl
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:440: else if(*eyeMode == FLOATDOWN){
	ld	a, c
	sub	a, #0x07
	ld	a, #0x01
	jr	Z, 00476$
	xor	a, a
00476$:
	push	hl
	ldhl	sp,	#8
	ld	(hl), a
	pop	hl
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:443: else if(*eyeMode == FLOATLEFT){
	ld	a, c
	sub	a, #0x08
	ld	a, #0x01
	jr	Z, 00478$
	xor	a, a
00478$:
	ld	c, a
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:433: if(*eyeCnt == 5){
	ld	a, l
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:434: if(*eyeMode == FLOATUP){
	sub	a,#0x05
	jr	NZ, 00136$
	or	a,e
	jr	Z, 00120$
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:435: set_sprite_data(tile+4,4,EyeUpFloatTile);
	ld	de, #_EyeUpFloatTile
	push	de
	ld	a, #0x04
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_set_sprite_data
	add	sp, #4
	jp	00181$
00120$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:437: else if(*eyeMode == FLOATRIGHT){
	ldhl	sp,	#5
	ld	a, (hl)
	or	a, a
	jr	Z, 00117$
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:438: set_sprite_data(tile+4,4,EyeRightFloatTile);
	ld	de, #_EyeRightFloatTile
	push	de
	ld	a, #0x04
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_set_sprite_data
	add	sp, #4
	jp	00181$
00117$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:440: else if(*eyeMode == FLOATDOWN){
	ldhl	sp,	#6
	ld	a, (hl)
	or	a, a
	jr	Z, 00114$
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:441: set_sprite_data(tile+4,4,EyeDownFloatTile);
	ld	de, #_EyeDownFloatTile
	push	de
	ld	a, #0x04
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_set_sprite_data
	add	sp, #4
	jp	00181$
00114$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:443: else if(*eyeMode == FLOATLEFT){
	ld	a, c
	or	a, a
	jp	Z, 00181$
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:444: set_sprite_data(tile+4,4,EyeLeftFloatTile);
	ld	de, #_EyeLeftFloatTile
	push	de
	ld	a, #0x04
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_set_sprite_data
	add	sp, #4
	jp	00181$
00136$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:447: else if(*eyeCnt == 10){
	ld	a, l
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:448: if(*eyeMode == FLOATUP){
	sub	a,#0x0a
	jp	NZ,00181$
	or	a,e
	jr	Z, 00131$
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:449: set_sprite_data(tile+4,4,EyeUpTile);
	ld	de, #_EyeUpTile
	push	de
	ld	a, #0x04
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_set_sprite_data
	add	sp, #4
	jr	00132$
00131$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:451: else if(*eyeMode == FLOATRIGHT){
	ldhl	sp,	#5
	ld	a, (hl)
	or	a, a
	jr	Z, 00128$
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:452: set_sprite_data(tile+4,4,EyeRightTile);
	ld	de, #_EyeRightTile
	push	de
	ld	a, #0x04
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_set_sprite_data
	add	sp, #4
	jr	00132$
00128$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:454: else if(*eyeMode == FLOATDOWN){
	ldhl	sp,	#6
	ld	a, (hl)
	or	a, a
	jr	Z, 00125$
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:455: set_sprite_data(tile+4,4,EyeDownTile);
	ld	de, #_EyeDownTile
	push	de
	ld	a, #0x04
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_set_sprite_data
	add	sp, #4
	jr	00132$
00125$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:457: else if(*eyeMode == FLOATLEFT){
	ld	a, c
	or	a, a
	jr	Z, 00132$
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:458: set_sprite_data(tile+4,4,EyeLeftTile);
	ld	de, #_EyeLeftTile
	push	de
	ld	a, #0x04
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_set_sprite_data
	add	sp, #4
00132$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:460: EyeModeChange(eyeMode);
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_EyeModeChange
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:461: *eyeCnt = 0;
	pop	hl
	ld	(hl), #0x00
	push	hl
	jp	00181$
00176$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:464: else if(*eyeMode >= UP && *eyeMode <= LEFT){
	ld	a, c
	sub	a, #0x09
	jr	C, 00172$
	ld	a, #0x0c
	sub	a, c
	jr	C, 00172$
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:465: if(*eyeCnt == 59){
	pop	de
	push	de
	ld	a, (de)
	sub	a, #0x3b
	jp	NZ,00181$
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:466: EyeModeChange(eyeMode);
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_EyeModeChange
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:467: *eyeCnt = 0;
	pop	hl
	ld	(hl), #0x00
	push	hl
	jp	00181$
00172$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:470: else if(*eyeMode >= SINKUP && *eyeMode <= SINKLEFT){
	ld	a, c
	sub	a, #0x0d
	jp	C, 00168$
	ld	a, #0x10
	sub	a, c
	jp	C, 00168$
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:419: *eyeCnt = *eyeCnt + 1;
	pop	de
	push	de
	ld	a, (de)
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:471: if(*eyeCnt == 5){
	cp	a, #0x05
	jr	NZ, 00154$
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:472: if(*eyeMode == SINKUP){
	ld	a, c
	sub	a, #0x0d
	jr	NZ, 00149$
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:473: set_sprite_data(tile+4,4,EyeUpFloatTile);
	ld	de, #_EyeUpFloatTile
	push	de
	ld	a, #0x04
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_set_sprite_data
	add	sp, #4
	jp	00181$
00149$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:475: else if(*eyeMode == SINKRIGHT){
	ld	a, c
	sub	a, #0x0e
	jr	NZ, 00146$
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:476: set_sprite_data(tile+4,4,EyeRightFloatTile);
	ld	de, #_EyeRightFloatTile
	push	de
	ld	a, #0x04
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_set_sprite_data
	add	sp, #4
	jp	00181$
00146$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:478: else if(*eyeMode == SINKDOWN){
	ld	a, c
	sub	a, #0x0f
	jr	NZ, 00143$
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:479: set_sprite_data(tile+4,4,EyeDownFloatTile);
	ld	de, #_EyeDownFloatTile
	push	de
	ld	a, #0x04
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_set_sprite_data
	add	sp, #4
	jp	00181$
00143$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:481: else if(*eyeMode == SINKLEFT){
	ld	a, c
	sub	a, #0x10
	jp	NZ,00181$
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:482: set_sprite_data(tile+4,4,EyeLeftFloatTile);
	ld	de, #_EyeLeftFloatTile
	push	de
	ld	a, #0x04
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_set_sprite_data
	add	sp, #4
	jp	00181$
00154$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:485: else if(*eyeCnt == 10){
	sub	a, #0x0a
	jp	NZ,00181$
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:486: set_sprite_data(tile+4,4,EyeShadowTile);
	ld	de, #_EyeShadowTile
	push	de
	ld	a, #0x04
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_set_sprite_data
	add	sp, #4
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:487: EyeModeChange(eyeMode);
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_EyeModeChange
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:488: *eyeCnt = 0;
	pop	hl
	ld	(hl), #0x00
	push	hl
	jp	00181$
00168$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:491: else if(*eyeMode >= SHOTUP && *eyeMode <= SHOTLEFT){
	ld	a, c
	sub	a, #0x11
	jr	C, 00164$
	ld	a, #0x14
	sub	a, c
	jr	C, 00164$
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:492: if(*eyeCnt == 59){
	pop	de
	push	de
	ld	a, (de)
	sub	a, #0x3b
	jp	NZ,00181$
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:493: EyeModeChange(eyeMode);
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_EyeModeChange
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:494: *eyeCnt = 0;
	pop	hl
	ld	(hl), #0x00
	push	hl
	jp	00181$
00164$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:497: else if(*eyeMode == SLASH){
	ld	a, c
	sub	a, #0x15
	jp	NZ,00181$
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:419: *eyeCnt = *eyeCnt + 1;
	pop	de
	push	de
	ld	a, (de)
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:498: if(*eyeCnt < 9){
	ld	c, a
	sub	a, #0x09
	jr	NC, 00159$
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:499: move_sprite(spriteNum+2,*eyeX, *eyeY - *eyeCnt);
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	sub	a, c
	ld	c, a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#6
	ld	(hl-), a
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	c, l
	ld	b, h
	ldhl	sp,	#6
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:500: move_sprite(spriteNum+3,*eyeX + 8, *eyeY + *eyeCnt);
	ld	a, (hl+)
	ld	(bc), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	c, a
	pop	de
	push	de
	ld	a, (de)
	add	a, c
	ld	c, a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, #0x08
	ld	e, a
	ldhl	sp,	#4
	ld	b, (hl)
	inc	b
	inc	b
	inc	b
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, b
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	push	de
	ld	de, #_shadow_OAM
	add	hl, de
	pop	de
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	(hl), e
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:500: move_sprite(spriteNum+3,*eyeX + 8, *eyeY + *eyeCnt);
	jr	00181$
00159$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:503: *eyeX = 255;
	ldhl	sp,	#9
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0xff
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:504: *eyeY = 255;
	ldhl	sp,	#7
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0xff
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:505: move_sprite(spriteNum+2,*eyeX, *eyeY);
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	c, a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#6
	ld	(hl-), a
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	c, l
	ld	b, h
	ldhl	sp,	#6
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:506: move_sprite(spriteNum+3,*eyeX, *eyeY);
	ld	a, (hl+)
	ld	(bc), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	c, a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#6
	ld	(hl-), a
	dec	hl
	ld	b, (hl)
	inc	b
	inc	b
	inc	b
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, b
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	c, l
	ld	b, h
	ldhl	sp,	#6
	ld	a, (hl)
	ld	(bc), a
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:507: *eyeCnt = 0;
	pop	hl
	ld	(hl), #0x00
	push	hl
00181$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:510: if(*eyeMode == MOVEUP){
	ldhl	sp,	#20
	ld	a, (hl)
	ldhl	sp,	#3
	ld	(hl), a
	ldhl	sp,	#21
	ld	a, (hl)
	ldhl	sp,	#4
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:511: if(*bkgY < 40){
	ldhl	sp,	#15
	ld	a, (hl)
	ldhl	sp,	#5
	ld	(hl), a
	ldhl	sp,	#16
	ld	a, (hl)
	ldhl	sp,	#6
	ld	(hl), a
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:510: if(*eyeMode == MOVEUP){
	ld	a, c
	dec	a
	jr	NZ, 00208$
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:511: if(*bkgY < 40){
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	cp	a, #0x28
	jp	NC, 00209$
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:512: if((40 - *bkgY) == *eyeY){
	inc	hl
	ld	c, a
	ld	b, #0x00
	ld	a, #0x28
	sub	a, c
	ld	c, a
	sbc	a, a
	sub	a, b
	ld	b, a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	e, a
	ld	d, #0x00
	ld	a, e
	sub	a, c
	jp	NZ,00209$
	ld	a, d
	sub	a, b
	jp	NZ,00209$
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:513: *eyeMode = MOVEDOWN;
	ldhl	sp,	#3
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x03
	jp	00209$
00208$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:518: if(*bkgX >= 72){
	ldhl	sp,	#13
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:517: else if(*eyeMode == MOVERIGHT){
	ld	a, c
	sub	a, #0x02
	jr	NZ, 00205$
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:518: if(*bkgX >= 72){
	ld	a, (de)
	cp	a, #0x48
	jr	C, 00209$
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:519: if((*bkgX + *eyeX) == 216){
	ld	c, a
	ld	b, #0x00
	ldhl	sp,#9
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, a
	add	hl, bc
	ld	a, l
	sub	a, #0xd8
	or	a, h
	jr	NZ, 00209$
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:520: *eyeMode = MOVELEFT;
	ldhl	sp,	#3
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x04
	jr	00209$
00205$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:524: else if(*eyeMode == MOVEDOWN){
	ld	a, c
	sub	a, #0x03
	jr	NZ, 00202$
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:525: if(*bkgY >= 88){
	ldhl	sp,#5
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	cp	a, #0x58
	jr	C, 00209$
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:526: if((*bkgY + *eyeY) == 224){
	inc	hl
	ld	c, a
	ld	b, #0x00
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, a
	add	hl, bc
	ld	a, l
	sub	a, #0xe0
	or	a, h
	jr	NZ, 00209$
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:527: *eyeMode = MOVEUP;
	ldhl	sp,	#3
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x01
	jr	00209$
00202$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:531: else if(*eyeMode == MOVELEFT){
	ld	a, c
	sub	a, #0x04
	jr	NZ, 00209$
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:532: if(*bkgX < 40){
	ld	a, (de)
	cp	a, #0x28
	jr	NC, 00209$
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:533: if((40 - *bkgX) == *eyeX){
	ld	c, a
	ld	b, #0x00
	ld	a, #0x28
	sub	a, c
	ld	c, a
	sbc	a, a
	sub	a, b
	ld	b, a
	ldhl	sp,#9
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	e, a
	ld	d, #0x00
	ld	a, e
	sub	a, c
	jr	NZ, 00209$
	ld	a, d
	sub	a, b
	jr	NZ, 00209$
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:534: *eyeMode = MOVERIGHT;
	ldhl	sp,	#3
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x02
00209$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:538: if((*eyeX > 168) || *eyeY > 152){
	ldhl	sp,#9
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	ld	a, #0xa8
	sub	a, c
	jr	C, 00210$
	dec	hl
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	ld	a, #0x98
	sub	a, c
	jr	NC, 00219$
00210$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:539: *eyeX = 255;
	ldhl	sp,	#9
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0xff
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:540: *eyeY = 255;
	ldhl	sp,	#7
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0xff
00219$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:542: }
	add	sp, #11
	pop	hl
	add	sp, #11
	jp	(hl)
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:544: void EyeExec(uint8_t *heroX, uint8_t *heroY, uint8_t *bkgX, uint8_t *bkgY){
;	---------------------------------
; Function EyeExec
; ---------------------------------
_EyeExec::
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:545: if(eye1X == 255){
	ld	a, (#_eye1X)
	inc	a
	jr	NZ, 00102$
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:546: EyeInit(&eye1X, &eye1Y, heroX, heroY, bkgX, bkgY, 8, 4, 8, &eye1Mode, &eye1Cnt);
	ld	hl, #_eye1Cnt
	push	hl
	ld	hl, #_eye1Mode
	push	hl
	ld	hl, #0x804
	push	hl
	ld	a, #0x08
	push	af
	inc	sp
	ldhl	sp,	#11
	ld	a, (hl+)
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	ldhl	sp,	#11
	ld	a, (hl+)
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	push	bc
	push	de
	ld	bc, #_eye1Y
	ld	de, #_eye1X
	call	_EyeInit
	jr	00103$
00102$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:549: EyeExecMain(&eye1X, &eye1Y, bkgX, bkgY, 8, 4, 8, &eye1Mode, &eye1Cnt);
	ld	de, #_eye1Cnt
	push	de
	ld	de, #_eye1Mode
	push	de
	ld	hl, #0x804
	push	hl
	ld	a, #0x08
	push	af
	inc	sp
	ldhl	sp,	#11
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	ldhl	sp,	#11
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	ld	bc, #_eye1Y
	ld	de, #_eye1X
	call	_EyeExecMain
00103$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:553: adjustCnt = adjustCnt + 1;
	ld	hl, #_adjustCnt
	inc	(hl)
	ld	a, (hl)
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:554: }
	pop	hl
	add	sp, #4
	jp	(hl)
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:556: void EyePosAdjust(int8_t adjustX, int8_t adjustY){
;	---------------------------------
; Function EyePosAdjust
; ---------------------------------
_EyePosAdjust::
	ld	c, a
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:557: if(eye1X != 255){
	ld	a, (#_eye1X)
	inc	a
	ret	Z
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:558: eye1X = eye1X + adjustX;
	ld	hl, #_eye1X
	ld	a, (hl)
	add	a, c
	ld	(hl), a
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:559: eye1Y = eye1Y + adjustY;
	ld	hl, #_eye1Y
	ld	a, (hl)
	add	a, e
	ld	(hl), a
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:560: move_sprite(6,eye1X, eye1Y);
	ld	e, (hl)
	ld	hl, #_eye1X
	ld	c, (hl)
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 24)
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, e
	ld	(hl+), a
	ld	(hl), c
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:561: move_sprite(7,eye1X + 8, eye1Y);
	ld	hl, #_eye1Y
	ld	e, (hl)
	ld	a, (#_eye1X)
	add	a, #0x08
	ld	c, a
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 28)
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, e
	ld	(hl+), a
	ld	(hl), c
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:561: move_sprite(7,eye1X + 8, eye1Y);
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:563: }
	ret
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:565: BOOLEAN DamageCheck(uint8_t *heroX, uint8_t *heroY){
;	---------------------------------
; Function DamageCheck
; ---------------------------------
_DamageCheck::
	add	sp, #-6
	ldhl	sp,	#4
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:566: if(eye1X != 255){
	ld	a, (#_eye1X)
	inc	a
	jp	Z,00107$
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:567: if(((*heroX+8 >= eye1X) && (*heroX-8 <= eye1X)) && ((*heroY+8 >= eye1Y) && (*heroY-8 <= eye1Y))){
	ld	a, (de)
	ld	c, a
	ld	b, #0x00
	ld	hl, #0x0008
	add	hl, bc
	inc	sp
	inc	sp
	push	hl
	ld	a, (#_eye1X)
	ldhl	sp,	#2
	ld	(hl+), a
	ld	(hl), #0x00
	ldhl	sp,	#0
	ld	e, l
	ld	d, h
	ldhl	sp,	#2
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	ld	a, (de)
	ld	d, a
	bit	7, (hl)
	jr	Z, 00136$
	bit	7, d
	jr	NZ, 00137$
	cp	a, a
	jr	00137$
00136$:
	bit	7, d
	jr	Z, 00137$
	scf
00137$:
	jp	C, 00107$
	ld	a, c
	add	a, #0xf8
	ld	c, a
	ld	a, b
	adc	a, #0xff
	ld	b, a
	ldhl	sp,	#2
	ld	a, (hl+)
	sub	a, c
	ld	a, (hl)
	sbc	a, b
	ld	d, (hl)
	ld	a, b
	bit	7,a
	jr	Z, 00138$
	bit	7, d
	jr	NZ, 00139$
	cp	a, a
	jr	00139$
00138$:
	bit	7, d
	jr	Z, 00139$
	scf
00139$:
	jr	C, 00107$
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	ld	b, #0x00
	ld	hl, #0x0008
	add	hl, bc
	inc	sp
	inc	sp
	push	hl
	ld	a, (#_eye1Y)
	ldhl	sp,	#2
	ld	(hl+), a
	ld	(hl), #0x00
	ldhl	sp,	#0
	ld	e, l
	ld	d, h
	ldhl	sp,	#2
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	ld	a, (de)
	ld	d, a
	bit	7, (hl)
	jr	Z, 00140$
	bit	7, d
	jr	NZ, 00141$
	cp	a, a
	jr	00141$
00140$:
	bit	7, d
	jr	Z, 00141$
	scf
00141$:
	jr	C, 00107$
	ld	a, c
	add	a, #0xf8
	ld	c, a
	ld	a, b
	adc	a, #0xff
	ld	b, a
	ldhl	sp,	#2
	ld	a, (hl+)
	sub	a, c
	ld	a, (hl)
	sbc	a, b
	ld	d, (hl)
	ld	a, b
	bit	7,a
	jr	Z, 00142$
	bit	7, d
	jr	NZ, 00143$
	cp	a, a
	jr	00143$
00142$:
	bit	7, d
	jr	Z, 00143$
	scf
00143$:
	jr	C, 00107$
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:568: return TRUE;
	ld	a, #0x01
	jr	00108$
00107$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:571: return FALSE;
	xor	a, a
00108$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:572: }
	add	sp, #6
	ret
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:574: void HitCheck(uint8_t hitArea1X, uint8_t hitArea1Y,uint8_t hitArea2X, uint8_t hitArea2Y){
;	---------------------------------
; Function HitCheck
; ---------------------------------
_HitCheck::
	ld	c, a
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:575: if((eye1X >= hitArea1X && eye1X <= hitArea2X) && (eye1Y >= hitArea1Y && eye1Y <= hitArea2Y)){
	ld	a, (#_eye1X)
	sub	a, c
	jr	C, 00122$
	ldhl	sp,	#2
	ld	a, (hl)
	ld	hl, #_eye1X
	sub	a, (hl)
	jr	C, 00122$
	ld	a, (#_eye1Y)
	sub	a, e
	jr	C, 00122$
	ldhl	sp,	#3
	ld	a, (hl)
	ld	hl, #_eye1Y
	sub	a, (hl)
	jr	C, 00122$
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:576: if((eye1Mode >= FLOATUP && eye1Mode <= FLOATLEFT) && eye1Cnt >= 5){
	ld	hl, #_eye1Mode
	ld	a, (hl)
	sub	a, #0x05
	jr	C, 00113$
	ld	a, #0x08
	sub	a, (hl)
	jr	C, 00113$
	ld	a, (#_eye1Cnt)
	sub	a, #0x05
	jr	NC, 00114$
00113$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:579: else if((eye1Mode >= SINKUP && eye1Mode <= SINKLEFT) && eye1Cnt < 10){
	ld	hl, #_eye1Mode
	ld	a, (hl)
	sub	a, #0x0d
	jr	C, 00108$
	ld	a, #0x10
	sub	a, (hl)
	jr	C, 00108$
	ld	a, (#_eye1Cnt)
	sub	a, #0x0a
	jr	C, 00114$
00108$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:582: else if((eye1Mode >= UP && eye1Mode <= LEFT) || (eye1Mode >= SHOTUP && eye1Mode <= SHOTLEFT)){
	ld	hl, #_eye1Mode
	ld	a, (hl)
	sub	a, #0x09
	jr	C, 00106$
	ld	a, #0x0c
	sub	a, (hl)
	jr	NC, 00114$
00106$:
	ld	hl, #_eye1Mode
	ld	a, (hl)
	sub	a, #0x11
	jr	C, 00122$
	ld	a, #0x14
	sub	a, (hl)
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:586: return;
	jr	C, 00122$
00114$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:588: eye1Mode = SLASH;
	ld	hl, #_eye1Mode
	ld	(hl), #0x15
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:589: eye1Cnt = 0;
	ld	hl, #_eye1Cnt
	ld	(hl), #0x00
00122$:
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\EyeExec.c:591: }
	pop	hl
	pop	af
	jp	(hl)
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
