if (!global.option_hud)
    return;
if (obj_player1.ispeppino == ispeppino && alpha > 0)
{
    var text = concat(palettetitle, "\n", palettedesc)
    draw_set_font(lang_get_font("creditsfont"))
    draw_set_halign(fa_center)
    draw_set_valign(fa_bottom)
    tdp_draw_text_color((obj_screensizer.actual_width / 2), (obj_screensizer.actual_height - 16), text, 16777215, 16777215, 16777215, 16777215, alpha)
    tdp_text_commit(0, 0, obj_screensizer.actual_width, obj_screensizer.actual_height)
}
