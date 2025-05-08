if ((!global.pizzadelivery) && global.pizzasdelivered < 5 && global.panic == false)
{
    if (!global.failcutscene)
    {
        if (global.pizzasdelivered <= 0)
            scene_info = [[gml_Script_cutscene_set_sprite, 1127, 3236, 0.35, -1], [gml_Script_cutscene_gustavo_start], [gml_Script_cutscene_wait, 30], [gml_Script_cutscene_set_sprite, 1127, 3227, 0.35, -1], [gml_Script_cutscene_wait, 10], [gml_Script_cutscene_move_player, 602, (obj_gustavo.x - 48), 6, 16], [gml_Script_cutscene_set_sprite, 602, 3213, 0.35, 1], [gml_Script_cutscene_set_sprite, 1127, 3228, 0.35, -1], [gml_Script_cutscene_gustavo_end]]
        else
            scene_info = [[gml_Script_cutscene_set_sprite, 1127, 3227, 0.35, -1]]
    }
    else
        scene_info = [[gml_Script_cutscene_gustavofail_start], [gml_Script_cutscene_wait, 20], [gml_Script_cutscene_set_sprite, 1127, 3231, 0.35, -1], [gml_Script_cutscene_waitfor_sprite, 1127], [gml_Script_cutscene_set_sprite, 1127, 3232, 0.35, -1], [gml_Script_cutscene_wait, 50], [gml_Script_cutscene_set_sprite, 1127, 3233, 0.35, -1], [gml_Script_cutscene_set_sprite, 602, 3217, 0.35, 1], [gml_Script_cutscene_waitfor_sprite, 1127], [gml_Script_cutscene_set_sprite, 1127, 3234, 0.35, -1], [gml_Script_cutscene_set_hsp, 1127, -12], [gml_Script_cutscene_set_sprite, 602, 3223, 0.35, 1], [gml_Script_cutscene_waitfor_sprite, 602], [gml_Script_cutscene_set_sprite, 602, 3224, 0.35, 1], [gml_Script_cutscene_check_collision, 1127, 602], [gml_Script_cutscene_set_hsp, 1127, 0], [gml_Script_cutscene_gustavofail_end, 100], [gml_Script_cutscene_move_actor, 1127, obj_gustavo.xstart, obj_gustavo.ystart, 0.05], [gml_Script_cutscene_set_sprite, 1127, 3227, 0.35, -1]]
}
else
    scene_info = [[gml_Script_cutscene_wait, 2]]
