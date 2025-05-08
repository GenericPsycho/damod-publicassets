event_inherited()
func = function() //gml_Script_anon_gml_Object_obj_soundtest_pause_Create_0_27_gml_Object_obj_soundtest_pause_Create_0
{
    with (obj_soundtest)
    {
        play = (!play)
        if play
        {
            other.active = false
            if (!fmod_event_instance_is_playing(music_event))
                fmod_event_instance_play(music_event)
            fmod_event_instance_set_paused(music_event, false)
        }
        else
        {
            other.active = true
            fmod_event_instance_set_paused(music_event, true)
        }
    }
}

active = true
