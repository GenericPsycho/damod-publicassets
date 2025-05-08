pal_swap_init_system(shd_pal_swapper)
global.roommessage = "PIZZA TOWER ISLAND"
global.gameframe_caption_text = lang_get_value("caption_saloon")
if (!obj_secretmanager.init)
{
    obj_secretmanager.init = true
    secret_add(function() //gml_Script_anon_gml_Room_saloon_1_Create_262_gml_Room_saloon_1_Create
    {
        touchedtriggers = 0
    }
, function() //gml_Script_anon_gml_Room_saloon_1_Create_306_gml_Room_saloon_1_Create
    {
        if (touchedtriggers >= 6)
            secret_open_portal(0)
    }
)
    secret_add(-4, function() //gml_Script_anon_gml_Room_saloon_1_Create_431_gml_Room_saloon_1_Create
    {
        if secret_check_trigger(1)
            secret_open_portal(1)
    }
)
}
