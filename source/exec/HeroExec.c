#include <gb/gb.h>
#include <gb/cgb.h>
#include <stdio.h>
#include "../../headers/graphic/sprite/Hero.h"
#include "../../headers/graphic/sprite/Eye.h"
#include "../../headers/exec/EyeExec.h"

#define NOACTION 0
#define MOVEUP 1
#define MOVERIGHT 2
#define MOVEDOWN 3
#define MOVELEFT 4

#define NOACTION 0
#define SWORD 1

#define UP 0
#define RIGHT 1
#define DOWN 2
#define LEFT 3

UINT8 joypadPrevious;
uint8_t spriteX,spriteY,bkgX,bkgY;
uint8_t velocityX,velocityY;
uint8_t actionCnt, blinkCnt, swordCnt;
int8_t heroAction, direction, swordAction;
BOOLEAN blinkFlag;

const UWORD spritepalette[] = {
    HeroCGBPal0c0,HeroCGBPal0c1,HeroCGBPal0c2,HeroCGBPal0c3,
    EyeTileCGBPal1c0,EyeTileCGBPal1c1,EyeTileCGBPal1c2,EyeTileCGBPal1c3,
    EyeTileCGBPal2c0,EyeTileCGBPal2c1,EyeTileCGBPal2c2,EyeTileCGBPal2c3,
    SwordTileCGBPal0c0,SwordTileCGBPal0c1,SwordTileCGBPal0c2,SwordTileCGBPal0c3,
    HeroCGBPal0c0,HeroCGBPal0c1,HeroCGBPal0c2,HeroCGBPal0c3,
    HeroCGBPal0c0,HeroCGBPal0c1,HeroCGBPal0c2,HeroCGBPal0c3,
    HeroCGBPal0c0,HeroCGBPal0c1,HeroCGBPal0c2,HeroCGBPal0c3,
    HeroCGBPal0c0,HeroCGBPal0c1,HeroCGBPal0c2,HeroCGBPal0c3
};

void HeroExecInit(){
    set_sprite_palette(0,8,&spritepalette[0]);
    //剣
    set_sprite_data(0,4,SwordRightUpTile);
    set_sprite_tile(0,0);
    set_sprite_prop(0,0x03);
    set_sprite_tile(1,2);
    set_sprite_prop(1,0x03);
    //主人公
    set_sprite_data(4,4,HeroDownTile);
    set_sprite_tile(2,4);
    set_sprite_prop(2,0x00);
    set_sprite_tile(3,6);
    set_sprite_prop(3,0x00);
    spriteX=80;
    spriteY=72;
    move_sprite(2, spriteX, spriteY);
    move_sprite(3, spriteX + 8, spriteY);
    velocityX=0;
    velocityY=0;
    actionCnt=0;
    heroAction=NOACTION;
    bkgX = 0;
    bkgY = 0;
    blinkFlag = FALSE;
    blinkCnt = 0;
    swordAction = NOACTION;
    swordCnt = 0;
    direction = DOWN;
}

uint8_t *getSpriteX(){
    return &spriteX;
}

uint8_t *getSpriteY(){
    return &spriteY;
}

uint8_t *getBkgX(){
    return &bkgX;
}

uint8_t *getBkgY(){
    return &bkgY;
}

void HeroExec(){
    if(heroAction == NOACTION && swordAction == NOACTION){
        if(joypad() & J_RIGHT){
            heroAction = MOVERIGHT;
        }
        if(joypad() & J_LEFT){
            heroAction = MOVELEFT;
        }
        if(joypad() & J_UP){
            heroAction = MOVEUP;
        }
        if(joypad() & J_DOWN){
            heroAction = MOVEDOWN;
        }
        if(joypad() & J_A){
            if(blinkFlag == FALSE){
                swordAction = SWORD;
            }
        }
        if(joypad() & J_B){
        }
        actionCnt = 0;
    }
    if(heroAction != NOACTION && swordAction == NOACTION){
        if(heroAction == MOVERIGHT){
            if(actionCnt == 0){
                set_sprite_data(4,4,HeroRightTile);
                direction = RIGHT;
            }
            else if(actionCnt == 5){
                set_sprite_data(4,4,HeroRightWalkTile);
            }
            else if(actionCnt == 10){
                set_sprite_data(4,4,HeroRightTile);
                heroAction = NOACTION;
            }
            if(actionCnt == 5 || actionCnt == 10){
                if(bkgX == 96){
                    if(spriteX != 120){
                        spriteX += 4;
                        move_sprite(2,spriteX,spriteY);
                        move_sprite(3,spriteX+8,spriteY);
                    }
                }
                else{
                    if(spriteX != 80){
                        spriteX += 4;
                        move_sprite(2,spriteX,spriteY);
                        move_sprite(3,spriteX+8,spriteY);
                    }
                    else{
                        bkgX += 4;
                        move_bkg(bkgX,bkgY);
                        EyePosAdjust(-4,0);
                    }
                }
            }
        }
        else if(heroAction == MOVELEFT){
            if(actionCnt == 0){
                set_sprite_data(4,4,HeroLeftTile);
                direction = LEFT;
            }
            else if(actionCnt == 5){
                set_sprite_data(4,4,HeroLeftWalkTile);
            }
            else if(actionCnt == 10){
                set_sprite_data(4,4,HeroLeftTile);
                heroAction = NOACTION;
            }
            if(actionCnt == 5 || actionCnt == 10){
                if(bkgX == 0){
                    if(spriteX != 40){
                        spriteX -= 4;
                        move_sprite(2,spriteX,spriteY);
                        move_sprite(3,spriteX+8,spriteY);
                    }
                }
                else{
                    if(spriteX != 80){
                        spriteX -= 4;
                        move_sprite(2,spriteX,spriteY);
                        move_sprite(3,spriteX+8,spriteY);
                    }
                    else{
                        bkgX -= 4;
                        move_bkg(bkgX,bkgY);
                        EyePosAdjust(4,0);
                    }
                }
            }
        }
        else if(heroAction == MOVEUP){
            if(actionCnt == 0){
                set_sprite_data(4,4,HeroUpTile);
                direction = UP;
            }
            else if(actionCnt == 5){
                set_sprite_data(4,4,HeroUpWalkTile);
            }
            else if(actionCnt == 10){
                set_sprite_data(4,4,HeroUpTile);
                heroAction = NOACTION;
            }
            if(actionCnt == 5 || actionCnt == 10){
                if(bkgY == 0){
                    if(spriteY != 40){
                        spriteY -= 4;
                        move_sprite(2,spriteX,spriteY);
                        move_sprite(3,spriteX+8,spriteY);
                    }
                }
                else{
                    if(spriteY != 72){
                        spriteY -= 4;
                        move_sprite(2,spriteX,spriteY);
                        move_sprite(3,spriteX+8,spriteY);
                    }
                    else{
                        bkgY -= 4;
                        move_bkg(bkgX,bkgY);
                        EyePosAdjust(0,4);
                    }
                }
            }
        }
        else if(heroAction == MOVEDOWN){
            if(actionCnt == 0){
                set_sprite_data(4,4,HeroDownTile);
                direction = DOWN;
            }
            else if(actionCnt == 5){
                set_sprite_data(4,4,HeroDownWalkTile);
            }
            else if(actionCnt == 10){
                set_sprite_data(4,4,HeroDownTile);
                heroAction = NOACTION;
            }
            if(actionCnt == 5 || actionCnt == 10){
                if(bkgY == 112){
                    if(spriteY != 112){
                        spriteY += 4;
                        move_sprite(2,spriteX,spriteY);
                        move_sprite(3,spriteX+8,spriteY);
                    }
                }
                else{
                    if(spriteY != 72){
                        spriteY += 4;
                        move_sprite(2,spriteX,spriteY);
                        move_sprite(3,spriteX+8,spriteY);
                    }
                    else{
                        bkgY += 4;
                        move_bkg(bkgX,bkgY);
                        EyePosAdjust(0,-4);
                    }
                }
            }
        }
        actionCnt++;
    }
    if(swordAction == SWORD){
        if(direction == UP){
            if(actionCnt == 0){
                set_sprite_data(0,4,SwordRightDownTile);
                set_sprite_data(4,4,HeroUpAttack1Tile);
                move_sprite(0,spriteX+16,spriteY+8);
                move_sprite(1,spriteX+24,spriteY+8);
            }
            else if(actionCnt == 5){
                move_sprite(0,255,255);
                move_sprite(1,255,255);
            }
            else if(actionCnt == 6){
                set_sprite_data(0,4,SwordRightTile);
                move_sprite(0,spriteX+16,spriteY);
                move_sprite(1,spriteX+24,spriteY);
            }
            else if(actionCnt == 11){
                move_sprite(0,255,255);
                move_sprite(1,255,255);
            }
            else if(actionCnt == 12){
                set_sprite_data(0,4,SwordRightUpTile);
                set_sprite_data(4,4,HeroUpAttack2Tile);
                move_sprite(0,spriteX+16,spriteY-12);
                move_sprite(1,spriteX+24,spriteY-12);
            }
            else if(actionCnt == 17){
                move_sprite(0,255,255);
                move_sprite(1,255,255);
            }
            else if(actionCnt == 18){
                set_sprite_data(0,4,SwordUpTile);
                move_sprite(0,spriteX+2,spriteY-16);
                move_sprite(1,spriteX+10,spriteY-16);
            }
            else if(actionCnt == 24){
                set_sprite_data(4,4,HeroUpTile);
                move_sprite(0,255,255);
                move_sprite(1,255,255);
                swordAction = NOACTION;
            }
            if(actionCnt >= 6 && actionCnt < 12){
                HitCheck(spriteX+16,spriteY,spriteX+32,spriteY+16);
            }
            else if(actionCnt >= 12){
                HitCheck(spriteX,spriteY-16,spriteX+32,spriteY);
            }
        }
        else if(direction == RIGHT){
            if(actionCnt == 0){
                set_sprite_data(0,4,SwordLeftUpTile);
                set_sprite_data(4,4,HeroRightAttack1Tile);
                move_sprite(0,spriteX-14,spriteY-10);
                move_sprite(1,spriteX-6,spriteY-10);
            }
            else if(actionCnt == 5){
                move_sprite(0,255,255);
                move_sprite(1,255,255);
            }
            else if(actionCnt == 6){
                set_sprite_data(0,4,SwordUpTile);
                move_sprite(0,spriteX-4,spriteY-10);
                move_sprite(1,spriteX+4,spriteY-10);
            }
            else if(actionCnt == 11){
                move_sprite(0,255,255);
                move_sprite(1,255,255);
            }
            else if(actionCnt == 12){
                set_sprite_data(0,4,SwordRightUpTile);
                set_sprite_data(4,4,HeroRightAttack2Tile);
                move_sprite(0,spriteX+12,spriteY-4);
                move_sprite(1,spriteX+20,spriteY-4);
            }
            else if(actionCnt == 17){
                move_sprite(0,255,255);
                move_sprite(1,255,255);
            }
            else if(actionCnt == 18){
                set_sprite_data(0,4,SwordRightTile);
                move_sprite(0,spriteX+12,spriteY+3);
                move_sprite(1,spriteX+20,spriteY+3);
            }
            else if(actionCnt == 24){
                set_sprite_data(4,4,HeroRightTile);
                move_sprite(0,255,255);
                move_sprite(1,255,255);
                swordAction = NOACTION;
            }
            if(actionCnt >= 12){
                HitCheck(spriteX+16,spriteY-8,spriteX+32,spriteY+24);
            }
        }
        else if(direction == DOWN){
            if(actionCnt == 0){
                set_sprite_data(0,4,SwordLeftUpTile);
                set_sprite_data(4,4,HeroDownAttack1Tile);
                move_sprite(0,spriteX-16,spriteY-8);
                move_sprite(1,spriteX-8,spriteY-8);
            }
            else if(actionCnt == 5){
                move_sprite(0,255,255);
                move_sprite(1,255,255);
            }
            else if(actionCnt == 6){
                set_sprite_data(0,4,SwordLeftTile);
                move_sprite(0,spriteX-16,spriteY);
                move_sprite(1,spriteX-8,spriteY);
            }
            else if(actionCnt == 11){
                move_sprite(0,255,255);
                move_sprite(1,255,255);
            }
            else if(actionCnt == 12){
                set_sprite_data(0,4,SwordLeftDownTile);
                set_sprite_data(4,4,HeroDownAttack2Tile);
                move_sprite(0,spriteX-16,spriteY+12);
                move_sprite(1,spriteX-8,spriteY+12);
            }
            else if(actionCnt == 17){
                move_sprite(0,255,255);
                move_sprite(1,255,255);
            }
            else if(actionCnt == 18){
                set_sprite_data(0,4,SwordDownTile);
                move_sprite(0,spriteX-2,spriteY+16);
                move_sprite(1,spriteX+6,spriteY+16);
            }
            else if(actionCnt == 24){
                set_sprite_data(4,4,HeroDownTile);
                move_sprite(0,255,255);
                move_sprite(1,255,255);
                swordAction = NOACTION;
            }
            if(actionCnt >= 6 && actionCnt < 12){
                HitCheck(spriteX-16,spriteY,spriteX,spriteY+16);
            }
            else if(actionCnt >= 12){
                HitCheck(spriteX-16,spriteY+16,spriteX+8,spriteY+32);
            }
        }
        else if(direction == LEFT){
            if(actionCnt == 0){
                set_sprite_data(0,4,SwordRightUpTile);
                set_sprite_data(4,4,HeroLeftAttack1Tile);
                move_sprite(0,spriteX+14,spriteY-10);
                move_sprite(1,spriteX+22,spriteY-10);
            }
            else if(actionCnt == 5){
                move_sprite(0,255,255);
                move_sprite(1,255,255);
            }
            else if(actionCnt == 6){
                set_sprite_data(0,4,SwordUpTile);
                move_sprite(0,spriteX+4,spriteY-10);
                move_sprite(1,spriteX+12,spriteY-10);
            }
            else if(actionCnt == 11){
                move_sprite(0,255,255);
                move_sprite(1,255,255);
            }
            else if(actionCnt == 12){
                set_sprite_data(0,4,SwordLeftUpTile);
                set_sprite_data(4,4,HeroLeftAttack2Tile);
                move_sprite(0,spriteX-12,spriteY-4);
                move_sprite(1,spriteX-4,spriteY-4);
            }
            else if(actionCnt == 17){
                move_sprite(0,255,255);
                move_sprite(1,255,255);
            }
            else if(actionCnt == 18){
                set_sprite_data(0,4,SwordLeftTile);
                move_sprite(0,spriteX-12,spriteY+3);
                move_sprite(1,spriteX-4,spriteY+3);
            }
            else if(actionCnt == 24){
                set_sprite_data(4,4,HeroLeftTile);
                move_sprite(0,255,255);
                move_sprite(1,255,255);
                swordAction = NOACTION;
            }
            if(actionCnt >= 12){
                HitCheck(spriteX-16,spriteY-8,spriteX,spriteY+24);
            }
        }
        actionCnt++;
    }

    joypadPrevious=joypad();
}

void StartBlink(){
    if(blinkFlag == FALSE){
        blinkFlag = TRUE;
        blinkCnt = 0;
        set_sprite_data(24,4,HeroBlinkTile);
        set_sprite_prop(24,0x00);
    }
}

void BlinkExec(){
    if(blinkFlag == TRUE){
        if(blinkCnt == 0 || blinkCnt == 20 || blinkCnt == 40 || blinkCnt == 60 || blinkCnt == 80 || blinkCnt == 100 || blinkCnt == 120){
            set_sprite_tile(2,24);
            set_sprite_tile(3,26);
        }
        if(blinkCnt == 10 || blinkCnt == 30 || blinkCnt == 50|| blinkCnt == 70 || blinkCnt == 90 || blinkCnt == 110 || blinkCnt == 130){
            set_sprite_tile(2,4);
            set_sprite_tile(3,6);
            if(blinkCnt == 130){
                blinkFlag = FALSE;
                blinkCnt = 0;
                return;
            }
        }
        blinkCnt = blinkCnt + 1;
    }
}
