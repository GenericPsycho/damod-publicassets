pal_swap_init_system(shd_pal_swapper)
global.roommessage = "PIZZA TOWER ISLAND"
var lay_id = layer_get_id("Assets_stillBG1")
var gus = layer_sprite_get_id(lay_id, "gustv")
var noise = layer_sprite_get_id(lay_id, "noisetv2")
if obj_player1.ispeppino
{
    layer_sprite_alpha(gus, 1)
    layer_sprite_alpha(noise, 0)
}
else
{
    layer_sprite_alpha(gus, 0)
    layer_sprite_alpha(noise, 1)
}
if (!obj_secretmanager.init)
{
    obj_secretmanager.init = true
    secret_add(function() //gml_Script_anon_gml_Room_street_john_Create_515_gml_Room_street_john_Create
    {
        touchedtriggers = 0
    }
, function() //gml_Script_anon_gml_Room_street_john_Create_556_gml_Room_street_john_Create
    {
        if (touchedtriggers >= 6)
            secret_open_portal(0)
    }
)
    secret_add(-4, function() //gml_Script_anon_gml_Room_street_john_Create_678_gml_Room_street_john_Create
    {
        secret_open_portal(1)
    }
)
    secret_add(-4, function() //gml_Script_anon_gml_Room_street_john_Create_767_gml_Room_street_john_Create
    {
        if secret_check_trigger(2)
            secret_open_portal(2)
    }
)
}
