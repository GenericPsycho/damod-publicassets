event_inherited()
if (!instance_exists(inst))
    return;
if ((!dragged) && obj_editor.instance_state == (0 << 0))
{
    switch dock
    {
        case (3 << 0):
            x = (inst.image_xscale > 0 ? inst.bbox_right : inst.bbox_left)
            y = inst.bbox_top
            break
        case (4 << 0):
            x = (inst.image_xscale > 0 ? inst.bbox_right : inst.bbox_left)
            y = inst.bbox_bottom - (inst.bbox_bottom - inst.bbox_top) / 2
            break
        case (5 << 0):
            x = (inst.image_xscale > 0 ? inst.bbox_right : inst.bbox_left)
            y = inst.bbox_bottom
            break
        case (0 << 0):
            x = (inst.image_xscale > 0 ? inst.bbox_left : inst.bbox_right)
            y = inst.bbox_top
            break
        case (1 << 0):
            x = (inst.image_xscale > 0 ? inst.bbox_left : inst.bbox_right)
            y = inst.bbox_bottom - (inst.bbox_bottom - inst.bbox_top) / 2
            break
        case (2 << 0):
            x = (inst.image_xscale > 0 ? inst.bbox_left : inst.bbox_right)
            y = inst.bbox_bottom
            break
        case (6 << 0):
            x = inst.bbox_left + (inst.bbox_left - inst.bbox_right) / 2
            y = inst.bbox_top
            break
        case (7 << 0):
            x = inst.bbox_left + (inst.bbox_left - inst.bbox_right) / 2
            y = inst.bbox_bottom
            break
    }

    with (obj_editor)
    {
        if (key_place && obj_editorcursor.hovered_object == other.id)
        {
            other.dragged = true
            other.oldxscale = other.inst.image_xscale
            other.oldyscale = other.inst.image_yscale
            instance_state = (2 << 0)
        }
    }
}
else if dragged
{
    var pos = editor_get_world_pos()
    x = pos[0]
    y = pos[1]
    x = clamp(x, global.current_level.current_room.x, (global.current_level.current_room.x + global.current_level.current_room.width))
    var ch = global.current_level.current_room.height
    if (ch == obj_screensizer.ideal_height)
        ch += 4
    y = clamp(y, global.current_level.current_room.y, (global.current_level.current_room.y + ch))
    with (inst)
    {
        var t = other.snap / 2
        if (!other.lock.x)
        {
            image_xscale = (snap_tile((other.x - x + t), other.snap)) / sprite_get_width(sprite_index)
            if (image_xscale > 0 || other.xclamp)
                image_xscale = max(1, image_xscale)
            else
                image_xscale = min(image_xscale, 1)
        }
        if (!other.lock.y)
        {
            image_yscale = (snap_tile((other.y - y + t), other.snap)) / sprite_get_height(sprite_index)
            image_yscale = max(1, image_yscale)
            if (image_yscale > 0 || other.yclamp)
                image_yscale = max(1, image_yscale)
            else
                image_yscale = min(image_yscale, 1)
        }
    }
    if obj_editor.key_place_released
    {
        dragged = false
        with (inst)
            command_add(new ResizeCMD(id, image_xscale, image_yscale, other.oldxscale, other.oldyscale))
        obj_editor.instance_state = (0 << 0)
    }
}