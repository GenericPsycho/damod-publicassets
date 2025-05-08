if (player < obj_hardmode)
{
    if (place_meeting(xstart, ystart, obj_player1) && obj_player1.state != states.chainsaw)
        player = obj_doisedead
    else if ((!global.panic) && (!(place_meeting(xstart, ystart, obj_player1))))
        player = obj_hardmode
}
if (global.panic == false && player != obj_doisedead)
{
    x = xstart
    y = ystart
    sprite_index = spr_minipillarwoke
    mask_index = spr_minipillarwoke
}
else
{
    x = -100
    y = -100
    sprite_index = spr_minipillarsleep
}
