function toggle_panel(argument0) //gml_Script_toggle_panel
{
    var _closed = false
    with (obj_panel)
    {
        if (ID == argument0 && state == states.revolver)
            _closed = true
    }
    if _closed
    {
        with (obj_panel)
        {
            if (ID == argument0)
                state = states.normal
            else if (ID != noone)
                state = states.revolver
        }
    }
    else
    {
        with (obj_panel)
        {
            if (ID != noone)
                state = states.revolver
        }
    }
}

