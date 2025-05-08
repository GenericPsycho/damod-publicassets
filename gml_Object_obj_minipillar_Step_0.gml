if (room == rm_editor)
{
    mask_index = spr_minipillarwoke
    return;
}
if (player < obj_hardmode)
{
    if (place_meeting(xstart, ystart, obj_player1) && obj_player1.state != states.chainsaw)
        player = obj_doisedead
    else if (global.panic && (!(place_meeting(xstart, ystart, obj_player1))))
        player = obj_hardmode
}
if (global.panic == false || player <= obj_doisedead)
{
    x = -100
    y = -100
    sprite_index = spr_minipillarsleep
    mask_index = spr_minipillarsleep
}
else
{
    mask_index = spr_minipillarwoke
    sprite_index = spr_minipillarwoke
    x = xstart
    y = ystart
}
