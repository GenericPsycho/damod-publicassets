if (!instance_exists(self))
    return;
if is_undefined(text)
{
    instance_destroy()
    return;
}
var r = string_letters(room_get_name(room))
if (global.panic && r != "towertutorial" && r != "towertutorialN")
{
    instance_destroy()
    return;
}
compiled = false
alarm[1] = 1
