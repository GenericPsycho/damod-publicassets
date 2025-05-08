depth = -99
scr_init_input()
slidecount = 0
slidebuffer = 0
bg_alpha = [1, 0, 0, 0, 0]
bg_x = 0
bg_y = 0
menus = []
lastmenu = 0
menu = 0
optionselected = 0
backbuffer = 0
pause_icons = array_create(0)
scr_pauseicon_add(spr_pauseicons, 4)
scr_pauseicon_add(spr_pauseicons, 5)
scr_pauseicon_add(spr_pauseicons, 6)
scr_pauseicon_add(spr_pauseicons, 7, 8, 8)
var categories = create_menu_fixed((0 << 0), (0 << 0), 0, 48, -4)
add_option_press(categories, 0, "option_audio", function() //gml_Script_anon_gml_Object_obj_option_Create_0_765_gml_Object_obj_option_Create_0
{
    menu_goto((1 << 0))
}
)
add_option_press(categories, 1, "option_video", function() //gml_Script_anon_gml_Object_obj_option_Create_0_865_gml_Object_obj_option_Create_0
{
    menu_goto((2 << 0))
}
)
add_option_press(categories, 2, "option_game", function() //gml_Script_anon_gml_Object_obj_option_Create_0_964_gml_Object_obj_option_Create_0
{
    menu_goto((6 << 0))
}
)
add_option_press(categories, 3, "option_controls", function() //gml_Script_anon_gml_Object_obj_option_Create_0_1066_gml_Object_obj_option_Create_0
{
    menu_goto((7 << 0))
}
)
array_push(menus, categories)
var audio_menu = create_menu_fixed((1 << 0), (1 << 0), 150, 40)
add_option_press(audio_menu, 0, "option_back", function() //gml_Script_anon_gml_Object_obj_option_Create_0_1301_gml_Object_obj_option_Create_0
{
    menu_goto((0 << 0))
    fmod_event_instance_stop(global.snd_slidermaster, true)
    fmod_event_instance_stop(global.snd_slidermusic, true)
    fmod_event_instance_stop(global.snd_slidersfx, true)
    set_audio_config()
}
)
add_option_slide(audio_menu, 1, "option_master", function(argument0) //gml_Script_anon_gml_Object_obj_option_Create_0_1600_gml_Object_obj_option_Create_0
{
    global.option_master_volume = argument0 / 100
    set_audio_config(false)
}
, function(argument0) //gml_Script_anon_gml_Object_obj_option_Create_0_1690_gml_Object_obj_option_Create_0
{
    global.option_master_volume = argument0 / 100
    set_audio_config()
}
, "event:/sfx/ui/slidersfxmaster").value = global.option_master_volume * 100
add_option_slide(audio_menu, 2, "option_music", function(argument0) //gml_Script_anon_gml_Object_obj_option_Create_0_1902_gml_Object_obj_option_Create_0
{
    global.option_music_volume = argument0 / 100
    set_audio_config(false)
}
, function(argument0) //gml_Script_anon_gml_Object_obj_option_Create_0_1991_gml_Object_obj_option_Create_0
{
    global.option_music_volume = argument0 / 100
    set_audio_config()
}
, "event:/sfx/ui/slidermusic").value = global.option_music_volume * 100
add_option_slide(audio_menu, 3, "option_sfx", function(argument0) //gml_Script_anon_gml_Object_obj_option_Create_0_2195_gml_Object_obj_option_Create_0
{
    global.option_sfx_volume = argument0 / 100
    set_audio_config(false)
}
, function(argument0) //gml_Script_anon_gml_Object_obj_option_Create_0_2282_gml_Object_obj_option_Create_0
{
    global.option_sfx_volume = argument0 / 100
    set_audio_config()
}
, "event:/sfx/ui/slidersfx").value = global.option_sfx_volume * 100
add_option_toggle(audio_menu, 4, "option_unfocus", function(argument0) //gml_Script_anon_gml_Object_obj_option_Create_0_2498_gml_Object_obj_option_Create_0
{
    ini_open_from_string(obj_savesystem.ini_str_options)
    ini_write_real("Option", "unfocus_mute", argument0)
    obj_savesystem.ini_str_options = ini_close()
    global.option_unfocus_mute = argument0
}
).value = global.option_unfocus_mute
array_push(menus, audio_menu)
var video_menu = create_menu_fixed((2 << 0), (1 << 0), 150, 40)
add_option_press(video_menu, 0, "option_back", function() //gml_Script_anon_gml_Object_obj_option_Create_0_2935_gml_Object_obj_option_Create_0
{
    menu_goto((0 << 0))
}
)
if (!steam_utils_is_steam_running_on_steam_deck())
{
    add_option_press(video_menu, 1, "option_window_mode", function() //gml_Script_anon_gml_Object_obj_option_Create_0_3113_gml_Object_obj_option_Create_0
    {
        menu_goto((3 << 0))
    }
)
    var res = []
    for (var i = 0; i < array_length(global.resolutions[obj_screensizer.aspect_ratio]); i++)
    {
        var b = global.resolutions[obj_screensizer.aspect_ratio][i]
        array_push(res, create_option_value(concat(b[0], "X", b[1]), i, false))
    }
    add_option_multiple(video_menu, 2, "option_resolution", res, function(argument0) //gml_Script_anon_gml_Object_obj_option_Create_0_3466_gml_Object_obj_option_Create_0
    {
        ini_open_from_string(obj_savesystem.ini_str_options)
        ini_write_real("Option", "resolution", argument0)
        obj_savesystem.ini_str_options = ini_close()
        global.option_resolution = argument0
        screen_apply_size()
    }
).value = global.option_resolution
}
add_option_toggle(video_menu, 3, "option_vsync", function(argument0) //gml_Script_anon_gml_Object_obj_option_Create_0_3806_gml_Object_obj_option_Create_0
{
    ini_open_from_string(obj_savesystem.ini_str_options)
    ini_write_real("Option", "vsync", argument0)
    obj_savesystem.ini_str_options = ini_close()
    global.option_vsync = argument0
    screen_apply_vsync()
}
).value = global.option_vsync
add_option_toggle(video_menu, 4, "option_texfilter", function(argument0) //gml_Script_anon_gml_Object_obj_option_Create_0_4123_gml_Object_obj_option_Create_0
{
    ini_open_from_string(obj_savesystem.ini_str_options)
    ini_write_real("Option", "texfilter", argument0)
    obj_savesystem.ini_str_options = ini_close()
    global.option_texfilter = argument0
}
).value = global.option_texfilter
add_option_toggle(video_menu, 5, "option_hud", function(argument0) //gml_Script_anon_gml_Object_obj_option_Create_0_4411_gml_Object_obj_option_Create_0
{
    ini_open_from_string(obj_savesystem.ini_str_options)
    ini_write_real("Option", "hud", argument0)
    obj_savesystem.ini_str_options = ini_close()
    global.option_hud = argument0
}
).value = global.option_hud
array_push(menus, video_menu)
var window_menu = create_menu_fixed((3 << 0), (1 << 0), 150, 40, (2 << 0))
add_option_press(window_menu, 0, "option_back", function() //gml_Script_anon_gml_Object_obj_option_Create_0_4844_gml_Object_obj_option_Create_0
{
    menu_goto((2 << 0))
}
)
add_option_press(window_menu, 1, "option_windowed", function() //gml_Script_anon_gml_Object_obj_option_Create_0_4948_gml_Object_obj_option_Create_0
{
    screen_option_apply_fullscreen(0)
    screen_apply_size_delayed()
}
)
add_option_press(window_menu, 2, "option_fullscreen", function() //gml_Script_anon_gml_Object_obj_option_Create_0_5089_gml_Object_obj_option_Create_0
{
    screen_option_apply_fullscreen(1)
    screen_apply_size_delayed()
}
)
add_option_press(window_menu, 3, "option_borderless", function() //gml_Script_anon_gml_Object_obj_option_Create_0_5232_gml_Object_obj_option_Create_0
{
    screen_option_apply_fullscreen(2)
    screen_apply_size_delayed()
}
)
array_push(menus, window_menu)
var resolution_menu = create_menu_fixed((4 << 0), (1 << 0), 150, 40, (2 << 0))
add_option_press(resolution_menu, 0, "option_back", function() //gml_Script_anon_gml_Object_obj_option_Create_0_5539_gml_Object_obj_option_Create_0
{
    menu_goto((2 << 0))
}
)
for (i = 0; i < array_length(global.resolutions[obj_screensizer.aspect_ratio]); i++)
{
    b = global.resolutions[obj_screensizer.aspect_ratio][i]
    add_option_press(resolution_menu, (i + 1), concat(b[0], "X", b[1]), function() //gml_Script_anon_gml_Object_obj_option_Create_0_5807_gml_Object_obj_option_Create_0
    {
        var opt = global.option_resolution
        global.option_resolution = menus[menu].options[optionselected].option_id - 1
        screen_apply_size()
        with (instance_create(0, 0, obj_screenconfirm))
        {
            savedoption = opt
            section = "Option"
            key = "resolution"
            varname = "option_resolution"
            depth = obj_option.depth - 1
        }
    }
).localization = false
}
array_push(menus, resolution_menu)
var game_menu = create_menu_fixed((6 << 0), (1 << 0), 150, 40)
add_option_press(game_menu, 0, "option_back", function() //gml_Script_anon_gml_Object_obj_option_Create_0_6379_gml_Object_obj_option_Create_0
{
    menu_goto((0 << 0))
}
)
if (room == Mainmenu)
    add_option_press(game_menu, 1, "option_lang", function() //gml_Script_anon_gml_Object_obj_option_Create_0_6517_gml_Object_obj_option_Create_0
    {
        obj_option.key_jump = false
        instance_create_unique(0, 0, obj_langselect)
    }
)
add_option_toggle(game_menu, 2, "option_vibration", function(argument0) //gml_Script_anon_gml_Object_obj_option_Create_0_7044_gml_Object_obj_option_Create_0
{
    ini_open_from_string(obj_savesystem.ini_str_options)
    ini_write_real("Option", "vibration", argument0)
    obj_savesystem.ini_str_options = ini_close()
    global.option_vibration = argument0
}
).value = global.option_vibration
add_option_toggle(game_menu, 3, "option_screenshake", function(argument0) //gml_Script_anon_gml_Object_obj_option_Create_0_7363_gml_Object_obj_option_Create_0
{
    ini_open_from_string(obj_savesystem.ini_str_options)
    ini_write_real("Option", "screenshake", argument0)
    obj_savesystem.ini_str_options = ini_close()
    global.option_screenshake = argument0
}
).value = global.option_screenshake
add_option_toggle(game_menu, 4, "option_timer", function(argument0) //gml_Script_anon_gml_Object_obj_option_Create_0_7670_gml_Object_obj_option_Create_0
{
    ini_open_from_string(obj_savesystem.ini_str_options)
    ini_write_real("Option", "timer", argument0)
    obj_savesystem.ini_str_options = ini_close()
    global.option_timer = argument0
}
).value = global.option_timer
add_option_multiple(game_menu, 5, "option_timer_type", [create_option_value("option_timer_level", 0), create_option_value("option_timer_save", 1), create_option_value("option_timer_levelsave", 2)], function(argument0) //gml_Script_anon_gml_Object_obj_option_Create_0_8103_gml_Object_obj_option_Create_0
{
    ini_open_from_string(obj_savesystem.ini_str_options)
    ini_write_real("Option", "timer_type", argument0)
    obj_savesystem.ini_str_options = ini_close()
    global.option_timer_type = argument0
}
).value = global.option_timer_type
add_option_toggle(game_menu, 6, "option_timer_speedrun", function(argument0) //gml_Script_anon_gml_Object_obj_option_Create_0_8423_gml_Object_obj_option_Create_0
{
    ini_open_from_string(obj_savesystem.ini_str_options)
    ini_write_real("Option", "speedrun_timer", argument0)
    obj_savesystem.ini_str_options = ini_close()
    global.option_speedrun_timer = argument0
}
).value = global.option_speedrun_timer
array_push(menus, game_menu)
var controls_menu = create_menu_fixed((7 << 0), (1 << 0), 150, 40)
add_option_press(controls_menu, 0, "option_back", function() //gml_Script_anon_gml_Object_obj_option_Create_0_8863_gml_Object_obj_option_Create_0
{
    menu_goto((0 << 0))
}
)
add_option_press(controls_menu, 1, "option_keyboard", function() //gml_Script_anon_gml_Object_obj_option_Create_0_8985_gml_Object_obj_option_Create_0
{
    menu_goto((9 << 0))
}
)
add_option_press(controls_menu, 2, "option_controller", function() //gml_Script_anon_gml_Object_obj_option_Create_0_9138_gml_Object_obj_option_Create_0
{
    menu_goto((8 << 0))
}
)
add_option_press(controls_menu, 3, "option_reset_config", function() //gml_Script_anon_gml_Object_obj_option_Create_0_9253_gml_Object_obj_option_Create_0
{
    ini_open_from_string(obj_savesystem.ini_str_options)
    ini_section_delete("Input")
    ini_section_delete("InputConfig")
    scr_initinput(false)
    obj_savesystem.ini_str_options = ini_close()
    with (obj_option)
    {
        for (var i = 0; i < array_length(menus); i++)
        {
            var b = menus[i]
            if (b.menu_id == (8 << 0) || b.menu_id == (10 << 0) || b.menu_id == (9 << 0))
            {
                for (var j = 0; j < array_length(b.options); j++)
                {
                    var q = b.options[j]
                    if (q.name == "option_deadzone")
                        q.value = global.input_controller_deadzone * 100
                    else if (q.name == "option_deadzone_h")
                        q.value = global.input_controller_deadzone_horizontal * 100
                    else if (q.name == "option_deadzone_v")
                        q.value = global.input_controller_deadzone_vertical * 100
                    else if (q.name == "option_deadzone_press")
                        q.value = global.input_controller_deadzone_press * 100
                    else if (q.name == "option_deadzone_superjump")
                        q.value = global.gamepad_deadzone_superjump * 100
                    else if (q.name == "option_deadzone_crouch")
                        q.value = global.gamepad_deadzone_crouch * 100
                    else if (q.name == "option_controller_superjump")
                        q.value = global.gamepad_superjump
                    else if (q.name == "option_controller_groundpound")
                        q.value = global.gamepad_groundpound
                    else if (q.name == "option_keyboard_superjump")
                        q.value = global.keyboard_superjump
                    else if (q.name == "option_keyboard_groundpound")
                        q.value = global.keyboard_groundpound
                }
            }
        }
    }
    with (create_transformation_tip(lang_get_value("option_controls_resetted")))
    {
        depth = -700
        alarm[1] = 100
    }
}
)
array_push(menus, controls_menu)
var keyboard_menu = create_menu_fixed((9 << 0), (1 << 0), 150, 40, (7 << 0))
add_option_press(keyboard_menu, 0, "option_back", function() //gml_Script_anon_gml_Object_obj_option_Create_0_11206_gml_Object_obj_option_Create_0
{
    menu_goto((7 << 0))
}
)
add_option_press(keyboard_menu, 1, "option_controller_binds", function(argument0) //gml_Script_anon_gml_Object_obj_option_Create_0_11323_gml_Object_obj_option_Create_0
{
    obj_option.key_jump = false
    instance_create_unique(0, 0, obj_keyconfig)
}
)
add_option_toggle(keyboard_menu, 2, "option_keyboard_superjump", function(argument0) //gml_Script_anon_gml_Object_obj_option_Create_0_11489_gml_Object_obj_option_Create_0
{
    global.keyboard_superjump = argument0
    set_controller_config()
}
).value = global.keyboard_superjump
add_option_toggle(keyboard_menu, 3, "option_keyboard_groundpound", function(argument0) //gml_Script_anon_gml_Object_obj_option_Create_0_11676_gml_Object_obj_option_Create_0
{
    global.keyboard_groundpound = argument0
    set_controller_config()
}
).value = global.keyboard_groundpound
array_push(menus, keyboard_menu)
var controller_menu = create_menu_fixed((8 << 0), (1 << 0), 150, 40, (7 << 0))
add_option_press(controller_menu, 0, "option_back", function() //gml_Script_anon_gml_Object_obj_option_Create_0_12018_gml_Object_obj_option_Create_0
{
    menu_goto((7 << 0))
}
)
add_option_press(controller_menu, 1, "option_controller_binds", function(argument0) //gml_Script_anon_gml_Object_obj_option_Create_0_12137_gml_Object_obj_option_Create_0
{
    obj_option.key_jump = false
    with (instance_create_unique(0, 0, obj_keyconfig))
        controller = true
}
)
add_option_press(controller_menu, 2, "option_deadzone_title", function(argument0) //gml_Script_anon_gml_Object_obj_option_Create_0_12335_gml_Object_obj_option_Create_0
{
    menu_goto((10 << 0))
}
)
add_option_toggle(controller_menu, 3, "option_controller_superjump", function(argument0) //gml_Script_anon_gml_Object_obj_option_Create_0_12463_gml_Object_obj_option_Create_0
{
    global.gamepad_superjump = argument0
    set_controller_config()
}
).value = global.gamepad_superjump
add_option_toggle(controller_menu, 4, "option_controller_groundpound", function(argument0) //gml_Script_anon_gml_Object_obj_option_Create_0_12652_gml_Object_obj_option_Create_0
{
    global.gamepad_groundpound = argument0
    set_controller_config()
}
).value = global.gamepad_groundpound
array_push(menus, controller_menu)
var back = (8 << 0)
var deadzones_menu = create_menu_fixed((10 << 0), (1 << 0), 150, 40, back)
add_option_press(deadzones_menu, 0, "option_back", function() //gml_Script_anon_gml_Object_obj_option_Create_0_13012_gml_Object_obj_option_Create_0
{
    menu_goto((8 << 0))
}
)
add_option_slide(deadzones_menu, 1, "option_deadzone", function(argument0) //gml_Script_anon_gml_Object_obj_option_Create_0_13124_gml_Object_obj_option_Create_0
{
    if (argument0 > 90)
        argument0 = 90
    global.input_controller_deadzone = argument0 / 100
    trace(argument0 / 100)
    set_controller_config()
}
).value = global.input_controller_deadzone * 100
add_option_slide(deadzones_menu, 2, "option_deadzone_h", function(argument0) //gml_Script_anon_gml_Object_obj_option_Create_0_13372_gml_Object_obj_option_Create_0
{
    if (argument0 > 90)
        argument0 = 90
    global.input_controller_deadzone_horizontal = argument0 / 100
    trace(argument0 / 100)
    set_controller_config()
}
).value = global.input_controller_deadzone_horizontal * 100
add_option_slide(deadzones_menu, 3, "option_deadzone_v", function(argument0) //gml_Script_anon_gml_Object_obj_option_Create_0_13642_gml_Object_obj_option_Create_0
{
    if (argument0 > 90)
        argument0 = 90
    global.input_controller_deadzone_vertical = argument0 / 100
    trace(argument0 / 100)
    set_controller_config()
}
).value = global.input_controller_deadzone_vertical * 100
add_option_slide(deadzones_menu, 4, "option_deadzone_press", function(argument0) //gml_Script_anon_gml_Object_obj_option_Create_0_13912_gml_Object_obj_option_Create_0
{
    if (argument0 > 90)
        argument0 = 90
    global.input_controller_deadzone_press = argument0 / 100
    trace(argument0 / 100)
    set_controller_config()
}
).value = global.input_controller_deadzone_press * 100
add_option_slide(deadzones_menu, 5, "option_deadzone_superjump", function(argument0) //gml_Script_anon_gml_Object_obj_option_Create_0_14180_gml_Object_obj_option_Create_0
{
    global.gamepad_deadzone_superjump = argument0 / 100
    set_controller_config()
    trace(argument0 / 100)
}
).value = global.gamepad_deadzone_superjump * 100
add_option_slide(deadzones_menu, 5, "option_deadzone_crouch", function(argument0) //gml_Script_anon_gml_Object_obj_option_Create_0_14406_gml_Object_obj_option_Create_0
{
    global.gamepad_deadzone_crouch = argument0 / 100
    set_controller_config()
    trace(argument0 / 100)
}
).value = global.gamepad_deadzone_crouch * 100
array_push(menus, deadzones_menu)
