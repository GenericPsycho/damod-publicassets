piledriver = true
active = false
step = function() //gml_Script_anon_gml_RoomCC_space_2_15_Create_46_gml_RoomCC_space_2_15_Create
{
    with (obj_player)
    {
        if (place_meeting(x, y, other) && state != states.superslam && state != states.chainsaw)
            other.piledriver = false
    }
    if (piledriver && (!active) && (!(place_meeting(x, y, obj_secretbigblock))))
    {
        notification_push((15 << 0), [room])
        active = true
    }
}

