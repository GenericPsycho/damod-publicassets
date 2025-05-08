ID = obj_doorRobot
with (instance_create_depth(0, 0, (depth - 1), obj_itemlist))
{
    parent = other.id
    ID = obj_doorRobot
    image_xscale = other.image_xscale
    image_yscale = other.image_yscale
    value = noone
    item_height = 32
    on_dirty = function() //gml_Script_anon_gml_RoomCC_editor_room_7_Create_299_gml_RoomCC_editor_room_7_Create
    {
        dirty = false
        ds_list_clear(items)
        ds_list_copy(items, obj_editor.backgrounds_list)
    }

    on_item_click = function(argument0) //gml_Script_anon_gml_RoomCC_editor_room_7_Create_433_gml_RoomCC_editor_room_7_Create
    {
        if (argument0 < ds_list_size(items))
        {
            var _room = global.current_level.current_room
            if (_room == noone)
                return;
            var _arr = _room.backgrounds
            var i = 0
            while (i < array_length(_arr))
            {
                var b = _arr[i]
                if (b.depth == value.depth)
                {
                    b.sprite_index = ds_list_find_value(items, argument0)
                    break
                }
                else
                    i++
            }
        }
    }

    on_item_draw = function(argument0, argument1, argument2, argument3) //gml_Script_anon_gml_RoomCC_editor_room_7_Create_811_gml_RoomCC_editor_room_7_Create
    {
        var a = 1
        if (argument3 > 0)
            a = 0.5
        draw_sprite_ext(spr_emptybg, 0, argument0, argument1, (sprite_width / 64), (item_height / 64), 0, c_white, a)
        var scale = sprite_width / sprite_get_width(argument2)
        var sx = 0
        var bb_top = sprite_get_bbox_top(argument2)
        var bb_bottom = sprite_get_bbox_bottom(argument2)
        var sy = bb_top + (bb_bottom - bb_top) / 4
        draw_sprite_part_ext(argument2, 0, sx, sy, (sprite_width / scale), (item_height / scale), argument0, argument1, scale, scale, c_white, a)
    }

}
