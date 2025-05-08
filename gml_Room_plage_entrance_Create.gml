pal_swap_init_system(shd_pal_swapper)
global.roommessage = "PIZZA TOWER ISLAND"
global.gameframe_caption_text = lang_get_value("caption_plage")
if (!obj_secretmanager.init)
{
    obj_secretmanager.init = true
    secret_add(-4, function() //gml_Script_anon_gml_Room_plage_entrance_Create_316_gml_Room_plage_entrance_Create
    {
        if secret_check_trigger(1)
            secret_open_portal(1)
        else
            secret_close_portal(1)
    }
)
    secret_add(function() //gml_Script_anon_gml_Room_plage_entrance_Create_484_gml_Room_plage_entrance_Create
    {
        touchedtriggers = 0
    }
, function() //gml_Script_anon_gml_Room_plage_entrance_Create_528_gml_Room_plage_entrance_Create
    {
        if (touchedtriggers >= 6)
            secret_open_portal(0)
    }
)
}
