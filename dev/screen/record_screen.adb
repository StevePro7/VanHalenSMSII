M:record_screen
F:G$screen_record_screen_load$0$0({2}DF,SV:S),Z,0,0,0,0,0
F:G$screen_record_screen_update$0$0({2}DF,SV:S),Z,0,0,0,0,0
S:Lrecord_screen.screen_record_screen_update$screen_type$1$30({2}DG,SC:U),B,1,4
S:Lrecord_screen.screen_record_screen_update$ro$1$31({2}DG,STtag_struct_record_object:S),R,0,0,[]
S:Lrecord_screen.screen_record_screen_update$input1$1$31({1}SC:U),R,0,0,[l]
S:Lrecord_screen.screen_record_screen_update$input2$1$31({1}SC:U),R,0,0,[l]
F:Frecord_screen$load_record$0$0({2}DF,SV:S),Z,0,0,0,0,0
T:Frecord_screen$tag_struct_scroll_object[({0}S:S$scroll_value_offset$0$0({1}SC:U),Z,0,0)]
T:Frecord_screen$tag_struct_cursor_object[({0}S:S$cursor_index_x$0$0({1}SC:U),Z,0,0)({1}S:S$cursor_index_y$0$0({1}SC:U),Z,0,0)({2}S:S$cursor_value_x$0$0({1}SC:U),Z,0,0)({3}S:S$cursor_value_y$0$0({1}SC:U),Z,0,0)]
T:Frecord_screen$tag_struct_storage_object[({0}S:S$Magic$0$0({4}SL:U),Z,0,0)({4}S:S$save_album_index$0$0({1}SC:U),Z,0,0)({5}S:S$terminal$0$0({1}SC:U),Z,0,0)]
T:Frecord_screen$tag_struct_delay_object[({0}S:S$delay_value$0$0({2}SI:U),Z,0,0)({2}S:S$delay_timer$0$0({2}SI:U),Z,0,0)]
T:Frecord_screen$tag_struct_reset_object[({0}S:S$reset_value$0$0({2}SI:U),Z,0,0)({2}S:S$reset_timer$0$0({2}SI:U),Z,0,0)]
T:Frecord_screen$tag_struct_record_object[({0}S:S$record_album_index$0$0({1}SC:U),Z,0,0)]
S:G$cursor_album$0$0({24}DA12d,DG,SC:U),E,0,0
S:G$global_cursor_object$0$0({4}STtag_struct_cursor_object:S),E,0,0
S:G$record_tiles_data$0$0({0}DA0d,DG,SC:U),E,0,0
S:G$record_tilemap_data$0$0({0}DA0d,DG,SC:U),E,0,0
S:G$record_palette_data$0$0({0}DA0d,DG,SC:U),E,0,0
S:G$global_record_object$0$0({1}STtag_struct_record_object:S),E,0,0
S:G$global_savegame_object$0$0({6}STtag_struct_storage_object:S),E,0,0
S:G$global_scroll_object$0$0({1}STtag_struct_scroll_object:S),E,0,0
S:G$global_delay_object$0$0({4}STtag_struct_delay_object:S),E,0,0
S:G$global_reset_object$0$0({4}STtag_struct_reset_object:S),E,0,0
S:Frecord_screen$event_stage$0$0({1}SC:U),E,0,0
S:G$engine_asm_manager_clear_VRAM$0$0({2}DF,SV:S),C,0,0
S:G$engine_cursor_manager_init$0$0({2}DF,SV:S),C,0,0
S:G$engine_cursor_manager_load$0$0({2}DF,SV:S),C,0,0
S:G$engine_cursor_manager_save$0$0({2}DF,SC:U),C,0,0
S:G$engine_cursor_manager_draw$0$0({2}DF,SV:S),C,0,0
S:G$engine_cursor_manager_decX$0$0({2}DF,SV:S),C,0,0
S:G$engine_cursor_manager_incX$0$0({2}DF,SV:S),C,0,0
S:G$engine_cursor_manager_decY$0$0({2}DF,SV:S),C,0,0
S:G$engine_cursor_manager_incY$0$0({2}DF,SV:S),C,0,0
S:G$engine_font_manager_draw_char$0$0({2}DF,SV:S),C,0,0
S:G$engine_font_manager_draw_text$0$0({2}DF,SV:S),C,0,0
S:G$engine_font_manager_draw_data$0$0({2}DF,SV:S),C,0,0
S:G$engine_input_manager_update$0$0({2}DF,SV:S),C,0,0
S:G$engine_input_manager_hold$0$0({2}DF,SC:U),C,0,0
S:G$engine_input_manager_move$0$0({2}DF,SC:U),C,0,0
S:G$engine_record_manager_init$0$0({2}DF,SV:S),C,0,0
S:G$engine_record_manager_load$0$0({2}DF,SV:S),C,0,0
S:G$engine_record_manager_decrement$0$0({2}DF,SV:S),C,0,0
S:G$engine_record_manager_increment$0$0({2}DF,SV:S),C,0,0
S:G$engine_storage_manager_available$0$0({2}DF,SC:U),C,0,0
S:G$engine_storage_manager_read$0$0({2}DF,SV:S),C,0,0
S:G$engine_storage_manager_write$0$0({2}DF,SV:S),C,0,0
S:G$engine_storage_manager_erase$0$0({2}DF,SV:S),C,0,0
S:G$engine_scroll_manager_reset$0$0({2}DF,SV:S),C,0,0
S:G$engine_scroll_manager_load$0$0({2}DF,SV:S),C,0,0
S:G$engine_delay_manager_load$0$0({2}DF,SV:S),C,0,0
S:G$engine_delay_manager_update$0$0({2}DF,SC:U),C,0,0
S:G$engine_reset_manager_load$0$0({2}DF,SV:S),C,0,0
S:G$engine_reset_manager_update$0$0({2}DF,SC:U),C,0,0
S:G$engine_reset_manager_reset$0$0({2}DF,SV:S),C,0,0
S:G$devkit_SMS_init$0$0({2}DF,SV:S),C,0,0
S:G$devkit_SMS_displayOn$0$0({2}DF,SV:S),C,0,0
S:G$devkit_SMS_displayOff$0$0({2}DF,SV:S),C,0,0
S:G$devkit_SMS_mapROMBank$0$0({2}DF,SV:S),C,0,0
S:G$devkit_SMS_setBGScrollX$0$0({2}DF,SV:S),C,0,0
S:G$devkit_SMS_setBGScrollY$0$0({2}DF,SV:S),C,0,0
S:G$devkit_SMS_enableSRAM$0$0({2}DF,SV:S),C,0,0
S:G$devkit_SMS_enableSRAMBank$0$0({2}DF,SV:S),C,0,0
S:G$devkit_SMS_disableSRAM$0$0({2}DF,SV:S),C,0,0
S:G$devkit_SMS_SRAM$0$0({2}DF,DG,SC:U),C,0,0
S:G$devkit_SMS_setSpriteMode$0$0({2}DF,SV:S),C,0,0
S:G$devkit_SMS_useFirstHalfTilesforSprites_False$0$0({2}DF,SV:S),C,0,0
S:G$devkit_SMS_useFirstHalfTilesforSprites_True$0$0({2}DF,SV:S),C,0,0
S:G$devkit_SMS_VDPturnOnFeature$0$0({2}DF,SV:S),C,0,0
S:G$devkit_SMS_loadPSGaidencompressedTiles$0$0({2}DF,SV:S),C,0,0
S:G$devkit_SMS_loadSTMcompressedTileMap$0$0({2}DF,SV:S),C,0,0
S:G$devkit_SMS_loadBGPalette$0$0({2}DF,SV:S),C,0,0
S:G$devkit_SMS_loadSpritePalette$0$0({2}DF,SV:S),C,0,0
S:G$devkit_SMS_setBGPaletteColor$0$0({2}DF,SV:S),C,0,0
S:G$devkit_SMS_setSpritePaletteColor$0$0({2}DF,SV:S),C,0,0
S:G$devkit_SMS_setNextTileatXY$0$0({2}DF,SV:S),C,0,0
S:G$devkit_SMS_setTile$0$0({2}DF,SV:S),C,0,0
S:G$devkit_SMS_setTilePriority$0$0({2}DF,SV:S),C,0,0
S:G$devkit_SMS_addSprite$0$0({2}DF,SV:S),C,0,0
S:G$devkit_SMS_initSprites$0$0({2}DF,SV:S),C,0,0
S:G$devkit_SMS_finalizeSprites$0$0({2}DF,SV:S),C,0,0
S:G$devkit_SMS_waitForVBlank$0$0({2}DF,SV:S),C,0,0
S:G$devkit_SMS_copySpritestoSAT$0$0({2}DF,SV:S),C,0,0
S:G$devkit_UNSAFE_SMS_copySpritestoSAT$0$0({2}DF,SV:S),C,0,0
S:G$devkit_SMS_queryPauseRequested$0$0({2}DF,SC:U),C,0,0
S:G$devkit_SMS_resetPauseRequest$0$0({2}DF,SV:S),C,0,0
S:G$devkit_isCollisionDetected$0$0({2}DF,SC:U),C,0,0
S:G$devkit_SMS_getKeysStatus$0$0({2}DF,SI:U),C,0,0
S:G$devkit_SPRITEMODE_NORMAL$0$0({2}DF,SC:U),C,0,0
S:G$devkit_VDPFEATURE_HIDEFIRSTCOL$0$0({2}DF,SI:U),C,0,0
S:G$devkit_TILE_PRIORITY$0$0({2}DF,SI:U),C,0,0
S:G$devkit_TILE_USE_SPRITE_PALETTE$0$0({2}DF,SI:U),C,0,0
