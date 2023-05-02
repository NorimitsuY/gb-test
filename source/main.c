#include <gb/gb.h>
#include <gb/cgb.h>
#include <stdio.h>
#include <stdlib.h>
#include "../headers/exec/HeroExec.h"
#include "../headers/exec/doukutsuExec.h"
#include "../headers/exec/EyeExec.h"


void main(void){
    DISPLAY_ON;
    SPRITES_8x16;



    HeroExecInit();
    EyeExecInit();
    doukutsuInit();

    SHOW_SPRITES;
    SHOW_BKG;
    while(1){
        //当たり判定
        HeroExec();
        EyeExec(getSpriteX(), getSpriteY(), getBkgX(), getBkgY());
        BOOLEAN damageFlag = DamageCheck(getSpriteX(), getSpriteY());
        if(damageFlag == TRUE){
            StartBlink();
        }
        BlinkExec();
        wait_vbl_done();
    }
}