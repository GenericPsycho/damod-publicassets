ID = obj_noisecredit
depth = -500
state = states.normal
var _menu1 = [["New", function() //gml_Script_anon_gml_RoomCC_editor_room_9_Create_91_gml_RoomCC_editor_room_9_Create
{
    if (global.current_level != noone)
        global.current_level.destroy()
    global.current_level = new_empty_level()
    with (obj_itemlist)
        dirty = true
    toggle_panel(obj_noisecredit)
    instance_destroy(obj_editorobject)
}
], ["Edit", function() //gml_Script_anon_gml_RoomCC_editor_room_9_Create_362_gml_RoomCC_editor_room_9_Create
{
}
], ["Play", function() //gml_Script_anon_gml_RoomCC_editor_room_9_Create_396_gml_RoomCC_editor_room_9_Create
{
}
], ["Delete", function() //gml_Script_anon_gml_RoomCC_editor_room_9_Create_432_gml_RoomCC_editor_room_9_Create
{
}
]]
with (instance_create_depth(0, 0, (depth - 1), obj_itemlist))
{
    parent = other.id
    image_yscale = other.image_yscale
    dirty = false
    requires_level = false
    on_dirty = function() //gml_Script_anon_gml_RoomCC_editor_room_9_Create_636_gml_RoomCC_editor_room_9_Create
    {
        dirty = false
    }

    for (var i = 0; i < array_length(_menu1); i++)
    {
        ds_list_add(items, 
        {
            name: _menu1[i][0],
            func: _menu1[i][1]
        }
)
    }
    on_item_click = function(argument0) //gml_Script_anon_gml_RoomCC_editor_room_9_Create_818_gml_RoomCC_editor_room_9_Create
    {
        if (argument0 < ds_list_size(items))
            ds_list_find_value(items, argument0).func()
    }

}
