pal_swap_init_system(shd_pal_swapper)
global.roommessage = "PIZZA TOWER OF HELL!"
global.gameframe_caption_text = lang_get_value("caption_dungeon")
if (!obj_secretmanager.init)
{
    obj_secretmanager.init = true
    secret_add(-4, function() //gml_Script_anon_gml_Room_dungeon_1_Create_343_gml_Room_dungeon_1_Create
    {
        secret_open_portal(0)
    }
)
    secret_add(-4, function() //gml_Script_anon_gml_Room_dungeon_1_Create_434_gml_Room_dungeon_1_Create
    {
        secret_open_portal(1)
    }
)
    secret_add(-4, function() //gml_Script_anon_gml_Room_dungeon_1_Create_527_gml_Room_dungeon_1_Create
    {
        secret_open_portal(2)
    }
)
}
