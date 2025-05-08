if (global.levelcomplete && (!global.warcutscene))
{
    global.levelcomplete = false
    currentroom = room
    explosion_func = function(argument0, argument1) //gml_Script_anon_gml_RoomCC_hub_warpath_4_Create_127_gml_RoomCC_hub_warpath_4_Create
    {
        instance_create(argument0, argument1, obj_canonexplosion)
        cutscene_end_action()
    }

    bombactor = noone
    planeactor = -4
    scene_info = [[gml_Script_cutscene_entrance_start], [gml_Script_cutscene_waitfor_sprite, 602], [gml_Script_cutscene_player_idleanim], [gml_Script_cutscene_change_room, 660], [gml_Script_cutscene_set_player_visible, false], [gml_Script_cutscene_player_float, true], [gml_Script_cutscene_set_player_pos, 100, 100], [gml_Script_cutscene_wait, 20], [function() //gml_Script_anon_gml_RoomCC_hub_warpath_4_Create_591_gml_RoomCC_hub_warpath_4_Create
    {
        planeactor = instance_create(1056, 128, obj_actor)
        planeactor.image_speed = 0.35
        planeactor.sprite_index = spr_crashingplane
        planeactor.hsp = -8
        cutscene_end_action()
    }
], [function() //gml_Script_anon_gml_RoomCC_hub_warpath_4_Create_821_gml_RoomCC_hub_warpath_4_Create
    {
        with (planeactor)
        {
            x += hsp
            if (x < (room_width / 2))
            {
                with (other)
                    cutscene_end_action()
            }
        }
    }
], [function() //gml_Script_anon_gml_RoomCC_hub_warpath_4_Create_1005_gml_RoomCC_hub_warpath_4_Create
    {
        bombactor = instance_create(planeactor.x, planeactor.y, obj_actor)
        bombactor.sprite_index = spr_bomb
        bombactor.image_index = 0.35
        planeactor.x += planeactor.hsp
        cutscene_end_action()
    }
], [function() //gml_Script_anon_gml_RoomCC_hub_warpath_4_Create_1251_gml_RoomCC_hub_warpath_4_Create
    {
        planeactor.x += planeactor.hsp
        with (bombactor)
        {
            y += 10
            if (y > (room_height + 50))
            {
                with (other)
                {
                    planeactor = -4
                    bombactor = -4
                    cutscene_end_action()
                }
            }
        }
    }
], [gml_Script_cutscene_change_room, 648], [gml_Script_cutscene_set_player_pos, 1350, 200], [function() //gml_Script_anon_gml_RoomCC_hub_warpath_4_Create_1636_gml_RoomCC_hub_warpath_4_Create
    {
        bombactor = instance_create(1344, -60, obj_actor)
        bombactor.sprite_index = spr_bomb
        bombactor.image_index = 0.35
        cutscene_end_action()
    }
], [function() //gml_Script_anon_gml_RoomCC_hub_warpath_4_Create_1827_gml_RoomCC_hub_warpath_4_Create
    {
        bombactor.y += 10
        if (bombactor.y > 390)
        {
            instance_destroy(bombactor)
            cutscene_end_action()
        }
    }
], [explosion_func, 1342, 385], [gml_Script_cutscene_wait, 3], [explosion_func, 1342, 477], [gml_Script_cutscene_wait, 3], [explosion_func, 1342, 531], [gml_Script_cutscene_wait, 40], [gml_Script_cutscene_change_room, 647], [gml_Script_cutscene_set_player_pos, 300, 300], [gml_Script_cutscene_wait, 50], [explosion_func, 267, 4], [gml_Script_cutscene_wait, 3], [explosion_func, 267, 63], [gml_Script_cutscene_wait, 3], [explosion_func, 267, 125], [gml_Script_cutscene_wait, 3], [gml_Script_cutscene_wait, 100], [gml_Script_cutscene_change_room, currentroom], [gml_Script_cutscene_set_player_visible, true], [function() //gml_Script_anon_gml_RoomCC_hub_warpath_4_Create_2566_gml_RoomCC_hub_warpath_4_Create
    {
        with (obj_player)
        {
            state = states.normal
            x = backtohubstartx
            y = backtohubstarty
        }
        global.levelcomplete = false
        global.warcutscene = true
        quick_ini_write_real(get_savefile_ini(), "cutscene", "war", true)
        cutscene_end_action()
    }
], [gml_Script_cutscene_save_game]]
}
else if global.levelcomplete
{
    global.levelcomplete = false
    scene_info = [[gml_Script_cutscene_save_game]]
}
else
    scene_info = [[gml_Script_cutscene_wait, 20]]
