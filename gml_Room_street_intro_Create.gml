pal_swap_init_system(shd_pal_swapper)
global.roommessage = "PIZZA TOWER ISLAND"
global.gameframe_caption_text = lang_get_value("caption_street")
with (obj_secretbigblock)
    particlespr = spr_streetdebris
var lay_id = layer_get_id("Assets_1")
var pep = layer_sprite_get_id(lay_id, "peppinotv")
var noise = layer_sprite_get_id(lay_id, "noisetv")
if obj_player1.ispeppino
{
    layer_sprite_alpha(pep, 1)
    layer_sprite_alpha(noise, 0)
}
else
{
    layer_sprite_alpha(pep, 0)
    layer_sprite_alpha(noise, 1)
}
if (!obj_secretmanager.init)
{
    obj_secretmanager.init = true
    secret_add(function() //gml_Script_anon_gml_Room_street_intro_Create_643_gml_Room_street_intro_Create
    {
        touchedtriggers = 0
    }
, function() //gml_Script_anon_gml_Room_street_intro_Create_687_gml_Room_street_intro_Create
    {
        if (touchedtriggers >= 6)
            secret_open_portal(0)
    }
)
    secret_add(-4, function() //gml_Script_anon_gml_Room_street_intro_Create_817_gml_Room_street_intro_Create
    {
        secret_open_portal(1)
    }
)
    secret_add(-4, function() //gml_Script_anon_gml_Room_street_intro_Create_913_gml_Room_street_intro_Create
    {
        if secret_check_trigger(2)
            secret_open_portal(2)
    }
)
}
