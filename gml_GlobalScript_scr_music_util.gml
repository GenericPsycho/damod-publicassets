function add_music(argument0, argument1, argument2, argument3, argument4) //gml_Script_add_music
{
    if (argument4 == undefined)
        argument4 = -4
    var b = 
    {
        continuous: argument3,
        on_room_start: -4,
        value: 0,
        immediate: false,
        event: -4,
        event_secret: -4
    }

    with (b)
    {
        if (argument4 != -4)
            on_room_start = method(self, argument4)
        if (argument1 != -4)
        {
            event_name = argument1
            event = fmod_event_create_instance(argument1)
        }
        if (argument2 != -4)
        {
            event_secret_name = argument2
            event_secret = fmod_event_create_instance(argument2)
        }
    }
    ds_map_set(music_map, argument0, b)
    return b;
}

function stop_music() //gml_Script_stop_music
{
    with (obj_music)
    {
        if (music != noone)
        {
            if obj_pause.pause
            {
                fmod_event_instance_stop(music.event, true)
                fmod_event_instance_stop(music.event_secret, true)
            }
            else
            {
                fmod_event_instance_stop(music.event, false)
                fmod_event_instance_stop(music.event_secret, false)
            }
        }
        fmod_event_instance_stop(pillarmusicID, true)
        fmod_event_instance_stop(panicmusicID, true)
    }
}

function hub_state(argument0, argument1, argument2) //gml_Script_hub_state
{
    var s = 0
    switch argument0
    {
        case 752:
        case 773:
        case 810:
        case 799:
        case 805:
            s = 0
            break
        case 748:
        case 774:
        case 811:
        case 806:
            s = 1
            break
        case 744:
        case 776:
        case 812:
        case 807:
            s = 2
            break
        case 740:
        case 777:
        case 813:
        case 808:
        case 804:
            s = 3
            break
        case 736:
        case 814:
        case 803:
        case 809:
            s = 4
            break
    }

    fmod_event_instance_set_parameter(argument1, "hub", s, false)
}

function music_get_pos_wrap(argument0, argument1) //gml_Script_music_get_pos_wrap
{
    while (argument0 > argument1)
        argument0 -= argument1
    if (argument0 < 1)
        argument0 = 1
    return argument0;
}

