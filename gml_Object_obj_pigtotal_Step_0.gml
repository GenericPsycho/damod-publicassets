switch state
{
    case states.fall:
        add_y += 8
        if (add_y >= 0)
        {
            state = states.transitioncutscene
            y += 20
        }
        break
    case states.transitioncutscene:
        y = Approach(y, (obj_screensizer.actual_height - 100), 6)
        if (y == (obj_screensizer.actual_height - 100))
        {
            state = states.animation
            buffer = 1
        }
        break
    case states.animation:
        if (global.pigtotal_add > 0)
            global.pigtotal_add--
        else
            state = states.normal
        break
}

