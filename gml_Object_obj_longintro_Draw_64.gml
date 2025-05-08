if showtext
{
    draw_set_font(lang_get_font("creditsfont"))
    draw_set_halign(fa_left)
    draw_set_valign(fa_top)
    global.tdp_text_try_outline = true
    scr_draw_text_arr(16, (obj_screensizer.actual_height - 48), text)
    global.tdp_text_try_outline = false
    tdp_text_commit(0, 0, obj_screensizer.actual_width, obj_screensizer.actual_height)
}
