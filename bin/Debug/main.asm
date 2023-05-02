;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.2 #13350 (MINGW64)
;--------------------------------------------------------
	.module main
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _DamageCheck
	.globl _EyeExecInit
	.globl _EyeExec
	.globl _getBkgY
	.globl _getBkgX
	.globl _getSpriteX
	.globl _getSpriteY
	.globl _HeroExec
	.globl _HeroExecInit
	.globl _wait_vbl_done
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
	G$main$0$0	= .
	.globl	G$main$0$0
	C$main.c$10$0_0$131	= .
	.globl	C$main.c$10$0_0$131
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\main.c:10: void main(void){
;	---------------------------------
; Function main
; ---------------------------------
_main::
	dec	sp
	dec	sp
	C$main.c$11$1_0$131	= .
	.globl	C$main.c$11$1_0$131
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\main.c:11: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
	C$main.c$12$1_0$131	= .
	.globl	C$main.c$12$1_0$131
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\main.c:12: SPRITES_8x16;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x04
	ldh	(_LCDC_REG + 0), a
	C$main.c$16$1_0$131	= .
	.globl	C$main.c$16$1_0$131
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\main.c:16: HeroExecInit();
	call	_HeroExecInit
	C$main.c$17$1_0$131	= .
	.globl	C$main.c$17$1_0$131
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\main.c:17: EyeExecInit();
	call	_EyeExecInit
	C$main.c$18$1_0$131	= .
	.globl	C$main.c$18$1_0$131
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\main.c:18: doukutsuInit();
	call	_doukutsuInit
	C$main.c$20$1_0$131	= .
	.globl	C$main.c$20$1_0$131
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\main.c:20: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
	C$main.c$21$1_0$131	= .
	.globl	C$main.c$21$1_0$131
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\main.c:21: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
	C$main.c$22$1_0$131	= .
	.globl	C$main.c$22$1_0$131
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\main.c:22: while(1){
00104$:
	C$main.c$24$2_0$132	= .
	.globl	C$main.c$24$2_0$132
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\main.c:24: HeroExec();
	call	_HeroExec
	C$main.c$25$2_0$132	= .
	.globl	C$main.c$25$2_0$132
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\main.c:25: EyeExec(getSpriteX(), getSpriteY(), getBkgX(), getBkgY());
	call	_getBkgY
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	call	_getBkgX
	ldhl	sp,	#2
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	call	_getSpriteY
	push	bc
	call	_getSpriteX
	ld	e, c
	ld	d, b
	pop	bc
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	call	_EyeExec
	C$main.c$26$2_1$133	= .
	.globl	C$main.c$26$2_1$133
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\main.c:26: BOOLEAN damageFlag = DamageCheck(getSpriteX(), getSpriteY());
	call	_getSpriteY
	push	bc
	call	_getSpriteX
	ld	e, c
	ld	d, b
	pop	bc
	call	_DamageCheck
	C$main.c$27$2_1$133	= .
	.globl	C$main.c$27$2_1$133
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\main.c:27: if(damageFlag == TRUE){
	dec	a
	jr	NZ, 00102$
	C$main.c$28$3_1$134	= .
	.globl	C$main.c$28$3_1$134
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\main.c:28: StartBlink();
	call	_StartBlink
00102$:
	C$main.c$30$2_1$133	= .
	.globl	C$main.c$30$2_1$133
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\main.c:30: BlinkExec();
	call	_BlinkExec
	C$main.c$31$2_1$133	= .
	.globl	C$main.c$31$2_1$133
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\main.c:31: wait_vbl_done();
	call	_wait_vbl_done
	jr	00104$
	C$main.c$33$1_0$131	= .
	.globl	C$main.c$33$1_0$131
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\main.c:33: }
	inc	sp
	inc	sp
	C$main.c$33$1_0$131	= .
	.globl	C$main.c$33$1_0$131
	XG$main$0$0	= .
	.globl	XG$main$0$0
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
