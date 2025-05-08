if dark
    draw_rectangle_color(0, 0, obj_screensizer.actual_width, obj_screensizer.actual_height, c_black, c_black, c_black, c_black, false)
else
    scr_draw_pause_image()
draw_set_halign(fa_right)
draw_set_valign(fa_bottom)
draw_set_font(lang_get_font("creditsfont"))
tdp_draw_text_color((obj_screensizer.actual_width - 16), (obj_screensizer.actual_height - 16), lang_get_value("menu_loading"), 16777215, 16777215, 16777215, 16777215, 1)
tdp_text_commit(0, 0, obj_screensizer.actual_width, obj_screensizer.actual_height)
