if (editor_state == (4 << 0))
{
    save_level_update(global.current_level.name)
    return;
}
if (editor_state == (5 << 0))
{
    load_level_update(global.current_level.name)
    return;
}
if keyboard_check_pressed(vk_f3)
{
    save_level()
    return;
}
if keyboard_check_pressed(vk_f4)
{
    load_level()
    return;
}
editor_input_update()
if (global.current_level == noone)
    return;
current_room = global.current_level.current_room
commands_update()
editor_camera_update()
switch editor_state
{
    case (1 << 0):
        instance_edit_update()
        break
}

