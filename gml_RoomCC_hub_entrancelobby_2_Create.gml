if (global.levelcomplete && (!global.entrancecutscene))
{
    currentroom = room
    scene_info = [[gml_Script_cutscene_entrance_start], [gml_Script_cutscene_waitfor_sprite, 602], [gml_Script_cutscene_player_idleanim], [gml_Script_cutscene_change_room, 623], [gml_Script_cutscene_set_player_visible, false], [gml_Script_cutscene_set_player_pos, 396, 750], [gml_Script_cutscene_wait, 100], [gml_Script_cutscene_entrance_middle], [gml_Script_cutscene_wait, 100], [gml_Script_cutscene_change_room, currentroom], [gml_Script_cutscene_set_player_visible, true], [gml_Script_cutscene_entrance_end], [gml_Script_cutscene_save_game]]
}
else if global.levelcomplete
{
    global.levelcomplete = false
    scene_info = [[gml_Script_cutscene_save_game]]
}
else
    scene_info = [[gml_Script_cutscene_wait, 20]]
