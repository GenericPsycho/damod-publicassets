event_inherited()
requires_level = true
ID = noone
items = ds_list_create()
item_height = 32
item_sprite = spr_button_nineslice
scroll = 0
selected_item = -4
dirty = true
clicked = false
surf = -4
on_item_click = function(argument0) //gml_Script_anon_gml_Object_obj_itemlist_Create_0_333_gml_Object_obj_itemlist_Create_0
{
    if (argument0 < ds_list_size(items))
    {
        if (selected_item == argument0)
            self.on_item_double_click(argument0)
        selected_item = argument0
    }
    else
        selected_item = -4
}

on_item_double_click = function(argument0) //gml_Script_anon_gml_Object_obj_itemlist_Create_0_524_gml_Object_obj_itemlist_Create_0
{
    trace("double clicked item ", argument0)
}

on_item_draw = function(argument0, argument1, argument2) //gml_Script_anon_gml_Object_obj_itemlist_Create_0_595_gml_Object_obj_itemlist_Create_0
{
    if (draw_get_font() != 0)
        draw_set_font(fnt_caption)
    draw_set_halign(fa_left)
    draw_set_valign(fa_middle)
    draw_text_color((argument0 + 12), (argument1 + item_height / 2), argument2.name, c_white, c_white, c_white, c_white, 1)
}

on_dirty = function() //gml_Script_anon_gml_Object_obj_itemlist_Create_0_872_gml_Object_obj_itemlist_Create_0
{
    trace("list dirty")
    dirty = false
}

on_left_click = function() //gml_Script_anon_gml_Object_obj_itemlist_Create_0_947_gml_Object_obj_itemlist_Create_0
{
    var yy = get_list_pos(obj_editorcursor.y)
    if (yy < 0)
        return;
    clicked = true
    self.on_item_click(yy)
}

