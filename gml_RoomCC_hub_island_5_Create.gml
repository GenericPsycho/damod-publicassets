sprite_index = spr_pepperman_idle
pm_dialog[0] = [dialog_create("Seems you don't have either a bottle or a piece of paper.")]
pm_dialog[1] = [dialog_create("Beach     boat")]
pm_scene_info = [[gml_Script_cutscene_do_dialog, [dialog_create("Here you go")]], [gml_Script_cutscene_waitfor_dialog], [gml_Script_cutscene_set_player_actor], [gml_Script_cutscene_set_object_pos, 150876, 1696, 576], [gml_Script_cutscene_do_dialog, [dialog_create("Go ahead", -4, function() //gml_Script_anon_gml_RoomCC_hub_island_5_Create_442_gml_RoomCC_hub_island_5_Create
{
}
)]]]
dialog_func = function() //gml_Script_anon_gml_RoomCC_hub_island_5_Create_490_gml_RoomCC_hub_island_5_Create
{
    if ((!global.bottlecutscene) || (!global.papercutscene))
        do_dialog(pm_dialog[0])
    else if (global.beachboatcutscene == -4 || (!global.beachboatcutscene))
    {
        do_dialog_cutscene(pm_scene_info)
        global.beachboatcutscene = true
        quick_ini_write_real(get_savefile_ini(), "cutscene", "beachboat", true)
    }
    else
        do_dialog(pm_dialog[1])
}

if (global.bottlecutscene == -4)
    global.bottlecutscene = quick_ini_read_real(get_savefile_ini(), "cutscene", "bottle", false)
if (global.papercutscene == -4)
    global.papercutscene = quick_ini_read_real(get_savefile_ini(), "cutscene", "paper", false)
if (global.beachboatcutscene == -4)
    global.beachboatcutscene = quick_ini_read_real(get_savefile_ini(), "cutscene", "beachboat", false)
if (global.beachcutscene == -4)
    global.beachcutscene = quick_ini_read_real(get_savefile_ini(), "cutscene", "beach", false)
if global.beachcutscene
    instance_destroy()
