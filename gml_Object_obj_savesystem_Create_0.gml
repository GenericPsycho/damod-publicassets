depth = -600
if (instance_number(object_index) > 1)
{
    instance_destroy()
    return;
}
dirty = false
savegame = false
saveoptions = false
fadeoutcreate = false
showicon = false
ini_str = ""
state = states.normal
icon_index = 0
ispeppino = true
icon_max = sprite_get_number(spr_pizzaslice)
ini_open("saveData.ini")
ini_str_options = ini_close()
