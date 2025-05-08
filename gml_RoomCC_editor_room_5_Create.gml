ID = obj_grindrailslope
with (instance_create_depth(0, 0, (depth - 1), obj_itemlist))
{
    parent = other.id
    image_xscale = other.image_xscale
    image_yscale = other.image_yscale
    ds_list_add(items, 
    {
        name: "Room Settings",
        func: function() //gml_Script_anon____struct___86_gml_RoomCC_editor_room_5_Create_246____struct___86_gml_RoomCC_editor_room_5_Create
        {
            toggle_panel(obj_followcharacter)
        }
    }
)
    ds_list_add(items, 
    {
        name: "Level Settings",
        func: function() //gml_Script_anon____struct___87_gml_RoomCC_editor_room_5_Create_370____struct___87_gml_RoomCC_editor_room_5_Create
        {
        }
    }
)
    ds_list_add(items, 
    {
        name: "Save Level",
        func: function() //gml_Script_anon____struct___88_gml_RoomCC_editor_room_5_Create_451____struct___88_gml_RoomCC_editor_room_5_Create
        {
            with (obj_editor)
            {
                if (editor_state != (4 << 0))
                    save_level()
            }
        }
    }
)
    dirty = false
    on_item_click = function(argument0) //gml_Script_anon_gml_RoomCC_editor_room_5_Create_620_gml_RoomCC_editor_room_5_Create
    {
        if (argument0 < ds_list_size(items))
            ds_list_find_value(items, argument0).func()
    }

}
