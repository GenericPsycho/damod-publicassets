piledriver = true
touched = false
active = false
step = function() //gml_Script_anon_gml_RoomCC_space_7_10_Create_64_gml_RoomCC_space_7_10_Create
{
    if (!touched)
    {
        with (obj_player)
        {
            if place_meeting(x, y, other)
                other.touched = true
        }
    }
    if touched
    {
        with (obj_player)
        {
            if (place_meeting(x, y, other) && state != states.superslam && state != states.chainsaw)
                other.piledriver = false
            else if (!(place_meeting(x, y, other)))
            {
                with (other)
                {
                    if (piledriver && (!active) && (!(place_meeting(x, y, obj_baddie))))
                    {
                        notification_push((15 << 0), [room])
                        active = true
                    }
                }
            }
        }
    }
}

