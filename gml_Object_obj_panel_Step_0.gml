if (!active)
    return;
var accel = 0.4
switch state
{
    case states.revolver:
        switch dock
        {
            case (4 << 0):
                x = lerp(x, obj_screensizer.ideal_width, accel)
                break
            case (1 << 0):
                x = lerp(x, (-sprite_width), accel)
                break
            case (6 << 0):
                y = lerp(y, (-sprite_height), accel)
                break
            case (7 << 0):
                y = lerp(y, obj_screensizer.ideal_height, accel)
                break
        }

        break
    case states.normal:
        switch dock
        {
            case (4 << 0):
            case (1 << 0):
                x = lerp(x, xstart, accel)
                break
            case (6 << 0):
            case (7 << 0):
                y = lerp(y, ystart, accel)
                break
        }

        break
}

