pal_swap_init_system(shd_pal_swapper)
global.roommessage = "PIZZA TOWER OF THE WEST"
global.gameframe_caption_text = lang_get_value("caption_badland")
if (!obj_secretmanager.init)
{
    obj_secretmanager.init = true
    secret_add(function() //gml_Script_anon_gml_Room_badland_1_Create_320_gml_Room_badland_1_Create
    {
        touchedtriggers = 0
    }
, function() //gml_Script_anon_gml_Room_badland_1_Create_364_gml_Room_badland_1_Create
    {
        if (touchedtriggers >= 6)
            secret_open_portal(0)
    }
)
    secret_add(-4, function() //gml_Script_anon_gml_Room_badland_1_Create_489_gml_Room_badland_1_Create
    {
        secret_open_portal(1)
    }
)
    secret_add(-4, function() //gml_Script_anon_gml_Room_badland_1_Create_579_gml_Room_badland_1_Create
    {
        if secret_check_trigger(2)
            secret_open_portal(2)
    }
)
}
