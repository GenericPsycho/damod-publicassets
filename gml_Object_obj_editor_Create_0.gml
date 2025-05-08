editor_states = ds_map_create()
editor_state = (0 << 0)
ds_map_set(editor_states, (1 << 0), function() //gml_Script_anon_gml_Object_obj_editor_Create_0_114_gml_Object_obj_editor_Create_0
{
    toggle_menu_layer(0)
}
)
ds_map_set(editor_states, (2 << 0), function() //gml_Script_anon_gml_Object_obj_editor_Create_0_191_gml_Object_obj_editor_Create_0
{
    toggle_menu_layer(1)
}
)
alarm[0] = 1
depth = 1
rooms = ds_list_create()
current_room = -4
editor_input_init()
commands_init()
editor_camera_init()
instance_edit_init()
save_level_init()
backgrounds_list = ds_list_create()
for (var i = 0; i < array_length(global.editor_data.backgrounds); i++)
    ds_list_add(backgrounds_list, asset_get_index(global.editor_data.backgrounds[i]))
for (i = 0; i < (8 << 0); i++)
{
    with (instance_create_depth(0, 0, (depth - 1), obj_roomresize))
        dock = i
}
