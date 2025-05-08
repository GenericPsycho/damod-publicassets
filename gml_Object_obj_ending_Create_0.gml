state = states.normal
snd = fmod_event_create_instance("event:/sfx/ending/towercollapse")
credits = [[-4, lang_get_value_newline_raw("en", "credits_game")], [-4, string_replace_all(lang_get_value_newline_raw("en", "credits_music"), "%", "\"")], [-4, string_replace_all(lang_get_value_newline_raw("en", "credits_sfx"), "%", "\"")], [-4, string_replace_all(lang_get_value_newline_raw("en", "credits_mort"), "%", "\"")], [-4, string_replace_all(lang_get_value_newline_raw("en", "credits_playtester1"), "%", "\"")], [-4, string_replace_all(lang_get_value_newline_raw("en", "credits_playtester2"), "%", "\"")], [-4, string_replace_all(lang_get_value_newline_raw("en", "credits_playtester3"), "%", "\"")], [-4, string_replace_all(lang_get_value_newline_raw("en", "credits_playtester4"), "%", "\"")], [-4, string_replace_all(lang_get_value_newline_raw("en", "credits_lockit1"), "%", "\"")], [-4, string_replace_all(lang_get_value_newline_raw("en", "credits_lockit2"), "%", "\"")], [-4, string_replace_all(lang_get_value_newline_raw("en", "credits_lockit3"), "%", "\"")], [-4, string_replace_all(lang_get_value_newline_raw("en", "credits_lockit4"), "%", "\"")], [-4, string_replace_all(lang_get_value_newline_raw("en", "credits_lockit5"), "%", "\"")], [-4, string_replace_all(lang_get_value_newline_raw("en", "credits_lockit6"), "%", "\"")], [-4, string_replace_all(lang_get_value_newline_raw("en", "credits_lockit7"), "%", "\"")], [-4, string_replace_all(lang_get_value_newline_raw("en", "credits_keyword1"), "%", "\"")], [-4, string_replace_all(lang_get_value_newline_raw("en", "credits_keyword2"), "%", "\"")], [-4, string_replace_all(lang_get_value_newline_raw("en", "credits_sprites"), "%", "\"")], [-4, string_replace_all(lang_get_value_newline_raw("en", "credits_help1"), "%", "\"")], [-4, string_replace_all(lang_get_value_newline_raw("en", "credits_help2"), "%", "\"")], [-4, string_replace_all(lang_get_value_newline_raw("en", "credits_help3"), "%", "\"")], [-4, string_replace_all(lang_get_value_newline_raw("en", "credits_help4"), "%", "\"")], [0, -4], [1, -4], [2, -4], [3, -4], [4, -4], [5, -4], [6, -4], [7, -4], [9, -4], [10, -4], [11, -4], [12, -4], [-4, lang_get_value_newline("credits_fmod")]]
var i = 0
while (i < array_length(credits))
{
    if (credits[i][0] == 7)
    {
        if (!global.johnresurrection)
            credits[i][0] = 8
        break
    }
    else
        i++
}
if ((!obj_player1.ispeppino) || global.swapmode)
    credits = []
bgalpha = 3
credits_pos = 0
draw_set_font(lang_get_font("creditsfont"))
draw_set_halign(fa_left)
draw_set_valign(fa_top)
skiptext = scr_compile_icon_text(lang_get_value("menu_skip"))
showtext = false
fade = 0
whitefade = 0
image_speed = 0.35
puffbuffer = 0
introbuffer = 0
spawn_arr = [obj_pizzahead_finalecutscene, obj_baddiecollisionboxTEST, obj_trapghost, obj_ghostblock, obj_johnresurrection_peppino, 4386, obj_papertreasure, obj_tinyslimedude, obj_escapespawn, obj_skateboardnoise, obj_baddiegibsstick, obj_uziprojectile, obj_farmerbaddie3_projectile, 2883, obj_stick, obj_bazookabaddie, 1702, 1229, obj_grabmarker, 2103, obj_menutv, 4159, obj_tank, obj_deliveryfolloweranim, obj_bucket_war, 2546, 1270, obj_monstergate, 3205, obj_spiderweb, obj_title_dontmakeasound, obj_baddiegibsstick, obj_menutv3, 1260, 2595, 4596, obj_wartimer, obj_secretfound, obj_swapplayergrabbable]
var _noise = (!obj_player1.ispeppino)
if global.swapmode
    _noise = true
if _noise
    spawn_arr = [1494]
with (instance_create(0, 0, obj_introprop))
{
    sprite_index = spr_towerending_bg
    depth = -3
}
with (instance_create(0, 0, obj_introprop))
{
    sprite_index = spr_towerending
    depth = -7
}
if (!_noise)
{
    with (instance_create(0, 0, obj_introprop))
    {
        sprite_index = spr_towerending_bosses
        depth = -8
    }
    with (instance_create(145, 345, obj_introprop))
    {
        sprite_index = spr_towerending_mrstick
        depth = -8
    }
    with (instance_create(369, 409, obj_introprop))
    {
        sprite_index = spr_towerending_gustavo
        depth = -8
    }
    with (instance_create(484, 386, obj_introprop))
    {
        sprite_index = spr_towerending_brick
        depth = -8
    }
    with (instance_create(288, 408, obj_introprop))
    {
        sprite_index = spr_towerending_peppino
        depth = -9
    }
}
else
{
    with (instance_create(0, 0, obj_introprop))
    {
        sprite_index = spr_towerendingN
        depth = -8
    }
    with (instance_create(278, 384, obj_introprop))
    {
        sprite_index = spr_towerending_noise
        depth = -9
    }
    with (instance_create(490, 373, obj_introprop))
    {
        sprite_index = spr_towerending_noisey
        depth = -9
    }
    if global.swapmode
    {
        with (obj_player1)
        {
            if ispeppino
                swap_player(false)
        }
        with (instance_create(0, 0, obj_introprop))
        {
            sprite_index = spr_towerending_swapmode
            depth = -9
        }
    }
}
towerID = instance_create(468, 188, obj_introprop)
with (towerID)
{
    hitY = y - 100
    depth = -5
    sprite_index = spr_towerending_tower
}
with (obj_player)
    state = states.titlescreen
depth = -10
