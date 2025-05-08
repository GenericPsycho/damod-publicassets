// Note added by UTMTCE: "GMS2.3 object function definitions" has been automatically enabled
depth = -500
DEBUG = false
if (parameter_count() > 2)
    DEBUG = true
if (!DEBUG)
{
    var n = parameter_count()
    for (var i = 0; i < n; i++)
    {
        var s = parameter_string(i)
        if (s == "-debug" || s == "debug")
            DEBUG = true
    }
}
if (!DEBUG)
    instance_destroy()
if DEBUG
{
    active = false
    showoverlay = false
    SET_GAME_SPEED = new DebugCommand("set_game_speed", "Sets the game speed", "<int>", function(argument0) //gml_Script_anon_gml_Object_obj_debugcontroller_Create_0_638_gml_Object_obj_debugcontroller_Create_0
    {
        game_set_speed(floor(real(argument0)), gamespeed_fps)
    }
)
    TEST_P_RANK = new DebugCommand("test_p_rank", "", "", function() //gml_Script_anon_gml_Object_obj_debugcontroller_Create_0_771_gml_Object_obj_debugcontroller_Create_0
    {
        global.collect = global.srank + 5000
        global.lap = true
        global.treasure = true
        global.secretfound = 3
        global.combodropped = false
        global.prank_enemykilled = true
        global.combotime = 60
        global.combo = 99
        global.panic = true
    }
)
    KILL_BOSS = new DebugCommand("kill_boss", "", "", function() //gml_Script_anon_gml_Object_obj_debugcontroller_Create_0_1102_gml_Object_obj_debugcontroller_Create_0
    {
        instance_destroy(obj_baddie)
    }
)
    SET_BOSS_HP = new DebugCommand("set_boss_hp", "", "<int>", function(argument0) //gml_Script_anon_gml_Object_obj_debugcontroller_Create_0_1218_gml_Object_obj_debugcontroller_Create_0
    {
        with (obj_baddie)
            elitehit = real(argument0)
    }
)
    SWITCH_CHAR = new DebugCommand("switch_char", "Switches character", "", function() //gml_Script_anon_gml_Object_obj_debugcontroller_Create_0_1361_gml_Object_obj_debugcontroller_Create_0
    {
        with (obj_player)
        {
            character = "P"
            ispeppino = (!ispeppino)
            scr_characterspr()
        }
    }
)
    FILL_GATESWITCH = new DebugCommand("gateswitchmax", "", "", function() //gml_Script_anon_gml_Object_obj_debugcontroller_Create_0_1543_gml_Object_obj_debugcontroller_Create_0
    {
        global.gateswitch = global.gateswitchmax
    }
)
    SHOW_DEBUG_OVERLAY = new DebugCommand("show_debug_overlay", "Toggles debug overlay", "", function() //gml_Script_anon_gml_Object_obj_debugcontroller_Create_0_1698_gml_Object_obj_debugcontroller_Create_0
    {
        show_debug_overlay((!showoverlay))
        showoverlay = (!showoverlay)
    }
)
    ROOMCHECK = new DebugCommand("roomcheck", "", "", function() //gml_Script_anon_gml_Object_obj_debugcontroller_Create_0_1837_gml_Object_obj_debugcontroller_Create_0
    {
        instance_create_unique(0, 0, obj_roomcheck)
    }
)
    UNLOCK_TOPPINS = new DebugCommand("unlock_toppins", "Unlocks the toppins of the given level", "<level_name_ini>", function(argument0) //gml_Script_anon_gml_Object_obj_debugcontroller_Create_0_2020_gml_Object_obj_debugcontroller_Create_0
    {
        if is_undefined(argument0)
            return;
        ini_open_from_string(obj_savesystem.ini_str)
        ini_write_real("Toppin", concat(argument0, 1), true)
        ini_write_real("Toppin", concat(argument0, 2), true)
        ini_write_real("Toppin", concat(argument0, 3), true)
        ini_write_real("Toppin", concat(argument0, 4), true)
        ini_write_real("Toppin", concat(argument0, 5), true)
        obj_savesystem.ini_str = ini_close()
        gamesave_async_save()
    }
)
    UNLOCK_BOSS_KEY = new DebugCommand("unlock_boss_key", "Unlocks the boss key of the given world (1, 2, 3, 4)", "<number>", function(argument0) //gml_Script_anon_gml_Object_obj_debugcontroller_Create_0_2597_gml_Object_obj_debugcontroller_Create_0
    {
        if is_undefined(argument0)
            return;
        argument0 = real(argument0)
        ini_open_from_string(obj_savesystem.ini_str)
        var n = concat("w", argument0, "stick")
        ini_write_real(n, "bosskey", true)
        obj_savesystem.ini_str = ini_close()
        gamesave_async_save()
    }
)
    LOCKCAMERA = new DebugCommand("lockcam", "", "", function() //gml_Script_anon_gml_Object_obj_debugcontroller_Create_0_2933_gml_Object_obj_debugcontroller_Create_0
    {
        with (obj_camera)
            lock = (!lock)
    }
)
    BOSSINVINCIBLE = new DebugCommand("bossinv", "", "", function() //gml_Script_anon_gml_Object_obj_debugcontroller_Create_0_3053_gml_Object_obj_debugcontroller_Create_0
    {
        global.boss_invincible = (!global.boss_invincible)
    }
)
    HIDETILES = new DebugCommand("hidetiles", "", "<bool>", function(argument0) //gml_Script_anon_gml_Object_obj_debugcontroller_Create_0_3183_gml_Object_obj_debugcontroller_Create_0
    {
        if is_undefined(argument0)
            global.hidetiles = (!global.hidetiles)
        else
            global.hidetiles = argument0
        layer_set_visible("Tiles_BG", (!global.hidetiles))
        layer_set_visible("Tiles_BG2", (!global.hidetiles))
        layer_set_visible("Tiles_BG3", (!global.hidetiles))
        layer_set_visible("Tiles_1", (!global.hidetiles))
        layer_set_visible("Tiles_2", (!global.hidetiles))
        layer_set_visible("Tiles_3", (!global.hidetiles))
        layer_set_visible("Tiles_4", (!global.hidetiles))
        layer_set_visible("Tiles_Foreground1", (!global.hidetiles))
        layer_set_visible("Tiles_Foreground2", (!global.hidetiles))
        layer_set_visible("Tiles_Foreground3", (!global.hidetiles))
    }
)
    THROWARC = new DebugCommand("throwarc", "", "<bool>", function(argument0) //gml_Script_anon_gml_Object_obj_debugcontroller_Create_0_3944_gml_Object_obj_debugcontroller_Create_0
    {
        if is_undefined(argument0)
            global.throwarc = (!global.throwarc)
        else
            global.throwarc = argument0
    }
)
    GOTOEDITOR = new DebugCommand("editor", "", "", function() //gml_Script_anon_gml_Object_obj_debugcontroller_Create_0_4135_gml_Object_obj_debugcontroller_Create_0
    {
        with (obj_player)
        {
            targetRoom = editor_room
            targetDoor = "A"
        }
        instance_create_unique(0, 0, obj_fadeout)
    }
)
    NOCLIP = new DebugCommand("noclip", "", "", function() //gml_Script_anon_gml_Object_obj_debugcontroller_Create_0_4333_gml_Object_obj_debugcontroller_Create_0
    {
        with (obj_player1)
            state = states.debugstate
    }
)
    GIVEKEY = new DebugCommand("givekey", "", "", function() //gml_Script_anon_gml_Object_obj_debugcontroller_Create_0_4489_gml_Object_obj_debugcontroller_Create_0
    {
        global.key_inv = true
    }
)
    LOADTEST = new DebugCommand("loadtest", "", "", function() //gml_Script_anon_gml_Object_obj_debugcontroller_Create_0_4599_gml_Object_obj_debugcontroller_Create_0
    {
        with (obj_debugcontroller)
        {
            self.DoCommand("player_room rm_testing4 A")
            alarm[0] = 20
        }
    }
)
    OTHERTEST = new DebugCommand("othertest", "", "", function() //gml_Script_anon_gml_Object_obj_debugcontroller_Create_0_4862_gml_Object_obj_debugcontroller_Create_0
    {
        with (obj_debugcontroller)
        {
            self.DoCommand("showcollisions 1")
            self.DoCommand("player_room rm_testing4 A")
            self.DoCommand("switch_char")
            alarm[0] = 20
        }
    }
)
    SETCOMBO = new DebugCommand("set_combo", "Set the combo", "<combo> <combotime:optional>", function(argument0, argument1) //gml_Script_anon_gml_Object_obj_debugcontroller_Create_0_5197_gml_Object_obj_debugcontroller_Create_0
    {
        if (argument0 == undefined)
            return;
        if (argument1 == undefined)
            argument1 = 60
        global.combo = real(argument0)
        global.combotime = real(argument1)
        with (obj_player)
            supercharge = 10
    }
)
    GIVEHEAT = new DebugCommand("giveheat", "Gives heat", "", function() //gml_Script_anon_gml_Object_obj_debugcontroller_Create_0_5565_gml_Object_obj_debugcontroller_Create_0
    {
        global.style += 100
    }
)
    ALLTOPPINS = new DebugCommand("alltoppins", "Adds all the toppins", "", function() //gml_Script_anon_gml_Object_obj_debugcontroller_Create_0_5704_gml_Object_obj_debugcontroller_Create_0
    {
        if (!instance_exists(obj_pizzakincheese))
            instance_create(obj_player1.x, obj_player1.y, obj_pizzakincheese)
        if (!instance_exists(obj_pizzakintomato))
            instance_create(obj_player1.x, obj_player1.y, obj_pizzakintomato)
        if (!instance_exists(obj_pizzakinsausage))
            instance_create(obj_player1.x, obj_player1.y, obj_pizzakinsausage)
        if (!instance_exists(obj_pizzakinpineapple))
            instance_create(obj_player1.x, obj_player1.y, obj_pizzakinpineapple)
        if (!instance_exists(obj_pizzakinshroom))
            instance_create(obj_player1.x, obj_player1.y, obj_pizzakinshroom)
        global.cheesefollow = true
        global.tomatofollow = true
        global.sausagefollow = true
        global.pineapplefollow = true
        global.shroomfollow = true
    }
)
    PANIC = new DebugCommand("panic", "Toggles pizza time", "<fill>", function(argument0) //gml_Script_anon_gml_Object_obj_debugcontroller_Create_0_6601_gml_Object_obj_debugcontroller_Create_0
    {
        if (argument0 != undefined && argument0 != "")
            argument0 = self.get_number_string(argument0)
        else
            argument0 = 4000
        global.panic = (!global.panic)
        global.fill = argument0
        if global.panic
            obj_camera.alarm[1] = 60
        obj_tv.chunkmax = global.fill
    }
)
    SHOW_COLLISIONS = new DebugCommand("showcollisions", "Shows the collisions", "<bool>", function(argument0) //gml_Script_anon_gml_Object_obj_debugcontroller_Create_0_7054_gml_Object_obj_debugcontroller_Create_0
    {
        if (argument0 == undefined)
            return;
        argument0 = self.get_bool(argument0)
        if (argument0 != undefined)
        {
            showcollisions = argument0
            event_perform(ev_other, ev_room_start)
        }
    }
)
    SHOW_HUD = new DebugCommand("showhud", "Shows the HUD", "<bool>", function(argument0) //gml_Script_anon_gml_Object_obj_debugcontroller_Create_0_7407_gml_Object_obj_debugcontroller_Create_0
    {
        if (argument0 == undefined)
            return;
        argument0 = self.get_bool(argument0)
        show_debug_message((!argument0))
        if (argument0 != undefined)
        {
            showhud = argument0
            with (obj_tv)
            {
                visible = argument0
                show_debug_message(visible)
            }
            with (obj_camera)
            {
                visible = argument0
                show_debug_message(visible)
            }
            with (obj_roomname)
            {
                visible = argument0
                show_debug_message(visible)
            }
            with (obj_pigtotal)
            {
                visible = argument0
                show_debug_message(visible)
            }
        }
    }
)
    PLAYER_ROOM = new DebugCommand("player_room", "Go to given room", "<targetRoom> <targetDoor>", function(argument0, argument1) //gml_Script_anon_gml_Object_obj_debugcontroller_Create_0_8258_gml_Object_obj_debugcontroller_Create_0
    {
        if (argument0 == undefined)
            return;
        if (argument1 == undefined)
            return;
        argument0 = asset_get_index(argument0)
        if (argument0 == -1)
            return;
        with (obj_player)
        {
            targetRoom = argument0
            targetDoor = argument1
        }
        instance_create(x, y, obj_fadeout)
    }
)
    CAMERA_ZOOM = new DebugCommand("camera_zoom", "Zoom", "<targetzoom> <spd>", function(argument0, argument1) //gml_Script_anon_gml_Object_obj_debugcontroller_Create_0_8816_gml_Object_obj_debugcontroller_Create_0
    {
        if (argument0 == undefined)
            return;
        if (argument1 != undefined)
            argument1 = self.get_number_string(argument1)
        with (obj_camera)
        {
            targetzoom = argument0
            targetzoom = clamp(targetzoom, 0, max_zoom)
            if (argument1 != undefined)
                zoomspd = abs(argument1)
        }
    }
)
    DESTROYICE = new DebugCommand("destroyice", "", "", function() //gml_Script_anon_gml_Object_obj_debugcontroller_Create_0_9280_gml_Object_obj_debugcontroller_Create_0
    {
        instance_destroy(obj_iceblock)
        instance_destroy(obj_iceblockslope)
    }
)
    HARDMODE = new DebugCommand("hardmode", "Toggles hardmode", "<bool>", function(argument0) //gml_Script_anon_gml_Object_obj_debugcontroller_Create_0_9477_gml_Object_obj_debugcontroller_Create_0
    {
        if (argument0 == undefined)
            return;
        argument0 = self.get_bool(argument0)
        show_debug_message((!argument0))
        if (argument0 != undefined)
        {
            global.hardmode = argument0
            with (obj_hardmode)
                event_perform(ev_other, ev_room_start)
        }
    }
)
    PLAYER_SET_STATE = new DebugCommand("player_set_state", "Changes the player state", "<states.state>", function(argument0) //gml_Script_anon_gml_Object_obj_debugcontroller_Create_0_9967_gml_Object_obj_debugcontroller_Create_0
    {
        if (argument0 == undefined)
            return;
        argument0 = ds_map_find_value(state_map, argument0)
        if (!is_undefined(argument0))
        {
            with (obj_player)
            {
                if (object_index == obj_player1 || global.coop)
                {
                    state = argument0
                    var _spr = sprite_index
                    switch argument0
                    {
                        case states.normal:
                            _spr = spr_idle
                            break
                        case (24 << 0):
                            _spr = spr_cheesepep_idle
                            break
                        case (47 << 0):
                            _spr = spr_knightpepidle
                            break
                        case (10 << 0):
                            _spr = spr_firemouth
                            break
                        case (191 << 0):
                            _spr = spr_player_ratmountidle
                            break
                    }

                    sprite_index = _spr
                    image_index = 0
                }
            }
        }
    }
)
    active = false
    showcollisions = false
    showhud = true
    state_map = ds_map_create()
    ds_map_set(state_map, "states.normal", (0 << 0))
    ds_map_set(state_map, "states.cheesepep", (24 << 0))
    ds_map_set(state_map, "states.knightpep", (47 << 0))
    ds_map_set(state_map, "states.firemouth", (10 << 0))
    ds_map_set(state_map, "states.ratmount", (191 << 0))
    command_list = ds_list_create()
    ds_list_add(command_list, DESTROYICE, SET_GAME_SPEED, SHOW_HUD, SHOW_COLLISIONS, PLAYER_ROOM, CAMERA_ZOOM, HARDMODE, PLAYER_SET_STATE, PANIC, ALLTOPPINS, GIVEHEAT, ROOMCHECK, SWITCH_CHAR, SET_BOSS_HP)
    ds_list_add(command_list, OTHERTEST, KILL_BOSS, TEST_P_RANK, FILL_GATESWITCH, SETCOMBO, GIVEKEY, LOADTEST, NOCLIP, THROWARC, HIDETILES, LOCKCAMERA, BOSSINVINCIBLE, UNLOCK_TOPPINS, UNLOCK_BOSS_KEY, SHOW_DEBUG_OVERLAY, GOTOEDITOR)
    input_text = ""
    text_list = ds_list_create()
    search_commands = ds_list_create()
    ds_list_clear(search_commands)
    search_w = 0
    keyboard_string = ""
    function FindCommand(argument0) //gml_Script_FindCommand_gml_Object_obj_debugcontroller_Create_0
    {
        for (var i = 0; i < ds_list_size(command_list); i++)
        {
            var b = ds_list_find_value(command_list, i)
            if (b.command_id == argument0)
                return b;
        }
        return undefined;
    }

    function DoCommand(argument0) //gml_Script_DoCommand_gml_Object_obj_debugcontroller_Create_0
    {
        var commands = string_split(argument0, " ")
        trace(commands)
        if (array_length(commands) > 0)
        {
            var c = self.FindCommand(commands[0])
            if (c != undefined)
            {
                TextList_Add((1 << 0), argument0)
                array_delete(commands, 0, 1)
                c.Invoke(commands)
                return true;
            }
            else
            {
                TextList_Add((0 << 0), argument0)
                TextList_Add((3 << 0), "Invalid command")
            }
        }
        else
        {
            TextList_Add((0 << 0), argument0)
            TextList_Add((3 << 0), "No text typed")
        }
        return false;
    }

    function GetDouble(argument0) //gml_Script_GetDouble_gml_Object_obj_debugcontroller_Create_0
    {
        var n = string_digits(argument0)
        if (n != undefined && n != "")
        {
            n = real(argument0)
            return n;
        }
        return undefined;
    }

    function get_bool(argument0) //gml_Script_get_bool_gml_Object_obj_debugcontroller_Create_0
    {
        if (argument0 == "true")
        {
            argument0 = true
            return argument0;
        }
        else if (argument0 == "false")
        {
            argument0 = false
            return argument0;
        }
        else if is_real(real(string_digits(argument0)))
        {
            argument0 = bool(real(string_digits(argument0)))
            return argument0;
        }
        return undefined;
    }

    function get_number_string(argument0) //gml_Script_get_number_string_gml_Object_obj_debugcontroller_Create_0
    {
        var n = argument0
        if is_string(argument0)
        {
            n = real(string_digits(argument0))
            if (string_char_at(argument0, 1) == "-")
                n = (-real(string_digits(argument0)))
        }
        return n;
    }

}
