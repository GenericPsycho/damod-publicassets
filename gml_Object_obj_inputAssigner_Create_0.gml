// Note added by UTMTCE: "GMS2.3 object function definitions" has been automatically enabled
player_input_device[0] = -2
player_input_device[1] = -2
switch_input_buffer = 0
switch_operation_mode = switch_get_operation_mode()
switch_swap_ready_buffer = 0
swap_cancelled = false
switch_mode = 0
switch_saved_input = -2
mode = 0
player_index = 0
device_selected[0] = false
device_selected[1] = false
press_start = false
deactivated = false
device_to_reconnect = 0
instance_list = ds_list_create()
sound_list = ds_list_create()
prevstate[0] = states.titlescreen
prevstate[1] = states.titlescreen
vibration[0][0] = 0
vibration[0][1] = 0
vibration[0][2] = 0
vibration[1][0] = 0
vibration[1][1] = 0
vibration[1][2] = 0
switch_get_single_player = function(argument0) //gml_Script_anon_gml_Object_obj_inputAssigner_Create_0_931_gml_Object_obj_inputAssigner_Create_0
{
    while true
    {
        switch_controller_joycon_set_holdtype(1)
        switch_controller_set_supported_styles(31)
        switch_controller_support_set_singleplayer_only(true)
        switch_controller_support_set_player_min(1)
        switch_controller_support_set_player_max(1)
        var result = switch_controller_support_show()
        if (result == 0)
        {
            player_input_device[argument0] = switch_controller_support_get_selected_id()
            break
        }
    }
}

for (var i = 0; i < gamepad_get_device_count(); i++)
{
    if gamepad_is_connected(i)
    {
        device_selected[0] = true
        player_input_device[0] = i
        press_start = false
    }
}
setVibration = function(argument0, argument1, argument2, argument3) //gml_Script_anon_gml_Object_obj_inputAssigner_Create_0_1828_gml_Object_obj_inputAssigner_Create_0
{
    vibration[argument0][0] = argument1
    vibration[argument0][1] = argument2
    if (argument3 != undefined)
        vibration[argument0][2] = argument3
}

function CheckUsedIndex(argument0) //gml_Script_CheckUsedIndex_gml_Object_obj_inputAssigner_Create_0
{
    for (var _x = 0; _x < 2; _x++)
    {
        if (player_input_device[_x] == argument0)
            return true;
    }
    return false;
}

