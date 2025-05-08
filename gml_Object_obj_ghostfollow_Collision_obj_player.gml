if ((!locked) && state != (291 << 0) && other.state != states.door && other.state != states.actor && other.state != states.comingoutdoor)
{
    notification_push((41 << 0), [room])
    with (other)
    {
        hitX = x
        hitY = y
        state = (291 << 0)
        sprite_index = spr_hurt
        image_speed = 0.35
    }
    fmod_event_one_shot("event:/sfx/pep/johnghost")
    fadein = false
    state = (291 << 0)
    playerid = other.id
}
