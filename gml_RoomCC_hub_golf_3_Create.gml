if (global.levelcomplete && (!global.golfcutscene))
{
    currentroom = room
    scene_info = [[function() //gml_Script_anon_gml_RoomCC_hub_golf_3_Create_97_gml_RoomCC_hub_golf_3_Create
    {
        with (obj_player)
        {
            state = states.normal
            x = backtohubstartx
            y = backtohubstarty
        }
        global.levelcomplete = false
        global.golfcutscene = true
        global.levelcompletename = -4
        quick_ini_write_real(get_savefile_ini(), "cutscene", "golf", true)
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