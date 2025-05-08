event_inherited()
active = true
func = function() //gml_Script_anon_gml_Object_obj_soundtest_next_Create_0_45_gml_Object_obj_soundtest_next_Create_0
{
    with (obj_soundtest)
    {
        other.active = false
        other.alarm[1] = 10
        music_pos++
        if (music_pos > (array_length(music_arr) - 1))
            music_pos = 0
        fmod_event_instance_stop(music_event, true)
        fmod_event_instance_release(music_event)
        music_event = fmod_event_create_instance(music_arr[music_pos][0])
        if play
            fmod_event_instance_play(music_event)
    }
}

