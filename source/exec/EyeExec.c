#include <gb/gb.h>
#include <gb/cgb.h>
#include <stdio.h>
#include <rand.h>
#include "../../headers/graphic/sprite/Eye.h"

#define NOACTION 0
#define MOVEUP 1
#define MOVERIGHT 2
#define MOVEDOWN 3
#define MOVELEFT 4
#define FLOATUP 5
#define FLOATRIGHT 6
#define FLOATDOWN 7
#define FLOATLEFT 8
#define UP 9
#define RIGHT 10
#define DOWN 11
#define LEFT 12
#define SINKUP 13
#define SINKRIGHT 14
#define SINKDOWN 15
#define SINKLEFT 16
#define SHOTUP 17
#define SHOTRIGHT 18
#define SHOTDOWN 19
#define SHOTLEFT 20
#define SLASH 21

uint8_t eye1X,eye1Y,eye2X,eye2Y,eye1Mode,eye2Mode;
BOOLEAN eye1Flag,eye2Flag;
uint8_t eye1Cnt, eye2Cnt, adjustCnt;
//fixed seed;


void EyeExecInit(){
    eye1X = 255;
    eye1Y = 255;
    eye2X = 255;
    eye2Y = 255;
    eye1Cnt = 0;
    eye2Cnt = 0;
    adjustCnt = 0;
    //set_sprite_data(0,52,EyeTile);
}

// 2個,4個,8個のランダム値を返す
uint8_t randGenetate(uint8_t step){
    uint16_t seed = LY_REG;
    seed |= (uint16_t)DIV_REG << 8;
    initrand(seed);
    uint8_t uI = 0;
    uint8_t i = 0;
    uI = rand();
    if(step <= 2){
        // 2個(0～1)のランダム値を返す
        if(uI <= 127){
            return 0;
        }
        else{
            return 1;
        }
    }
    else if(step > 2 && step <= 4){
        // 4個(0～3)のランダム値を返す
        if(uI >= 0 && uI <= 63){
            return 0;
        }
        else if(uI >= 64 && uI <= 127){
            return 1;
        }
        else if(uI >= 128 && uI <= 191){
            return 2;
        }
        else{
            return 3;
        }
    }
    else{
        // 8個(0～7)のランダム値を返す
        if(uI >= 0 && uI <= 31){
            return 0;
        }
        else if(uI >= 32 && uI <= 63){
            return 1;
        }
        else if(uI >= 64 && uI <= 95){
            return 2;
        }
        else if(uI >= 96 && uI <= 127){
            return 3;
        }
        else if(uI >= 128 && uI <= 159){
            return 4;
        }
        else if(uI >= 160 && uI <= 191){
            return 5;
        }
        else if(uI >= 192 && uI <= 223){
            return 6;
        }
        else{
            return 7;
        }
    }
}


void EyeInit(uint8_t *eyeX, uint8_t *eyeY, 
            uint8_t *heroX, uint8_t *heroY, uint8_t *bkgX, uint8_t *bkgY, 
            uint8_t tile, uint8_t spriteNum, uint8_t tileIndex, 
            uint8_t *eyeMode, uint8_t *eyeCnt){
    set_sprite_data(tile,4,EyeBeamShot1Tile);
    set_sprite_data(tile+4,4,EyeShadowTile);
    set_sprite_tile(spriteNum,tileIndex);
    set_sprite_tile(spriteNum+1,tileIndex+2);
    set_sprite_tile(spriteNum+2,tileIndex+4);
    set_sprite_tile(spriteNum+3,tileIndex+6);
    set_sprite_prop(spriteNum,0x02);
    set_sprite_prop(spriteNum+1,0x02);
    set_sprite_prop(spriteNum+2,0x01);
    set_sprite_prop(spriteNum+3,0x01);
    if(*bkgX < 48 && *bkgY < 48){
        //下右から敵が出てくる
        //initrand(adjustCnt);
        uint8_t randNum1 = randGenetate(2);
        uint8_t randNum2 = randGenetate(8);
        if(randNum2 == 7){
            adjustCnt = adjustCnt + 1;
            return;
        }
        if(randNum1 == 0){
            // 右から出現
            if(randNum2 < 2){
                adjustCnt = adjustCnt + 1;
                return;
            }
            *eyeX = 168;
            *eyeY = 16 * (randNum2 + 1);
            *eyeMode = MOVELEFT;
            move_sprite(spriteNum+2,*eyeX, *eyeY);
            move_sprite(spriteNum+3,*eyeX + 8, *eyeY);
        }
        else{
            // 下から出現
            *eyeX = (16 * (randNum2 + 2) + 8);
            *eyeY = 144;
            *eyeMode = MOVEUP;
            move_sprite(spriteNum+2, *eyeX, *eyeY );
            move_sprite(spriteNum+3, *eyeX + 8, *eyeY);
        }
    }
    else if(*bkgX < 48  && (*bkgY >= 48 && *bkgY < 64)){
        //上下右から敵が出てくる
        uint8_t randNum1 = randGenetate(4);
        uint8_t randNum2 = randGenetate(8);
        if(randNum1 >= 0 && randNum1 <= 1){
            *eyeX = (16 * (randNum2 + 2) + 8);
            if(randNum1 == 0){
                //上から出てくる
                *eyeY = 0;
                *eyeMode = MOVEDOWN;
            }
            else{
                //下から出てくる
                *eyeY = 144;
                *eyeMode = MOVEUP;
            }
            move_sprite(spriteNum+2, *eyeX, *eyeY );
            move_sprite(spriteNum+3, *eyeX + 8, *eyeY);
        }
        else{
            //右から出てくる
            *eyeX = 168;
            *eyeY = 16 * (randNum2 + 1);
            *eyeMode = MOVELEFT;
            move_sprite(spriteNum+2,*eyeX, *eyeY);
            move_sprite(spriteNum+3,*eyeX + 8, *eyeY);
        }
    }
    else if((*bkgX >= 48 && *bkgX < 56 ) && (*bkgY >= 48 && *bkgY < 64)){
        //上下左右から敵が出てくる
        uint8_t randNum1 = randGenetate(4);
        uint8_t randNum2 = randGenetate(8);
        if(randNum1 >= 0 && randNum1 <= 1){
            *eyeX = (16 * (randNum2 + 1) + 8);
            if(randNum1 == 0){
                //上から出てくる
                *eyeY = 0;
                *eyeMode = MOVEDOWN;
            }
            else{
                //下から出てくる
                *eyeY = 144;
                *eyeMode = MOVEUP;
            }
            move_sprite(spriteNum+2, *eyeX, *eyeY );
            move_sprite(spriteNum+3, *eyeX + 8, *eyeY);
        }
        else{
            *eyeY = 16 * (randNum2 + 1);
            if(randNum1 == 2){
                //右から出てくる
                *eyeX = 168;
                *eyeMode = MOVELEFT;
            }
            else{
                //左から出てくる
                *eyeX = 8;
                *eyeMode = MOVERIGHT;
            }
            move_sprite(spriteNum+2,*eyeX, *eyeY);
            move_sprite(spriteNum+3,*eyeX + 8, *eyeY);
        }
    }
    else if((*bkgX >= 48 && *bkgX < 56 ) && (*bkgY >= 64)){
        //上左右から敵が出てくる
        uint8_t randNum1 = randGenetate(4);
        uint8_t randNum2 = randGenetate(8);
        if(randNum1 >= 0 && randNum1 <= 1){
            *eyeX = (16 * (randNum2 + 1) + 8);
            *eyeY = 0;
            *eyeMode = MOVEDOWN;
            move_sprite(spriteNum+2, *eyeX, *eyeY );
            move_sprite(spriteNum+3, *eyeX + 8, *eyeY);
        }
        else{
            if(randNum1 == 7) return;
            *eyeY = 16 * randNum2;
            if(randNum1 == 2){
                //右から出てくる
                *eyeX = 168;
                *eyeMode = MOVELEFT;
            }
            else{
                //左から出てくる
                *eyeX = 8;
                *eyeMode = MOVERIGHT;
            }
            move_sprite(spriteNum+2,*eyeX, *eyeY);
            move_sprite(spriteNum+3,*eyeX + 8, *eyeY);
        }
    }
    else if(*bkgX >= 56 && *bkgY >= 64){
        //上左から敵が出てくる
        uint8_t randNum1 = randGenetate(4);
        uint8_t randNum2 = randGenetate(8);
        if(randNum1 >= 0 && randNum1 <= 1){
            *eyeX = (16 * (randNum2 + 1) + 8);
            *eyeY = 0;
            *eyeMode = MOVEDOWN;
            move_sprite(spriteNum+2, *eyeX, *eyeY );
            move_sprite(spriteNum+3, *eyeX + 8, *eyeY);
        }
        else{
            //左から出てくる
            if(randNum1 == 7) return;
            *eyeY = 16 * randNum2;
            *eyeX = 8;
            *eyeMode = MOVERIGHT;
            move_sprite(spriteNum+2,*eyeX, *eyeY);
            move_sprite(spriteNum+3,*eyeX + 8, *eyeY);
        }
    }
    else if(*bkgX >= 56 && *bkgY < 48){
        //下左から敵が出てくる
        uint8_t randNum1 = randGenetate(2);
        uint8_t randNum2 = randGenetate(8);
        if(randNum2 == 7){
            adjustCnt = adjustCnt + 1;
            return;
        }
        if(randNum1 == 0){
            // 左から出現
            if(randNum2 < 2){
                adjustCnt = adjustCnt + 1;
                return;
            }
            *eyeX = 8;
            *eyeY = 16 * (randNum2 + 1);
            *eyeMode = MOVERIGHT;
            move_sprite(spriteNum+2,*eyeX, *eyeY);
            move_sprite(spriteNum+3,*eyeX + 8, *eyeY);
        }
        else{
            // 下から出現
            *eyeX = (16 * randNum2 + 8);
            *eyeY = 144;
            *eyeMode = MOVEUP;
            move_sprite(spriteNum+2, *eyeX, *eyeY );
            move_sprite(spriteNum+3, *eyeX + 8, *eyeY);
        }

    }
    else if(*bkgX >= 56 && (*bkgY >= 48 && *bkgY < 64)){
        //上下左から敵が出てくる
        uint8_t randNum1 = randGenetate(4);
        uint8_t randNum2 = randGenetate(8);
        if(randNum1 >= 0 && randNum1 <= 1){
            *eyeX = (16 * randNum2 + 8);
            if(randNum1 == 0){
                //上から出てくる
                *eyeY = 0;
                *eyeMode = MOVEDOWN;
            }
            else{
                //下から出てくる
                *eyeY = 144;
                *eyeMode = MOVEUP;
            }
            move_sprite(spriteNum+2, *eyeX, *eyeY );
            move_sprite(spriteNum+3, *eyeX + 8, *eyeY);
        }
        else{
            //右から出てくる
            *eyeX = 8;
            *eyeY = 16 * (randNum2 + 1);
            *eyeMode = MOVERIGHT;
            move_sprite(spriteNum+2,*eyeX, *eyeY);
            move_sprite(spriteNum+3,*eyeX + 8, *eyeY);
        }
    }
}
uint8_t ChangeDirection(){
    //initrand(adjustCnt);
    uint8_t randNum = randGenetate(4);
    if(randNum == 0){
        return MOVEUP;
    }
    else if(randNum == 1){
        return MOVERIGHT;
    }
    else if(randNum == 2){
        return MOVEDOWN;
    }
    else if(randNum == 3){
        return MOVELEFT;
    }
    else{
        return MOVELEFT;
    }
}

void EyeModeChange(uint8_t *eyeMode){
    //uint8_t randNum = 0;
    //initrand(adjustCnt);
    if(*eyeMode == NOACTION){

    }
    else if(*eyeMode >= MOVEUP && *eyeMode <= MOVELEFT){
        uint8_t randNum = randGenetate(8);
        if(randNum == 6){
            *eyeMode = ChangeDirection();
        }
        else if(randNum == 7){
            if(*eyeMode == MOVEUP) *eyeMode = FLOATUP;
            if(*eyeMode == MOVERIGHT) *eyeMode = FLOATRIGHT;
            if(*eyeMode == MOVEDOWN) *eyeMode = FLOATDOWN;
            if(*eyeMode == MOVELEFT) *eyeMode = FLOATLEFT; 
        }
    }
    else if(*eyeMode >= FLOATUP && *eyeMode <= FLOATLEFT){
        uint8_t randNum = randGenetate(2);
        if(randNum == 0){
            if(*eyeMode == FLOATUP) *eyeMode = UP;
            if(*eyeMode == FLOATRIGHT) *eyeMode = RIGHT;
            if(*eyeMode == FLOATDOWN) *eyeMode = DOWN;
            if(*eyeMode == FLOATLEFT) *eyeMode = LEFT;            
        }
        else{
            if(*eyeMode == FLOATUP) *eyeMode = SHOTUP;
            if(*eyeMode == FLOATRIGHT) *eyeMode = SHOTRIGHT;
            if(*eyeMode == FLOATDOWN) *eyeMode = SHOTDOWN;
            if(*eyeMode == FLOATLEFT) *eyeMode = SHOTLEFT;    
        }
    }
    else if(*eyeMode >= UP && *eyeMode <= LEFT){
        uint8_t randNum = randGenetate(2);
        if(randNum == 0){
            if(*eyeMode == UP) *eyeMode = SINKUP;
            if(*eyeMode == RIGHT) *eyeMode = SINKRIGHT;
            if(*eyeMode == DOWN) *eyeMode = SINKDOWN;
            if(*eyeMode == LEFT) *eyeMode = SINKLEFT;            
        }
        else{
            if(*eyeMode == UP) *eyeMode = SHOTUP;
            if(*eyeMode == RIGHT) *eyeMode = SHOTRIGHT;
            if(*eyeMode == DOWN) *eyeMode = SHOTDOWN;
            if(*eyeMode == LEFT) *eyeMode = SHOTLEFT;    
        }
    }
    else if(*eyeMode >= SINKUP && *eyeMode <= SINKLEFT){
        uint8_t randNum = randGenetate(8);
        if(randNum >= 4){
            *eyeMode = ChangeDirection();
        }
        else{
            if(*eyeMode == SINKUP) *eyeMode = FLOATUP;
            if(*eyeMode == SINKRIGHT) *eyeMode = FLOATRIGHT;
            if(*eyeMode == SINKDOWN) *eyeMode = FLOATDOWN;
            if(*eyeMode == SINKLEFT) *eyeMode = FLOATLEFT;  
        }
    }
    else if(*eyeMode >= SHOTUP && *eyeMode <= SHOTLEFT){
        uint8_t randNum = randGenetate(8);
        if(randNum >= 4){
            if(*eyeMode == SHOTUP) *eyeMode = SINKUP;
            if(*eyeMode == SHOTRIGHT) *eyeMode = SINKRIGHT;
            if(*eyeMode == SHOTDOWN) *eyeMode = SINKDOWN;
            if(*eyeMode == SHOTLEFT) *eyeMode = SINKLEFT; 
        }   
    }
}

void EyeExecMain(uint8_t *eyeX, uint8_t *eyeY, 
            uint8_t *bkgX, uint8_t *bkgY, 
            uint8_t tile, uint8_t spriteNum, uint8_t tileIndex, 
            uint8_t *eyeMode, uint8_t *eyeCnt){
    *eyeCnt = *eyeCnt + 1;
    if(*eyeMode >= MOVEUP && *eyeMode <= MOVELEFT){
        if(*eyeMode == MOVEUP) *eyeY = *eyeY - 1;
        if(*eyeMode == MOVERIGHT) *eyeX = *eyeX + 1;
        if(*eyeMode == MOVEDOWN) *eyeY = *eyeY + 1;
        if(*eyeMode == MOVELEFT) *eyeX = *eyeX - 1;
        move_sprite(spriteNum+2,*eyeX, *eyeY);
        move_sprite(spriteNum+3,*eyeX + 8, *eyeY);
        if(*eyeCnt == 8){
            EyeModeChange(eyeMode);
            *eyeCnt = 0;
        }
    }
    else if(*eyeMode >= FLOATUP && *eyeMode <= FLOATLEFT){
        if(*eyeCnt == 5){
            if(*eyeMode == FLOATUP){
                set_sprite_data(tile+4,4,EyeUpFloatTile);
            }
            else if(*eyeMode == FLOATRIGHT){
                set_sprite_data(tile+4,4,EyeRightFloatTile);
            }
            else if(*eyeMode == FLOATDOWN){
                set_sprite_data(tile+4,4,EyeDownFloatTile);
            }
            else if(*eyeMode == FLOATLEFT){
                set_sprite_data(tile+4,4,EyeLeftFloatTile);
            }
        }
        else if(*eyeCnt == 10){
            if(*eyeMode == FLOATUP){
                set_sprite_data(tile+4,4,EyeUpTile);
            }
            else if(*eyeMode == FLOATRIGHT){
                set_sprite_data(tile+4,4,EyeRightTile);
            }
            else if(*eyeMode == FLOATDOWN){
                set_sprite_data(tile+4,4,EyeDownTile);
            }
            else if(*eyeMode == FLOATLEFT){
                set_sprite_data(tile+4,4,EyeLeftTile);
            }
            EyeModeChange(eyeMode);
            *eyeCnt = 0;
        }
    }
    else if(*eyeMode >= UP && *eyeMode <= LEFT){
        if(*eyeCnt == 59){
            EyeModeChange(eyeMode);
            *eyeCnt = 0;
        }
    }
    else if(*eyeMode >= SINKUP && *eyeMode <= SINKLEFT){
        if(*eyeCnt == 5){
            if(*eyeMode == SINKUP){
                set_sprite_data(tile+4,4,EyeUpFloatTile);
            }
            else if(*eyeMode == SINKRIGHT){
                set_sprite_data(tile+4,4,EyeRightFloatTile);
            }
            else if(*eyeMode == SINKDOWN){
                set_sprite_data(tile+4,4,EyeDownFloatTile);
            }
            else if(*eyeMode == SINKLEFT){
                set_sprite_data(tile+4,4,EyeLeftFloatTile);
            }
        }
        else if(*eyeCnt == 10){
            set_sprite_data(tile+4,4,EyeShadowTile);
            EyeModeChange(eyeMode);
            *eyeCnt = 0;
        }
    }
    else if(*eyeMode >= SHOTUP && *eyeMode <= SHOTLEFT){
        if(*eyeCnt == 59){
            EyeModeChange(eyeMode);
            *eyeCnt = 0;
        }
    }
    else if(*eyeMode == SLASH){
        if(*eyeCnt < 9){
            move_sprite(spriteNum+2,*eyeX, *eyeY - *eyeCnt);
            move_sprite(spriteNum+3,*eyeX + 8, *eyeY + *eyeCnt);
        }
        else{
            *eyeX = 255;
            *eyeY = 255;
            move_sprite(spriteNum+2,*eyeX, *eyeY);
            move_sprite(spriteNum+3,*eyeX, *eyeY);
            *eyeCnt = 0;
        }
    }
    if(*eyeMode == MOVEUP){
        if(*bkgY < 40){
            if((40 - *bkgY) == *eyeY){
                *eyeMode = MOVEDOWN;
            }
        }
    }
    else if(*eyeMode == MOVERIGHT){
        if(*bkgX >= 72){
            if((*bkgX + *eyeX) == 216){
                *eyeMode = MOVELEFT;
            }
        }
    }
    else if(*eyeMode == MOVEDOWN){
        if(*bkgY >= 88){
            if((*bkgY + *eyeY) == 224){
                *eyeMode = MOVEUP;
            }
        }
    }
    else if(*eyeMode == MOVELEFT){
        if(*bkgX < 40){
            if((40 - *bkgX) == *eyeX){
                *eyeMode = MOVERIGHT;
            }
        }
    }
    if((*eyeX > 168) || *eyeY > 152){
        *eyeX = 255;
        *eyeY = 255;
    }
}

void EyeExec(uint8_t *heroX, uint8_t *heroY, uint8_t *bkgX, uint8_t *bkgY){
    if(eye1X == 255){
        EyeInit(&eye1X, &eye1Y, heroX, heroY, bkgX, bkgY, 8, 4, 8, &eye1Mode, &eye1Cnt);
    }
    else{
        EyeExecMain(&eye1X, &eye1Y, bkgX, bkgY, 8, 4, 8, &eye1Mode, &eye1Cnt);
    }
    if(eye2X == 255){
    }
    adjustCnt = adjustCnt + 1;
}

void EyePosAdjust(int8_t adjustX, int8_t adjustY){
    if(eye1X != 255){
        eye1X = eye1X + adjustX;
        eye1Y = eye1Y + adjustY;
        move_sprite(6,eye1X, eye1Y);
        move_sprite(7,eye1X + 8, eye1Y);
    }
}

BOOLEAN DamageCheck(uint8_t *heroX, uint8_t *heroY){
    if(eye1X != 255){
        if(((*heroX+8 >= eye1X) && (*heroX-8 <= eye1X)) && ((*heroY+8 >= eye1Y) && (*heroY-8 <= eye1Y))){
            return TRUE;
        }
    }
    return FALSE;
}

void HitCheck(uint8_t hitArea1X, uint8_t hitArea1Y,uint8_t hitArea2X, uint8_t hitArea2Y){
    if((eye1X >= hitArea1X && eye1X <= hitArea2X) && (eye1Y >= hitArea1Y && eye1Y <= hitArea2Y)){
        if((eye1Mode >= FLOATUP && eye1Mode <= FLOATLEFT) && eye1Cnt >= 5){

        }
        else if((eye1Mode >= SINKUP && eye1Mode <= SINKLEFT) && eye1Cnt < 10){

        }
        else if((eye1Mode >= UP && eye1Mode <= LEFT) || (eye1Mode >= SHOTUP && eye1Mode <= SHOTLEFT)){

        }
        else{
            return;
        }
        eye1Mode = SLASH;
        eye1Cnt = 0;
    }
}
