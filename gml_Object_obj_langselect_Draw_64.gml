var selected = lang[select]
if (selected.image_index != -1)
    draw_sprite(spr_lang_flags, selected.image_index, (obj_screensizer.ideal_width / 2), (obj_screensizer.ideal_height / 2 + (Wave(-2, 2, 2, 10))))
draw_sprite(spr_lang_left, 0, (obj_screensizer.ideal_width / 2 - 180 - left_offset), (obj_screensizer.ideal_height / 2))
draw_sprite(spr_lang_right, 0, (obj_screensizer.ideal_width / 2 + 180 + right_offset), (obj_screensizer.ideal_height / 2))
var name_y = obj_screensizer.ideal_height / 2 + 80 + (floor(Wave(-1, 1, 0.5, 0)))
if (selected.image_index < 0)
    name_y = obj_screensizer.ideal_height / 2
if (selected.spr_name == -4)
{
    draw_set_font(global.bigfont)
    draw_set_halign(fa_center)
    if (selected.image_index < 0)
        draw_set_valign(fa_middle)
    else
        draw_set_valign(fa_top)
    draw_text((obj_screensizer.ideal_width / 2), name_y, selected.name)
}
else
    draw_sprite(selected.spr_name, 0, (obj_screensizer.ideal_width / 2), name_y)
