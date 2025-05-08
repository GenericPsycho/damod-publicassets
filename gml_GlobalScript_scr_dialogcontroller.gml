function scr_get_tutorial_key(argument0) //gml_Script_scr_get_tutorial_key
{
    var spr = -4
    var ix = 0
    var txt = -4
    switch argument0
    {
        case 37:
            spr = global.spr_gamepadbuttons
            ix = 16
            break
        case 39:
            spr = global.spr_gamepadbuttons
            ix = 17
            break
        case 38:
            spr = global.spr_gamepadbuttons
            ix = 4
            break
        case 40:
            spr = global.spr_gamepadbuttons
            ix = 5
            break
        case 16:
        case 160:
            spr = spr_tutorialkeyspecial
            ix = 0
            break
        case 17:
        case 162:
            spr = spr_tutorialkeyspecial
            ix = 1
            break
        case 32:
            spr = spr_tutorialkeyspecial
            ix = 2
            break
        default:
            spr = spr_tutorialkey
            ix = 0
            txt = chr(argument0)
            break
    }

    return [spr, ix, txt];
}

function scr_string_width(argument0) //gml_Script_scr_string_width
{
    var pos = 0
    var w = 0
    var originalstr = argument0
    var str_arr = array_create(0)
    while (pos < string_length(originalstr))
    {
        if (string_copy(originalstr, pos, 2) == "\n")
        {
            array_push(str_arr, string_copy(originalstr, 1, pos))
            string_delete(originalstr, 1, pos)
            pos = 0
            if (originalstr == "")
                break
        }
        else
            pos++
    }
    if (array_length(str_arr) == 0)
        w = string_width(argument0)
    for (var i = 0; i < array_length(str_arr); i++)
    {
        var b = str_arr[i]
        if (string_width(b) > w)
            w = string_width(b)
    }
    return w;
}

function scr_separate_text(argument0, argument1, argument2) //gml_Script_scr_separate_text
{
    if (argument1 != -4)
        draw_set_font(argument1)
    var separation = lang_get_value("separation_map")
    separation = string_split(separation, ",")
    var _start_pos = 0
    while (scr_string_width(argument0) > (argument2 - string_width("a")))
    {
        var _pos = _start_pos
        var _sep_pos = _pos
        var len = string_length(argument0)
        var found = false
        while (_pos < len)
        {
            if scr_is_separation(string_char_at(argument0, _pos), separation)
            {
                var _prev_sep_pos = _sep_pos
                _sep_pos = _pos
                if (scr_string_width(string_copy(argument0, _start_pos, (_pos - _start_pos))) > (argument2 - string_width("a")))
                {
                    _sep_pos = _prev_sep_pos
                    _start_pos = _sep_pos
                    _pos = _start_pos
                    found = true
                    break
                }
                else
                    _pos++
            }
            else
                _pos++
        }
        if (string_char_at(argument0, _sep_pos) == " ")
        {
            argument0 = string_delete(argument0, _sep_pos, 1)
            argument0 = string_insert("\n", argument0, _sep_pos)
        }
        else
            argument0 = string_insert("\n", argument0, (_sep_pos + 1))
    }
    return argument0;
}

function scr_is_separation(argument0, argument1) //gml_Script_scr_is_separation
{
    for (var i = 0; i < array_length(argument1); i++)
    {
        if (argument0 == argument1[i])
            return true;
    }
    return false;
}

function scr_calculate_text(argument0) //gml_Script_scr_calculate_text
{
    draw_set_font(font2)
    var pos = 0
    var str2 = ""
    while (pos <= string_length(argument0))
    {
        pos++
        str2 = string_insert(string_char_at(argument0, pos), str2, (string_length(str2) + 1))
        str2 = scr_separate_text(str2)
    }
    return str2;
}

function scr_calculate_height(argument0) //gml_Script_scr_calculate_height
{
    var str2 = scr_calculate_text(argument0)
    return string_height(str2);
}

