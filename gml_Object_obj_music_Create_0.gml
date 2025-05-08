secret = false
secretend = false
pillar_on_camera = false
prevpillar_on_camera = false
music_map = ds_map_create()
music = -4
savedpillarpause = false
savedpanicpause = false
savedmusicpause = false
savedsecretpause = false
savedpanicpos = 0
savedmusicpos = 0
exitmusic = false
pillarmusicID = fmod_event_create_instance("event:/music/pillarmusic")
panicmusicP = fmod_event_create_instance("event:/music/pizzatime")
panicmusicN = fmod_event_create_instance("event:/music/pizzatimenoise")
panicmusicID = panicmusicP
kidspartychaseID = fmod_event_create_instance("event:/music/w5/kidspartychase")
panicstart = false
add_music(Endingroom, "event:/music/ending", -4, false)
add_music(Creditsroom, "event:/music/credits", -4, false)
add_music(Johnresurrectionroom, "event:/music/ending", -4, false)
add_music(characterselect, "event:/music/characterselect", -4, false)
add_music(Longintro, "event:/music/intro", -4, false, function(argument0, argument1) //gml_Script_anon_gml_Object_obj_music_Create_0_1005_gml_Object_obj_music_Create_0
{
    fmod_event_instance_set_parameter(argument1, "state", 0, true)
}
)
add_music(Mainmenu, "event:/music/title", -4, false, function(argument0, argument1) //gml_Script_anon_gml_Object_obj_music_Create_0_1156_gml_Object_obj_music_Create_0
{
    fmod_event_instance_set_parameter(argument1, "state", 0, true)
}
)
add_music(tower_tutorial1, "event:/music/tutorial", "event:/music/pillarmusic", false)
add_music(tower_tutorial1N, "event:/music/tutorial", "event:/music/pillarmusic", false)
add_music(tower_entrancehall, "event:/music/hub", "event:/music/pillarmusic", false, gml_Script_hub_state)
add_music(tower_johngutterhall, "event:/music/hub", "event:/music/pillarmusic", false, gml_Script_hub_state)
add_music(tower_1, "event:/music/hub", "event:/music/pillarmusic", false, gml_Script_hub_state)
add_music(tower_2, "event:/music/hub", "event:/music/pillarmusic", false, gml_Script_hub_state)
add_music(tower_3, "event:/music/hub", "event:/music/pillarmusic", false, gml_Script_hub_state)
add_music(tower_4, "event:/music/hub", "event:/music/pillarmusic", false, gml_Script_hub_state)
add_music(tower_5, "event:/music/hub", "event:/music/pillarmusic", false, gml_Script_hub_state)
add_music(tower_finalhallway, "event:/music/finalescape", -4, false)
add_music(tower_finalhallwaytitlecard, "event:/music/pillarmusic", -4, false)
add_music(tower_pizzafacehall, "event:/music/w5/finalhallway", -4, false)
add_music(tower_outside, "event:/sfx/misc/windloop", -4, false)
add_music(tower_peppinohouse, "event:/music/peppinohouse", -4, false)
add_music(tower_soundtestlevel, "event:/sfx/misc/pillarmusic", -4, false)
add_music(trickytreat_1, "event:/music/halloween2023", -4, false, function(argument0, argument1) //gml_Script_anon_gml_Object_obj_music_Create_0_2593_gml_Object_obj_music_Create_0
{
    if (argument0 == 832)
        fmod_event_instance_set_parameter(argument1, "state", 0, true)
    else
        fmod_event_instance_set_parameter(argument1, "state", 1, true)
}
)
add_music(secret_entrance, "event:/music/secretworld", -4, false)
add_music(tower_1up, "event:/music/pillarmusic", -4, false)
add_music(tower_2up, "event:/music/pillarmusic", -4, false)
add_music(tower_3up, "event:/music/pillarmusic", -4, false)
add_music(tower_4up, "event:/music/pillarmusic", -4, false)
add_music(boss_vigilante, "event:/music/boss/vigilante", -4, false)
add_music(boss_fakepep, "event:/music/boss/fakepep", -4, false)
add_music(boss_fakepephallway, "event:/music/boss/fakepepambient", -4, false)
add_music(boss_fakepepkey, "event:/music/pillarmusic", -4, false)
add_music(boss_noise, "event:/music/boss/noise", -4, false)
add_music(boss_pepperman, "event:/music/boss/pepperman", -4, false)
add_music(boss_pizzaface, "event:/music/boss/pizzaface", -4, false, function(argument0, argument1) //gml_Script_anon_gml_Object_obj_music_Create_0_3640_gml_Object_obj_music_Create_0
{
    if (argument0 == 656)
        fmod_event_instance_set_parameter(argument1, "state", 0, true)
    else if (argument0 == 783)
        fmod_event_instance_set_parameter(argument1, "state", 5, false)
}
)
add_music(entrance_1, "event:/music/w1/entrance", "event:/music/w1/entrancesecret", false, function(argument0, argument1, argument2) //gml_Script_anon_gml_Object_obj_music_Create_0_3976_gml_Object_obj_music_Create_0
{
    var s = 0
    fmod_event_instance_set_parameter(argument1, "state", s, true)
}
)
add_music(medieval_1, "event:/music/w1/medieval", "event:/music/w1/medievalsecret", false, function(argument0, argument1, argument2) //gml_Script_anon_gml_Object_obj_music_Create_0_4191_gml_Object_obj_music_Create_0
{
    var s = -1
    switch argument0
    {
        case 39:
        case 40:
            s = 0
            break
        case 41:
        case 44:
            s = 0
            break
        case 46:
            s = 2
            break
    }

    if (s != -1)
        fmod_event_instance_set_parameter(argument1, "state", s, true)
}
)
add_music(ruin_1, "event:/music/w1/ruin", "event:/music/w1/ruinsecret", false, function(argument0, argument1) //gml_Script_anon_gml_Object_obj_music_Create_0_4603_gml_Object_obj_music_Create_0
{
    var s = -1
    switch argument0
    {
        case 54:
        case 59:
            s = 0
            break
        case 60:
            s = 1
            break
    }

    if (s != -1)
        fmod_event_instance_set_parameter(argument1, "state", s, true)
}
)
add_music(dungeon_1, "event:/music/w1/dungeon", "event:/music/w1/dungeonsecret", false)
add_music(badland_1, "event:/music/w2/desert", "event:/music/w2/desertsecret", false, function(argument0, argument1) //gml_Script_anon_gml_Object_obj_music_Create_0_5227_gml_Object_obj_music_Create_0
{
    var s = -1
    switch argument0
    {
        case 715:
        case 796:
        case 727:
            s = 0
            break
        case 725:
        case 730:
            s = 1
            break
    }

    if (s != -1)
        fmod_event_instance_set_parameter(argument1, "state", s, true)
}
)
add_music(farm_2, "event:/music/w2/farm", "event:/music/w2/farmsecret", false, function(argument0, argument1) //gml_Script_anon_gml_Object_obj_music_Create_0_5604_gml_Object_obj_music_Create_0
{
    var s = -1
    switch argument0
    {
        case 138:
        case 145:
            s = 0
            break
        case 149:
            s = 1
            break
    }

    if (s != -1)
        fmod_event_instance_set_parameter(argument1, "state", s, true)
}
)
add_music(graveyard_1, "event:/music/w2/graveyard", "event:/music/w2/graveyardsecret", false)
add_music(saloon_1, "event:/music/w2/saloon", "event:/music/w2/saloonsecret", false)
add_music(plage_entrance, "event:/music/w3/beach", "event:/music/w3/beachsecret", false)
add_music(forest_1, "event:/music/w3/forest", "event:/music/w3/forestsecret", false, function(argument0, argument1) //gml_Script_anon_gml_Object_obj_music_Create_0_6222_gml_Object_obj_music_Create_0
{
    var s = -1
    switch argument0
    {
        case 194:
        case 196:
            s = 0
            break
        case 768:
            s = 1
            break
        case 551:
            if (obj_player1.isgustavo || obj_player1.noisecrusher)
                s = 2
            break
    }

    if (s != -1)
        fmod_event_instance_set_parameter(argument1, "state", s, true)
}
)
add_music(minigolf_1, "event:/music/w3/golf", "event:/music/w3/golfsecret", false)
add_music(space_1, "event:/music/w3/space", "event:/music/w3/spacesecret", false)
add_music(freezer_1, "event:/music/w4/freezer", "event:/music/w4/freezersecret", false, function(argument0, argument1, argument2) //gml_Script_anon_gml_Object_obj_music_Create_0_6847_gml_Object_obj_music_Create_0
{
    var s = -1
    switch argument0
    {
        case 438:
        case 451:
            s = 0
            break
        case 454:
            s = 1
            break
    }

    if (s != -1)
        fmod_event_instance_set_parameter(argument1, "state", s, true)
}
)
add_music(industrial_1, "event:/music/w4/industrial", "event:/music/w4/industrialsecret", false, function(argument0, argument1, argument2) //gml_Script_anon_gml_Object_obj_music_Create_0_7213_gml_Object_obj_music_Create_0
{
    var s = -1
    switch argument0
    {
        case 669:
        case 670:
            s = 0
            break
        case 671:
            s = 1
            break
    }

    if (s != -1)
        fmod_event_instance_set_parameter(argument1, "state", s, true)
}
)
add_music(sewer_1, "event:/music/w4/sewer", "event:/music/w4/sewersecret", false)
add_music(street_1, "event:/music/w4/street", "event:/music/w4/streetsecret", false, function(argument0, argument1) //gml_Script_anon_gml_Object_obj_music_Create_0_7659_gml_Object_obj_music_Create_0
{
    if (argument0 == 557 || argument0 == 562)
        fmod_event_instance_set_parameter(argument1, "state", 0, true)
    else if (argument0 == 769)
        fmod_event_instance_set_parameter(argument1, "state", 2, true)
    if (argument0 == 563)
        fmod_set_parameter("musicmuffle", 1, false)
    else
        fmod_set_parameter("musicmuffle", 0, false)
}
)
add_music(chateau_1, "event:/music/w5/chateau", "event:/music/w1/medievalsecret", false)
add_music(kidsparty_1, "event:/music/w5/kidsparty", "event:/music/w5/kidspartysecret", false)
add_music(war_1, "event:/music/w5/war", "event:/music/w5/warsecret", false)
