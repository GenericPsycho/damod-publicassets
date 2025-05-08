draw_rectangle_color(0, 0, obj_screensizer.actual_width, obj_screensizer.actual_height, c_black, c_black, c_black, c_black, false)
for (var i = 0; i < array_length(bg_alpha); i++)
    draw_sprite_tiled_ext(spr_optionsBG, i, bg_x, bg_y, 1, 1, c_white, bg_alpha[i])
if (room != Mainmenu)
{
    with (obj_keyconfig)
        event_perform(ev_draw, ev_gui)
}
if (instance_exists(obj_keyconfig) || instance_exists(obj_screenconfirm) || instance_exists(obj_langselect))
    return;
tdp_draw_set_font(lang_get_font("bigfont"))
tdp_draw_set_halign(1)
tdp_draw_set_valign(1)
draw_set_color(c_white)
var _os = optionselected
var m = menus[menu]
var options = m.options
var len = array_length(options)
var size = string_height(lang_get_value("default_letter")) * len + len * m.ypad
var xx = obj_screensizer.actual_width / 2
var yy = obj_screensizer.actual_height / 2 - size / 4
switch m.anchor
{
    case (0 << 0):
        tdp_draw_set_halign(1)
        tdp_draw_set_valign(0)
        var c = c_white
        var a = 1
        for (i = 0; i < len; i++)
        {
            var o = options[i]
            c = c_gray
            if (i == _os)
                c = c_white
            var t = menu_lang_value(o.name)
            menu_draw_text(xx, (yy + m.ypad * i), t, c, a)
            if (menu == (0 << 0))
                scr_pauseicon_draw(i, (xx + string_width(t) / 2 + 50), (yy + m.ypad * i + string_height(t) / 2))
        }
        break
    case (1 << 0):
        tdp_draw_set_halign(0)
        tdp_draw_set_valign(0)
        xx = m.xpad
        c = c_white
        a = 1
        var yy_plus = 0
        for (i = 0; i < len; i++)
        {
            tdp_draw_set_halign(0)
            var _newline = false
            o = options[i]
            c = c_gray
            if (i == _os)
                c = c_white
            if (o.type == (2 << 0) && (!o.localization))
                var txt = o.name
            else
                txt = menu_lang_value(o.name)
            var target_y = yy + m.ypad * i + yy_plus
            if menu_draw_text(xx, target_y, txt, c, a)
                _newline = true
            tdp_draw_set_halign(2)
            switch o.type
            {
                case (0 << 0):
                    menu_draw_text((obj_screensizer.actual_width - m.xpad), target_y, (o.value ? lang_get_value("option_on") : lang_get_value("option_off")), c, a)
                    break
                case (3 << 0):
                    var w = 200
                    var h = 5
                    var aw = w * o.value / 100
                    var x1 = obj_screensizer.actual_width - m.xpad - w
                    var y1 = target_y
                    var x2 = x1 + aw
                    var y2 = y1 + h
                    var spr = spr_slidericon
                    if (menu != (1 << 0))
                        spr = spr_slidericon2
                    draw_set_alpha(a)
                    draw_sprite_ext(spr_slider, 0, x1, y1, 1, 1, 0, c_dkgray, a)
                    draw_sprite_ext(spr_slider, 0, x1, y1, 1, 1, 0, c, a)
                    draw_set_alpha(1)
                    draw_sprite(spr, o.moving, x2, (y2 - h))
                    break
                case (1 << 0):
                    var select = o.values[o.value]
                    var n = select.name
                    if select.localization
                        n = menu_lang_value(select.name)
                    if menu_draw_text((obj_screensizer.actual_width - m.xpad), target_y, n, c, a)
                        _newline = true
                    break
            }

            if _newline
                yy_plus += 16
        }
        break
}

tdp_text_commit(0, 0, obj_screensizer.actual_width, obj_screensizer.actual_height)
if (room != Mainmenu)
{
    with (obj_transfotip)
        event_perform(ev_draw, ev_gui)
}
