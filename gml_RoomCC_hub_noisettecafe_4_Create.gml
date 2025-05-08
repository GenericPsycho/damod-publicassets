dialog[0] = dialog_create("no")
loop = true
persistent = false
scene_info = [[function() //gml_Script_anon_gml_RoomCC_hub_noisettecafe_4_Create_89_gml_RoomCC_hub_noisettecafe_4_Create
{
    if (!global.noisecutscene2)
    {
        with (obj_player)
        {
            if (x > other.x)
            {
                with (other)
                    cutscene_end_action()
            }
        }
    }
}
], [gml_Script_cutscene_set_player_actor], [gml_Script_cutscene_do_dialog, dialog], [gml_Script_cutscene_waitfor_dialog], [gml_Script_cutscene_set_player_actor], [gml_Script_cutscene_move_player, 600, (x - 200), 8, 12], [gml_Script_cutscene_set_player_normal]]
if (global.noisecutscene2 == -4)
    global.noisecutscene2 = quick_ini_read_real(get_savefile_ini(), "cutscene", "noise2", false)
if global.noisecutscene2
    instance_destroy()
