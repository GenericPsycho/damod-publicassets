if (global.levelcomplete && (!global.freezercutscene))
{
    global.levelcomplete = false
    with (obj_player1)
    {
        other.backx = backtohubstartx
        other.backy = backtohubstarty
    }
    currentroom = room
    dragonactor = 151359
    scene_info = [[gml_Script_cutscene_medieval_start], [gml_Script_cutscene_waitfor_sprite, 602], [function() //gml_Script_anon_gml_RoomCC_hub_freezerlobby_3_Create_344_gml_RoomCC_hub_freezerlobby_3_Create
    {
        with (obj_actor)
        {
            if (id != other.dragonactor)
            {
                sprite_index = spr_idle
                visible = true
            }
        }
        cutscene_end_action()
    }
], [gml_Script_cutscene_set_player_visible, false], [gml_Script_cutscene_player_idleanim], [gml_Script_cutscene_player_float, true], [gml_Script_cutscene_player_pos_lerp, 832, 288, 0.07], [gml_Script_cutscene_wait, 40], [function() //gml_Script_anon_gml_RoomCC_hub_freezerlobby_3_Create_732_gml_RoomCC_hub_freezerlobby_3_Create
    {
        with (dragonactor)
        {
            image_speed = 0.35
            sprite_index = spr_cheesedragon_goingup
            repeat (3)
                create_debris(x, y, spr_icedebris)
        }
        cutscene_end_action()
    }
], [function() //gml_Script_anon_gml_RoomCC_hub_freezerlobby_3_Create_966_gml_RoomCC_hub_freezerlobby_3_Create
    {
        with (dragonactor)
        {
            y -= 5
            if (y < -100)
            {
                with (other)
                    cutscene_end_action()
            }
        }
    }
], [gml_Script_cutscene_change_room, 634], [gml_Script_cutscene_set_player_visible, false], [gml_Script_cutscene_set_player_pos, 1407, 415], [gml_Script_cutscene_wait, 20], [function() //gml_Script_anon_gml_RoomCC_hub_freezerlobby_3_Create_1305_gml_RoomCC_hub_freezerlobby_3_Create
    {
        dragonactor = instance_create(1407, -125, obj_actor)
        dragonactor.sprite_index = spr_cheesedragon_idle
        dragonactor.image_speed = 0.35
        cutscene_end_action()
    }
], [function() //gml_Script_anon_gml_RoomCC_hub_freezerlobby_3_Create_1528_gml_RoomCC_hub_freezerlobby_3_Create
    {
        with (dragonactor)
        {
            y += 5
            if place_meeting(x, (y + 128), obj_solid)
            {
                sprite_index = spr_cheesedragon_stomp
                image_index = 0
                with (other)
                    cutscene_end_action()
            }
        }
    }
], [function() //gml_Script_anon_gml_RoomCC_hub_freezerlobby_3_Create_1806_gml_RoomCC_hub_freezerlobby_3_Create
    {
        with (dragonactor)
        {
            y += 5
            if place_meeting(x, (y + 5), obj_solid)
            {
                while (!(place_meeting(x, (y + 1), obj_solid)))
                    y++
                with (other)
                    cutscene_end_action()
            }
        }
    }
], [gml_Script_cutscene_soundeffect, sfx_groundpound], [gml_Script_cutscene_camera_shake, 5, (3 / room_speed)], [function() //gml_Script_anon_gml_RoomCC_hub_freezerlobby_3_Create_2177_gml_RoomCC_hub_freezerlobby_3_Create
    {
        with (dragonactor)
        {
            if (floor(image_index) == (image_number - 1))
            {
                sprite_index = spr_cheesedragon_idle
                with (other)
                    cutscene_end_action()
            }
        }
    }
], [gml_Script_cutscene_wait, 50], [function() //gml_Script_anon_gml_RoomCC_hub_freezerlobby_3_Create_2439_gml_RoomCC_hub_freezerlobby_3_Create
    {
        with (obj_freezerblock)
            instance_destroy()
        cutscene_end_action()
    }
], [gml_Script_cutscene_wait, 50], [gml_Script_cutscene_change_room, 632], [gml_Script_cutscene_set_player_visible, false], [gml_Script_cutscene_set_player_pos, 190, 600], [gml_Script_cutscene_soundeffect, sfx_groundpound], [gml_Script_cutscene_camera_shake, 5, (3 / room_speed)], [gml_Script_cutscene_wait, 50], [function() //gml_Script_anon_gml_RoomCC_hub_freezerlobby_3_Create_2834_gml_RoomCC_hub_freezerlobby_3_Create
    {
        with (obj_freezerblock)
            instance_destroy()
        cutscene_end_action()
    }
], [gml_Script_cutscene_wait, 50], [gml_Script_cutscene_change_room, currentroom], [gml_Script_cutscene_set_player_pos, backx, backy], [gml_Script_cutscene_set_player_visible, true], [gml_Script_cutscene_player_float, false], [function() //gml_Script_anon_gml_RoomCC_hub_freezerlobby_3_Create_3151_gml_RoomCC_hub_freezerlobby_3_Create
    {
        instance_destroy(obj_actor)
        with (obj_player)
        {
            if (object_index != obj_player2 || global.coop)
            {
                state = states.normal
                x = backtohubstartx
                y = backtohubstarty
            }
        }
        global.levelcomplete = false
        global.freezercutscene = true
        quick_ini_write_real(get_savefile_ini(), "cutscene", "freezer", true)
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