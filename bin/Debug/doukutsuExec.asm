;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.2 #13350 (MINGW64)
;--------------------------------------------------------
	.module doukutsuExec
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _doukutsuInit
	.globl _set_bkg_palette
	.globl _set_bkg_tiles
	.globl _set_bkg_data
	.globl _doukutsuPallet
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
	G$doukutsuInit$0$0	= .
	.globl	G$doukutsuInit$0$0
	C$doukutsuExec.c$18$0_0$107	= .
	.globl	C$doukutsuExec.c$18$0_0$107
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\doukutsuExec.c:18: void doukutsuInit(){
;	---------------------------------
; Function doukutsuInit
; ---------------------------------
_doukutsuInit::
	C$doukutsuExec.c$19$1_0$107	= .
	.globl	C$doukutsuExec.c$19$1_0$107
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\doukutsuExec.c:19: HIDE_BKG;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfe
	ldh	(_LCDC_REG + 0), a
	C$doukutsuExec.c$20$1_0$107	= .
	.globl	C$doukutsuExec.c$20$1_0$107
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\doukutsuExec.c:20: set_bkg_data(0, 52, doukutsuTile);
	ld	de, #_doukutsuTile
	push	de
	ld	hl, #0x3400
	push	hl
	call	_set_bkg_data
	add	sp, #4
	C$doukutsuExec.c$21$1_0$107	= .
	.globl	C$doukutsuExec.c$21$1_0$107
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\doukutsuExec.c:21: set_bkg_palette(0,8,&doukutsuPallet[0]);
	ld	de, #_doukutsuPallet
	push	de
	ld	hl, #0x800
	push	hl
	call	_set_bkg_palette
	add	sp, #4
	C$doukutsuExec.c$22$1_0$107	= .
	.globl	C$doukutsuExec.c$22$1_0$107
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\doukutsuExec.c:22: VBK_REG = 1;
	ld	a, #0x01
	ldh	(_VBK_REG + 0), a
	C$doukutsuExec.c$24$1_0$107	= .
	.globl	C$doukutsuExec.c$24$1_0$107
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\doukutsuExec.c:24: set_bkg_tiles(0,0,32,32,douketsuColor);
	ld	de, #_douketsuColor
	push	de
	ld	hl, #0x2020
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
	C$doukutsuExec.c$25$1_0$107	= .
	.globl	C$doukutsuExec.c$25$1_0$107
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\doukutsuExec.c:25: VBK_REG = 0;
	xor	a, a
	ldh	(_VBK_REG + 0), a
	C$doukutsuExec.c$26$1_0$107	= .
	.globl	C$doukutsuExec.c$26$1_0$107
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\doukutsuExec.c:26: set_bkg_tiles(0,0,32,32,doukutsu);
	ld	de, #_doukutsu
	push	de
	ld	hl, #0x2020
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
	C$doukutsuExec.c$28$1_0$107	= .
	.globl	C$doukutsuExec.c$28$1_0$107
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\doukutsuExec.c:28: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
	C$doukutsuExec.c$29$1_0$107	= .
	.globl	C$doukutsuExec.c$29$1_0$107
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\doukutsuExec.c:29: }
	C$doukutsuExec.c$29$1_0$107	= .
	.globl	C$doukutsuExec.c$29$1_0$107
	XG$doukutsuInit$0$0	= .
	.globl	XG$doukutsuInit$0$0
	ret
G$doukutsuPallet$0_0$0 == .
_doukutsuPallet:
	.dw #0x7fff
	.dw #0x6251
	.dw #0x51ae
	.dw #0x34e8
	.dw #0x5291
	.dw #0x4a4e
	.dw #0x3dea
	.dw #0x3589
	.dw #0x4633
	.dw #0x318e
	.dw #0x252b
	.dw #0x0ce8
	.dw #0x7fff
	.dw #0x22e7
	.dw #0x19c4
	.dw #0x0000
	.dw #0x7fff
	.dw #0x6251
	.dw #0x51ae
	.dw #0x34e8
	.dw #0x7fff
	.dw #0x6251
	.dw #0x51ae
	.dw #0x34e8
	.dw #0x7fff
	.dw #0x6251
	.dw #0x51ae
	.dw #0x34e8
	.dw #0x7fff
	.dw #0x6251
	.dw #0x51ae
	.dw #0x34e8
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
