;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.2 #13350 (MINGW64)
;--------------------------------------------------------
	.module HeroExec
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _BlinkExec
	.globl _StartBlink
	.globl _HeroExec
	.globl _getBkgY
	.globl _getBkgX
	.globl _getSpriteY
	.globl _getSpriteX
	.globl _HeroExecInit
	.globl _HitCheck
	.globl _EyePosAdjust
	.globl _set_sprite_palette
	.globl _set_sprite_data
	.globl _joypad
	.globl _blinkFlag
	.globl _swordAction
	.globl _direction
	.globl _heroAction
	.globl _swordCnt
	.globl _blinkCnt
	.globl _actionCnt
	.globl _velocityY
	.globl _velocityX
	.globl _bkgY
	.globl _bkgX
	.globl _spriteY
	.globl _spriteX
	.globl _joypadPrevious
	.globl _spritepalette
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
G$joypadPrevious$0_0$0==.
_joypadPrevious::
	.ds 1
G$spriteX$0_0$0==.
_spriteX::
	.ds 1
G$spriteY$0_0$0==.
_spriteY::
	.ds 1
G$bkgX$0_0$0==.
_bkgX::
	.ds 1
G$bkgY$0_0$0==.
_bkgY::
	.ds 1
G$velocityX$0_0$0==.
_velocityX::
	.ds 1
G$velocityY$0_0$0==.
_velocityY::
	.ds 1
G$actionCnt$0_0$0==.
_actionCnt::
	.ds 1
G$blinkCnt$0_0$0==.
_blinkCnt::
	.ds 1
G$swordCnt$0_0$0==.
_swordCnt::
	.ds 1
G$heroAction$0_0$0==.
_heroAction::
	.ds 1
G$direction$0_0$0==.
_direction::
	.ds 1
G$swordAction$0_0$0==.
_swordAction::
	.ds 1
G$blinkFlag$0_0$0==.
_blinkFlag::
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
	G$HeroExecInit$0$0	= .
	.globl	G$HeroExecInit$0$0
	C$HeroExec.c$40$0_0$111	= .
	.globl	C$HeroExec.c$40$0_0$111
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:40: void HeroExecInit(){
;	---------------------------------
; Function HeroExecInit
; ---------------------------------
_HeroExecInit::
	C$HeroExec.c$41$1_0$111	= .
	.globl	C$HeroExec.c$41$1_0$111
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:41: set_sprite_palette(0,8,&spritepalette[0]);
	ld	de, #_spritepalette
	push	de
	ld	hl, #0x800
	push	hl
	call	_set_sprite_palette
	add	sp, #4
	C$HeroExec.c$43$1_0$111	= .
	.globl	C$HeroExec.c$43$1_0$111
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:43: set_sprite_data(0,4,SwordRightUpTile);
	ld	de, #_SwordRightUpTile
	push	de
	ld	hl, #0x400
	push	hl
	call	_set_sprite_data
	add	sp, #4
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), #0x00
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1648: shadow_OAM[nb].prop=prop;
	ld	hl, #(_shadow_OAM + 3)
	ld	(hl), #0x03
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
	ld	(hl), #0x02
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1648: shadow_OAM[nb].prop=prop;
	ld	hl, #(_shadow_OAM + 7)
	ld	(hl), #0x03
	C$HeroExec.c$49$1_0$111	= .
	.globl	C$HeroExec.c$49$1_0$111
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:49: set_sprite_data(4,4,HeroDownTile);
	ld	de, #_HeroDownTile
	push	de
	ld	hl, #0x404
	push	hl
	call	_set_sprite_data
	add	sp, #4
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 10)
	ld	(hl), #0x04
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1648: shadow_OAM[nb].prop=prop;
	ld	hl, #(_shadow_OAM + 11)
	ld	(hl), #0x00
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 14)
	ld	(hl), #0x06
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1648: shadow_OAM[nb].prop=prop;
	ld	hl, #(_shadow_OAM + 15)
	ld	(hl), #0x00
	C$HeroExec.c$54$1_0$111	= .
	.globl	C$HeroExec.c$54$1_0$111
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:54: spriteX=80;
	ld	hl, #_spriteX
	ld	(hl), #0x50
	C$HeroExec.c$55$1_0$111	= .
	.globl	C$HeroExec.c$55$1_0$111
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:55: spriteY=72;
	ld	hl, #_spriteY
	ld	(hl), #0x48
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 8)
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, #0x48
	ld	(hl+), a
	ld	(hl), #0x50
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:57: move_sprite(3, spriteX + 8, spriteY);
	ld	hl, #_spriteY
	ld	b, (hl)
	ld	a, (#_spriteX)
	add	a, #0x08
	ld	c, a
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 12)
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
	C$HeroExec.c$58$1_0$111	= .
	.globl	C$HeroExec.c$58$1_0$111
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:58: velocityX=0;
	ld	hl, #_velocityX
	ld	(hl), #0x00
	C$HeroExec.c$59$1_0$111	= .
	.globl	C$HeroExec.c$59$1_0$111
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:59: velocityY=0;
	ld	hl, #_velocityY
	ld	(hl), #0x00
	C$HeroExec.c$60$1_0$111	= .
	.globl	C$HeroExec.c$60$1_0$111
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:60: actionCnt=0;
	ld	hl, #_actionCnt
	ld	(hl), #0x00
	C$HeroExec.c$61$1_0$111	= .
	.globl	C$HeroExec.c$61$1_0$111
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:61: heroAction=NOACTION;
	ld	hl, #_heroAction
	ld	(hl), #0x00
	C$HeroExec.c$62$1_0$111	= .
	.globl	C$HeroExec.c$62$1_0$111
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:62: bkgX = 0;
	ld	hl, #_bkgX
	ld	(hl), #0x00
	C$HeroExec.c$63$1_0$111	= .
	.globl	C$HeroExec.c$63$1_0$111
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:63: bkgY = 0;
	ld	hl, #_bkgY
	ld	(hl), #0x00
	C$HeroExec.c$64$1_0$111	= .
	.globl	C$HeroExec.c$64$1_0$111
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:64: blinkFlag = FALSE;
	ld	hl, #_blinkFlag
	ld	(hl), #0x00
	C$HeroExec.c$65$1_0$111	= .
	.globl	C$HeroExec.c$65$1_0$111
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:65: blinkCnt = 0;
	ld	hl, #_blinkCnt
	ld	(hl), #0x00
	C$HeroExec.c$66$1_0$111	= .
	.globl	C$HeroExec.c$66$1_0$111
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:66: swordAction = NOACTION;
	ld	hl, #_swordAction
	ld	(hl), #0x00
	C$HeroExec.c$67$1_0$111	= .
	.globl	C$HeroExec.c$67$1_0$111
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:67: swordCnt = 0;
	ld	hl, #_swordCnt
	ld	(hl), #0x00
	C$HeroExec.c$68$1_0$111	= .
	.globl	C$HeroExec.c$68$1_0$111
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:68: direction = DOWN;
	ld	hl, #_direction
	ld	(hl), #0x02
	C$HeroExec.c$69$1_0$111	= .
	.globl	C$HeroExec.c$69$1_0$111
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:69: }
	C$HeroExec.c$69$1_0$111	= .
	.globl	C$HeroExec.c$69$1_0$111
	XG$HeroExecInit$0$0	= .
	.globl	XG$HeroExecInit$0$0
	ret
G$spritepalette$0_0$0 == .
_spritepalette:
	.dw #0x7fff
	.dw #0x7fff
	.dw #0x0d9f
	.dw #0x0000
	.dw #0x7fff
	.dw #0x777e
	.dw #0x541c
	.dw #0x0000
	.dw #0x7fff
	.dw #0x039c
	.dw #0x03ff
	.dw #0x0000
	.dw #0x7fff
	.dw #0x7fff
	.dw #0x6318
	.dw #0x0000
	.dw #0x7fff
	.dw #0x7fff
	.dw #0x0d9f
	.dw #0x0000
	.dw #0x7fff
	.dw #0x7fff
	.dw #0x0d9f
	.dw #0x0000
	.dw #0x7fff
	.dw #0x7fff
	.dw #0x0d9f
	.dw #0x0000
	.dw #0x7fff
	.dw #0x7fff
	.dw #0x0d9f
	.dw #0x0000
	G$getSpriteX$0$0	= .
	.globl	G$getSpriteX$0$0
	C$HeroExec.c$71$1_0$142	= .
	.globl	C$HeroExec.c$71$1_0$142
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:71: uint8_t *getSpriteX(){
;	---------------------------------
; Function getSpriteX
; ---------------------------------
_getSpriteX::
	C$HeroExec.c$72$1_0$142	= .
	.globl	C$HeroExec.c$72$1_0$142
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:72: return &spriteX;
	ld	bc, #_spriteX
	C$HeroExec.c$73$1_0$142	= .
	.globl	C$HeroExec.c$73$1_0$142
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:73: }
	C$HeroExec.c$73$1_0$142	= .
	.globl	C$HeroExec.c$73$1_0$142
	XG$getSpriteX$0$0	= .
	.globl	XG$getSpriteX$0$0
	ret
	G$getSpriteY$0$0	= .
	.globl	G$getSpriteY$0$0
	C$HeroExec.c$75$1_0$143	= .
	.globl	C$HeroExec.c$75$1_0$143
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:75: uint8_t *getSpriteY(){
;	---------------------------------
; Function getSpriteY
; ---------------------------------
_getSpriteY::
	C$HeroExec.c$76$1_0$143	= .
	.globl	C$HeroExec.c$76$1_0$143
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:76: return &spriteY;
	ld	bc, #_spriteY
	C$HeroExec.c$77$1_0$143	= .
	.globl	C$HeroExec.c$77$1_0$143
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:77: }
	C$HeroExec.c$77$1_0$143	= .
	.globl	C$HeroExec.c$77$1_0$143
	XG$getSpriteY$0$0	= .
	.globl	XG$getSpriteY$0$0
	ret
	G$getBkgX$0$0	= .
	.globl	G$getBkgX$0$0
	C$HeroExec.c$79$1_0$144	= .
	.globl	C$HeroExec.c$79$1_0$144
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:79: uint8_t *getBkgX(){
;	---------------------------------
; Function getBkgX
; ---------------------------------
_getBkgX::
	C$HeroExec.c$80$1_0$144	= .
	.globl	C$HeroExec.c$80$1_0$144
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:80: return &bkgX;
	ld	bc, #_bkgX
	C$HeroExec.c$81$1_0$144	= .
	.globl	C$HeroExec.c$81$1_0$144
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:81: }
	C$HeroExec.c$81$1_0$144	= .
	.globl	C$HeroExec.c$81$1_0$144
	XG$getBkgX$0$0	= .
	.globl	XG$getBkgX$0$0
	ret
	G$getBkgY$0$0	= .
	.globl	G$getBkgY$0$0
	C$HeroExec.c$83$1_0$145	= .
	.globl	C$HeroExec.c$83$1_0$145
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:83: uint8_t *getBkgY(){
;	---------------------------------
; Function getBkgY
; ---------------------------------
_getBkgY::
	C$HeroExec.c$84$1_0$145	= .
	.globl	C$HeroExec.c$84$1_0$145
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:84: return &bkgY;
	ld	bc, #_bkgY
	C$HeroExec.c$85$1_0$145	= .
	.globl	C$HeroExec.c$85$1_0$145
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:85: }
	C$HeroExec.c$85$1_0$145	= .
	.globl	C$HeroExec.c$85$1_0$145
	XG$getBkgY$0$0	= .
	.globl	XG$getBkgY$0$0
	ret
	G$HeroExec$0$0	= .
	.globl	G$HeroExec$0$0
	C$HeroExec.c$87$1_0$146	= .
	.globl	C$HeroExec.c$87$1_0$146
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:87: void HeroExec(){
;	---------------------------------
; Function HeroExec
; ---------------------------------
_HeroExec::
	add	sp, #-7
	C$HeroExec.c$88$1_0$146	= .
	.globl	C$HeroExec.c$88$1_0$146
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:88: if(heroAction == NOACTION && swordAction == NOACTION){
	ld	a, (#_heroAction)
	or	a, a
	jr	NZ, 00116$
	ld	a, (#_swordAction)
	or	a, a
	jr	NZ, 00116$
	C$HeroExec.c$89$2_0$147	= .
	.globl	C$HeroExec.c$89$2_0$147
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:89: if(joypad() & J_RIGHT){
	call	_joypad
	rrca
	jr	NC, 00102$
	C$HeroExec.c$90$3_0$148	= .
	.globl	C$HeroExec.c$90$3_0$148
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:90: heroAction = MOVERIGHT;
	ld	hl, #_heroAction
	ld	(hl), #0x02
00102$:
	C$HeroExec.c$92$2_0$147	= .
	.globl	C$HeroExec.c$92$2_0$147
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:92: if(joypad() & J_LEFT){
	call	_joypad
	bit	1, a
	jr	Z, 00104$
	C$HeroExec.c$93$3_0$149	= .
	.globl	C$HeroExec.c$93$3_0$149
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:93: heroAction = MOVELEFT;
	ld	hl, #_heroAction
	ld	(hl), #0x04
00104$:
	C$HeroExec.c$95$2_0$147	= .
	.globl	C$HeroExec.c$95$2_0$147
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:95: if(joypad() & J_UP){
	call	_joypad
	bit	2, a
	jr	Z, 00106$
	C$HeroExec.c$96$3_0$150	= .
	.globl	C$HeroExec.c$96$3_0$150
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:96: heroAction = MOVEUP;
	ld	hl, #_heroAction
	ld	(hl), #0x01
00106$:
	C$HeroExec.c$98$2_0$147	= .
	.globl	C$HeroExec.c$98$2_0$147
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:98: if(joypad() & J_DOWN){
	call	_joypad
	bit	3, a
	jr	Z, 00108$
	C$HeroExec.c$99$3_0$151	= .
	.globl	C$HeroExec.c$99$3_0$151
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:99: heroAction = MOVEDOWN;
	ld	hl, #_heroAction
	ld	(hl), #0x03
00108$:
	C$HeroExec.c$101$2_0$147	= .
	.globl	C$HeroExec.c$101$2_0$147
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:101: if(joypad() & J_A){
	call	_joypad
	bit	4, a
	jr	Z, 00112$
	C$HeroExec.c$102$3_0$152	= .
	.globl	C$HeroExec.c$102$3_0$152
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:102: if(blinkFlag == FALSE){
	ld	a, (#_blinkFlag)
	or	a, a
	jr	NZ, 00112$
	C$HeroExec.c$103$4_0$153	= .
	.globl	C$HeroExec.c$103$4_0$153
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:103: swordAction = SWORD;
	ld	hl, #_swordAction
	ld	(hl), #0x01
00112$:
	C$HeroExec.c$106$2_0$147	= .
	.globl	C$HeroExec.c$106$2_0$147
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:106: if(joypad() & J_B){
	call	_joypad
	C$HeroExec.c$108$2_0$147	= .
	.globl	C$HeroExec.c$108$2_0$147
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:108: actionCnt = 0;
	ld	hl, #_actionCnt
	ld	(hl), #0x00
00116$:
	C$HeroExec.c$110$1_0$146	= .
	.globl	C$HeroExec.c$110$1_0$146
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:110: if(heroAction != NOACTION && swordAction == NOACTION){
	ld	a, (#_heroAction)
	or	a, a
	jp	Z, 00206$
	ld	a, (#_swordAction)
	or	a, a
	jp	NZ, 00206$
	C$HeroExec.c$116$1_0$146	= .
	.globl	C$HeroExec.c$116$1_0$146
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:116: else if(actionCnt == 5){
	ld	a, (#_actionCnt)
	sub	a, #0x05
	ld	a, #0x01
	jr	Z, 00856$
	xor	a, a
00856$:
	ld	c, a
	C$HeroExec.c$119$1_0$146	= .
	.globl	C$HeroExec.c$119$1_0$146
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:119: else if(actionCnt == 10){
	ld	a, (#_actionCnt)
	sub	a, #0x0a
	ld	a, #0x01
	jr	Z, 00858$
	xor	a, a
00858$:
	ld	b, a
	C$HeroExec.c$111$2_0$155	= .
	.globl	C$HeroExec.c$111$2_0$155
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:111: if(heroAction == MOVERIGHT){
	ld	a, (#_heroAction)
	sub	a, #0x02
	jp	NZ,00203$
	C$HeroExec.c$112$3_0$156	= .
	.globl	C$HeroExec.c$112$3_0$156
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:112: if(actionCnt == 0){
	ld	a, (#_actionCnt)
	or	a, a
	jr	NZ, 00124$
	C$HeroExec.c$113$4_0$157	= .
	.globl	C$HeroExec.c$113$4_0$157
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:113: set_sprite_data(4,4,HeroRightTile);
	ld	de, #_HeroRightTile
	push	de
	ld	hl, #0x404
	push	hl
	call	_set_sprite_data
	add	sp, #4
	C$HeroExec.c$114$4_0$157	= .
	.globl	C$HeroExec.c$114$4_0$157
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:114: direction = RIGHT;
	ld	hl, #_direction
	ld	(hl), #0x01
	jr	00125$
00124$:
	C$HeroExec.c$116$3_0$156	= .
	.globl	C$HeroExec.c$116$3_0$156
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:116: else if(actionCnt == 5){
	ld	a, c
	or	a, a
	jr	Z, 00121$
	C$HeroExec.c$117$4_0$158	= .
	.globl	C$HeroExec.c$117$4_0$158
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:117: set_sprite_data(4,4,HeroRightWalkTile);
	ld	de, #_HeroRightWalkTile
	push	de
	ld	hl, #0x404
	push	hl
	call	_set_sprite_data
	add	sp, #4
	jr	00125$
00121$:
	C$HeroExec.c$119$3_0$156	= .
	.globl	C$HeroExec.c$119$3_0$156
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:119: else if(actionCnt == 10){
	ld	a, b
	or	a, a
	jr	Z, 00125$
	C$HeroExec.c$120$4_0$159	= .
	.globl	C$HeroExec.c$120$4_0$159
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:120: set_sprite_data(4,4,HeroRightTile);
	ld	de, #_HeroRightTile
	push	de
	ld	hl, #0x404
	push	hl
	call	_set_sprite_data
	add	sp, #4
	C$HeroExec.c$121$4_0$159	= .
	.globl	C$HeroExec.c$121$4_0$159
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:121: heroAction = NOACTION;
	ld	hl, #_heroAction
	ld	(hl), #0x00
00125$:
	C$HeroExec.c$123$3_0$156	= .
	.globl	C$HeroExec.c$123$3_0$156
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:123: if(actionCnt == 5 || actionCnt == 10){
	ld	a, (#_actionCnt)
	sub	a, #0x05
	jr	Z, 00134$
	ld	a, (#_actionCnt)
	sub	a, #0x0a
	jp	NZ,00204$
00134$:
	C$HeroExec.c$126$1_0$146	= .
	.globl	C$HeroExec.c$126$1_0$146
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:126: spriteX += 4;
	ld	a, (#_spriteX)
	C$HeroExec.c$127$1_0$146	= .
	.globl	C$HeroExec.c$127$1_0$146
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:127: move_sprite(2,spriteX,spriteY);
	ld	hl, #_spriteY
	ld	e, (hl)
	C$HeroExec.c$126$1_0$146	= .
	.globl	C$HeroExec.c$126$1_0$146
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:126: spriteX += 4;
	add	a, #0x04
	ld	c, a
	C$HeroExec.c$124$4_0$160	= .
	.globl	C$HeroExec.c$124$4_0$160
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:124: if(bkgX == 96){
	ld	a, (#_bkgX)
	sub	a, #0x60
	jr	NZ, 00132$
	C$HeroExec.c$125$5_0$161	= .
	.globl	C$HeroExec.c$125$5_0$161
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:125: if(spriteX != 120){
	ld	a, (#_spriteX)
	sub	a, #0x78
	jp	Z,00204$
	C$HeroExec.c$126$6_0$162	= .
	.globl	C$HeroExec.c$126$6_0$162
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:126: spriteX += 4;
	ld	hl, #_spriteX
	ld	(hl), c
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:127: move_sprite(2,spriteX,spriteY);
	ld	c, (hl)
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 8)
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, e
	ld	(hl+), a
	ld	(hl), c
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:128: move_sprite(3,spriteX+8,spriteY);
	ld	hl, #_spriteY
	ld	e, (hl)
	ld	a, (#_spriteX)
	add	a, #0x08
	ld	c, a
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 12)
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, e
	ld	(hl+), a
	ld	(hl), c
	C$HeroExec.c$128$4_0$160	= .
	.globl	C$HeroExec.c$128$4_0$160
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:128: move_sprite(3,spriteX+8,spriteY);
	jp	00204$
00132$:
	C$HeroExec.c$132$5_0$163	= .
	.globl	C$HeroExec.c$132$5_0$163
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:132: if(spriteX != 80){
	ld	a, (#_spriteX)
	sub	a, #0x50
	jr	Z, 00129$
	C$HeroExec.c$133$6_0$164	= .
	.globl	C$HeroExec.c$133$6_0$164
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:133: spriteX += 4;
	ld	hl, #_spriteX
	ld	(hl), c
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:134: move_sprite(2,spriteX,spriteY);
	ld	c, (hl)
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 8)
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, e
	ld	(hl+), a
	ld	(hl), c
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:135: move_sprite(3,spriteX+8,spriteY);
	ld	hl, #_spriteY
	ld	b, (hl)
	ld	a, (#_spriteX)
	add	a, #0x08
	ld	c, a
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 12)
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
	C$HeroExec.c$135$5_0$163	= .
	.globl	C$HeroExec.c$135$5_0$163
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:135: move_sprite(3,spriteX+8,spriteY);
	jp	00204$
00129$:
	C$HeroExec.c$138$6_0$165	= .
	.globl	C$HeroExec.c$138$6_0$165
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:138: bkgX += 4;
	ld	hl, #_bkgX
	ld	a, (hl)
	add	a, #0x04
	ld	(hl), a
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:139: move_bkg(bkgX,bkgY);
	ld	hl, #_bkgY
	ld	c, (hl)
	ld	a, (#_bkgX)
	ldh	(_SCX_REG + 0), a
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1208: SCX_REG=x, SCY_REG=y;
	ld	a, c
	ldh	(_SCY_REG + 0), a
	C$HeroExec.c$140$6_0$165	= .
	.globl	C$HeroExec.c$140$6_0$165
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:140: EyePosAdjust(-4,0);
	ld	e, #0x00
	ld	a, #0xfc
	call	_EyePosAdjust
	jp	00204$
00203$:
	C$HeroExec.c$145$2_0$155	= .
	.globl	C$HeroExec.c$145$2_0$155
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:145: else if(heroAction == MOVELEFT){
	ld	a, (#_heroAction)
	sub	a, #0x04
	jp	NZ,00200$
	C$HeroExec.c$146$3_0$166	= .
	.globl	C$HeroExec.c$146$3_0$166
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:146: if(actionCnt == 0){
	ld	a, (#_actionCnt)
	or	a, a
	jr	NZ, 00143$
	C$HeroExec.c$147$4_0$167	= .
	.globl	C$HeroExec.c$147$4_0$167
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:147: set_sprite_data(4,4,HeroLeftTile);
	ld	de, #_HeroLeftTile
	push	de
	ld	hl, #0x404
	push	hl
	call	_set_sprite_data
	add	sp, #4
	C$HeroExec.c$148$4_0$167	= .
	.globl	C$HeroExec.c$148$4_0$167
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:148: direction = LEFT;
	ld	hl, #_direction
	ld	(hl), #0x03
	jr	00144$
00143$:
	C$HeroExec.c$150$3_0$166	= .
	.globl	C$HeroExec.c$150$3_0$166
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:150: else if(actionCnt == 5){
	ld	a, c
	or	a, a
	jr	Z, 00140$
	C$HeroExec.c$151$4_0$168	= .
	.globl	C$HeroExec.c$151$4_0$168
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:151: set_sprite_data(4,4,HeroLeftWalkTile);
	ld	de, #_HeroLeftWalkTile
	push	de
	ld	hl, #0x404
	push	hl
	call	_set_sprite_data
	add	sp, #4
	jr	00144$
00140$:
	C$HeroExec.c$153$3_0$166	= .
	.globl	C$HeroExec.c$153$3_0$166
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:153: else if(actionCnt == 10){
	ld	a, b
	or	a, a
	jr	Z, 00144$
	C$HeroExec.c$154$4_0$169	= .
	.globl	C$HeroExec.c$154$4_0$169
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:154: set_sprite_data(4,4,HeroLeftTile);
	ld	de, #_HeroLeftTile
	push	de
	ld	hl, #0x404
	push	hl
	call	_set_sprite_data
	add	sp, #4
	C$HeroExec.c$155$4_0$169	= .
	.globl	C$HeroExec.c$155$4_0$169
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:155: heroAction = NOACTION;
	ld	hl, #_heroAction
	ld	(hl), #0x00
00144$:
	C$HeroExec.c$157$3_0$166	= .
	.globl	C$HeroExec.c$157$3_0$166
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:157: if(actionCnt == 5 || actionCnt == 10){
	ld	a, (#_actionCnt)
	sub	a, #0x05
	jr	Z, 00153$
	ld	a, (#_actionCnt)
	sub	a, #0x0a
	jp	NZ,00204$
00153$:
	C$HeroExec.c$126$1_0$146	= .
	.globl	C$HeroExec.c$126$1_0$146
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:126: spriteX += 4;
	ld	a, (#_spriteX)
	C$HeroExec.c$127$1_0$146	= .
	.globl	C$HeroExec.c$127$1_0$146
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:127: move_sprite(2,spriteX,spriteY);
	ld	hl, #_spriteY
	ld	e, (hl)
	C$HeroExec.c$160$1_0$146	= .
	.globl	C$HeroExec.c$160$1_0$146
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:160: spriteX -= 4;
	add	a, #0xfc
	ld	c, a
	C$HeroExec.c$158$4_0$170	= .
	.globl	C$HeroExec.c$158$4_0$170
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:158: if(bkgX == 0){
	ld	a, (#_bkgX)
	or	a, a
	jr	NZ, 00151$
	C$HeroExec.c$159$5_0$171	= .
	.globl	C$HeroExec.c$159$5_0$171
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:159: if(spriteX != 40){
	ld	a, (#_spriteX)
	sub	a, #0x28
	jp	Z,00204$
	C$HeroExec.c$160$6_0$172	= .
	.globl	C$HeroExec.c$160$6_0$172
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:160: spriteX -= 4;
	ld	hl, #_spriteX
	ld	(hl), c
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:161: move_sprite(2,spriteX,spriteY);
	ld	c, (hl)
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 8)
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, e
	ld	(hl+), a
	ld	(hl), c
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:162: move_sprite(3,spriteX+8,spriteY);
	ld	hl, #_spriteY
	ld	e, (hl)
	ld	a, (#_spriteX)
	add	a, #0x08
	ld	c, a
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 12)
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, e
	ld	(hl+), a
	ld	(hl), c
	C$HeroExec.c$162$4_0$170	= .
	.globl	C$HeroExec.c$162$4_0$170
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:162: move_sprite(3,spriteX+8,spriteY);
	jp	00204$
00151$:
	C$HeroExec.c$166$5_0$173	= .
	.globl	C$HeroExec.c$166$5_0$173
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:166: if(spriteX != 80){
	ld	a, (#_spriteX)
	sub	a, #0x50
	jr	Z, 00148$
	C$HeroExec.c$167$6_0$174	= .
	.globl	C$HeroExec.c$167$6_0$174
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:167: spriteX -= 4;
	ld	hl, #_spriteX
	ld	(hl), c
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:168: move_sprite(2,spriteX,spriteY);
	ld	c, (hl)
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 8)
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, e
	ld	(hl+), a
	ld	(hl), c
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:169: move_sprite(3,spriteX+8,spriteY);
	ld	hl, #_spriteY
	ld	b, (hl)
	ld	a, (#_spriteX)
	add	a, #0x08
	ld	c, a
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 12)
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
	C$HeroExec.c$169$5_0$173	= .
	.globl	C$HeroExec.c$169$5_0$173
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:169: move_sprite(3,spriteX+8,spriteY);
	jp	00204$
00148$:
	C$HeroExec.c$172$6_0$175	= .
	.globl	C$HeroExec.c$172$6_0$175
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:172: bkgX -= 4;
	ld	hl, #_bkgX
	ld	a, (hl)
	add	a, #0xfc
	ld	(hl), a
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:173: move_bkg(bkgX,bkgY);
	ld	hl, #_bkgY
	ld	c, (hl)
	ld	a, (#_bkgX)
	ldh	(_SCX_REG + 0), a
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1208: SCX_REG=x, SCY_REG=y;
	ld	a, c
	ldh	(_SCY_REG + 0), a
	C$HeroExec.c$174$6_0$175	= .
	.globl	C$HeroExec.c$174$6_0$175
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:174: EyePosAdjust(4,0);
	ld	e, #0x00
	ld	a, #0x04
	call	_EyePosAdjust
	jp	00204$
00200$:
	C$HeroExec.c$179$2_0$155	= .
	.globl	C$HeroExec.c$179$2_0$155
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:179: else if(heroAction == MOVEUP){
	ld	a, (#_heroAction)
	dec	a
	jp	NZ,00197$
	C$HeroExec.c$180$3_0$176	= .
	.globl	C$HeroExec.c$180$3_0$176
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:180: if(actionCnt == 0){
	ld	a, (#_actionCnt)
	or	a, a
	jr	NZ, 00162$
	C$HeroExec.c$181$4_0$177	= .
	.globl	C$HeroExec.c$181$4_0$177
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:181: set_sprite_data(4,4,HeroUpTile);
	ld	de, #_HeroUpTile
	push	de
	ld	hl, #0x404
	push	hl
	call	_set_sprite_data
	add	sp, #4
	C$HeroExec.c$182$4_0$177	= .
	.globl	C$HeroExec.c$182$4_0$177
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:182: direction = UP;
	ld	hl, #_direction
	ld	(hl), #0x00
	jr	00163$
00162$:
	C$HeroExec.c$184$3_0$176	= .
	.globl	C$HeroExec.c$184$3_0$176
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:184: else if(actionCnt == 5){
	ld	a, c
	or	a, a
	jr	Z, 00159$
	C$HeroExec.c$185$4_0$178	= .
	.globl	C$HeroExec.c$185$4_0$178
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:185: set_sprite_data(4,4,HeroUpWalkTile);
	ld	de, #_HeroUpWalkTile
	push	de
	ld	hl, #0x404
	push	hl
	call	_set_sprite_data
	add	sp, #4
	jr	00163$
00159$:
	C$HeroExec.c$187$3_0$176	= .
	.globl	C$HeroExec.c$187$3_0$176
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:187: else if(actionCnt == 10){
	ld	a, b
	or	a, a
	jr	Z, 00163$
	C$HeroExec.c$188$4_0$179	= .
	.globl	C$HeroExec.c$188$4_0$179
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:188: set_sprite_data(4,4,HeroUpTile);
	ld	de, #_HeroUpTile
	push	de
	ld	hl, #0x404
	push	hl
	call	_set_sprite_data
	add	sp, #4
	C$HeroExec.c$189$4_0$179	= .
	.globl	C$HeroExec.c$189$4_0$179
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:189: heroAction = NOACTION;
	ld	hl, #_heroAction
	ld	(hl), #0x00
00163$:
	C$HeroExec.c$191$3_0$176	= .
	.globl	C$HeroExec.c$191$3_0$176
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:191: if(actionCnt == 5 || actionCnt == 10){
	ld	a, (#_actionCnt)
	sub	a, #0x05
	jr	Z, 00172$
	ld	a, (#_actionCnt)
	sub	a, #0x0a
	jp	NZ,00204$
00172$:
	C$HeroExec.c$127$1_0$146	= .
	.globl	C$HeroExec.c$127$1_0$146
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:127: move_sprite(2,spriteX,spriteY);
	ld	hl, #_spriteX
	ld	c, (hl)
	C$HeroExec.c$194$1_0$146	= .
	.globl	C$HeroExec.c$194$1_0$146
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:194: spriteY -= 4;
	ld	a, (#_spriteY)
	add	a, #0xfc
	ld	e, a
	C$HeroExec.c$192$4_0$180	= .
	.globl	C$HeroExec.c$192$4_0$180
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:192: if(bkgY == 0){
	ld	a, (#_bkgY)
	or	a, a
	jr	NZ, 00170$
	C$HeroExec.c$193$5_0$181	= .
	.globl	C$HeroExec.c$193$5_0$181
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:193: if(spriteY != 40){
	ld	a, (#_spriteY)
	sub	a, #0x28
	jp	Z,00204$
	C$HeroExec.c$194$6_0$182	= .
	.globl	C$HeroExec.c$194$6_0$182
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:194: spriteY -= 4;
	ld	hl, #_spriteY
	ld	(hl), e
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:195: move_sprite(2,spriteX,spriteY);
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, (hl)
	ld	hl, #(_shadow_OAM + 8)
	ld	(hl+), a
	ld	(hl), c
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:196: move_sprite(3,spriteX+8,spriteY);
	ld	hl, #_spriteY
	ld	e, (hl)
	ld	a, (#_spriteX)
	add	a, #0x08
	ld	c, a
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 12)
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, e
	ld	(hl+), a
	ld	(hl), c
	C$HeroExec.c$196$4_0$180	= .
	.globl	C$HeroExec.c$196$4_0$180
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:196: move_sprite(3,spriteX+8,spriteY);
	jp	00204$
00170$:
	C$HeroExec.c$200$5_0$183	= .
	.globl	C$HeroExec.c$200$5_0$183
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:200: if(spriteY != 72){
	ld	a, (#_spriteY)
	sub	a, #0x48
	jr	Z, 00167$
	C$HeroExec.c$201$6_0$184	= .
	.globl	C$HeroExec.c$201$6_0$184
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:201: spriteY -= 4;
	ld	hl, #_spriteY
	ld	(hl), e
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:202: move_sprite(2,spriteX,spriteY);
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, (hl)
	ld	hl, #(_shadow_OAM + 8)
	ld	(hl+), a
	ld	(hl), c
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:203: move_sprite(3,spriteX+8,spriteY);
	ld	hl, #_spriteY
	ld	b, (hl)
	ld	a, (#_spriteX)
	add	a, #0x08
	ld	c, a
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 12)
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
	C$HeroExec.c$203$5_0$183	= .
	.globl	C$HeroExec.c$203$5_0$183
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:203: move_sprite(3,spriteX+8,spriteY);
	jp	00204$
00167$:
	C$HeroExec.c$206$6_0$185	= .
	.globl	C$HeroExec.c$206$6_0$185
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:206: bkgY -= 4;
	ld	hl, #_bkgY
	ld	a, (hl)
	add	a, #0xfc
	ld	(hl), a
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:207: move_bkg(bkgX,bkgY);
	ld	c, (hl)
	ld	a, (#_bkgX)
	ldh	(_SCX_REG + 0), a
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1208: SCX_REG=x, SCY_REG=y;
	ld	a, c
	ldh	(_SCY_REG + 0), a
	C$HeroExec.c$208$6_0$185	= .
	.globl	C$HeroExec.c$208$6_0$185
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:208: EyePosAdjust(0,4);
	ld	e, #0x04
	xor	a, a
	call	_EyePosAdjust
	jp	00204$
00197$:
	C$HeroExec.c$213$2_0$155	= .
	.globl	C$HeroExec.c$213$2_0$155
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:213: else if(heroAction == MOVEDOWN){
	ld	a, (#_heroAction)
	sub	a, #0x03
	jp	NZ,00204$
	C$HeroExec.c$214$3_0$186	= .
	.globl	C$HeroExec.c$214$3_0$186
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:214: if(actionCnt == 0){
	ld	a, (#_actionCnt)
	or	a, a
	jr	NZ, 00181$
	C$HeroExec.c$215$4_0$187	= .
	.globl	C$HeroExec.c$215$4_0$187
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:215: set_sprite_data(4,4,HeroDownTile);
	ld	de, #_HeroDownTile
	push	de
	ld	hl, #0x404
	push	hl
	call	_set_sprite_data
	add	sp, #4
	C$HeroExec.c$216$4_0$187	= .
	.globl	C$HeroExec.c$216$4_0$187
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:216: direction = DOWN;
	ld	hl, #_direction
	ld	(hl), #0x02
	jr	00182$
00181$:
	C$HeroExec.c$218$3_0$186	= .
	.globl	C$HeroExec.c$218$3_0$186
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:218: else if(actionCnt == 5){
	ld	a, c
	or	a, a
	jr	Z, 00178$
	C$HeroExec.c$219$4_0$188	= .
	.globl	C$HeroExec.c$219$4_0$188
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:219: set_sprite_data(4,4,HeroDownWalkTile);
	ld	de, #_HeroDownWalkTile
	push	de
	ld	hl, #0x404
	push	hl
	call	_set_sprite_data
	add	sp, #4
	jr	00182$
00178$:
	C$HeroExec.c$221$3_0$186	= .
	.globl	C$HeroExec.c$221$3_0$186
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:221: else if(actionCnt == 10){
	ld	a, b
	or	a, a
	jr	Z, 00182$
	C$HeroExec.c$222$4_0$189	= .
	.globl	C$HeroExec.c$222$4_0$189
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:222: set_sprite_data(4,4,HeroDownTile);
	ld	de, #_HeroDownTile
	push	de
	ld	hl, #0x404
	push	hl
	call	_set_sprite_data
	add	sp, #4
	C$HeroExec.c$223$4_0$189	= .
	.globl	C$HeroExec.c$223$4_0$189
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:223: heroAction = NOACTION;
	ld	hl, #_heroAction
	ld	(hl), #0x00
00182$:
	C$HeroExec.c$225$3_0$186	= .
	.globl	C$HeroExec.c$225$3_0$186
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:225: if(actionCnt == 5 || actionCnt == 10){
	ld	a, (#_actionCnt)
	sub	a, #0x05
	jr	Z, 00191$
	ld	a, (#_actionCnt)
	sub	a, #0x0a
	jr	NZ, 00204$
00191$:
	C$HeroExec.c$127$1_0$146	= .
	.globl	C$HeroExec.c$127$1_0$146
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:127: move_sprite(2,spriteX,spriteY);
	ld	hl, #_spriteX
	ld	c, (hl)
	C$HeroExec.c$194$1_0$146	= .
	.globl	C$HeroExec.c$194$1_0$146
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:194: spriteY -= 4;
	ld	a, (#_spriteY)
	C$HeroExec.c$228$1_0$146	= .
	.globl	C$HeroExec.c$228$1_0$146
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:228: spriteY += 4;
	add	a, #0x04
	ld	e, a
	C$HeroExec.c$226$4_0$190	= .
	.globl	C$HeroExec.c$226$4_0$190
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:226: if(bkgY == 112){
	ld	a, (#_bkgY)
	sub	a, #0x70
	jr	NZ, 00189$
	C$HeroExec.c$227$5_0$191	= .
	.globl	C$HeroExec.c$227$5_0$191
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:227: if(spriteY != 112){
	ld	a, (#_spriteY)
	sub	a, #0x70
	jr	Z, 00204$
	C$HeroExec.c$228$6_0$192	= .
	.globl	C$HeroExec.c$228$6_0$192
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:228: spriteY += 4;
	ld	hl, #_spriteY
	ld	(hl), e
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:229: move_sprite(2,spriteX,spriteY);
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, (hl)
	ld	hl, #(_shadow_OAM + 8)
	ld	(hl+), a
	ld	(hl), c
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:230: move_sprite(3,spriteX+8,spriteY);
	ld	hl, #_spriteY
	ld	e, (hl)
	ld	a, (#_spriteX)
	add	a, #0x08
	ld	c, a
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 12)
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, e
	ld	(hl+), a
	ld	(hl), c
	C$HeroExec.c$230$4_0$190	= .
	.globl	C$HeroExec.c$230$4_0$190
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:230: move_sprite(3,spriteX+8,spriteY);
	jr	00204$
00189$:
	C$HeroExec.c$234$5_0$193	= .
	.globl	C$HeroExec.c$234$5_0$193
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:234: if(spriteY != 72){
	ld	a, (#_spriteY)
	sub	a, #0x48
	jr	Z, 00186$
	C$HeroExec.c$235$6_0$194	= .
	.globl	C$HeroExec.c$235$6_0$194
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:235: spriteY += 4;
	ld	hl, #_spriteY
	ld	(hl), e
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:236: move_sprite(2,spriteX,spriteY);
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, (hl)
	ld	hl, #(_shadow_OAM + 8)
	ld	(hl+), a
	ld	(hl), c
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:237: move_sprite(3,spriteX+8,spriteY);
	ld	hl, #_spriteY
	ld	b, (hl)
	ld	a, (#_spriteX)
	add	a, #0x08
	ld	c, a
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 12)
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
	C$HeroExec.c$237$5_0$193	= .
	.globl	C$HeroExec.c$237$5_0$193
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:237: move_sprite(3,spriteX+8,spriteY);
	jr	00204$
00186$:
	C$HeroExec.c$240$6_0$195	= .
	.globl	C$HeroExec.c$240$6_0$195
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:240: bkgY += 4;
	ld	hl, #_bkgY
	ld	a, (hl)
	add	a, #0x04
	ld	(hl), a
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:241: move_bkg(bkgX,bkgY);
	ld	c, (hl)
	ld	a, (#_bkgX)
	ldh	(_SCX_REG + 0), a
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1208: SCX_REG=x, SCY_REG=y;
	ld	a, c
	ldh	(_SCY_REG + 0), a
	C$HeroExec.c$242$6_0$195	= .
	.globl	C$HeroExec.c$242$6_0$195
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:242: EyePosAdjust(0,-4);
	ld	e, #0xfc
	xor	a, a
	call	_EyePosAdjust
00204$:
	C$HeroExec.c$247$2_0$155	= .
	.globl	C$HeroExec.c$247$2_0$155
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:247: actionCnt++;
	ld	hl, #_actionCnt
	inc	(hl)
00206$:
	C$HeroExec.c$249$1_0$146	= .
	.globl	C$HeroExec.c$249$1_0$146
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:249: if(swordAction == SWORD){
	ld	a, (#_swordAction)
	dec	a
	jp	NZ,00328$
	C$HeroExec.c$116$1_0$146	= .
	.globl	C$HeroExec.c$116$1_0$146
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:116: else if(actionCnt == 5){
	ld	a, (#_actionCnt)
	sub	a, #0x05
	ld	a, #0x01
	jr	Z, 00894$
	xor	a, a
00894$:
	ldhl	sp,	#0
	ld	(hl), a
	C$HeroExec.c$261$1_0$146	= .
	.globl	C$HeroExec.c$261$1_0$146
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:261: else if(actionCnt == 6){
	ld	a, (#_actionCnt)
	sub	a, #0x06
	ld	a, #0x01
	jr	Z, 00896$
	xor	a, a
00896$:
	ldhl	sp,	#1
	ld	(hl), a
	C$HeroExec.c$266$1_0$146	= .
	.globl	C$HeroExec.c$266$1_0$146
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:266: else if(actionCnt == 11){
	ld	a, (#_actionCnt)
	sub	a, #0x0b
	ld	a, #0x01
	jr	Z, 00898$
	xor	a, a
00898$:
	ldhl	sp,	#2
	ld	(hl), a
	C$HeroExec.c$270$1_0$146	= .
	.globl	C$HeroExec.c$270$1_0$146
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:270: else if(actionCnt == 12){
	ld	a, (#_actionCnt)
	sub	a, #0x0c
	ld	a, #0x01
	jr	Z, 00900$
	xor	a, a
00900$:
	ldhl	sp,	#3
	ld	(hl), a
	C$HeroExec.c$276$1_0$146	= .
	.globl	C$HeroExec.c$276$1_0$146
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:276: else if(actionCnt == 17){
	ld	a, (#_actionCnt)
	sub	a, #0x11
	ld	a, #0x01
	jr	Z, 00902$
	xor	a, a
00902$:
	ldhl	sp,	#4
	ld	(hl), a
	C$HeroExec.c$280$1_0$146	= .
	.globl	C$HeroExec.c$280$1_0$146
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:280: else if(actionCnt == 18){
	ld	a, (#_actionCnt)
	sub	a, #0x12
	ld	a, #0x01
	jr	Z, 00904$
	xor	a, a
00904$:
	ldhl	sp,	#5
	ld	(hl), a
	C$HeroExec.c$285$1_0$146	= .
	.globl	C$HeroExec.c$285$1_0$146
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:285: else if(actionCnt == 24){
	ld	a, (#_actionCnt)
	sub	a, #0x18
	ld	a, #0x01
	jr	Z, 00906$
	xor	a, a
00906$:
	ldhl	sp,	#6
	ld	(hl), a
	C$HeroExec.c$250$2_0$196	= .
	.globl	C$HeroExec.c$250$2_0$196
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:250: if(direction == UP){
	ld	a, (#_direction)
	or	a, a
	jp	NZ, 00325$
	C$HeroExec.c$251$3_0$197	= .
	.globl	C$HeroExec.c$251$3_0$197
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:251: if(actionCnt == 0){
	ld	a, (#_actionCnt)
	or	a, a
	jr	NZ, 00229$
	C$HeroExec.c$252$4_0$198	= .
	.globl	C$HeroExec.c$252$4_0$198
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:252: set_sprite_data(0,4,SwordRightDownTile);
	ld	de, #_SwordRightDownTile
	push	de
	ld	hl, #0x400
	push	hl
	call	_set_sprite_data
	add	sp, #4
	C$HeroExec.c$253$4_0$198	= .
	.globl	C$HeroExec.c$253$4_0$198
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:253: set_sprite_data(4,4,HeroUpAttack1Tile);
	ld	de, #_HeroUpAttack1Tile
	push	de
	ld	hl, #0x404
	push	hl
	call	_set_sprite_data
	add	sp, #4
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:254: move_sprite(0,spriteX+16,spriteY+8);
	ld	a, (#_spriteY)
	add	a, #0x08
	ldhl	sp,	#5
	ld	(hl), a
	ld	a, (#_spriteX)
	ldhl	sp,	#6
	ld	(hl), a
	ld	a, (hl)
	add	a, #0x10
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	(hl-), a
	ld	bc, #_shadow_OAM
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:255: move_sprite(1,spriteX+24,spriteY+8);
	ld	a, (#_spriteY)
	add	a, #0x08
	ldhl	sp,	#5
	ld	(hl), a
	ld	a, (#_spriteX)
	ldhl	sp,	#6
	ld	(hl), a
	ld	a, (hl)
	add	a, #0x18
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	(hl-), a
	ld	bc, #(_shadow_OAM + 4)
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
	C$HeroExec.c$255$3_0$197	= .
	.globl	C$HeroExec.c$255$3_0$197
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:255: move_sprite(1,spriteX+24,spriteY+8);
	jp	00230$
00229$:
	C$HeroExec.c$257$3_0$197	= .
	.globl	C$HeroExec.c$257$3_0$197
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:257: else if(actionCnt == 5){
	ldhl	sp,	#0
	ld	a, (hl)
	or	a, a
	jr	Z, 00226$
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	hl, #_shadow_OAM
	ld	(hl), #0xff
	ld	hl, #(_shadow_OAM + 1)
	ld	(hl), #0xff
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	hl, #(_shadow_OAM + 4)
	ld	(hl), #0xff
	ld	hl, #(_shadow_OAM + 5)
	ld	(hl), #0xff
	C$HeroExec.c$259$3_0$197	= .
	.globl	C$HeroExec.c$259$3_0$197
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:259: move_sprite(1,255,255);
	jp	00230$
00226$:
	C$HeroExec.c$261$3_0$197	= .
	.globl	C$HeroExec.c$261$3_0$197
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:261: else if(actionCnt == 6){
	ldhl	sp,	#1
	ld	a, (hl)
	or	a, a
	jr	Z, 00223$
	C$HeroExec.c$262$4_0$200	= .
	.globl	C$HeroExec.c$262$4_0$200
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:262: set_sprite_data(0,4,SwordRightTile);
	ld	de, #_SwordRightTile
	push	de
	ld	hl, #0x400
	push	hl
	call	_set_sprite_data
	add	sp, #4
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:263: move_sprite(0,spriteX+16,spriteY);
	ld	a, (#_spriteY)
	ldhl	sp,	#5
	ld	(hl), a
	ld	a, (#_spriteX)
	ldhl	sp,	#6
	ld	(hl), a
	ld	a, (hl)
	add	a, #0x10
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	(hl-), a
	ld	bc, #_shadow_OAM
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:264: move_sprite(1,spriteX+24,spriteY);
	ld	a, (#_spriteY)
	ldhl	sp,	#5
	ld	(hl), a
	ld	a, (#_spriteX)
	ldhl	sp,	#6
	ld	(hl), a
	ld	a, (hl)
	add	a, #0x18
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	(hl-), a
	ld	bc, #(_shadow_OAM + 4)
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
	C$HeroExec.c$264$3_0$197	= .
	.globl	C$HeroExec.c$264$3_0$197
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:264: move_sprite(1,spriteX+24,spriteY);
	jp	00230$
00223$:
	C$HeroExec.c$266$3_0$197	= .
	.globl	C$HeroExec.c$266$3_0$197
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:266: else if(actionCnt == 11){
	ldhl	sp,	#2
	ld	a, (hl)
	or	a, a
	jr	Z, 00220$
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, #0xff
	ld	(hl+), a
	ld	(hl), #0xff
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 4)
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, #0xff
	ld	(hl+), a
	ld	(hl), #0xff
	C$HeroExec.c$268$3_0$197	= .
	.globl	C$HeroExec.c$268$3_0$197
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:268: move_sprite(1,255,255);
	jp	00230$
00220$:
	C$HeroExec.c$270$3_0$197	= .
	.globl	C$HeroExec.c$270$3_0$197
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:270: else if(actionCnt == 12){
	ldhl	sp,	#3
	ld	a, (hl)
	or	a, a
	jr	Z, 00217$
	C$HeroExec.c$271$4_0$202	= .
	.globl	C$HeroExec.c$271$4_0$202
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:271: set_sprite_data(0,4,SwordRightUpTile);
	ld	de, #_SwordRightUpTile
	push	de
	ld	hl, #0x400
	push	hl
	call	_set_sprite_data
	add	sp, #4
	C$HeroExec.c$272$4_0$202	= .
	.globl	C$HeroExec.c$272$4_0$202
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:272: set_sprite_data(4,4,HeroUpAttack2Tile);
	ld	de, #_HeroUpAttack2Tile
	push	de
	ld	hl, #0x404
	push	hl
	call	_set_sprite_data
	add	sp, #4
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:273: move_sprite(0,spriteX+16,spriteY-12);
	ld	a, (#_spriteY)
	add	a, #0xf4
	ldhl	sp,	#5
	ld	(hl), a
	ld	a, (#_spriteX)
	ldhl	sp,	#6
	ld	(hl), a
	ld	a, (hl)
	add	a, #0x10
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	(hl-), a
	ld	bc, #_shadow_OAM
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:274: move_sprite(1,spriteX+24,spriteY-12);
	ld	a, (#_spriteY)
	add	a, #0xf4
	ldhl	sp,	#5
	ld	(hl), a
	ld	a, (#_spriteX)
	ldhl	sp,	#6
	ld	(hl), a
	ld	a, (hl)
	add	a, #0x18
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	(hl-), a
	ld	bc, #(_shadow_OAM + 4)
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
	C$HeroExec.c$274$3_0$197	= .
	.globl	C$HeroExec.c$274$3_0$197
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:274: move_sprite(1,spriteX+24,spriteY-12);
	jp	00230$
00217$:
	C$HeroExec.c$276$3_0$197	= .
	.globl	C$HeroExec.c$276$3_0$197
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:276: else if(actionCnt == 17){
	ldhl	sp,	#4
	ld	a, (hl)
	or	a, a
	jr	Z, 00214$
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, #0xff
	ld	(hl+), a
	ld	(hl), #0xff
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 4)
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, #0xff
	ld	(hl+), a
	ld	(hl), #0xff
	C$HeroExec.c$278$3_0$197	= .
	.globl	C$HeroExec.c$278$3_0$197
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:278: move_sprite(1,255,255);
	jr	00230$
00214$:
	C$HeroExec.c$280$3_0$197	= .
	.globl	C$HeroExec.c$280$3_0$197
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:280: else if(actionCnt == 18){
	ldhl	sp,	#5
	ld	a, (hl)
	or	a, a
	jr	Z, 00211$
	C$HeroExec.c$281$4_0$204	= .
	.globl	C$HeroExec.c$281$4_0$204
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:281: set_sprite_data(0,4,SwordUpTile);
	ld	de, #_SwordUpTile
	push	de
	ld	hl, #0x400
	push	hl
	call	_set_sprite_data
	add	sp, #4
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:282: move_sprite(0,spriteX+2,spriteY-16);
	ld	a, (#_spriteY)
	add	a, #0xf0
	ldhl	sp,	#5
	ld	(hl), a
	ld	a, (#_spriteX)
	ldhl	sp,	#6
	ld	(hl), a
	inc	(hl)
	inc	(hl)
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	dec	hl
	ld	bc, #_shadow_OAM
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:283: move_sprite(1,spriteX+10,spriteY-16);
	ld	a, (#_spriteY)
	add	a, #0xf0
	ldhl	sp,	#5
	ld	(hl), a
	ld	a, (#_spriteX)
	ldhl	sp,	#6
	ld	(hl), a
	ld	a, (hl)
	add	a, #0x0a
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	(hl-), a
	ld	bc, #(_shadow_OAM + 4)
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
	C$HeroExec.c$283$3_0$197	= .
	.globl	C$HeroExec.c$283$3_0$197
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:283: move_sprite(1,spriteX+10,spriteY-16);
	jr	00230$
00211$:
	C$HeroExec.c$285$3_0$197	= .
	.globl	C$HeroExec.c$285$3_0$197
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:285: else if(actionCnt == 24){
	ldhl	sp,	#6
	ld	a, (hl)
	or	a, a
	jr	Z, 00230$
	C$HeroExec.c$286$4_0$205	= .
	.globl	C$HeroExec.c$286$4_0$205
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:286: set_sprite_data(4,4,HeroUpTile);
	ld	de, #_HeroUpTile
	push	de
	ld	hl, #0x404
	push	hl
	call	_set_sprite_data
	add	sp, #4
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, #0xff
	ld	(hl+), a
	ld	(hl), #0xff
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 4)
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, #0xff
	ld	(hl+), a
	ld	(hl), #0xff
	C$HeroExec.c$289$4_0$205	= .
	.globl	C$HeroExec.c$289$4_0$205
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:289: swordAction = NOACTION;
	ld	hl, #_swordAction
	ld	(hl), #0x00
00230$:
	C$HeroExec.c$126$1_0$146	= .
	.globl	C$HeroExec.c$126$1_0$146
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:126: spriteX += 4;
	ld	a, (#_spriteX)
	ldhl	sp,	#4
	ld	(hl), a
	C$HeroExec.c$194$1_0$146	= .
	.globl	C$HeroExec.c$194$1_0$146
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:194: spriteY -= 4;
	ld	a, (#_spriteY)
	ldhl	sp,	#6
	ld	(hl), a
	C$HeroExec.c$291$1_0$146	= .
	.globl	C$HeroExec.c$291$1_0$146
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:291: if(actionCnt >= 6 && actionCnt < 12){
	ld	a, (#_actionCnt)
	sub	a, #0x0c
	ld	a, #0x00
	rla
	ldhl	sp,	#3
	C$HeroExec.c$292$1_0$146	= .
	.globl	C$HeroExec.c$292$1_0$146
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:292: HitCheck(spriteX+16,spriteY,spriteX+32,spriteY+16);
	ld	(hl+), a
	ld	a, (hl+)
	add	a, #0x20
	ld	(hl), a
	C$HeroExec.c$291$3_0$197	= .
	.globl	C$HeroExec.c$291$3_0$197
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:291: if(actionCnt >= 6 && actionCnt < 12){
	ld	a, (#_actionCnt)
	sub	a, #0x06
	jr	C, 00234$
	ldhl	sp,	#3
	ld	a, (hl)
	or	a, a
	jr	Z, 00234$
	C$HeroExec.c$292$4_0$206	= .
	.globl	C$HeroExec.c$292$4_0$206
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:292: HitCheck(spriteX+16,spriteY,spriteX+32,spriteY+16);
	ldhl	sp,	#6
	ld	a, (hl)
	add	a, #0x10
	ld	(hl-), a
	dec	hl
	ld	a, (hl+)
	inc	hl
	add	a, #0x10
	ld	c, a
	ld	a, (hl-)
	ld	d, a
	ld	e, (hl)
	push	de
	ld	hl, #_spriteY
	ld	e, (hl)
	ld	a, c
	call	_HitCheck
	jp	00326$
00234$:
	C$HeroExec.c$294$3_0$197	= .
	.globl	C$HeroExec.c$294$3_0$197
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:294: else if(actionCnt >= 12){
	ldhl	sp,	#3
	bit	0, (hl)
	jp	NZ, 00326$
	C$HeroExec.c$295$4_0$207	= .
	.globl	C$HeroExec.c$295$4_0$207
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:295: HitCheck(spriteX,spriteY-16,spriteX+32,spriteY);
	ldhl	sp,	#6
	ld	a, (hl)
	add	a, #0xf0
	ld	e, a
	ld	a, (#_spriteY)
	push	af
	inc	sp
	ldhl	sp,	#6
	ld	a, (hl)
	push	af
	inc	sp
	ld	a, (#_spriteX)
	call	_HitCheck
	jp	00326$
00325$:
	C$HeroExec.c$298$2_0$196	= .
	.globl	C$HeroExec.c$298$2_0$196
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:298: else if(direction == RIGHT){
	ld	a, (#_direction)
	dec	a
	jp	NZ,00322$
	C$HeroExec.c$299$3_0$208	= .
	.globl	C$HeroExec.c$299$3_0$208
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:299: if(actionCnt == 0){
	ld	a, (#_actionCnt)
	or	a, a
	jr	NZ, 00258$
	C$HeroExec.c$300$4_0$209	= .
	.globl	C$HeroExec.c$300$4_0$209
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:300: set_sprite_data(0,4,SwordLeftUpTile);
	ld	de, #_SwordLeftUpTile
	push	de
	ld	hl, #0x400
	push	hl
	call	_set_sprite_data
	add	sp, #4
	C$HeroExec.c$301$4_0$209	= .
	.globl	C$HeroExec.c$301$4_0$209
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:301: set_sprite_data(4,4,HeroRightAttack1Tile);
	ld	de, #_HeroRightAttack1Tile
	push	de
	ld	hl, #0x404
	push	hl
	call	_set_sprite_data
	add	sp, #4
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:302: move_sprite(0,spriteX-14,spriteY-10);
	ld	a, (#_spriteY)
	add	a, #0xf6
	ldhl	sp,	#5
	ld	(hl), a
	ld	a, (#_spriteX)
	ldhl	sp,	#6
	ld	(hl), a
	ld	a, (hl)
	add	a, #0xf2
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	(hl-), a
	ld	bc, #_shadow_OAM
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:303: move_sprite(1,spriteX-6,spriteY-10);
	ld	a, (#_spriteY)
	add	a, #0xf6
	ldhl	sp,	#5
	ld	(hl), a
	ld	a, (#_spriteX)
	ldhl	sp,	#6
	ld	(hl), a
	ld	a, (hl)
	add	a, #0xfa
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	(hl-), a
	ld	bc, #(_shadow_OAM + 4)
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
	C$HeroExec.c$303$3_0$208	= .
	.globl	C$HeroExec.c$303$3_0$208
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:303: move_sprite(1,spriteX-6,spriteY-10);
	jp	00259$
00258$:
	C$HeroExec.c$305$3_0$208	= .
	.globl	C$HeroExec.c$305$3_0$208
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:305: else if(actionCnt == 5){
	ldhl	sp,	#0
	ld	a, (hl)
	or	a, a
	jr	Z, 00255$
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, #0xff
	ld	(hl+), a
	ld	(hl), #0xff
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 4)
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, #0xff
	ld	(hl+), a
	ld	(hl), #0xff
	C$HeroExec.c$307$3_0$208	= .
	.globl	C$HeroExec.c$307$3_0$208
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:307: move_sprite(1,255,255);
	jp	00259$
00255$:
	C$HeroExec.c$309$3_0$208	= .
	.globl	C$HeroExec.c$309$3_0$208
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:309: else if(actionCnt == 6){
	ldhl	sp,	#1
	ld	a, (hl)
	or	a, a
	jr	Z, 00252$
	C$HeroExec.c$310$4_0$211	= .
	.globl	C$HeroExec.c$310$4_0$211
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:310: set_sprite_data(0,4,SwordUpTile);
	ld	de, #_SwordUpTile
	push	de
	ld	hl, #0x400
	push	hl
	call	_set_sprite_data
	add	sp, #4
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:311: move_sprite(0,spriteX-4,spriteY-10);
	ld	a, (#_spriteY)
	add	a, #0xf6
	ldhl	sp,	#5
	ld	(hl), a
	ld	a, (#_spriteX)
	ldhl	sp,	#6
	ld	(hl), a
	ld	a, (hl)
	add	a, #0xfc
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	(hl-), a
	ld	bc, #_shadow_OAM
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:312: move_sprite(1,spriteX+4,spriteY-10);
	ld	a, (#_spriteY)
	add	a, #0xf6
	ldhl	sp,	#5
	ld	(hl), a
	ld	a, (#_spriteX)
	ldhl	sp,	#6
	ld	(hl), a
	inc	(hl)
	inc	(hl)
	inc	(hl)
	inc	(hl)
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	dec	hl
	ld	de, #(_shadow_OAM + 4)
	ld	a, (hl+)
	ld	(de), a
	ld	de, #(_shadow_OAM + 5)
	ld	a, (hl)
	ld	(de), a
	C$HeroExec.c$312$3_0$208	= .
	.globl	C$HeroExec.c$312$3_0$208
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:312: move_sprite(1,spriteX+4,spriteY-10);
	jp	00259$
00252$:
	C$HeroExec.c$314$3_0$208	= .
	.globl	C$HeroExec.c$314$3_0$208
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:314: else if(actionCnt == 11){
	ldhl	sp,	#2
	ld	a, (hl)
	or	a, a
	jr	Z, 00249$
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, #0xff
	ld	(hl+), a
	ld	(hl), #0xff
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 4)
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, #0xff
	ld	(hl+), a
	ld	(hl), #0xff
	C$HeroExec.c$316$3_0$208	= .
	.globl	C$HeroExec.c$316$3_0$208
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:316: move_sprite(1,255,255);
	jp	00259$
00249$:
	C$HeroExec.c$318$3_0$208	= .
	.globl	C$HeroExec.c$318$3_0$208
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:318: else if(actionCnt == 12){
	ldhl	sp,	#3
	ld	a, (hl)
	or	a, a
	jr	Z, 00246$
	C$HeroExec.c$319$4_0$213	= .
	.globl	C$HeroExec.c$319$4_0$213
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:319: set_sprite_data(0,4,SwordRightUpTile);
	ld	de, #_SwordRightUpTile
	push	de
	ld	hl, #0x400
	push	hl
	call	_set_sprite_data
	add	sp, #4
	C$HeroExec.c$320$4_0$213	= .
	.globl	C$HeroExec.c$320$4_0$213
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:320: set_sprite_data(4,4,HeroRightAttack2Tile);
	ld	de, #_HeroRightAttack2Tile
	push	de
	ld	hl, #0x404
	push	hl
	call	_set_sprite_data
	add	sp, #4
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:321: move_sprite(0,spriteX+12,spriteY-4);
	ld	a, (#_spriteY)
	add	a, #0xfc
	ldhl	sp,	#5
	ld	(hl), a
	ld	a, (#_spriteX)
	ldhl	sp,	#6
	ld	(hl), a
	ld	a, (hl)
	add	a, #0x0c
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	(hl-), a
	ld	bc, #_shadow_OAM
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:322: move_sprite(1,spriteX+20,spriteY-4);
	ld	a, (#_spriteY)
	add	a, #0xfc
	ldhl	sp,	#5
	ld	(hl), a
	ld	a, (#_spriteX)
	ldhl	sp,	#6
	ld	(hl), a
	ld	a, (hl)
	add	a, #0x14
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	(hl-), a
	ld	bc, #(_shadow_OAM + 4)
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
	C$HeroExec.c$322$3_0$208	= .
	.globl	C$HeroExec.c$322$3_0$208
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:322: move_sprite(1,spriteX+20,spriteY-4);
	jp	00259$
00246$:
	C$HeroExec.c$324$3_0$208	= .
	.globl	C$HeroExec.c$324$3_0$208
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:324: else if(actionCnt == 17){
	ldhl	sp,	#4
	ld	a, (hl)
	or	a, a
	jr	Z, 00243$
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, #0xff
	ld	(hl+), a
	ld	(hl), #0xff
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 4)
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, #0xff
	ld	(hl+), a
	ld	(hl), #0xff
	C$HeroExec.c$326$3_0$208	= .
	.globl	C$HeroExec.c$326$3_0$208
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:326: move_sprite(1,255,255);
	jr	00259$
00243$:
	C$HeroExec.c$328$3_0$208	= .
	.globl	C$HeroExec.c$328$3_0$208
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:328: else if(actionCnt == 18){
	ldhl	sp,	#5
	ld	a, (hl)
	or	a, a
	jr	Z, 00240$
	C$HeroExec.c$329$4_0$215	= .
	.globl	C$HeroExec.c$329$4_0$215
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:329: set_sprite_data(0,4,SwordRightTile);
	ld	de, #_SwordRightTile
	push	de
	ld	hl, #0x400
	push	hl
	call	_set_sprite_data
	add	sp, #4
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:330: move_sprite(0,spriteX+12,spriteY+3);
	ld	a, (#_spriteY)
	add	a, #0x03
	ldhl	sp,	#5
	ld	(hl), a
	ld	a, (#_spriteX)
	ldhl	sp,	#6
	ld	(hl), a
	ld	a, (hl)
	add	a, #0x0c
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	(hl-), a
	ld	bc, #_shadow_OAM
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:331: move_sprite(1,spriteX+20,spriteY+3);
	ld	a, (#_spriteY)
	add	a, #0x03
	ldhl	sp,	#5
	ld	(hl), a
	ld	a, (#_spriteX)
	ldhl	sp,	#6
	ld	(hl), a
	ld	a, (hl)
	add	a, #0x14
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	(hl-), a
	ld	bc, #(_shadow_OAM + 4)
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
	C$HeroExec.c$331$3_0$208	= .
	.globl	C$HeroExec.c$331$3_0$208
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:331: move_sprite(1,spriteX+20,spriteY+3);
	jr	00259$
00240$:
	C$HeroExec.c$333$3_0$208	= .
	.globl	C$HeroExec.c$333$3_0$208
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:333: else if(actionCnt == 24){
	ldhl	sp,	#6
	ld	a, (hl)
	or	a, a
	jr	Z, 00259$
	C$HeroExec.c$334$4_0$216	= .
	.globl	C$HeroExec.c$334$4_0$216
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:334: set_sprite_data(4,4,HeroRightTile);
	ld	de, #_HeroRightTile
	push	de
	ld	hl, #0x404
	push	hl
	call	_set_sprite_data
	add	sp, #4
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, #0xff
	ld	(hl+), a
	ld	(hl), #0xff
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 4)
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, #0xff
	ld	(hl+), a
	ld	(hl), #0xff
	C$HeroExec.c$337$4_0$216	= .
	.globl	C$HeroExec.c$337$4_0$216
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:337: swordAction = NOACTION;
	ld	hl, #_swordAction
	ld	(hl), #0x00
00259$:
	C$HeroExec.c$339$3_0$208	= .
	.globl	C$HeroExec.c$339$3_0$208
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:339: if(actionCnt >= 12){
	ld	a, (#_actionCnt)
	sub	a, #0x0c
	jp	C, 00326$
	C$HeroExec.c$340$4_0$217	= .
	.globl	C$HeroExec.c$340$4_0$217
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:340: HitCheck(spriteX+16,spriteY-8,spriteX+32,spriteY+24);
	ld	hl, #_spriteY
	ld	e, (hl)
	ld	a, e
	add	a, #0x18
	ld	b, a
	ld	hl, #_spriteX
	ld	c, (hl)
	ld	a, c
	add	a, #0x20
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, e
	add	a, #0xf8
	ld	e, a
	ld	a, c
	add	a, #0x10
	ld	c, a
	push	bc
	ld	a, l
	inc	sp
	push	af
	inc	sp
	ld	a, c
	call	_HitCheck
	jp	00326$
00322$:
	C$HeroExec.c$343$2_0$196	= .
	.globl	C$HeroExec.c$343$2_0$196
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:343: else if(direction == DOWN){
	ld	a, (#_direction)
	sub	a, #0x02
	jp	NZ,00319$
	C$HeroExec.c$344$3_0$218	= .
	.globl	C$HeroExec.c$344$3_0$218
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:344: if(actionCnt == 0){
	ld	a, (#_actionCnt)
	or	a, a
	jr	NZ, 00283$
	C$HeroExec.c$345$4_0$219	= .
	.globl	C$HeroExec.c$345$4_0$219
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:345: set_sprite_data(0,4,SwordLeftUpTile);
	ld	de, #_SwordLeftUpTile
	push	de
	ld	hl, #0x400
	push	hl
	call	_set_sprite_data
	add	sp, #4
	C$HeroExec.c$346$4_0$219	= .
	.globl	C$HeroExec.c$346$4_0$219
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:346: set_sprite_data(4,4,HeroDownAttack1Tile);
	ld	de, #_HeroDownAttack1Tile
	push	de
	ld	hl, #0x404
	push	hl
	call	_set_sprite_data
	add	sp, #4
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:347: move_sprite(0,spriteX-16,spriteY-8);
	ld	a, (#_spriteY)
	add	a, #0xf8
	ldhl	sp,	#5
	ld	(hl), a
	ld	a, (#_spriteX)
	ldhl	sp,	#6
	ld	(hl), a
	ld	a, (hl)
	add	a, #0xf0
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	(hl-), a
	ld	bc, #_shadow_OAM
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:348: move_sprite(1,spriteX-8,spriteY-8);
	ld	a, (#_spriteY)
	add	a, #0xf8
	ldhl	sp,	#5
	ld	(hl), a
	ld	a, (#_spriteX)
	ldhl	sp,	#6
	ld	(hl), a
	ld	a, (hl)
	add	a, #0xf8
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	(hl-), a
	ld	bc, #(_shadow_OAM + 4)
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
	C$HeroExec.c$348$3_0$218	= .
	.globl	C$HeroExec.c$348$3_0$218
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:348: move_sprite(1,spriteX-8,spriteY-8);
	jp	00284$
00283$:
	C$HeroExec.c$350$3_0$218	= .
	.globl	C$HeroExec.c$350$3_0$218
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:350: else if(actionCnt == 5){
	ldhl	sp,	#0
	ld	a, (hl)
	or	a, a
	jr	Z, 00280$
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, #0xff
	ld	(hl+), a
	ld	(hl), #0xff
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 4)
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, #0xff
	ld	(hl+), a
	ld	(hl), #0xff
	C$HeroExec.c$352$3_0$218	= .
	.globl	C$HeroExec.c$352$3_0$218
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:352: move_sprite(1,255,255);
	jp	00284$
00280$:
	C$HeroExec.c$354$3_0$218	= .
	.globl	C$HeroExec.c$354$3_0$218
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:354: else if(actionCnt == 6){
	ldhl	sp,	#1
	ld	a, (hl)
	or	a, a
	jr	Z, 00277$
	C$HeroExec.c$355$4_0$221	= .
	.globl	C$HeroExec.c$355$4_0$221
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:355: set_sprite_data(0,4,SwordLeftTile);
	ld	de, #_SwordLeftTile
	push	de
	ld	hl, #0x400
	push	hl
	call	_set_sprite_data
	add	sp, #4
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:356: move_sprite(0,spriteX-16,spriteY);
	ld	hl, #_spriteY
	ld	b, (hl)
	ld	a, (#_spriteX)
	add	a, #0xf0
	ld	c, a
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:357: move_sprite(1,spriteX-8,spriteY);
	ld	hl, #_spriteY
	ld	b, (hl)
	ld	a, (#_spriteX)
	add	a, #0xf8
	ld	c, a
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 4)
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
	C$HeroExec.c$357$3_0$218	= .
	.globl	C$HeroExec.c$357$3_0$218
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:357: move_sprite(1,spriteX-8,spriteY);
	jp	00284$
00277$:
	C$HeroExec.c$359$3_0$218	= .
	.globl	C$HeroExec.c$359$3_0$218
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:359: else if(actionCnt == 11){
	ldhl	sp,	#2
	ld	a, (hl)
	or	a, a
	jr	Z, 00274$
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, #0xff
	ld	(hl+), a
	ld	(hl), #0xff
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 4)
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, #0xff
	ld	(hl+), a
	ld	(hl), #0xff
	C$HeroExec.c$361$3_0$218	= .
	.globl	C$HeroExec.c$361$3_0$218
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:361: move_sprite(1,255,255);
	jp	00284$
00274$:
	C$HeroExec.c$363$3_0$218	= .
	.globl	C$HeroExec.c$363$3_0$218
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:363: else if(actionCnt == 12){
	ldhl	sp,	#3
	ld	a, (hl)
	or	a, a
	jr	Z, 00271$
	C$HeroExec.c$364$4_0$223	= .
	.globl	C$HeroExec.c$364$4_0$223
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:364: set_sprite_data(0,4,SwordLeftDownTile);
	ld	de, #_SwordLeftDownTile
	push	de
	ld	hl, #0x400
	push	hl
	call	_set_sprite_data
	add	sp, #4
	C$HeroExec.c$365$4_0$223	= .
	.globl	C$HeroExec.c$365$4_0$223
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:365: set_sprite_data(4,4,HeroDownAttack2Tile);
	ld	de, #_HeroDownAttack2Tile
	push	de
	ld	hl, #0x404
	push	hl
	call	_set_sprite_data
	add	sp, #4
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:366: move_sprite(0,spriteX-16,spriteY+12);
	ld	a, (#_spriteY)
	add	a, #0x0c
	ld	b, a
	ld	a, (#_spriteX)
	add	a, #0xf0
	ld	c, a
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:367: move_sprite(1,spriteX-8,spriteY+12);
	ld	a, (#_spriteY)
	add	a, #0x0c
	ld	b, a
	ld	a, (#_spriteX)
	add	a, #0xf8
	ld	c, a
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 4)
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
	C$HeroExec.c$367$3_0$218	= .
	.globl	C$HeroExec.c$367$3_0$218
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:367: move_sprite(1,spriteX-8,spriteY+12);
	jr	00284$
00271$:
	C$HeroExec.c$369$3_0$218	= .
	.globl	C$HeroExec.c$369$3_0$218
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:369: else if(actionCnt == 17){
	ldhl	sp,	#4
	ld	a, (hl)
	or	a, a
	jr	Z, 00268$
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, #0xff
	ld	(hl+), a
	ld	(hl), #0xff
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 4)
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, #0xff
	ld	(hl+), a
	ld	(hl), #0xff
	C$HeroExec.c$371$3_0$218	= .
	.globl	C$HeroExec.c$371$3_0$218
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:371: move_sprite(1,255,255);
	jr	00284$
00268$:
	C$HeroExec.c$373$3_0$218	= .
	.globl	C$HeroExec.c$373$3_0$218
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:373: else if(actionCnt == 18){
	ldhl	sp,	#5
	ld	a, (hl)
	or	a, a
	jr	Z, 00265$
	C$HeroExec.c$374$4_0$225	= .
	.globl	C$HeroExec.c$374$4_0$225
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:374: set_sprite_data(0,4,SwordDownTile);
	ld	de, #_SwordDownTile
	push	de
	ld	hl, #0x400
	push	hl
	call	_set_sprite_data
	add	sp, #4
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:375: move_sprite(0,spriteX-2,spriteY+16);
	ld	a, (#_spriteY)
	add	a, #0x10
	ld	b, a
	ld	hl, #_spriteX
	ld	c, (hl)
	dec	c
	dec	c
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:376: move_sprite(1,spriteX+6,spriteY+16);
	ld	a, (#_spriteY)
	add	a, #0x10
	ld	b, a
	ld	a, (#_spriteX)
	add	a, #0x06
	ld	c, a
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 4)
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
	C$HeroExec.c$376$3_0$218	= .
	.globl	C$HeroExec.c$376$3_0$218
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:376: move_sprite(1,spriteX+6,spriteY+16);
	jr	00284$
00265$:
	C$HeroExec.c$378$3_0$218	= .
	.globl	C$HeroExec.c$378$3_0$218
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:378: else if(actionCnt == 24){
	ldhl	sp,	#6
	ld	a, (hl)
	or	a, a
	jr	Z, 00284$
	C$HeroExec.c$379$4_0$226	= .
	.globl	C$HeroExec.c$379$4_0$226
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:379: set_sprite_data(4,4,HeroDownTile);
	ld	de, #_HeroDownTile
	push	de
	ld	hl, #0x404
	push	hl
	call	_set_sprite_data
	add	sp, #4
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, #0xff
	ld	(hl+), a
	ld	(hl), #0xff
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 4)
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, #0xff
	ld	(hl+), a
	ld	(hl), #0xff
	C$HeroExec.c$382$4_0$226	= .
	.globl	C$HeroExec.c$382$4_0$226
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:382: swordAction = NOACTION;
	ld	hl, #_swordAction
	ld	(hl), #0x00
00284$:
	C$HeroExec.c$126$1_0$146	= .
	.globl	C$HeroExec.c$126$1_0$146
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:126: spriteX += 4;
	ld	hl, #_spriteX
	ld	c, (hl)
	C$HeroExec.c$194$1_0$146	= .
	.globl	C$HeroExec.c$194$1_0$146
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:194: spriteY -= 4;
	ld	hl, #_spriteY
	ld	e, (hl)
	C$HeroExec.c$291$1_0$146	= .
	.globl	C$HeroExec.c$291$1_0$146
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:291: if(actionCnt >= 6 && actionCnt < 12){
	ld	a, (#_actionCnt)
	sub	a, #0x0c
	ld	a, #0x00
	rla
	ld	d, a
	C$HeroExec.c$292$1_0$146	= .
	.globl	C$HeroExec.c$292$1_0$146
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:292: HitCheck(spriteX+16,spriteY,spriteX+32,spriteY+16);
	ld	a, e
	add	a, #0x10
	ld	b, a
	C$HeroExec.c$385$1_0$146	= .
	.globl	C$HeroExec.c$385$1_0$146
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:385: HitCheck(spriteX-16,spriteY,spriteX,spriteY+16);
	ld	a, c
	add	a, #0xf0
	ldhl	sp,	#6
	ld	(hl), a
	C$HeroExec.c$384$3_0$218	= .
	.globl	C$HeroExec.c$384$3_0$218
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:384: if(actionCnt >= 6 && actionCnt < 12){
	ld	a, (#_actionCnt)
	sub	a, #0x06
	jr	C, 00288$
	ld	a, d
	or	a, a
	jr	Z, 00288$
	C$HeroExec.c$385$4_0$227	= .
	.globl	C$HeroExec.c$385$4_0$227
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:385: HitCheck(spriteX-16,spriteY,spriteX,spriteY+16);
	push	bc
	inc	sp
	ld	a, (#_spriteX)
	push	af
	inc	sp
	ld	hl, #_spriteY
	ld	e, (hl)
	ldhl	sp,	#8
	ld	a, (hl)
	call	_HitCheck
	jp	00326$
00288$:
	C$HeroExec.c$387$3_0$218	= .
	.globl	C$HeroExec.c$387$3_0$218
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:387: else if(actionCnt >= 12){
	bit	0, d
	jp	NZ, 00326$
	C$HeroExec.c$388$4_0$228	= .
	.globl	C$HeroExec.c$388$4_0$228
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:388: HitCheck(spriteX-16,spriteY+16,spriteX+8,spriteY+32);
	ld	a, e
	add	a, #0x20
	ld	d, a
	ld	a, c
	add	a, #0x08
	push	de
	inc	sp
	push	af
	inc	sp
	ld	e, b
	ldhl	sp,	#8
	ld	a, (hl)
	call	_HitCheck
	jp	00326$
00319$:
	C$HeroExec.c$391$2_0$196	= .
	.globl	C$HeroExec.c$391$2_0$196
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:391: else if(direction == LEFT){
	ld	a, (#_direction)
	sub	a, #0x03
	jp	NZ,00326$
	C$HeroExec.c$392$3_0$229	= .
	.globl	C$HeroExec.c$392$3_0$229
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:392: if(actionCnt == 0){
	ld	a, (#_actionCnt)
	or	a, a
	jr	NZ, 00312$
	C$HeroExec.c$393$4_0$230	= .
	.globl	C$HeroExec.c$393$4_0$230
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:393: set_sprite_data(0,4,SwordRightUpTile);
	ld	de, #_SwordRightUpTile
	push	de
	ld	hl, #0x400
	push	hl
	call	_set_sprite_data
	add	sp, #4
	C$HeroExec.c$394$4_0$230	= .
	.globl	C$HeroExec.c$394$4_0$230
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:394: set_sprite_data(4,4,HeroLeftAttack1Tile);
	ld	de, #_HeroLeftAttack1Tile
	push	de
	ld	hl, #0x404
	push	hl
	call	_set_sprite_data
	add	sp, #4
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:395: move_sprite(0,spriteX+14,spriteY-10);
	ld	a, (#_spriteY)
	add	a, #0xf6
	ld	b, a
	ld	a, (#_spriteX)
	add	a, #0x0e
	ld	c, a
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:396: move_sprite(1,spriteX+22,spriteY-10);
	ld	a, (#_spriteY)
	add	a, #0xf6
	ld	b, a
	ld	a, (#_spriteX)
	add	a, #0x16
	ld	c, a
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 4)
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
	C$HeroExec.c$396$3_0$229	= .
	.globl	C$HeroExec.c$396$3_0$229
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:396: move_sprite(1,spriteX+22,spriteY-10);
	jp	00313$
00312$:
	C$HeroExec.c$398$3_0$229	= .
	.globl	C$HeroExec.c$398$3_0$229
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:398: else if(actionCnt == 5){
	ldhl	sp,	#0
	ld	a, (hl)
	or	a, a
	jr	Z, 00309$
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, #0xff
	ld	(hl+), a
	ld	(hl), #0xff
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 4)
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, #0xff
	ld	(hl+), a
	ld	(hl), #0xff
	C$HeroExec.c$400$3_0$229	= .
	.globl	C$HeroExec.c$400$3_0$229
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:400: move_sprite(1,255,255);
	jp	00313$
00309$:
	C$HeroExec.c$402$3_0$229	= .
	.globl	C$HeroExec.c$402$3_0$229
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:402: else if(actionCnt == 6){
	ldhl	sp,	#1
	ld	a, (hl)
	or	a, a
	jr	Z, 00306$
	C$HeroExec.c$403$4_0$232	= .
	.globl	C$HeroExec.c$403$4_0$232
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:403: set_sprite_data(0,4,SwordUpTile);
	ld	de, #_SwordUpTile
	push	de
	ld	hl, #0x400
	push	hl
	call	_set_sprite_data
	add	sp, #4
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:404: move_sprite(0,spriteX+4,spriteY-10);
	ld	a, (#_spriteY)
	add	a, #0xf6
	ld	c, a
	ld	a, (#_spriteX)
	add	a, #0x04
	ld	b, a
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:405: move_sprite(1,spriteX+12,spriteY-10);
	ld	a, (#_spriteY)
	add	a, #0xf6
	ld	c, a
	ld	a, (#_spriteX)
	add	a, #0x0c
	ld	b, a
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 4)
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	C$HeroExec.c$405$3_0$229	= .
	.globl	C$HeroExec.c$405$3_0$229
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:405: move_sprite(1,spriteX+12,spriteY-10);
	jp	00313$
00306$:
	C$HeroExec.c$407$3_0$229	= .
	.globl	C$HeroExec.c$407$3_0$229
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:407: else if(actionCnt == 11){
	ldhl	sp,	#2
	ld	a, (hl)
	or	a, a
	jr	Z, 00303$
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, #0xff
	ld	(hl+), a
	ld	(hl), #0xff
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 4)
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, #0xff
	ld	(hl+), a
	ld	(hl), #0xff
	C$HeroExec.c$409$3_0$229	= .
	.globl	C$HeroExec.c$409$3_0$229
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:409: move_sprite(1,255,255);
	jp	00313$
00303$:
	C$HeroExec.c$411$3_0$229	= .
	.globl	C$HeroExec.c$411$3_0$229
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:411: else if(actionCnt == 12){
	ldhl	sp,	#3
	ld	a, (hl)
	or	a, a
	jr	Z, 00300$
	C$HeroExec.c$412$4_0$234	= .
	.globl	C$HeroExec.c$412$4_0$234
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:412: set_sprite_data(0,4,SwordLeftUpTile);
	ld	de, #_SwordLeftUpTile
	push	de
	ld	hl, #0x400
	push	hl
	call	_set_sprite_data
	add	sp, #4
	C$HeroExec.c$413$4_0$234	= .
	.globl	C$HeroExec.c$413$4_0$234
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:413: set_sprite_data(4,4,HeroLeftAttack2Tile);
	ld	de, #_HeroLeftAttack2Tile
	push	de
	ld	hl, #0x404
	push	hl
	call	_set_sprite_data
	add	sp, #4
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:414: move_sprite(0,spriteX-12,spriteY-4);
	ld	a, (#_spriteY)
	add	a, #0xfc
	ld	c, a
	ld	a, (#_spriteX)
	add	a, #0xf4
	ld	b, a
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:415: move_sprite(1,spriteX-4,spriteY-4);
	ld	a, (#_spriteY)
	add	a, #0xfc
	ld	c, a
	ld	a, (#_spriteX)
	add	a, #0xfc
	ld	b, a
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 4)
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	C$HeroExec.c$415$3_0$229	= .
	.globl	C$HeroExec.c$415$3_0$229
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:415: move_sprite(1,spriteX-4,spriteY-4);
	jr	00313$
00300$:
	C$HeroExec.c$417$3_0$229	= .
	.globl	C$HeroExec.c$417$3_0$229
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:417: else if(actionCnt == 17){
	ldhl	sp,	#4
	ld	a, (hl)
	or	a, a
	jr	Z, 00297$
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, #0xff
	ld	(hl+), a
	ld	(hl), #0xff
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 4)
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, #0xff
	ld	(hl+), a
	ld	(hl), #0xff
	C$HeroExec.c$419$3_0$229	= .
	.globl	C$HeroExec.c$419$3_0$229
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:419: move_sprite(1,255,255);
	jr	00313$
00297$:
	C$HeroExec.c$421$3_0$229	= .
	.globl	C$HeroExec.c$421$3_0$229
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:421: else if(actionCnt == 18){
	ldhl	sp,	#5
	ld	a, (hl)
	or	a, a
	jr	Z, 00294$
	C$HeroExec.c$422$4_0$236	= .
	.globl	C$HeroExec.c$422$4_0$236
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:422: set_sprite_data(0,4,SwordLeftTile);
	ld	de, #_SwordLeftTile
	push	de
	ld	hl, #0x400
	push	hl
	call	_set_sprite_data
	add	sp, #4
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:423: move_sprite(0,spriteX-12,spriteY+3);
	ld	a, (#_spriteY)
	add	a, #0x03
	ld	c, a
	ld	a, (#_spriteX)
	add	a, #0xf4
	ld	b, a
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:424: move_sprite(1,spriteX-4,spriteY+3);
	ld	a, (#_spriteY)
	add	a, #0x03
	ld	c, a
	ld	a, (#_spriteX)
	add	a, #0xfc
	ld	b, a
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 4)
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	C$HeroExec.c$424$3_0$229	= .
	.globl	C$HeroExec.c$424$3_0$229
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:424: move_sprite(1,spriteX-4,spriteY+3);
	jr	00313$
00294$:
	C$HeroExec.c$426$3_0$229	= .
	.globl	C$HeroExec.c$426$3_0$229
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:426: else if(actionCnt == 24){
	ldhl	sp,	#6
	ld	a, (hl)
	or	a, a
	jr	Z, 00313$
	C$HeroExec.c$427$4_0$237	= .
	.globl	C$HeroExec.c$427$4_0$237
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:427: set_sprite_data(4,4,HeroLeftTile);
	ld	de, #_HeroLeftTile
	push	de
	ld	hl, #0x404
	push	hl
	call	_set_sprite_data
	add	sp, #4
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, #0xff
	ld	(hl+), a
	ld	(hl), #0xff
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 4)
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, #0xff
	ld	(hl+), a
	ld	(hl), #0xff
	C$HeroExec.c$430$4_0$237	= .
	.globl	C$HeroExec.c$430$4_0$237
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:430: swordAction = NOACTION;
	ld	hl, #_swordAction
	ld	(hl), #0x00
00313$:
	C$HeroExec.c$432$3_0$229	= .
	.globl	C$HeroExec.c$432$3_0$229
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:432: if(actionCnt >= 12){
	ld	a, (#_actionCnt)
	sub	a, #0x0c
	jr	C, 00326$
	C$HeroExec.c$433$4_0$238	= .
	.globl	C$HeroExec.c$433$4_0$238
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:433: HitCheck(spriteX-16,spriteY-8,spriteX,spriteY+24);
	ld	hl, #_spriteY
	ld	c, (hl)
	ld	a, c
	add	a, #0x18
	ld	b, a
	ld	a, c
	add	a, #0xf8
	ld	e, a
	ld	hl, #_spriteX
	ld	a, (hl)
	add	a, #0xf0
	ld	c, a
	push	bc
	inc	sp
	ld	a, (hl)
	push	af
	inc	sp
	ld	a, c
	call	_HitCheck
00326$:
	C$HeroExec.c$436$2_0$196	= .
	.globl	C$HeroExec.c$436$2_0$196
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:436: actionCnt++;
	ld	hl, #_actionCnt
	inc	(hl)
00328$:
	C$HeroExec.c$439$1_0$146	= .
	.globl	C$HeroExec.c$439$1_0$146
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:439: joypadPrevious=joypad();
	call	_joypad
	ld	(#_joypadPrevious),a
	C$HeroExec.c$440$1_0$146	= .
	.globl	C$HeroExec.c$440$1_0$146
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:440: }
	add	sp, #7
	C$HeroExec.c$440$1_0$146	= .
	.globl	C$HeroExec.c$440$1_0$146
	XG$HeroExec$0$0	= .
	.globl	XG$HeroExec$0$0
	ret
	G$StartBlink$0$0	= .
	.globl	G$StartBlink$0$0
	C$HeroExec.c$442$1_0$491	= .
	.globl	C$HeroExec.c$442$1_0$491
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:442: void StartBlink(){
;	---------------------------------
; Function StartBlink
; ---------------------------------
_StartBlink::
	C$HeroExec.c$443$1_0$491	= .
	.globl	C$HeroExec.c$443$1_0$491
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:443: if(blinkFlag == FALSE){
	ld	hl, #_blinkFlag
	ld	a, (hl)
	or	a, a
	ret	NZ
	C$HeroExec.c$444$2_0$492	= .
	.globl	C$HeroExec.c$444$2_0$492
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:444: blinkFlag = TRUE;
	ld	(hl), #0x01
	C$HeroExec.c$445$2_0$492	= .
	.globl	C$HeroExec.c$445$2_0$492
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:445: blinkCnt = 0;
	ld	hl, #_blinkCnt
	ld	(hl), #0x00
	C$HeroExec.c$446$2_0$492	= .
	.globl	C$HeroExec.c$446$2_0$492
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:446: set_sprite_data(24,4,HeroBlinkTile);
	ld	de, #_HeroBlinkTile
	push	de
	ld	hl, #0x418
	push	hl
	call	_set_sprite_data
	add	sp, #4
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1648: shadow_OAM[nb].prop=prop;
	ld	hl, #(_shadow_OAM + 99)
	ld	(hl), #0x00
	C$HeroExec.c$447$1_0$491	= .
	.globl	C$HeroExec.c$447$1_0$491
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:447: set_sprite_prop(24,0x00);
	C$HeroExec.c$449$1_0$491	= .
	.globl	C$HeroExec.c$449$1_0$491
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:449: }
	C$HeroExec.c$449$1_0$491	= .
	.globl	C$HeroExec.c$449$1_0$491
	XG$StartBlink$0$0	= .
	.globl	XG$StartBlink$0$0
	ret
	G$BlinkExec$0$0	= .
	.globl	G$BlinkExec$0$0
	C$HeroExec.c$451$1_0$496	= .
	.globl	C$HeroExec.c$451$1_0$496
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:451: void BlinkExec(){
;	---------------------------------
; Function BlinkExec
; ---------------------------------
_BlinkExec::
	C$HeroExec.c$452$1_0$496	= .
	.globl	C$HeroExec.c$452$1_0$496
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:452: if(blinkFlag == TRUE){
	ld	a, (#_blinkFlag)
	dec	a
	ret	NZ
	C$HeroExec.c$453$2_0$497	= .
	.globl	C$HeroExec.c$453$2_0$497
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:453: if(blinkCnt == 0 || blinkCnt == 20 || blinkCnt == 40 || blinkCnt == 60 || blinkCnt == 80 || blinkCnt == 100 || blinkCnt == 120){
	ld	hl, #_blinkCnt
	ld	a, (hl)
	or	a, a
	jr	Z, 00101$
	ld	a, (hl)
	sub	a, #0x14
	jr	Z, 00101$
	ld	a, (#_blinkCnt)
	sub	a, #0x28
	jr	Z, 00101$
	ld	a, (#_blinkCnt)
	sub	a, #0x3c
	jr	Z, 00101$
	ld	a, (#_blinkCnt)
	sub	a, #0x50
	jr	Z, 00101$
	ld	a, (#_blinkCnt)
	sub	a, #0x64
	jr	Z, 00101$
	ld	a, (#_blinkCnt)
	sub	a, #0x78
	jr	NZ, 00102$
00101$:
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 10)
	ld	(hl), #0x18
	ld	hl, #(_shadow_OAM + 14)
	ld	(hl), #0x1a
	C$HeroExec.c$455$2_0$497	= .
	.globl	C$HeroExec.c$455$2_0$497
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:455: set_sprite_tile(3,26);
00102$:
	C$HeroExec.c$457$2_0$497	= .
	.globl	C$HeroExec.c$457$2_0$497
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:457: if(blinkCnt == 10 || blinkCnt == 30 || blinkCnt == 50|| blinkCnt == 70 || blinkCnt == 90 || blinkCnt == 110 || blinkCnt == 130){
	ld	a, (#_blinkCnt)
	sub	a, #0x0a
	jr	Z, 00111$
	ld	a, (#_blinkCnt)
	sub	a, #0x1e
	jr	Z, 00111$
	ld	a, (#_blinkCnt)
	sub	a, #0x32
	jr	Z, 00111$
	ld	a, (#_blinkCnt)
	sub	a, #0x46
	jr	Z, 00111$
	ld	a, (#_blinkCnt)
	sub	a, #0x5a
	jr	Z, 00111$
	ld	a, (#_blinkCnt)
	sub	a, #0x6e
	jr	Z, 00111$
	ld	a, (#_blinkCnt)
	sub	a, #0x82
	jr	NZ, 00112$
00111$:
;C:/Users/sva13/OneDrive/ドキュメント/会社/課題/gbdk/Resources/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 10)
	ld	(hl), #0x04
	ld	hl, #(_shadow_OAM + 14)
	ld	(hl), #0x06
	C$HeroExec.c$460$3_0$499	= .
	.globl	C$HeroExec.c$460$3_0$499
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:460: if(blinkCnt == 130){
	ld	a, (#_blinkCnt)
	sub	a, #0x82
	jr	NZ, 00112$
	C$HeroExec.c$461$4_0$500	= .
	.globl	C$HeroExec.c$461$4_0$500
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:461: blinkFlag = FALSE;
	ld	hl, #_blinkFlag
	ld	(hl), #0x00
	C$HeroExec.c$462$4_0$500	= .
	.globl	C$HeroExec.c$462$4_0$500
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:462: blinkCnt = 0;
	ld	hl, #_blinkCnt
	ld	(hl), #0x00
	C$HeroExec.c$463$4_0$500	= .
	.globl	C$HeroExec.c$463$4_0$500
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:463: return;
	ret
00112$:
	C$HeroExec.c$466$2_0$497	= .
	.globl	C$HeroExec.c$466$2_0$497
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:466: blinkCnt = blinkCnt + 1;
	ld	hl, #_blinkCnt
	inc	(hl)
	ld	a, (hl)
	C$HeroExec.c$468$1_0$496	= .
	.globl	C$HeroExec.c$468$1_0$496
;C:\Users\sva13\OneDrive\ドキュメント\会社\課題\gbdk\Project\gb-test\source\exec\HeroExec.c:468: }
	C$HeroExec.c$468$1_0$496	= .
	.globl	C$HeroExec.c$468$1_0$496
	XG$BlinkExec$0$0	= .
	.globl	XG$BlinkExec$0$0
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
