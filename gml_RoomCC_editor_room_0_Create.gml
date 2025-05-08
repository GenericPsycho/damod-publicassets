state = states.normal
ID = noone
with (instance_create_depth(0, 0, (depth - 1), obj_button))
{
    icon = spr_editor_objects
    parent = other.id
    name = "Objects"
    on_left_click = function() //gml_Script_anon_gml_RoomCC_editor_room_0_Create_202_gml_RoomCC_editor_room_0_Create
    {
        toggle_panel(obj_doisedead)
    }

}
with (instance_create_depth(0, 64, (depth - 1), obj_button))
{
    icon = spr_editor_tiles
    parent = other.id
    name = "Tiles"
    on_left_click = function() //gml_Script_anon_gml_RoomCC_editor_room_0_Create_429_gml_RoomCC_editor_room_0_Create
    {
        toggle_panel(obj_bosskeynoise)
    }

}
with (instance_create_depth(0, 128, (depth - 1), obj_button))
{
    icon = spr_editor_bg
    parent = other.id
    name = "Backgrounds"
    on_left_click = function() //gml_Script_anon_gml_RoomCC_editor_room_0_Create_656_gml_RoomCC_editor_room_0_Create
    {
        toggle_panel(obj_hardmode)
    }

}
with (instance_create_depth(0, 192, (depth - 1), obj_button))
{
    icon = spr_editor_rooms
    parent = other.id
    name = "Rooms"
    on_left_click = function() //gml_Script_anon_gml_RoomCC_editor_room_0_Create_874_gml_RoomCC_editor_room_0_Create
    {
        toggle_panel(obj_banditochicken_dynamite)
    }

}
with (instance_create_depth(0, 256, (depth - 1), obj_button))
{
    parent = other.id
    name = "Settings"
    icon = spr_editor_settings
    on_left_click = function() //gml_Script_anon_gml_RoomCC_editor_room_0_Create_1097_gml_RoomCC_editor_room_0_Create
    {
        toggle_panel(obj_grindrailslope)
    }

}
with (instance_create_depth(0, (sprite_height - 64), (depth - 1), obj_button))
{
    name = "Menu"
    icon = spr_editor_menu
    parent = other.id
    on_left_click = function() //gml_Script_anon_gml_RoomCC_editor_room_0_Create_1341_gml_RoomCC_editor_room_0_Create
    {
        toggle_panel(obj_noisecredit)
    }

}
