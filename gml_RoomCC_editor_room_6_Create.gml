ID = obj_followcharacter
with (instance_create_depth(0, 0, (depth - 1), obj_button))
{
    parent = other.id
    image_xscale = other.image_xscale
    image_yscale = 0.5
    text = "Test Room"
    on_left_click = function() //gml_Script_anon_gml_RoomCC_editor_room_6_Create_211_gml_RoomCC_editor_room_6_Create
    {
    }

}
with (instance_create_depth(0, 32, (depth - 1), obj_button))
{
    parent = other.id
    image_xscale = other.image_xscale
    image_yscale = 0.5
    text = "Resize Room"
    on_left_click = function() //gml_Script_anon_gml_RoomCC_editor_room_6_Create_441_gml_RoomCC_editor_room_6_Create
    {
        toggle_panel(obj_followcharacter)
        with (obj_editor)
            editor_state = (3 << 0)
        with (obj_editorobject)
            selected = false
    }

}
