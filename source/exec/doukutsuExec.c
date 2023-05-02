#include <gb/gb.h>
#include <gb/cgb.h>
#include <stdio.h>
#include "../../headers/graphic/bkg/doukutsu.h"

const UWORD doukutsuPallet[] = {
  doukutsuTileCGBPal0c0,doukutsuTileCGBPal0c1,doukutsuTileCGBPal0c2,doukutsuTileCGBPal0c3,
  doukutsuTileCGBPal3c0,doukutsuTileCGBPal3c1,doukutsuTileCGBPal3c2,doukutsuTileCGBPal3c3,
  doukutsuTileCGBPal4c0,doukutsuTileCGBPal4c1,doukutsuTileCGBPal4c2,doukutsuTileCGBPal4c3,
  doukutsuTileCGBPal5c0,doukutsuTileCGBPal5c1,doukutsuTileCGBPal5c2,doukutsuTileCGBPal5c3,
  doukutsuTileCGBPal0c0,doukutsuTileCGBPal0c1,doukutsuTileCGBPal0c2,doukutsuTileCGBPal0c3,
  doukutsuTileCGBPal0c0,doukutsuTileCGBPal0c1,doukutsuTileCGBPal0c2,doukutsuTileCGBPal0c3,
  doukutsuTileCGBPal0c0,doukutsuTileCGBPal0c1,doukutsuTileCGBPal0c2,doukutsuTileCGBPal0c3,
  doukutsuTileCGBPal0c0,doukutsuTileCGBPal0c1,doukutsuTileCGBPal0c2,doukutsuTileCGBPal0c3
};


void doukutsuInit(){
    HIDE_BKG;
    set_bkg_data(0, 52, doukutsuTile);
    set_bkg_palette(0,8,&doukutsuPallet[0]);
    VBK_REG = 1;
    //タイル毎の色を追加
    set_bkg_tiles(0,0,32,32,douketsuColor);
    VBK_REG = 0;
    set_bkg_tiles(0,0,32,32,doukutsu);

    SHOW_BKG;
}